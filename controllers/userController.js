const {User, Password, sequelize} = require("../models");
const {NotFound, BadRequest} = require("http-errors");
const {failure, success} = require("../utils/responses");
const {mailProducer} = require("../utils/rabbitMQ");
const {validateParams} = require("../utils/validations");
const feedbackEmailTemplate = require("../templates/feedback");
const {singleFileUpload} = require("../utils/aliyun");
const bcrypt = require("bcrypt");

const userController = {
    async getCurrentUser(req, res) {
        try {
            const {id} = req.user;
            const user = await User.findByPk(id);
            if (!user) {
                throw new NotFound("用户不存在");
            }
            delete user.dataValues.password;
            success(res, "成功获取用户信息", user);
        } catch (error) {
            failure(res, error);
        }
    },
    async updateUser(req, res) {
        try {
            validateParams(req)

            const {id} = req.user;
            const user = await User.findByPk(id);
            if (!user) {
                throw new NotFound("用户不存在");
            }
            await user.update({...req.body});
            success(res, "成功更新用户信息", user);
        } catch (error) {
            failure(res, error);
        }
    },
    async uploadAvatar(req, res) {
        try {
            singleFileUpload(req, res, function (err) {
                if (err) {
                    failure(res, err);
                }
                if (!req.file) {
                    failure(res, new BadRequest("未找到上传的文件"));
                }

                success(res, "文件上传成功", {file: req.file});
            })
        } catch (err) {
            failure(res, err);
        }
    },
    async resetMasterPasswordAndReEncrypt(req, res) {
        //  先进行校验参数, 失败直接抛错
        validateParams(req)
        //  再开启事务
        const t = await sequelize.transaction();
        try {
            const userId = req.user.id;
            const user = await User.findByPk(userId);
            const {currentPassword, newPassword, items} = req.body;
            const isPasswordValid = bcrypt.compareSync(currentPassword, user.password);
            if (!isPasswordValid) {
                throw new BadRequest("当前密码不正确");
            }
            if (currentPassword === newPassword) {
                throw new BadRequest("新密码不能与当前密码相同");
            }
            // 更新用户密码
            await user.update({password: newPassword}, {transaction: t});

            // 构造批量更新的 Promise 数组
            const updatePromises = items.map((item) => {
                // 安全校验：只更新属于当前用户的记录
                return Password.update(
                    {
                        title: item.title,
                        username: item.username,
                        password: item.password,
                        notes: item.notes,
                        site_url: item.site_url,
                        // 其他加密字段...
                    },
                    {
                        paranoid: false, // 允许删除记录
                        where: {
                            id: item.id,
                            userId: userId,
                        },
                        transaction: t
                    },
                );
            });
            // 等待所有更新操作完成
            await Promise.all(updatePromises);
            // 提交事务
            await t.commit();
            success(res, "密码重置成功");
        } catch (error) {
            await t.rollback();
            failure(res, error);
        }
    },
    async sendFeedbackEmail(req, res) {
        try {
            validateParams(req)

            const userId = req.user.id;
            const user = await User.findByPk(userId);
            if (!user) {
                throw new NotFound("用户不存在");
            }
            const {contact, content, feedbackType, deviceInfo} = req.body;

            const userContact = contact || user.email;
            const html = feedbackEmailTemplate(feedbackType, content, userContact, deviceInfo);
            const msg = {
                to: process.env.DEVELOP_EMAIL, // 开发者邮箱
                subject: `【新反馈】${feedbackType} - 来自用户 ${user.username}`,
                html,
            }

            await mailProducer(msg)

            success(res, "反馈邮件发送成功");
        } catch (error) {
            failure(res, error);
        }
    },
    async cancelAccount(req, res) {
        try {
            const userId = req.user.id;
            const user = await User.findByPk(userId);
            if (!user) {
                throw new NotFound("用户不存在");
            }

            await user.update({deleted: true});
            success(res, "用户已注销");
        } catch (error) {
            failure(res, error);
        }
    },
};

module.exports = userController;

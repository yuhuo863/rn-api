const {User, Category, Password, sequelize} = require("../models");
const {NotFound, BadRequest} = require("http-errors");
const {failure, success} = require("../utils/responses");
const {mailProducer} = require("../utils/rabbitMQ");
const {validateParams} = require("../utils/validations");
const feedbackEmailTemplate = require("../templates/feedback");
const {singleFileUpload} = require("../utils/aliyun");
const {redis} = require("../utils/redis");
const bcrypt = require("bcrypt");
const crypto = require("crypto");
const emailVerificationTemplate = require('../templates/captcha');

const userService = {
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
            const user = req.user;
            const {currentPassword, newPassword, items} = req.body;
            const isPasswordValid = bcrypt.compareSync(currentPassword, user.password);
            if (!isPasswordValid) {
                throw new BadRequest("当前密码不正确");
            }
            if (currentPassword === newPassword) {
                throw new BadRequest("新密码不能与当前密码相同");
            }
            // 更新用户所有密码
            await user.update({password: newPassword}, {transaction: t});

            if (items && items.length > 0) {
                const updatePromises = items.map((item) => {
                    return Password.update(
                        {
                            title: item.title,
                            username: item.username,
                            password: item.password,
                            notes: item.notes,
                            site_url: item.site_url,
                        },
                        {
                            paranoid: false,
                            where: {
                                id: item.id,
                                userId: req.user.id,
                            },
                            transaction: t
                        },
                    );
                });
                await Promise.all(updatePromises);
            }
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

            const user = req.user;

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
            const user = req.user
            await user.update({deleted: true});
            success(res, "用户已注销");
        } catch (error) {
            failure(res, error);
        }
    },
    async sendEmailCode(req, res) {
        try {
            validateParams(req)
            const {email} = req.body;
            const user = await User.findOne({where: {email}});
            if (!user) {
                throw new NotFound("邮箱错误或未注册");
            }

            const code = crypto.randomInt(100000, 1000000).toString();
            await redis.set(`email_verification:${user.id}`, code, 60 * 5);
            const html = emailVerificationTemplate(code)
            const msg = {
                to: email,
                subject: "「重置密码」验证码",
                html,
            }
            await mailProducer(msg)

            success(res, "验证码已发送至您的邮箱");
        } catch (error) {
            failure(res, error);
        }
    },
    async verifyEmailCode(req, res) {
        try {
            validateParams(req)
            const {email, code} = req.body;
            const user = await User.findOne({where: {email}});
            if (!user) {
                throw new NotFound("邮箱错误或未注册");
            }
            const storedCode = await redis.get(`email_verification:${user.id}`);
            if (!storedCode || storedCode !== +code) {
                throw new BadRequest("验证码无效或已过期");
            }
            await redis.del(`email_verification:${user.id}`);
            success(res, "验证通过");
        } catch (error) {
            failure(res, error);
        }
    },
    async wipeAccount(req, res) {
        try {
            validateParams(req)
            const {email} = req.body;
            await User.destroy({where: {email}});
            success(res, "数据已清除");
        } catch (error) {
            failure(res, error);
        }
    }
};

module.exports = userService;

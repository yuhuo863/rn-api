const {User} = require("../models");
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
    async changePassword(req, res) {
        try {
            validateParams(req)

            const userId = req.user.id;
            const user = await User.findByPk(userId);
            if (!user) {
                throw new NotFound("用户不存在");
            }
            const {currentPassword, newPassword} = req.body;
            const isPasswordValid = bcrypt.compareSync(currentPassword, user.password);
            if (!isPasswordValid) {
                throw new BadRequest("当前密码不正确");
            }
            if (currentPassword === newPassword) {
                throw new BadRequest("新密码不能与当前密码相同");
            }

            await user.update({password: newPassword});

            success(res, "密码修改成功");
        } catch (error) {
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

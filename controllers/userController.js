const {User} = require("../models");
const {validationResult} = require("express-validator");
const {NotFound, BadRequest} = require("http-errors");
const {failure, success} = require("../utils/responses");
const {mailProducer} = require("../utils/rabbitMQ");
const {validatePassword} = require("../utils/validations");
const feedbackEmailTemplate = require("../templates/feedback");

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
            const errors = validationResult(req);
            if (!errors.isEmpty()) {
                throw new BadRequest(
                    `请求参数错误: ${errors
                        .array()
                        .map((e) => e.msg)
                        .join(", ")}`,
                );
            }

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
    // 注销用户
    async sendFeedbackEmail(req, res) {
        try {
            validatePassword(req)

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
    }
};

module.exports = userController;

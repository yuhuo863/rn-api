const {Notice, User} = require("../models");
const {failure, success} = require("../utils/responses");
const {validationResult} = require("express-validator");
const {BadRequest} = require("http-errors");

const noticeController = {
    async getNotices(req, res) {
        try {
            const userId = req.user.id;
            const user = await User.findByPk(userId);
            if (user) {
                await user.update({
                    lastReadNoticeAt: new Date(),
                });
            }
            const notices = await Notice.findAll({
                order: [['createdAt', 'DESC']],
            })
            success(res, "成功获取通知列表", {
                notices,
            });
        } catch (error) {
            failure(res, error);
        }
    },
    async createNotice(req, res) {
        try {
            const errors = validationResult(req);
            if (!errors.isEmpty()) {
                throw new BadRequest(
                    errors
                        .array()
                        .map(e => e.msg)[0]
                );
            }
            const {title, content} = req.body;
            const notice = await Notice.create({
                title,
                content,
            });
            success(res, "成功创建通知", {
                notice,
            }, 201);
        } catch (error) {
            failure(res, error);
        }
    },
    async checkHasUnreadNotices(req, res) {
        try {
            const userId = req.user.id;
            const maxCreatedAt = await Notice.max('createdAt');
            const user = await User.findByPk(userId, {
                attributes: ['lastReadNoticeAt']
            })
            let hasUnread = false;
            if (maxCreatedAt && user) {
                hasUnread = new Date(maxCreatedAt) > new Date(user.lastReadNoticeAt || 0);
            }
            success(res, "成功检查是否有未读通知", {
                hasUnread,
            });
        } catch (error) {
            failure(res, error);
        }
    },
}

module.exports = noticeController;
const express = require("express");
const {body, param} = require("express-validator");
const router = express.Router();

const noticeService = require("../services/notice-service");
const authenticate = require("../middlewares/auth-user");
router.use(authenticate);

router.get("/", noticeService.getNotices);
router.get("/check", noticeService.checkHasUnreadNotices);
router.get("/:id", [
    param('id')
        .notEmpty()
        .withMessage("通知ID不能为空")
        .isUUID('4')
        .withMessage("通知ID不合法"),
], noticeService.getNotice);
router.post("/", [
    body('title')
        .notEmpty()
        .withMessage("通知标题不能为空"),
    body('content')
        .notEmpty()
        .withMessage("通知内容不能为空"),
    body('type')
        .optional()
        .isIn(['1', '2'])
        .withMessage("通知类型不合法"),
], noticeService.createNotice);

module.exports = router;
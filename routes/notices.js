const express = require("express");
const {body} = require("express-validator");
const router = express.Router();

const noticeController = require("../controllers/noticeController");
const authenticate = require("../middlewares/auth-user");
router.use(authenticate);

router.get("/", noticeController.getNotices);
router.post("/", [
    body('title')
        .notEmpty()
        .withMessage("通知标题不能为空"),
    body('content')
        .notEmpty()
        .withMessage("通知内容不能为空"),
], noticeController.createNotice);
router.get("/check", noticeController.checkHasUnreadNotices);

module.exports = router;
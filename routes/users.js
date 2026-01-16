const express = require("express");
const router = express.Router();
const {body} = require("express-validator");

const userService = require("../services/user-service");
const authenticate = require("../middlewares/auth-user");
router.use(authenticate);

router.get("/me", userService.getCurrentUser);
router.put("/me", [
    body("username")
        .optional()
        .isString()
        .withMessage("用户名必须是字符串")
        .isLength({min: 6, max: 50})
        .withMessage("用户名必须是6到50个字符"),
    body("email").optional().isEmail().withMessage("邮箱格式不正确"),
    body("avatar")
        .optional()
        .isURL()
        .withMessage("头像链接格式不正确")
        .isLength({max: 255})
        .withMessage("头像链接不能超过255个字符"),
    body("sex").optional().isIn([0, 1, 2]).withMessage("性别必须是 0（女）、1（男）或 2（未选择）"),
], userService.updateUser);
router.post('/reset-master-password', [
    body('currentPassword')
        .notEmpty()
        .withMessage('当前密码不能为空')
        .isLength({min: 8, max: 45})
        .withMessage('当前密码长度必须是8到45个字符'),
    body('newPassword')
        .notEmpty()
        .withMessage('新密码不能为空')
        .isLength({min: 8, max: 45})
        .withMessage('新密码长度必须是8到45个字符'),
    body('items')
        .isArray()
        .withMessage('加密数据项必须是数组')
], userService.resetMasterPasswordAndReEncrypt);
router.post("/upload", userService.uploadAvatar);
router.post("/feedback", [
    body("feedbackType")
        .notEmpty()
        .withMessage("反馈类型不能为空")
        .isString()
        .withMessage("反馈类型必须是字符串"),
    body("content")
        .notEmpty()
        .withMessage("反馈内容不能为空")
        .isString()
        .withMessage("反馈内容必须是字符串")
        .isLength({max: 200})
        .withMessage("反馈内容不能超过200个字符"),
    body("contact")
        .optional()
        .isString()
        .withMessage("联系方式必须是字符串"),
    body("deviceInfo")
        .optional()
        .isObject()
        .withMessage("设备信息必须是一个对象"),
], userService.sendFeedbackEmail);
router.delete("/me", userService.cancelAccount);

module.exports = router;

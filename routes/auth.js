const express = require("express");
const router = express.Router();
const {body} = require("express-validator");
const authController = require("../controllers/authController");

// 用户注册
router.post(
    "/register",
    [
        body("username")
            .notEmpty()
            .withMessage("用户名不能为空")
            .isLength({min: 3})
            .withMessage("用户名长度至少为3个字符"),
        body("email")
            .notEmpty()
            .withMessage("邮箱不能为空")
            .isEmail()
            .withMessage("请输入有效的邮箱地址"),
        body("password")
            .notEmpty()
            .withMessage("密码不能为空")
            .isLength({min: 8})
            .withMessage("密码长度至少为8个字符"),
        body("confirmPassword")
            .notEmpty()
            .withMessage("确认密码不能为空")
            .custom((value, {req}) => value === req.body.password)
            .withMessage("两次输入的密码不一致"),
    ],
    authController.register,
);

// 用户登录
router.post(
    "/login",
    [
        body("login").notEmpty().withMessage("用户名或邮箱不能为空"),
        body("password").notEmpty().withMessage("密码不能为空"),
    ],
    authController.login,
);

module.exports = router;

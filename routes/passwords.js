const express = require("express");
const router = express.Router();
const {body, param} = require("express-validator");

const passwordController = require("../controllers/passwordController");
const authenticate = require("../middlewares/auth-user");
router.use(authenticate);

router.post(
    "/",
    [
        body("title")
            .notEmpty()
            .withMessage("密码标题不能为空")
            .isLength({min: 6})
            .withMessage("密码标题长度不能少于6个字符"),
        body("site_url")
            .optional()
            .isURL()
            .withMessage("站点URL格式不正确"),
        body("categoryId")
            .optional()
            .isUUID('4')
            .withMessage("分类ID格式不正确"),
        body("encrypted_blob").notEmpty().withMessage("加密内容不能为空"),
        body('iv').notEmpty().withMessage("初始化向量不能为空"),
    ],
    passwordController.createPassword,
);

router.put(
    '/:id',
    [
        param("id")
            .notEmpty()
            .withMessage('密码ID不能为空')
            .isUUID('4')
            .withMessage("密码ID格式不正确"),
        body("title")
            .optional()
            .isString()
            .withMessage("密码标题必须是字符串"),
        body("site_url")
            .optional()
            .isURL()
            .withMessage("站点URL格式不正确"),
        body("categoryId")
            .optional()
            .isUUID('4')
            .withMessage("分类ID格式不正确"),
        body("encrypted_blob")
            .optional()
            .isString()
            .withMessage("加密内容必须是字符串"),
    ],
    passwordController.updatePassword,
);

router.delete(
    '/:id',
    [
        param("id")
            .notEmpty()
            .withMessage('密码ID不能为空')
            .isUUID('4')
            .withMessage("密码ID格式不正确"),
    ],
    passwordController.deletePassword,
);

router.get('/', passwordController.getUserPasswords);

router.post('/restore',
    [
        body("id")
            .notEmpty()
            .withMessage("密码ID不能为空")
            .isUUID('4')
            .withMessage("密码ID格式不正确")],
    passwordController.restorePassword
);

router.post('/force',
    [
        body("id")
            .notEmpty()
            .withMessage("密码ID不能为空")
            .isUUID('4')
            .withMessage("密码ID格式不正确")
    ],
    passwordController.thoroughDelPassword
);

module.exports = router;

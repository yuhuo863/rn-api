const express = require("express");
const router = express.Router();
const {body, param} = require("express-validator");

const passwordController = require("../controllers/passwordController");
const authenticate = require("../middlewares/auth-user");
router.use(authenticate);

router.get('/', passwordController.getUserPasswords);

router.get('/trash', passwordController.getTrashPasswords);

router.get('/list-all', passwordController.getAllPasswords);

router.get('/:id', passwordController.getPasswordDetail);

router.post("/", [
        body("title")
            .notEmpty()
            .withMessage("密码标题不能为空"),
        body("username")
            .notEmpty()
            .withMessage("用户名不能为空"),
        body("password")
            .notEmpty()
            .withMessage("密码不能为空"),
        body("site_url")
            .optional()
            .isURL()
            .withMessage("站点URL格式不正确"),
        body("notes")
            .optional()
            .isString()
            .withMessage("备注必须是字符串"),
        body("categoryId")
            .optional()
            .isUUID('4')
            .withMessage("分类ID格式不正确"),
    ], passwordController.createPassword,
);

router.put('/:id', [
        param("id")
            .notEmpty()
            .withMessage('密码ID不能为空')
            .isUUID('4')
            .withMessage("密码ID格式不正确"),
        body("title")
            .optional()
            .isString()
            .withMessage("密码标题必须是字符串"),
        body("username")
            .optional()
            .isString()
            .withMessage("用户名必须是字符串"),
        body("password")
            .optional()
            .isString()
            .withMessage("密码必须是字符串"),
        body("site_url")
            .optional()
            .isURL()
            .withMessage("站点URL格式不正确"),
        body("notes")
            .optional()
            .isString()
            .withMessage("备注必须是字符串"),
        body("categoryId")
            .optional()
            .isUUID('4')
            .withMessage("分类ID格式不正确"),
    ], passwordController.updatePassword,
);

router.delete('/:id', [
        param("id")
            .notEmpty()
            .withMessage('密码ID不能为空')
            .isUUID('4')
            .withMessage("密码ID格式不正确"),
    ], passwordController.deletePassword,
);

router.post('/restore', [
        body("id")
            .notEmpty()
            .withMessage("密码ID不能为空")
            .isUUID('4')
            .withMessage("密码ID格式不正确")
    ], passwordController.restorePassword
);

router.post('/force', [
        body("id")
            .notEmpty()
            .withMessage("密码ID不能为空")
            .isUUID('4')
            .withMessage("密码ID格式不正确")
    ], passwordController.thoroughDelPassword
);
module.exports = router;

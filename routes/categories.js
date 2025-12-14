const express = require("express");
const router = express.Router();
const {body, param} = require("express-validator");

const categoryController = require("../controllers/categoryController");
const authenticate = require("../middlewares/auth-user");
router.use(authenticate);

router.get("/", categoryController.getAllCategories);

router.post('/', [
    body("name")
        .notEmpty()
        .withMessage("分类名称不能为空")
        .isLength({min: 2, max: 50})
        .withMessage("分类名称长度必须在2到50个字符之间"),
    body("icon")
        .optional()
        .isString()
        .withMessage("图标必须是字符串"),
], categoryController.createCategory);

router.put('/:id', [
    param("id")
        .notEmpty()
        .withMessage('分类ID不能为空')
        .isUUID('4')
        .withMessage("无效的分类ID"),
    body("name")
        .optional()
        .isLength({min: 2, max: 50})
        .withMessage("分类名称长度必须在2到50个字符之间"),
    body("icon")
        .optional()
        .isString()
        .withMessage("图标必须是字符串"),
], categoryController.updateCategory);

router.delete('/:id', [
    param("id")
        .notEmpty()
        .withMessage('分类ID不能为空')
        .isUUID('4')
        .withMessage("无效的分类ID"),
], categoryController.deleteCategory);

module.exports = router;
const express = require("express");
const router = express.Router();
const {body, param} = require("express-validator");

const categoryService = require("../services/category-service");
const authenticate = require("../middlewares/auth-user");
router.use(authenticate);

router.get("/", categoryService.getAllCategories);

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
    body("color")
        .optional()
        .isHexColor()
        .withMessage("颜色必须是有效的十六进制颜色值"),
], categoryService.createCategory);

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
], categoryService.updateCategory);

router.delete('/:id', [
    param("id")
        .notEmpty()
        .withMessage('分类ID不能为空')
        .isUUID('4')
        .withMessage("无效的分类ID"),
], categoryService.deleteCategory);

module.exports = router;
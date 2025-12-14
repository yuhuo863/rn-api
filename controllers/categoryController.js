const {Category, Password} = require("../models");
const {failure, success} = require("../utils/responses");
const {validatePassword} = require('../utils/validations');
const {BadRequest, NotFound, Conflict} = require("http-errors");

const categoryController = {
    async getAllCategories(req, res) {
        try {
            const userId = req.user.id;
            const categories = await Category.findAll({
                where: {
                    userId: userId,
                },
                attributes: {exclude: ['UserId']},
                order: [['createdAt', 'ASC']],
            });
            success(res, "成功获取分类列表", {categories});
        } catch (error) {
            failure(res, error);
        }
    },
    async createCategory(req, res) {
        try {
            validatePassword(req);
            const userId = req.user.id;
            const existingCategory = await Category.findOne({
                where: {
                    userId: userId,
                    name: req.body.name,
                },
            });
            if (existingCategory) {
                throw new BadRequest("分类名称已存在");
            }
            await Category.create({
                userId: userId,
                ...req.body,
            });
            success(res, "成功创建分类", {}, 201);
        } catch (error) {
            failure(res, error);
        }
    },
    async updateCategory(req, res) {
        try {
            validatePassword(req);
            const userId = req.user.id;
            const categoryId = req.params.id;
            const category = await Category.findOne({
                where: {
                    id: categoryId,
                    userId: userId,
                },
            });
            if (!category) {
                throw new NotFound("分类不存在");
            }
            await category.update({
                ...req.body,
            });
            success(res, "成功更新分类");
        } catch (error) {
            failure(res, error);
        }
    },
    async deleteCategory(req, res) {
        try {
            validatePassword(req);
            const userId = req.user.id;
            const categoryId = req.params.id;
            const category = await Category.findOne({
                where: {
                    id: categoryId,
                    userId: userId,
                },
            });
            if (!category) {
                throw new NotFound("分类不存在");
            }
            if (category.isDefault) {
                throw new BadRequest("默认分类不能被删除");
            }
            const passwordCount = await Password.count({
                where: {
                    categoryId: categoryId,
                    userId: userId,
                },
            })
            if (passwordCount > 0) {
                throw new Conflict("分类下存在密码，不能删除");
            }
            await category.destroy();
            success(res, "成功删除分类");
        } catch (error) {
            failure(res, error);
        }
    }
}

module.exports = categoryController;

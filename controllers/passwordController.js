const {Password, Category} = require("../models");
const {NotFound} = require("http-errors");
const {Op} = require("sequelize");
const {success, failure} = require("../utils/responses");
const {validateParams} = require('../utils/validations');

const passwordController = {
    async createPassword(req, res) {
        try {
            validateParams(req)
            let findCategoryId = req.body.categoryId
            if (!findCategoryId) {
                const defaultCategory = await Category.findOne({
                    where: {
                        userId: req.user.id,
                        isDefault: true,
                    }
                })
                findCategoryId = defaultCategory ? defaultCategory.id : undefined
            }
            await Password.create({
                ...req.body,
                userId: req.user.id,
                categoryId: findCategoryId,
            });
            success(res, "成功创建密码", {}, 201);
        } catch (error) {
            failure(res, error);
        }
    },
    async updatePassword(req, res) {
        try {
            validateParams(req);
            const userId = req.user.id;
            const passwordId = req.params.id;
            const password = await Password.findOne({
                where: {
                    id: passwordId,
                    userId: userId,
                },
            });
            if (!password) {
                throw new NotFound("未找到对应的密码记录");
            }
            await password.update({
                ...req.body,
            });
            success(res, "成功更新密码");
        } catch (error) {
            failure(res, error);
        }
    },
    async deletePassword(req, res) {
        try {
            validateParams(req)
            const userId = req.user.id;
            const passwordId = req.params.id;
            const password = await Password.findOne({
                where: {
                    id: passwordId,
                    userId: userId,
                },
            });
            if (!password) {
                throw new NotFound("未找到对应的密码记录");
            }
            await password.destroy();
            success(res, "成功删除密码");
        } catch (error) {
            failure(res, error);
        }
    },
    async getUserPasswords(req, res) {
        try {
            const {
                categoryId,
                keyword,
                sortBy = "createdAt",
                sortOrder = "DESC"
            } = req.query;

            const userId = req.user.id;
            const whereClause = {
                userId
            };
            if (categoryId) {
                whereClause.categoryId = categoryId;
            }
            if (keyword) {
                whereClause.title = {[Op.like]: `%${keyword}%`}
            }
            const {count, rows} = await Password.findAndCountAll({
                where: whereClause,
                include: [
                    {
                        model: Category,
                        as: "category",
                        attributes: ['id', 'name', 'icon'],
                    }
                ],
                attributes: {exclude: ['UserId', 'CategoryId']},
                order: [[sortBy, sortOrder]],
            });

            success(res, "成功获取用户密码列表", {
                passwords: rows,
                total: count,
            });
        } catch (error) {
            failure(res, error);
        }
    },
    async getPasswordDetail(req, res) {
        try {
            const userId = req.user.id;
            const passwordId = req.params.id;
            const password = await Password.findOne({
                where: {
                    id: passwordId,
                    userId: userId,
                },
                attributes: {exclude: ['UserId', 'CategoryId']},
                include: [
                    {
                        model: Category,
                        as: "category",
                        attributes: ['name', 'icon', 'color'],
                    }
                ]
            });
            if (!password) {
                throw new NotFound("未找到对应的密码记录");
            }

            success(res, "成功获取密码详情", {password});
        } catch (error) {
            failure(res, error);
        }
    },
    async getTrashPasswords(req, res) {
        try {
            const userId = req.user.id;
            const {count, rows: passwords} = await Password.findAndCountAll({
                where: {
                    userId,
                    deletedAt: {
                        [Op.not]: null
                    }
                },
                include: [
                    {
                        model: Category,
                        as: "category",
                        attributes: ['name', 'icon', 'color'],
                    }
                ],
                order: [['updatedAt', 'DESC']],
                paranoid: false
            })
            success(res, "成功获取回收站密码", {
                passwords,
                total: count,
            })
        } catch (error) {
            failure(res, error);
        }
    },
    async restorePassword(req, res) {
        try {
            validateParams(req);
            let message = '已恢复成功。';
            const {id} = req.body;
            // 这里的 ID，可以是单条记录值, 也可以是数组
            await Password.restore({where: {id: id}});
            if (typeof id === 'object') message = '已批量恢复成功。';

            success(res, message, {id});
        } catch (error) {
            failure(res, error);
        }
    },
    async thoroughDelPassword(req, res) {
        try {
            validateParams(req);
            let message = '已彻底删除。';
            const {id} = req.body;
            // 这里的 ID，可以是单条记录值, 也可以是数组
            await Password.destroy({
                where: {id: id},
                force: true,
            });
            if (typeof id === 'object') message = '已批量彻底删除。';

            success(res, message, {id});
        } catch (error) {
            failure(res, error);
        }
    }
};

module.exports = passwordController;

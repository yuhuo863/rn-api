const {Password, Category, Notice, User} = require("../models");
const {NotFound} = require("http-errors");
const {Op} = require("sequelize");
const {success, failure} = require("../utils/responses");
const {validatePassword} = require('../utils/validations');
const {encrypt, decrypt} = require('../utils/encryption')
const dayjs = require("dayjs");

const passwordController = {
    async createPassword(req, res) {
        try {
            validatePassword(req)
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
            const encryptedPassword = encrypt(req.body.encrypted_password, process.env.MASTER_PASSWORD);
            await Password.create({
                ...req.body,
                userId: req.user.id,
                categoryId: findCategoryId,
                encrypted_password: encryptedPassword,
            });
            success(res, "成功创建密码", {}, 201);
        } catch (error) {
            failure(res, error);
        }
    },
    async updatePassword(req, res) {
        try {
            validatePassword(req);
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
            req.body.encrypted_password = encrypt(req.body.encrypted_password, process.env.MASTER_PASSWORD);
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
            validatePassword(req)
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
                attributes: {exclude: ['iv', 'UserId', 'CategoryId']},
                order: [[sortBy, sortOrder]],
            });
            const passwords = rows.map(password => {
                const decryptedPassword = decrypt(password.encrypted_password, process.env.MASTER_PASSWORD);
                delete password.dataValues.encrypted_password;
                return {
                    ...password.toJSON(),
                    password: decryptedPassword,
                };
            });

            success(res, "成功获取用户密码列表", {
                passwords,
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
            const decryptedPassword = decrypt(password.encrypted_password, process.env.MASTER_PASSWORD);
            const passwordDetail = {
                ...password.toJSON(),
                password: decryptedPassword,
            };
            delete passwordDetail.encrypted_password;

            success(res, "成功获取密码详情", {password: passwordDetail});
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
                attributes: ['id', 'title', 'deletedAt', 'updatedAt'],
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
            validatePassword(req);
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
            validatePassword(req);
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

const {Password, Category} = require("../models");
const {NotFound} = require("http-errors");
const {Op} = require("sequelize");
const {success, failure} = require("../utils/responses");
const {validatePassword} = require('../utils/validations');
const {encrypt, decrypt} = require('../utils/encryption')

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
                paranoid,
                currentPage = 1,
                pageSize = 10,
                sortBy = "id",
                sortOrder = "DESC"
            } = req.query;
            const offset = (currentPage - 1) * pageSize;

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
                order: [['id', 'ASC'], ['title', 'ASC']],
                limit: parseInt(pageSize),
                offset,
                paranoid: paranoid === 'true',
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
                pagination: {
                    total: count,
                    currentPage: parseInt(currentPage),
                    pageSize: parseInt(pageSize),
                },
            });
        } catch (error) {
            failure(res, error);
        }
    },
    async getPasswordDetail() {
        // 获取单个密码详情
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

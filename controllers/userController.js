const {User} = require("../models");
const {validationResult} = require("express-validator");
const {NotFound, BadRequest} = require("http-errors");
const {failure, success} = require("../utils/responses");

const userController = {
    async getCurrentUser(req, res) {
        try {
            const {id} = req.user;
            const user = await User.findByPk(id);
            if (!user) {
                throw new NotFound("用户不存在");
            }
            delete user.dataValues.password;
            success(res, "成功获取用户信息", user);
        } catch (error) {
            failure(res, error);
        }
    },
    async updateUser(req, res) {
        try {
            const errors = validationResult(req);
            if (!errors.isEmpty()) {
                throw new BadRequest(
                    `请求参数错误: ${errors
                        .array()
                        .map((e) => e.msg)
                        .join(", ")}`,
                );
            }

            const {id} = req.user;
            const user = await User.findByPk(id);
            if (!user) {
                throw new NotFound("用户不存在");
            }
            await user.update({...req.body});
            success(res, "成功更新用户信息", user);
        } catch (error) {
            failure(res, error);
        }
    },
};

module.exports = userController;

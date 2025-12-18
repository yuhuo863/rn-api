const {User, Category} = require("../models");
const {success, failure} = require("../utils/responses");
const {validationResult} = require("express-validator");
const {BadRequest, NotFound} = require("http-errors");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");
const {Op} = require("sequelize");

const authController = {
    // 用户注册
    async register(req, res) {
        try {
            const errors = validationResult(req);
            if (!errors.isEmpty()) {
                throw new BadRequest("请求参数错误", errors.array());
            }

            const user = await User.create({
                username: req.body.username,
                email: req.body.email,
                password: req.body.password,
                sex: 2, // 默认未选择 0男1女
                role: 0, // 默认普通用户
                avatar: "",
                deleted: false, // 默认未注销
            });

            delete user.dataValues.password;

            await Category.create({
                name: "默认分类",
                userId: user.id,
                icon: "hashtag",
                color: "#3b82f6",
                isDefault: true,
            });

            success(res, "用户注册成功", user, 201);
        } catch (error) {
            failure(res, error);
        }
    },
    // 用户登录
    async login(req, res) {
        try {
            const errors = validationResult(req);
            if (!errors.isEmpty()) {
                throw new BadRequest("请求参数错误", errors.array());
            }

            const {login, password} = req.body;

            const condition = {
                where: {
                    [Op.or]: [{email: login}, {username: login}],
                },
            };
            const user = await User.findOne(condition);
            if (!user) throw new NotFound("用户不存在, 请先注册");

            const isPasswordValid = await bcrypt.compare(password, user.password);
            if (!isPasswordValid) throw new BadRequest("用户名或密码错误");

            const payload = {
                userId: user.id,
            };
            const token = jwt.sign(payload, process.env.JWT_SECRET, {
                expiresIn: "7d",
            });
            success(res, "登录成功", {token});
        } catch (error) {
            failure(res, error);
        }
    },
};

module.exports = authController;

const {User} = require("../models");
const {Unauthorized} = require("http-errors");
const jwt = require("jsonwebtoken");
const {failure} = require("../utils/responses");

const authenticate = async (req, res, next) => {
    try {
        const authHeader = req.headers.authorization;
        if (!authHeader) {
            throw new Unauthorized("当前接口需要认证才能访问。");
        }

        const authHeaderParts = authHeader.split(" ");
        if (authHeaderParts[0] !== "Bearer" || !authHeaderParts[1]) {
            throw new Unauthorized("无效的 token 格式。");
        }

        const token = authHeader.split(" ")[1];

        const decoded = jwt.verify(token, process.env.JWT_SECRET);

        const {userId} = decoded;
        const user = await User.findByPk(userId);

        if (!user) {
            throw new Unauthorized("用户不存在。");
        }

        req.user = user;

        next();
    } catch (error) {
        failure(res, error);
    }
};

module.exports = authenticate;

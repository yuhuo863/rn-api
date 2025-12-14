const {validationResult} = require("express-validator");
const {BadRequest} = require("http-errors");

function validatePassword(req) {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        throw new BadRequest(
            `请求参数错误: ${errors
                .array()
                .map((e) => e.msg)
                .join(", ")}`,
        );
    }
}

module.exports = {
    validatePassword,
};
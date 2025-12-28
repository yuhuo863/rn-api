const {validationResult} = require("express-validator");
const {BadRequest} = require("http-errors");

function validateParams(req) {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        throw new BadRequest(
            errors
                .array()
                .map(e => e.msg)[0]
        );
    }
}

module.exports = {
    validateParams,
};
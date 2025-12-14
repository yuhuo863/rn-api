const { failure } = require("../utils/responses.js");

module.exports = (err, req, res, next) => {
  failure(res, err);
};

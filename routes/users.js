var express = require("express");
var router = express.Router();
const { body } = require("express-validator");

const userController = require("../controllers/userController");
const authenticate = require("../middlewares/auth-user");
router.use(authenticate);

router.get("/me", userController.getCurrentUser);
router.put(
  "/me",
  [
    body("username")
      .optional()
      .isString()
      .withMessage("用户名必须是字符串")
      .isLength({ min: 6, max: 50 })
      .withMessage("用户名必须是6到50个字符"),
    body("email").optional().isEmail().withMessage("邮箱格式不正确"),
    body("sex").optional().isIn([0, 1]).withMessage("性别必须是0或1"),
  ],
  userController.updateUser,
);

module.exports = router;

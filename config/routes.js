const express = require("express");
const router = express.Router();

// Define your routes here
const indexRouter = require("../routes/index");

const authRouter = require("../routes/auth");
const userRouter = require("../routes/users");
const passwordRouter = require("../routes/passwords");
const categoryRouter = require("../routes/categories");
const noticeRouter = require("../routes/notices");

router.use("/", indexRouter);
router.use("/auth", authRouter);
router.use("/user", userRouter);
router.use("/password", passwordRouter);
router.use("/category", categoryRouter);
router.use("/notice", noticeRouter);

module.exports = router;

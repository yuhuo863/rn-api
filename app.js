const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");
require("@dotenvx/dotenvx").config();

const createError = require("http-errors");
const routes = require("./config/routes");
const errorHandler = require("./middlewares/error-handler");

const app = express();

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({extended: false}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

app.use(routes);

app.use((req, res, next) => {
    // catch 404 and forward to error handler
    next(createError(404));
});

app.use(errorHandler);

module.exports = app;

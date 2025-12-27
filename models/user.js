"use strict";
const {Model} = require("sequelize");
const {Conflict, BadRequest} = require("http-errors");
const bcrypt = require("bcrypt");
module.exports = (sequelize, DataTypes) => {
    class User extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            models.User.hasMany(models.Password, {
                as: "passwords",
            });
            models.User.hasMany(models.Category, {
                as: "categories",
            });
        }
    }

    User.init(
        {
            id: {
                type: DataTypes.UUID,
                defaultValue: DataTypes.UUIDV4,
                allowNull: false,
                primaryKey: true,
            },
            username: {
                type: DataTypes.STRING,
                allowNull: false,
                validate: {
                    notEmpty: {msg: "用户名不能为空"},
                    len: {args: [6, 45], msg: "用户名长度必须是6 ~ 45之间"},
                    async isUnique(value) {
                        const user = await User.findOne({where: {username: value}});
                        if (user) {
                            throw new Conflict("用户名已经存在");
                        }
                    },
                },
            },
            email: {
                type: DataTypes.STRING,
                allowNull: false,
                validate: {
                    notEmpty: {msg: "邮箱不能为空"},
                    isEmail: {msg: "邮箱格式不正确"},
                    async isUnique(value) {
                        const user = await User.findOne({where: {email: value}});
                        if (user) {
                            throw new Conflict("邮箱已存在，请直接登录");
                        }
                    },
                },
            },
            password: {
                type: DataTypes.STRING,
                allowNull: false,
                set(value) {
                    if (!value) throw new BadRequest("密码必须填写");
                    if (value.length < 8 || value.length > 45)
                        throw new BadRequest("密码长度必须是8 ~ 45之间");
                    this.setDataValue("password", bcrypt.hashSync(value, 10));
                },
            },
            avatar: {
                type: DataTypes.STRING,
                allowNull: true,
                validate: {
                    isUrl: {msg: "图片地址不正确。"},
                },
            },
            sex: {
                type: DataTypes.TINYINT,
                allowNull: false,
                validate: {
                    notEmpty: {msg: "性别不能为空"},
                    isIn: {
                        args: [[0, 1, 2]],
                        msg: "性别的值必须是，男性：1 女性：0 未选择：2",
                    },
                },
            },
            role: {
                type: DataTypes.TINYINT,
                allowNull: false,
                validate: {
                    notEmpty: {msg: "用户组不能为空。"},
                    isIn: {
                        args: [[0, 100]],
                        msg: "用户组的值必须是，普通用户：0 管理员：100。",
                    },
                },

            },
            lastReadNoticeAt: {
                type: DataTypes.DATE,
                allowNull: true,
                comment: "最后一次阅读通知的时间",
            },
            deleted: {
                type: DataTypes.BOOLEAN,
                allowNull: false,
                defaultValue: false,
                comment: "是否已注销",
            },
        },
        {
            sequelize,
            modelName: "User",
        },
    );
    return User;
};

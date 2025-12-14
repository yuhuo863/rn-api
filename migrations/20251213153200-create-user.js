"use strict";
/** @type {import('sequelize-cli').Migration} */
module.exports = {
    async up(queryInterface, Sequelize) {
        await queryInterface.createTable("Users", {
            id: {
                allowNull: false,
                primaryKey: true,
                type: Sequelize.UUID,
                defaultValue: Sequelize.UUIDV4,
            },
            username: {
                type: Sequelize.STRING,
                allowNull: false,
            },
            email: {
                type: Sequelize.STRING,
                allowNull: false,
            },
            password: {
                type: Sequelize.STRING,
                allowNull: false,
            },
            avatar: {
                type: Sequelize.STRING,
                allowNull: true,
            },
            sex: {
                type: Sequelize.TINYINT.UNSIGNED,
                allowNull: false,
                defaultValue: 2,
            },
            role: {
                type: Sequelize.TINYINT.UNSIGNED,
                allowNull: false,
                defaultValue: 0,
            },
            deleted: {
                type: Sequelize.BOOLEAN,
                allowNull: false,
                defaultValue: false,
            },
            createdAt: {
                allowNull: false,
                type: Sequelize.DATE,
            },
            updatedAt: {
                allowNull: false,
                type: Sequelize.DATE,
            },
        });
        await queryInterface.addIndex("Users", {
            fields: ["email"], // 要索引的字段
            unique: true, // 唯一索引
        });
        await queryInterface.addIndex("Users", {
            fields: ["username"],
            unique: true,
        });
    },
    async down(queryInterface, Sequelize) {
        await queryInterface.dropTable("Users");
        await queryInterface.dropIndex("Users", "email");
        await queryInterface.dropIndex("Users", "username");
    },
};

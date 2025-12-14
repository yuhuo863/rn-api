"use strict";
/** @type {import('sequelize-cli').Migration} */
module.exports = {
    async up(queryInterface, Sequelize) {
        await queryInterface.createTable("Passwords", {
            id: {
                allowNull: false,
                primaryKey: true,
                type: Sequelize.UUID,
                defaultValue: Sequelize.UUIDV4,
            },
            userId: {
                allowNull: false,
                type: Sequelize.UUID,
            },
            categoryId: {
                allowNull: false,
                type: Sequelize.UUID,
            },
            encrypted_blob: {
                // 加密后的密码数据(AES加密后的 JSON 字符串，包含 username, password, notes)
                allowNull: false,
                type: Sequelize.TEXT,
            },
            iv: {
                // 初始化向量，用于解密
                allowNull: false,
                type: Sequelize.STRING,
            },
            title: {
                type: Sequelize.STRING,
                allowNull: false,
            },
            site_url: {
                type: Sequelize.STRING,
                allowNull: true,
            },
            deletedAt: {
                type: Sequelize.DATE,
                allowNull: true,
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
        await queryInterface.addIndex("Passwords", ["userId"]);
        await queryInterface.addIndex("Passwords", ["categoryId"]);
    },
    async down(queryInterface, Sequelize) {
        await queryInterface.dropTable("Passwords");
        await queryInterface.removeIndex("Passwords", ["userId"]);
        await queryInterface.removeIndex("Passwords", ["categoryId"]);
    },
};

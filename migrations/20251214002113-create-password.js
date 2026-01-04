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
            password: {
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

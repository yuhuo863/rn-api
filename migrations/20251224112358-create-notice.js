'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
    async up(queryInterface, Sequelize) {
        await queryInterface.createTable('Notices', {
            id: {
                allowNull: false,
                primaryKey: true,
                type: Sequelize.UUID,
                defaultValue: Sequelize.UUIDV4
            },
            title: {
                type: Sequelize.STRING,
                allowNull: false
            },
            content: {
                type: Sequelize.TEXT,
                allowNull: false
            },
            type: {
                type: Sequelize.TINYINT,
                allowNull: true,
                defaultValue: 1,
                comment: '1: 系统公告, 2: 功能更新'
            },
            createdAt: {
                allowNull: false,
                type: Sequelize.DATE
            },
        });
        await queryInterface.addIndex('Notices', ['createdAt']);
    },
    async down(queryInterface, Sequelize) {
        await queryInterface.dropTable('Notices');
        await queryInterface.removeIndex('Notices', ['createdAt']);
    }
};
'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
    async up(queryInterface, Sequelize) {
        await queryInterface.addColumn('Users', 'avatar', {
            type: Sequelize.STRING,
            allowNull: true,
            after: 'username', // 在username字段后添加
        })
    },

    async down(queryInterface, Sequelize) {
        await queryInterface.removeColumn('Users', 'avatar');
    }
};

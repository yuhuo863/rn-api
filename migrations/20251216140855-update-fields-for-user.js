'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
    async up(queryInterface, Sequelize) {
        await queryInterface.addColumn('Passwords', 'username', {
            type: Sequelize.STRING,
            allowNull: false,
        });
        await queryInterface.addColumn('Passwords', 'password', {
            type: Sequelize.TEXT,
            allowNull: false,
        });
        await queryInterface.addColumn('Passwords', 'notes', {
            type: Sequelize.TEXT,
        });
    },

    async down(queryInterface, Sequelize) {
        await queryInterface.removeColumn('Passwords', 'username');
        await queryInterface.removeColumn('Passwords', 'password');
        await queryInterface.removeColumn('Passwords', 'notes');
    }
};

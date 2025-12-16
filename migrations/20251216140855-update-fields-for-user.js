'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
    async up(queryInterface, Sequelize) {
        await queryInterface.removeColumn('Passwords', 'encrypted_blob');
        await queryInterface.removeColumn('Passwords', 'iv');
        await queryInterface.addColumn('Passwords', 'username', {
            type: Sequelize.STRING,
            allowNull: false,
        });
        await queryInterface.addColumn('Passwords', 'encrypted_password', {
            type: Sequelize.TEXT,
            allowNull: false,
        });
        await queryInterface.addColumn('Passwords', 'notes', {
            type: Sequelize.TEXT,
        });
    },

    async down(queryInterface, Sequelize) {
        await queryInterface.addColumn('Passwords', 'encrypted_blob', {
            type: Sequelize.TEXT,
        });
        await queryInterface.addColumn('Passwords', 'iv', {
            type: Sequelize.STRING,
        });
        await queryInterface.removeColumn('Passwords', 'username');
        await queryInterface.removeColumn('Passwords', 'encrypted_password');
        await queryInterface.removeColumn('Passwords', 'notes');
    }
};

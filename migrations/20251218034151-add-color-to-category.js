'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
    async up(queryInterface, Sequelize) {
        await queryInterface.addColumn('Categories', 'color', {
            type: Sequelize.STRING,
            allowNull: true,
            after: 'icon' // 在 icon 列之后添加
        })
    },

    async down(queryInterface, Sequelize) {
        await queryInterface.removeColumn('Categories', 'color')
    }
};

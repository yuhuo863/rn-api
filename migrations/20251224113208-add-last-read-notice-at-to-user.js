'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
    async up(queryInterface, Sequelize) {
        await queryInterface.addColumn('Users', 'lastReadNoticeAt', {
            type: Sequelize.DATE,
            allowNull: true,
            // defaultValue: Sequelize.NOW,
            after: 'role',
            comment: '用户最后一次阅读通知的时间',
        });
    },

    async down(queryInterface, Sequelize) {
        await queryInterface.removeColumn('Users', 'lastReadNoticeAt');
    }
};

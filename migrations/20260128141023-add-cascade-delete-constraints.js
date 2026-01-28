'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
    async up(queryInterface, Sequelize) {
        await queryInterface.addConstraint('Categories', {
            fields: ['userId'],
            type: 'foreign key',
            name: 'fkey_categories_user_cascade', // 自定义的新约束名
            references: {
                table: 'Users',
                field: 'id',
            },
            onDelete: 'CASCADE', // 核心：删除用户 -> 删除分类
            onUpdate: 'CASCADE',
        });

        await queryInterface.addConstraint('Passwords', {
            fields: ['categoryId'],
            type: 'foreign key',
            name: 'fkey_passwords_category_cascade', // 自定义的新约束名
            references: {
                table: 'Categories',
                field: 'id',
            },
            onDelete: 'CASCADE', // 核心：删除分类 -> 删除密码
            onUpdate: 'CASCADE',
        });
    },

    async down(queryInterface, Sequelize) {
        await queryInterface.removeConstraint('Categories', 'fkey_categories_user_cascade');
        await queryInterface.removeConstraint('Passwords', 'fkey_passwords_category_cascade');
    }
};

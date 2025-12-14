'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
    async up(queryInterface, Sequelize) {
        const passwords = [];
        const counts = 100;

        for (let i = 1; i <= counts; i++) {
            const password = {
                id: `${i}`,
                userId: '967f7842-2a09-449f-9952-d6e5c9d2cb47',
                title: `Facebook ${i}`,
                categoryId: '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867',
                encrypted_blob: `encrypted_blob${i}`,
                iv: `iv${i}`,
                createdAt: new Date(),
                updatedAt: new Date(),
            };

            passwords.push(password);
        }

        await queryInterface.bulkInsert('Passwords', passwords, {});
    },

    async down(queryInterface, Sequelize) {
        await queryInterface.bulkDelete('Passwords', null, {});
    }
};

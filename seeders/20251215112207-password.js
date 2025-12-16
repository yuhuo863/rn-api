'use strict';

/** @type {import('sequelize-cli').Migration} */
const {v4: uuidV4} = require('uuid')
module.exports = {
    async up(queryInterface, Sequelize) {
        const passwords = [];
        const counts = 100;

        for (let i = 1; i <= counts; i++) {
            const password = {
                id: `${uuidV4()}`,
                userId: '967f7842-2a09-449f-9952-d6e5c9d2cb47',
                title: `Facebook ${i}`,
                username: `username${i}`,
                encrypted_password: `encrypted_password${i}`,
                notes: `This is a note for password ${i}`,
                site_url: `https://www.facebook.com/user${i}`,
                categoryId: 'c69c0f9d-c38b-4925-b897-8889beb0182c',
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

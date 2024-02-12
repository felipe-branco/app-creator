/** @type {import('ts-jest').JestConfigWithTsJest} */

const base = require('./jest.config.base.js')

module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  projects: [
    '<rootDir>/packages/*/jest.config.js',
    '<rootDir>/app/jest.config.js'
  ],
}

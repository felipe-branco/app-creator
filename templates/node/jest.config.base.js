// jestconfig.base.js
module.exports = {
  roots: ['<rootDir>/src', '<rootDir>/tests'],
  transform: {
    "^.+\\.(ts|tsx)$": "ts-jest"
  },
  testRegex: '(/tests/.*.(test|spec)).(jsx?|tsx?)$',
  moduleFileExtensions: ['ts', 'tsx', 'js', 'jsx', 'json', 'node'],
}

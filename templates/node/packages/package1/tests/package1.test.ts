import { Package1 } from '../src/package1'

describe('Package1', () => {
  jest.spyOn(global.console, 'log')

  it('Logs into console', () => {
    Package1()
    expect(console.log).toHaveBeenCalledWith('I am package 1')
  })
})

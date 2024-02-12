import { Package2 } from '../src/package2'

describe('Package1', () => {
  jest.spyOn(global.console, 'log')

  it('Logs into console', () => {
    Package2()
    expect(console.log).toHaveBeenCalledWith('I am package 2')
  })
})

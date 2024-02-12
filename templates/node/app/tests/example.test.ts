import { main } from '../src/example'

describe('main', () => {
  jest.spyOn(global.console, 'log')

  it('Calls package functions', () => {
    main()
    expect(console.log).toHaveBeenCalledWith('I am package 1')
    expect(console.log).toHaveBeenCalledWith('I am package 2')
  })
})

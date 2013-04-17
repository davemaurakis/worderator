Worderator = helper.require 'worderator'
describe 'App', ->

  it 'can be required', ->
    expect(Worderator).to.not.be.undefined

  it 'can be instantiated', ->
    new Worderator

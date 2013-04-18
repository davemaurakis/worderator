Worderator = helper.require 'worderator'
describe 'Worderator', ->

  it 'can be required', ->
    expect(Worderator).to.not.be.undefined

  xit 'throws an error if no input is provided', ->
    fn = -> new Worderator
    expect(fn).to.throw Error

  it 'can be instantiated with a number', ->
    new Worderator 1

  it 'takes in a number on instantiation', ->
    worderator = new Worderator 1
    expect(worderator.input).to.equal 1

  it 'can translate a ones-place number to a word', ->
    worderator = new Worderator
    expect(worderator._ones[0]).to.equal 'zero'
    expect(worderator._ones[1]).to.equal 'one'
    expect(worderator._ones[2]).to.equal 'two'
    expect(worderator._ones[3]).to.equal 'three'
    expect(worderator._ones[4]).to.equal 'four'
    expect(worderator._ones[5]).to.equal 'five'
    expect(worderator._ones[6]).to.equal 'six'
    expect(worderator._ones[7]).to.equal 'seven'
    expect(worderator._ones[8]).to.equal 'eight'
    expect(worderator._ones[9]).to.equal 'nine'

  it 'can translate a teens-place number to a word', ->
    worderator = new Worderator
    # expect(worderator._teens[0]).to.equal 'zero'
    expect(worderator._teens[1]).to.equal 'eleven'
    expect(worderator._teens[2]).to.equal 'twelve'
    expect(worderator._teens[3]).to.equal 'thirteen'
    expect(worderator._teens[4]).to.equal 'fourteen'
    expect(worderator._teens[5]).to.equal 'fifteen'
    expect(worderator._teens[6]).to.equal 'sixteen'
    expect(worderator._teens[7]).to.equal 'seventeen'
    expect(worderator._teens[8]).to.equal 'eighteen'
    expect(worderator._teens[9]).to.equal 'nineteen'

  it 'can translate a tens-place number to a word', ->
    worderator = new Worderator
    # expect(worderator._ones[1]).to.equal 'one'
    expect(worderator._tens[2]).to.equal 'twenty'
    expect(worderator._tens[3]).to.equal 'thirty'
    expect(worderator._tens[4]).to.equal 'forty'
    expect(worderator._tens[5]).to.equal 'fifty'
    expect(worderator._tens[6]).to.equal 'sixty'
    expect(worderator._tens[7]).to.equal 'seventy'
    expect(worderator._tens[8]).to.equal 'eighty'
    expect(worderator._tens[9]).to.equal 'ninety'

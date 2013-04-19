Worderator = helper.require 'worderator'
describe 'Worderator', ->

  it 'can be required', ->
    expect(Worderator).to.not.be.undefined

  it 'can be instantiated with a number', ->
    new Worderator 1

  it 'takes in a number on instantiation', ->
    worderator = new Worderator 1
    expect(worderator.input).to.equal 1

  it 'converts a number into a string', ->
    worderator = new Worderator 456
    expect(worderator.number).to.equal '456'

  it 'removes any non-number characters', ->
    worderator = new Worderator
    clean = worderator.clean '1,234,567'
    expect(clean).to.equal '1234567'


  it 'can translate a ones-place number to a word', ->
    worderator = new Worderator
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
    expect(worderator._tens[1]).to.equal 'ten'
    expect(worderator._tens[2]).to.equal 'twenty'
    expect(worderator._tens[3]).to.equal 'thirty'
    expect(worderator._tens[4]).to.equal 'forty'
    expect(worderator._tens[5]).to.equal 'fifty'
    expect(worderator._tens[6]).to.equal 'sixty'
    expect(worderator._tens[7]).to.equal 'seventy'
    expect(worderator._tens[8]).to.equal 'eighty'
    expect(worderator._tens[9]).to.equal 'ninety'

  it 'can split a ones number', ->
    worderator = new Worderator
    worderator.split '4'
    expect(worderator.parts[0][0]).to.be.null
    expect(worderator.parts[0][1]).to.be.null
    expect(worderator.parts[0][2]).to.equal '4'

  it 'can split a tens number', ->
    worderator = new Worderator
    worderator.split '45'
    expect(worderator.parts[0][0]).to.be.null
    expect(worderator.parts[0][1]).to.equal '4'
    expect(worderator.parts[0][2]).to.equal '5'

  it 'can split a hundreds number', ->
    worderator = new Worderator
    worderator.split '456'
    expect(worderator.parts[0][0]).to.equal '4'
    expect(worderator.parts[0][1]).to.equal '5'
    expect(worderator.parts[0][2]).to.equal '6'

  it 'can split a thousands number', ->
    worderator = new Worderator
    worderator.split '456789'
    expect(worderator.parts[1][0]).to.equal '4'
    expect(worderator.parts[1][1]).to.equal '5'
    expect(worderator.parts[1][2]).to.equal '6'
    expect(worderator.parts[0][0]).to.equal '7'
    expect(worderator.parts[0][1]).to.equal '8'
    expect(worderator.parts[0][2]).to.equal '9'

  it 'can split a millions number', ->
    worderator = new Worderator
    worderator.split '123456789'
    expect(worderator.parts[2][0]).to.equal '1'
    expect(worderator.parts[2][1]).to.equal '2'
    expect(worderator.parts[2][2]).to.equal '3'
    expect(worderator.parts[1][0]).to.equal '4'
    expect(worderator.parts[1][1]).to.equal '5'
    expect(worderator.parts[1][2]).to.equal '6'
    expect(worderator.parts[0][0]).to.equal '7'
    expect(worderator.parts[0][1]).to.equal '8'
    expect(worderator.parts[0][2]).to.equal '9'

  it 'can translate a one-place number', ->
    worderator = new Worderator
    translated = worderator.translate [[null, '0', '8']]
    expect(translated).to.equal 'eight'

  it 'can translate a two-place number', ->
    worderator = new Worderator
    translated = worderator.translate [[null, '4', '5']]
    expect(translated).to.equal 'forty five'

  it 'can translate a three-place number', ->
    worderator = new Worderator
    translated = worderator.translate [['3', '4', '5']]
    expect(translated).to.equal 'three hundred and forty five'

  it 'can do it all', ->
    worderator = new Worderator '123456789'
    translated = worderator.worderize()
    expect(translated).to.equal '''
      one hundred and twenty three million four hundred and fifty six thousand seven hundred and eighty nine
    '''
  describe 'Worderator::', ->
    it 'has a clean method', ->
      expect(Worderator.clean '1,234').to.equal '1234'

    it 'has a worderize method', ->
      expect(Worderator.worderize '1,234').to.equal 'one thousand two hundred and thirty four'

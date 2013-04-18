class Worderator

  constructor: (input) ->
    @input = input
    @number = @input?.toString()

  split: (number) ->
    _parts = []
    parts = number.split ''
    while parts.length > 0
      temp = []
      for i in [2..0]
        temp.push parts.pop() or null
      _parts.push temp.reverse()
    @parts = _parts.reverse()

  translate: (parts) ->
    for part in parts
      output = []
      for number, index in part
        word = @map(index)?[number]
        output.push word if word
    output.join ' '

  map: (index) ->
    places =
      0: @_hundreds
      1: @_tens
      2: @_ones
    places[index]

  _ones:
    0: 'zero'
    1: 'one'
    2: 'two'
    3: 'three'
    4: 'four'
    5: 'five'
    6: 'six'
    7: 'seven'
    8: 'eight'
    9: 'nine'

  _teens:
    1: 'eleven'
    2: 'twelve'
    3: 'thirteen'
    4: 'fourteen'
    5: 'fifteen'
    6: 'sixteen'
    7: 'seventeen'
    8: 'eighteen'
    9: 'nineteen'

  _tens:
    1: 'ten'
    2: 'twenty'
    3: 'thirty'
    4: 'forty'
    5: 'fifty'
    6: 'sixty'
    7: 'seventy'
    8: 'eighty'
    9: 'ninety'

module.exports = Worderator

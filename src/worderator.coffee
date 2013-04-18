class Worderator

  constructor: (input) ->
    @input = input
    @number = @input?.toString()

  split: (number) ->
    @parts = []
    parts = number.split ''
    while parts.length > 0
      temp = []
      for i in [1..3]
        temp.push parts.shift()
      @parts.push temp
    @parts

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

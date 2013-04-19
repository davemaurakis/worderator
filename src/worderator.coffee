class Worderator

  constructor: (input) ->
    @input = input
    @number = @input?.toString()

  worderize: ->
    number = @clean @number
    parts = @split(number)
    @translate parts

  clean: (string) ->
    string.replace /\D/g, ''

  split: (number) ->
    @parts = []
    parts = number.split ''
    while parts.length > 0
      temp = []
      for i in [2..0]
        temp.push parts.pop() or null
      @parts.push temp.reverse()
    @parts

  translate: (parts) ->
    output = []
    for part, i in parts
      group = @_groups[i]
      section = []
      for number, index in part
        word = @[@map[index]]?[number]
        word += ' hundred and' if index is 0 and word
        section.push word if word
      section.push group if group
      output.push section.join ' '
    output.reverse().join ' '

  map:
    0: '_ones'
    1: '_tens'
    2: '_ones'

  _groups:
    1: 'thousand'
    2: 'million'
    3: 'billion'

  _ones:
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

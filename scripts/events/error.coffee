path = require 'path'
natural = require 'natural'

{msgVariables, stringElseRandomKey} = require path.join '..', 'lib', 'common.coffee'
answers = {}

class error
  constructor: (@interaction) ->
  process: (msg) =>
    type = @interaction.type?.toLowerCase() or 'random'
    switch type
      when 'block'
        messages = @interaction.answer.map (line) ->
          return msgVariables line, msg
        msg.sendWithNaturalDelay messages
      when 'random'
        message = stringElseRandomKey @interaction.answer
        message = msgVariables message, msg
        msg.sendWithNaturalDelay message

module.exports = error

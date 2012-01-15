{EventEmitter} = require 'events'
Movements = require './movements'
parser = require './parser'

class IngCrawler extends EventEmitter

  constructor: (filePath)->
    parser filePath, (err, movements) =>
      throw err if err
      @emit 'end', new Movements(movements)

module.exports = IngCrawler

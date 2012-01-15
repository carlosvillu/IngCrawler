IngCrawler = require '../lib'
Movements = require '../lib/movements'
{readFile} = require 'fs'
{log} = console

describe 'IngCrawler', ->
  it 'should exist the class', ->
    IngCrawler.should.be.a 'function'

  describe 'an instance', ->
    beforeEach ->
      @crawler = new IngCrawler("#{__dirname}/fixtures/movimientos.xls")

    it 'should be a instance of IngCrawler', ->
      @crawler.should.be.an.instanceof IngCrawler

    it 'should emmit a end event when the Movements object was created', (done) ->
      @crawler.on 'end', (movements) ->
        done()
    it 'movements in the end event should be an instanceOf Movements', (done) ->
      @crawler.on 'end', (movements) ->
        movements.should.be.an.instanceof Movements
        done()

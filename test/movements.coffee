Movements = require '../lib/movements'

describe 'Movements', ->
  it 'The class should be exists', ->
    Movements.should.not.eql undefined

  describe 'an instance', ->
    beforeEach ->
      @movements = new Movements()
    it 'should be instanceOf Movements', ->
      @movements.should.be.an.instanceof Movements

    it 'should have a array with the momevents', ->
      @movements.movements.should.be.an.instanceof Array

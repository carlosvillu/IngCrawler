parser = require '../lib/parser'

pathToFixture = "#{__dirname}/fixtures/movimientos.xls"
pathToError = "#{__dirname}/fixtures/movimientos.err"

describe 'Parser', ->

  it 'Should be a function', ->
    parser.should.be.a 'function'
  
  it 'If call without a valid path throw a error', (done) ->
    parser pathToError, (err, movements) ->
      err.should.be.an.instanceof Error
      done()

  it 'if a correct path should be return a array and null err', (done) ->
    parser pathToFixture, (err, movements) ->
      done(err) if err
      movements.should.be.an.instanceof Array
      done()

  it 'if length is not zero, each element should be a object', (done) ->
    parser pathToFixture, (err, movements) ->
      done(err) if err
      done(new Error "The length is #{movements.length}") if movements.length is 0
      movement.should.be.a 'object' for movement in movements
      done()

  it 'each object should has the key date_operation', (done) ->
    parser pathToFixture, (err, movements) ->
      done(err) if err
      movement.should.have.property 'date_operation' for movement in movements
      done()

  it 'each object should has the key date_valor', (done) ->
    parser pathToFixture, (err, movements) ->
      done(err) if err
      movement.should.have.property 'date_valor' for movement in movements
      done()

  it 'each object should has the key description', (done) ->
    parser pathToFixture, (err, movements) ->
      done(err) if err
      movement.should.have.property 'description' for movement in movements
      done()

  it 'each object should has the key amount', (done) ->
    parser pathToFixture, (err, movements) ->
      done(err) if err
      movement.should.have.property 'amount' for movement in movements
      done()

  it 'each object should has the key balance',(done) ->
    parser pathToFixture, (err, movements) ->
      done(err) if err
      movement.should.have.property 'balance' for movement in movements
      done()
  
  it 'the data_operation field should be a Date type', (done) ->
    parser pathToFixture, (err, movements) ->
      done(err) if err
      movement.date_operation.should.be.an.instanceof Date for movement in movements
      done()
    
  it 'the data_valor field can be parser to Data type', (done) ->
    parser pathToFixture, (err, movements) ->
      done(err) if err
      movement.date_valor.should.be.an.instanceof Date for movement in movements
      done()
  it 'Description should be a String', (done) ->
    parser pathToFixture, (err, movements) ->
      done(err) if err
      movement.description.should.be.a 'string' for movement in movements
      done()
  it 'amount should be a Integer', (done) ->
    parser pathToFixture, (err, movements) ->
      done(err) if err
      movement.amount.should.be.a 'number' for movement in movements
      done()
  it 'balance should be a Integer', (done) ->
    parser pathToFixture, (err, movements) ->
      done(err) if err
      movement.balance.should.be.a 'number' for movement in movements
      done()

  describe 'The return object should be the expected', ->
    beforeEach () ->
      @expectedOne =
        date_operation: new Date(2011, 11, 26)
        date_valor: new Date(2011, 11, 26)
        description: "Ingreso N�mina"
        amount: 3675.7
        balance: 3424.63
      @expectedThree =
        date_operation: new Date(2011, 11, 27)
        date_valor: new Date(2011, 11, 27)
        description: "Pago PELUQUERIA"
        amount: -9
        balance: 3390.26

    it 'should be 4 operations', (done) ->
      parser pathToFixture, (err, movements) ->
        done(err) if err
        movements.should.have.length(5)
        done()

    it '#movent[0] should be equl to @expectedOne', (done) ->
      parser pathToFixture, (err, movements) =>
        done(err) if err
        movements[0].should.eql @expectedOne
        done()
    it '#movent[3] should be equl to @expectedThree', (done) ->
      parser pathToFixture, (err, movements) =>
        done(err) if err
        movements[3].should.eql @expectedThree
        done()

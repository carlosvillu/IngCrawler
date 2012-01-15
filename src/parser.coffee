{exists} = require 'path'
{readFile} = require 'fs'
$ = require 'jquery'


getOperationFromHTML = (tr) ->
  dateOperation = $(tr).find('td').eq(0).html().replace /["|=]/g, ''
  dateValor = $(tr).find('td').eq(1).html().replace /["|=]/g, ''
  amountValue = $(tr).find('td').eq(3).html().replace('.','') #Whitout millar point
  balanceValue = $(tr).find('b').html().replace('.','') #Whitout millar point

  date_operation: new Date(dateOperation.split('-').reverse())
  date_valor: new Date(dateValor.split('-').reverse())
  description: $(tr).find('td').eq(2).html()
  amount: parseFloat(amountValue.replace(',', '.'), 10) #replace decimal comma for point
  balance: parseFloat(balanceValue.replace(',', '.'), 10) #replace decimal comma for point

module.exports = (path, cb) ->
  exists path, (exists) ->
    err = new Error "This file #{path} dont exists" unless exists
    if err
      cb(err)
    else
      readFile path, 'utf8', (err, data) ->
        parserOperations = []
        xls = data.replace(/[\n\r\t]/g, "")
        operations = ($ xls).find('tr:has(td.azul11)')
        parserOperations.push(getOperationFromHTML operation) for operation in operations.slice 1
        cb(null, parserOperations)

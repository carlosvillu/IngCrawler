(function() {
  var $, exists, getOperationFromHTML, readFile;

  exists = require('path').exists;

  readFile = require('fs').readFile;

  $ = require('jquery');

  getOperationFromHTML = function(tr) {
    var amountValue, balanceValue, dateOperation, dateValor;
    dateOperation = $(tr).find('td').eq(0).html().replace(/["|=]/g, '');
    dateValor = $(tr).find('td').eq(1).html().replace(/["|=]/g, '');
    amountValue = $(tr).find('td').eq(3).html().replace('.', '');
    balanceValue = $(tr).find('b').html().replace('.', '');
    return {
      date_operation: new Date(dateOperation.split('-').reverse()),
      date_valor: new Date(dateValor.split('-').reverse()),
      description: $(tr).find('td').eq(2).html(),
      amount: parseFloat(amountValue.replace(',', '.'), 10),
      balance: parseFloat(balanceValue.replace(',', '.'), 10)
    };
  };

  module.exports = function(path, cb) {
    return exists(path, function(exists) {
      var err;
      if (!exists) err = new Error("This file " + path + " dont exists");
      if (err) {
        return cb(err);
      } else {
        return readFile(path, 'utf8', function(err, data) {
          var operation, operations, parserOperations, xls, _i, _len, _ref;
          parserOperations = [];
          xls = data.replace(/[\n\r\t]/g, "");
          operations = ($(xls)).find('tr:has(td.azul11)');
          _ref = operations.slice(1);
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            operation = _ref[_i];
            parserOperations.push(getOperationFromHTML(operation));
          }
          return cb(null, parserOperations);
        });
      }
    });
  };

}).call(this);

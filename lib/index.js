(function() {
  var EventEmitter, IngCrawler, Movements, parser,
    __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  EventEmitter = require('events').EventEmitter;

  Movements = require('./movements');

  parser = require('./parser');

  IngCrawler = (function(_super) {

    __extends(IngCrawler, _super);

    function IngCrawler(filePath) {
      var _this = this;
      parser(filePath, function(err, movements) {
        if (err) throw err;
        return _this.emit('end', new Movements(movements));
      });
    }

    return IngCrawler;

  })(EventEmitter);

  module.exports = IngCrawler;

}).call(this);

# IngCrawler
Parseador del fichero excel resultante de pedir los últimos movimientos en la web del banco [Ing](http://www.ingdirect.es)

## Instalación
Aun no está publicado en [NPM](http://npmjs.org/), pero esa es la intención en cuanto llegue a la versión 0.1.0.

En este momento para poder usarlo en un proyecto el método recomendado sería clonar el repositorio dentro de tu ./node_modules folder de tu proyecto.

## Como usarlo

    var IngCrawler = require('IngCrawler')
        ,crawler = new IngCrawler("Path/a/mi/fichero/xls");
    
    crawler.on("end", function(err, movimientos){
      // movimientos es una instancia del objeto Movements.
      var lenMov = movimientos.movements.length;
      while(lenMov--){
        var movimiento = movimiento.movements[lenMov];
        console.log("Fecha Valor: " + movimiento.date_valor.toLocalString());
        console.log("Fecha Operació: " + movimiento.date_operation.toLocalString());
        console.log("Concepto: " + movimiento.description);
        console.log("Cantidad: " + movimiento.amount);
        console.log("Saldo en cuenta: " + movimiento.balance);
      }
    
    });


## Objeto Movements
Es la abtracción de los movimientos que se han producido en la cuenta. Viene representado por un array de operaciones, donde cada operación es un objeto literal con los siguientes campos:

* date_valor (Date) Fecha en la que si hizo efectiva la operación
* date_operation (Date) Fecha en la que se realizo la operación
* description (String) Concepto de la operación
* amount (Float) Cantidad de la operación
* balance (Float) Estado de la cuenta después de realizar la operación

## License 

(The MIT License)

Copyright (c) 2012 Carlos Villuendas &lt;carlosvillu@gmail.com&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

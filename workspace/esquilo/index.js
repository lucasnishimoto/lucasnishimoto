const Sqrl = require('squirrelly');

const data = {
  favoriteCake: "Chocolate",
  teste2: "asd"
}

Sqrl.renderFile("templete.tf", data, function(error, data){console.log(data)} )


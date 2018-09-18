

function compose(a, b){
    return b(a());
}

var greet = function() {return "Bienvenidos"; };
var yell = function(str) { return str.toUpperCase() + "!"; };
console.log(compose(greet, yell)); // => BIENVENIDOS!

var generate = function() { return 2; };
var square = function(x) { return x * x; }
console.log(compose(generate, square)); // => 4



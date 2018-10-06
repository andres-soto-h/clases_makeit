function minimo() {
    return Array.prototype.concat.apply([], arguments).reduce(function (p, v) {
      return ( p < v ? p : v );
    });
  }
  
  function maximo() {
    return Array.prototype.concat.apply([], arguments).reduce(function (p, v) {
      return ( p > v ? p : v );
    });
  }

  function maximo() {
    var args = Array.prototype.slice.call(arguments);
    args = args.sort(function(a, b) {
      return b - a;
    });
    return args[0];
  }
  
  function minimo() {
    var args = Array.prototype.slice.call(arguments);
    args = args.sort(function(a, b) {
      return a - b;
    });
    return args[0];
  }
  
console.log(maximo(5, 10, 20, 50, 32)) //=> 50

console.log(minimo(1, 44, 2, 8)) //=> 2
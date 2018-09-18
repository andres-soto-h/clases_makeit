
function transform(thing, fun){
    return thing.map(function(x){return fun(x);});
}

console.log(transform([1, 2, 3], function(i) { return i * 2;}))


function filter(arr, func) {
    return arr.filter(func);
}

var even = function(i) { return i % 2 === 0 };
console.log(filter([1, 2, 3, 4], even))

var none = function(i) { return i >=3 ; };
console.log(filter([1, 2, 3, 4], none))
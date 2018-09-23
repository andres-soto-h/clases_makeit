function counter(){
    var count = 0;
    return function(){
        return count+=1;
    }
}


var count = counter();
console.log(count()); // => 1
console.log(count()); // => 2
console.log(count()); // => 3
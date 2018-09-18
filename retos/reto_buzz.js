
fizzBuzz = function(n){
    if(n%3===0){
        if(n%5===0){
            return "fizzbuzz";
        }else{
            return "fizz";
        }
    }else if(n%5===0){
        return "buzz";
    }else{
        return n;
    }
}

console.log(fizzBuzz(15));
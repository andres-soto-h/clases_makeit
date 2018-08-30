

function factorial(n){
    f=1;
    while (n>0){
      f*=n;
      n=n-1;
    }
    return f;
  }

  console.log(factorial(5));
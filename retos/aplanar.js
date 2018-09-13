function flatten(arr) {
    var array = [];
    while(arr.length) {
      var value = arr.shift();
      if(Array.isArray(value)) {
        arr = value.concat(arr);
      } else {
        array.push(value);
      }
    }
    return array;
  }

  // function flatten(arr) {
  //   return arr.reduce(function(memo, a) {
  //     return memo.concat(a);
  //   }, []);
  // }

  console.log(flatten([1,[2,[3]],[4]])); // => [1,2,3,4]  
function order(arr, reverse = false) {
    var a = 0; b = 0;
    for (var i = 0; i < arr.length; i++) {
        for (var j = 0; j < arr.length; j++) {
            if (arr[j + 1] > arr[j]) {
                var b = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = b;
            }
        }
    }
    return reverse ? arr : arr.reverse()
}

function order2(arr, reverse) {
    return arr.sort(function(a, b) {
      return reverse ? b - a : a - b
    });
  }

console.log(order([2, 3, 7, 1, 5, 4],true))
console.log(order2([2, 3, 7, 1, 5, 4]))
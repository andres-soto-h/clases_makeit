function order(arr) {

    var arr2=[];
    var a = 0;
    var b = 0;
    var mayor = 0;

    for (var i = 2; i < arr.length; i++) {

        for (var j = 2; j < arr.length; i++){

            a = arr[j];
            b = arr[j + 1];

            if (b > a) {
                mayor = b;
            }

        }

        arr2.push(mayor)

    }

    return arr2
}

console.log(order([2, 3, 7, 1, 5, 4]))
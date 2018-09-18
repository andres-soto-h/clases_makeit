function promediame(array){
    var total = array.reduce((t, n) => t + n, 0);
    
    if (array.length==0){
        return 0;
    }else{
        return total/array.length;
    }
    
}

promediame([3,4]) 
promediame([3]) 
promediame([]) 
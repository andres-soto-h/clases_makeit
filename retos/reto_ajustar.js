

function adjustText(text, n){
    if (text.length==0){
        return text.concat(" ".repeat(n));
    }else if(n==0){
        return "";
    }else if(text.length>n){
        return text.substring(0,text.length-n)
    }else{
        return text.concat(" ".repeat(n-text.length));
    }

}

console.log(adjustText('Maker',0))

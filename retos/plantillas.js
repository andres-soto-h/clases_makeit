function template(str, obj) {

    var words = str.split(" ")
    var results = str

    if (words) {
        words.forEach(function (element) {
            end_obj=element.indexOf("]")            
            if(end_obj>=0){
                key=element.toString().substr(1,end_obj-1)
                results=results.replace("["+key+"]",obj[key])
            }
        });
    }

    return results;
    console.log(results);
}

template("Hola [nombre]", { nombre: "German" }); // => "Hola German"
template("Hola [nombre], tu saldo es [saldo]", { nombre: "German", saldo: 12000 }); // => "Hola German, tu saldo es 12000"
template("Hola mundo", {}) // => "Hola mundo"
template("Hola [nombre]", {}); // => "Hola undefined"
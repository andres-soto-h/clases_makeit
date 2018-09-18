var person = {
    name: "James",
    hello: function (thing) {
        console.log(this.name + " says: " + thing)
    }
}

//call
// person.hello("Bond")
// person.hello.call({name: "Andres"}, "cosa")

//bind
person.hello("World")
var helloFunc = person.hello.bind({
    name: "Jim Smith"
})
helloFunc("world")

//scope

var name = "Andres";

function showName() {
    var name = "Soto";
    console.log(name);
}

console.log(name);
showName();

//hoisting: Javascript lee todas las variables 
//y hace su definicion, pero no asigna los valores hasta llegar a la linea

var x = 1;
console.log(x + " " + y);
var y = 2;

nombreDelGato("Dumas");

function nombreDelGato(nombre){
    console.log("El nombre de mi gato es: " + nombre);
}
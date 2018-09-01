// // var personaLiteral={
// //     nombre: "Juan Literal",
// //     apellido: "Hz",
// //     saluda: function(){
// //         return "Hola soy " + this.nombre;
// //     }
// // };

// var Persona = function(nombre, apellido){
//     this.nombre=nombre;
//     this.apellido=apellido;
//     this.saluda=function(nombre2){
//         console.log("hola "+nombre2+"soy "+this.nombre);
//     };
// };

// // p1=new Persona("Pepito", "Perez");

// // p1.saluda('Pedro');

// // function printObject(obj){
// //     for (var key in obj){
// //         console.log(key+": "+obj[key]);
// //     }
// // }

// // printObject(p1);


var Car = function (brand, model, cc) {
    this.brand = brand;
    this.model = model;
    this.cc = cc;
    this.speed = 0;
    this.accelerate = function () {
        this.speed += (0.003 * this.cc);
    };
    this.break = function () {
        new_speed = this.speed - (0.0035 * this.cc);
        if (new_speed < 0) {
            this.speed = 0;
        } else {
            this.speed = new_speed;
        }
    };
}

function compareSpeed(car1, car2) {
    if (car1.speed > car2.speed) {
        return car1.brand + " is Faster than " + car2.brand
    } else {
        return car2.brand + " is Faster than " + car1.brand
    }
};


car1 = new Car("Mercedez", "XZ", 5000);
car1.accelerate();
car1.accelerate();

Car.prototype.aceite="Full"

car2 = new Car("Lamborgini", "Murcielago", 8000);
car2.accelerate();
car2.accelerate();

console.log(car1.speed);
console.log(car2.speed);

console.log(compareSpeed(car1, car2));
console.log(car2.aceite)

var Bus = function(marca, modelo, cc, capacidad){
  Car.call(this, marca, modelo, cc);
  this.capacidad=capacidad;
}

Bus.prototype = new Car();

b1 = new Bus("Marcopolo", "Trail", 5000, 50);

console.log(b1.model)

// //Recursividad

// var factorial = function (n) {
//     if (n == 0) {
//         return 1;
//     } else {
//         return n * factorial(n - 1);
//     }
// }

// console.log(factorial(3));


// //funcion revursiva para determinar si un numero es par o impar


// function isEven(n) {
//     if (n == 0) {
//         return "Is Even"
//     } else if (n == 1) {
//         return "Is Odd"
//     } else {
//         return isEven(n - 2);
//     }
// }

// console.log(isEven(7));

// //escribir una función recursiva que sume los elementos de un array

// var arraySum = function (my_array){
//     if (my_array.length===1){
//         return my_array[0];
//     }else{
//         return my_array.pop() + arraySum(my_array)
//     }
// }

// console.log(arraySum([1, 2, 3]));




//edad y funcion crecer que cada vez que se llame aumente la edad en un año

// var Persona = function(nombre, apellido){
//     this.nombre=nombre;
//     this.apellido=apellido;
// }

// var p1= new Persona("Andrés","Soto");
// console.log(p1.nombre);

// Persona.prototype.saluda=function(){
//     return "Hola " + this.nombre;
// };

// Persona.prototype.age=0;

// Persona.prototype.saluda=function(){
//     return "Hola " + this.nombre;
// };

// p1.age=10

// Persona.prototype.growUp=function(){
//     return this.age+=1;
// };

// console.log(p1.saluda());
// console.log(p1.age);
// p1.growUp();
// console.log(p1.age);
// p1.growUp();
// console.log(p1.age);
// p1.growUp();



// longitud = function(str){
//     if (str===""){
//       return 0;
//     }else{
//       return str.length;
//     }
//   }

// console.log(longitud("Hola"));



// isAlive = function(playerName, points){
//     if (playerName=="ikk" && points>30 || playerName=="gut" && points>10){
//       return true;
//     }else{
//       return false;
//     }
//   }

// console.log(isAlive("gut", 5));
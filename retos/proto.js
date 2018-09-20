var Square=function(width,height){
    this.width=width,
    this.height=height,
    this.calculateArea=function (){
        return this.width*this.height
    }
}

var square = new Square(50, 60);

console.log(square.width); // => 50
console.log(square.height); // => 60
console.log(square.calculateArea()); // => 3000
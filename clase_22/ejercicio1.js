// var agenda = [{
//         name: 'Andres',
//         phone: '210-2022'
//     },
//     {
//         name: 'Luis',
//         phone: '23230-2022'
//     },
//     {
//         name: 'Pedro',
//         phone: '4843-2022'
//     }
// ];


// findphone = function (agenda, name) {
//     var contact = agenda.find(p => p.name === name)
//     console.log(contact.phone);
// }

// findphone(agenda, 'Luis');


//escriba una función constructora que tenga los siguientes atributos 
//numbers que sea un array1
//addnumber(funcion) permite agregar numeros a numbers
//findnumber(funcion) permite buscar contactos



// myPhone = function () {
//     this.directory = []
//     this.add_num = function (name, phone) {
//         this.directory.push({
//             name: name,
//             phone: phone
//         });
//     }
//     this.findphone = function (name) {
//         var contact = this.directory.find(p => p.name === name)
//         console.log(contact.phone);
//     }
// }

// p1 = new myPhone();
// p1.add_num('Pepe', '12022-0222');
// p1.add_num('Luis', '28222-0222');
// p1.findphone('Pepe')
// p1.findphone('Luis')


//haga una función constructora Ecomerce que tenga productos 
//que se le puedan agregar productos id, nombre, precio, categoria, cantidad
//una funcion que retorne los productos de una categoria particular usando filter
//una funcion que retorne el valor total del invantario


var inventory = [{
        id: 1,
        name: 'Laptop',
        price: 500,
        category: 'Electronics',
        stock: 5
    },
    {
        id: 2,
        name: 'CellPhone',
        price: 300,
        category: 'Electronics',
        stock: 2
    },
    {
        id: 3,
        name: 'Charger',
        price: 40,
        category: 'Accesories',
        stock: 3
    },
    {
        id: 4,
        name: 'TV',
        price: 800,
        category: 'Home',
        stock: 5
    },
    {
        id: 5,
        name: 'Lamp',
        price: 60,
        category: 'Home',
        stock: 3
    }
];


Ecommerce = function (inventory) {
    this.inventory = inventory
    this.addProduct = function (id, name, price, category, stock) {
        this.inventory.push({
            id: id,
            name: name,
            price: price,
            category: category,
            stock: stock
        }, );
    }
    this.findCategory = function (category) {

        return this.inventory.filter(product => product.category === category);
       
    }
    this.inventorySum = function () {

        return this.inventory.reduce((total, item) => total + (item.price * item.stock), 0);
        
    }
}

e1 = new Ecommerce(inventory)
console.log(e1.findCategory('Home'))
e1.addProduct(8, 'Nintendo', 1000, 'Electronics', 6)
console.log(e1.findCategory('Electronics'))
console.log('Total value on inventory is: $' + e1.inventorySum())
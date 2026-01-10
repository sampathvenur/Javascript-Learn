// If arrays are list, objects are dictionaries.
// They allow you to store data in key-value pairs.

// 1. creating objects
const user = {
    firstName: "Sam",
    role: "Student",
    age: 21,
    isAdmin: false,
    "home address": "Mangalore, India"  // Keys with spaces need quotes
};


// 2. accessing data

// dot notation
console.log(user.firstName);
// console.log(user."home address");    // error - fix : use bracket notation

// bracket notation
console.log(user["age"]);
console.log(user["home address"]);


// 3. When use bracket notation? - When key is stored inside a variable.
const target = "role";
console.log(user.target);   // undefined
console.log(user[target]);  // Student


// 4. modifying objects: objects are mutable (even if declared with const)
user.email = "sam@123.com";     // add property
user.age = 22;                  // update/modify property
delete user.isAdmin;            // delete property
console.log(user);


// 5. object methods: functions stored inside objects are called methods.

const car = {
    brand: "Tesla",
    // Method
    startFSD: function() {
        console.log("Full self driving started");
    },
    // Modern ES6 shorthand (preferred)
    stopFSD() {
        console.log("Full self driving stopped");
    }
};

car.startFSD();             // Full self driving started
car.stopFSD();              // Full self driving stopped
console.log(car);           // { brand: 'Tesla', startFSD: [Function: startFSD], stopFSD: [Function: stopFSD] }
console.log(car.startFSD);  // [Function: startFSD]

console.log(car.startFSD());
// Full self driving started
// undefined

// undefined is caused because the function doesn't return anything.

// when js calls a function it runs the code inside the curly braces and then expects a return value to be returned.



// car.startFSD()
// Full self driving started printed on screen and undefined in not captured

// let a = car.startFSD();
// Full self driving started printed on screen and undefined in captured by a

// console.log(a);      // undefined
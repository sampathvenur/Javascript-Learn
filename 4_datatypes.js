// Data Types

// In Javascript "Primitive" is the data which is not an object and has no methods

// 7 primitves

// String: Text data. Wrapped in quotes.
let name = "Gemini";
let char = 'A';

// Number: Floating point number.
let age = 25;
let price = 9999.99;

// Boolean: True or false value.
let isDone = true;
let isReady = false;

// Undefined: Variable declared, but no value assigned.
let city;

// Null: Explicitly set as no value.
let state = null;

// Symbol (ES6): Used to create unique identifiers for objects.
let id = Symbol("id");

// BigInt (ES11): Large integers (approx 9 quadrillion).
let hugeNum = 9007199254740991n; // Notice the 'n' at the end
// n stands for BigInt

// Null vs. Undefined (The Interview Favorite)

// Undefined: "I haven't set this yet." (The engine does this automatically).
// Null: "I am setting this to nothing." (You do this manually).

// Dynamic Typing
// JavaScript is dynamically typed. You don't tell the engine "this is a number." It figures it out. 
// You can also change a variable's type later (though you usually shouldn't).

let data = 42;    // Now it's a Number
data = "Hello";   // Now it's a String (Allowed, but careful)
console.log(typeof(data)); // output: string
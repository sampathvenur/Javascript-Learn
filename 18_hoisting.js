// Hoisting
// Hoisting is a behavior where the JavaScript engine moves variable and function declarations to the top of their scope before the code runs.


// 1. Function Hoisting
// Function Declarations are fully hoisted. You can call them before they are written.

greet(); // Output: "Hello!" (It works!)

function greet() {
  console.log("Hello!");
}



// 2. Function Expressions (and Arrow Functions) are NOT hoisted.

greet(); // Error: Cannot access 'greet' before initialization

const greet = () => {
  console.log("Hello!");
};



// 3. Variable Hoisting (var vs let/const)

// var Hoisting:
// The variable is hoisted, but its value is not. It is initialized as undefined.

console.log(food); // Output: undefined (No error, but no data)
var food = "Pizza";
console.log(food); // Output: "Pizza"

// What JS actually sees:
// var food;          // Moved to top
// console.log(food);
// food = "Pizza";




// let and const Hoisting:
// They are technically hoisted, but they land in a "Temporal Dead Zone" (TDZ).
// If you try to touch them before the line where they are defined, JS throws an error.

console.log(food); // ReferenceError: Cannot access 'food' before initialization
let food = "Pizza";


// Summary Rule
// Don't rely on hoisting. It is confusing.
// Always declare your variables and functions at the top of your scope/file.
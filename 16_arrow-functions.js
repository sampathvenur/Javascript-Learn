// Arrow functions
// This is the modern way to write functions introduced in ES6.
// You will use these 90% of the time in modern react or node.js development.
// They are shorter and cleaner.

// The old way
// const add = function (a, b) {
//     return a + b;
// };

// The new way      // Remove the word function and add a "fat arrow" => after the parameters.
const add = (a, b) => {
    return a + b;
};


// 1. Implicit return
// If your function does one thing and returns the result immediately, you can remove the curly braces {} and the keyword return.

// This function...
// const multiply = (x, y) => {
//     return x * y;
// };

// ...becomes this one-liner:
const multiply = (x, y) => x * y;


// 2. Parantheses rule
// Multiple parameters : Parantheses are required. (a, b) => ...
// Zero parameters : Parantheses are optional. () => ...
// One parameter : Parantheses are optional (but I recommend keeping them for consistency).

// const square = x => x * x;   // Valid
const square = (x) => x * x;    // Also valid


// 3. Note
// If you use the curly braces {}, the "implicit return" is turned off. You must write return.

// Return undefined because of the braces!
const broken = (a, b) => { a + b };

// works
const fixed = (a, b) => { return a + b };
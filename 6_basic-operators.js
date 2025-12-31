// Basic Operators
// Operators allow us to perform actions on data.

// 1. Arithmetic Operators
// Standard math you learned in school.

// + (Addition): 10 + 5 -> 15
// - (Subtraction): 10 - 5 -> 5
// * (Multiplication): 10 * 5 -> 50
// / (Division): 10 / 5 -> 2
// ** (Exponentiation): 2 ** 3 (2 to the power of 3) -> 8

// 2. The Modulus Operator (%)
// This is the Remainder operator. It divides the first number by the second and returns what is left over.

// 10 % 2 -> 0 (10 divides perfectly by 2)
// 10 % 3 -> 1 (3 goes into 10 three times, remainder is 1)

// Common Use: Checking if a number is Even or Odd.

const x = 5;
// If x % 2 is 0, it's even. If 1, it's odd.


// 3. Increment & Decrement
// Shortcuts to add or subtract 1.

// ++ (Add 1)
// -- (Subtract 1)

// Prefix vs Postfix (Tricky):

// x++ (Postfix): Returns the value before changing it.
// ++x (Prefix): Changes the value before returning it.

let counter = 10;
console.log(counter++); // Output: 10 (Prints, then updates to 11)
console.log(counter);   // Output: 11

let score = 10;
console.log(++score);   // Output: 11 (Updates to 11, then prints)


// 4. Assignment Operators
// Shortcuts to update a variable.

// x += 5 is the same as x = x + 5
// x -= 5 is the same as x = x - 5
// x *= 5 is the same as x = x * 5
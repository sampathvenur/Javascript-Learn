// Comparison Operators
// This operator compares two values and always returns a boolean value

// 1. Equality - always use ===(its predictable and safer)
// == (Loose Equality)
// Does Type Coercion - tries to convert types to match before comparing
console.log("5" == 5);      // true - Is the string "5" equal to the number 5? JS says "Close enough"

// === (Strict Equality)
// Does not do type coercion - it checks both value and type
console.log("5" === 5);     // false - Is the string "5" equal to the number 5? JS says "No, one is text, one is a number"


// 2. Inequality
// != (Loose Inequality)
// Convert types then checks
console.log("5" != 5);      // false (Because it thinks they are equal)

// !== (Strict Inequality)
// Checks values and type
console.log("5" !== 5);     // true (Correct! They are different types)


// 3. Greater/Less than
// This works like normal maths
// > (Greater than)
// < (Less than)
// >= (Greater than or equal to)
// <= (Less than or equal to)

const age = 18;
if (age >= 18) {
    console.log("You can vote.");
}
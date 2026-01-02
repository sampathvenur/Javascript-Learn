// Logical Operators
// These operators are used to combine multiple conditions.
// They are fundamental for decision making in logic.

// 1. && (AND) - Returns true only if BOTH sides are true.

const hasLicence = true;
const hasCar = true;
console.log(hasLicence && hasCar); // true

// 2. || (OR) - Returns true if AT LEAST ONE side is true.

const isSaturday = false;
const isSunday = true;
console.log(isSaturday || isSunday); // true

// 3. ! (NOT) - Returns the boolean value. True becomes False, False becomes True.

const isTired = false;
console.log(!isTired); // true


// Short - Circuiting
// Javascript is lazy.
// It evaluates expressions from left to right and stops as soon as the result is guaranteed.

// AND (&&) - if the first value is false, JS stops immediately
false && console.log("This will not run");  // The log never happens

// OR (||) - if the first value is true, JS stops immediately
true || console.log("This will not run");  // The log never happens

// Real - world use case - Developers often use || to set default values.

let userParams = null;
// If userParams is null(falsy), use "Default Value"
let finalValue = userParams || "Default Value";
console.log(finalValue);    // "Default Value"
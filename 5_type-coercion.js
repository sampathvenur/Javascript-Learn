// Type Coercion
// Coercion is the process of converting a value from one type to another (e.g., String to Number).

// Implicit Coercion (The Automatic Way)
// When the engine automatically converts one type to another.

// string wins(+) - if we use '+' operator, the number will be converted to string
console.log("S" + 2); // output: "S2"

// number wins(-, *, /) - if we use '-', '*', '/' operator, the string will be converted to number
console.log("5" - 2); // output: 3
console.log("S" - 2); // output: NaN

// Explicit Coercion (The Manual Way)
// When we manually convert one type to another.

// Number() function
console.log(Number("123")); // output: 123

// String() function
console.log(String(123)); // output: "123"

// Boolean() function
console.log(Boolean(1)); // output: true


// Truthy vs. Falsy Values
// When you put a value into an if statement, JS converts it to a Boolean.

// Falsy Values: There are only 5 values (plus false itself) that become false. Memorize these:

// 0

// "" (Empty String)

// undefined

// null

// NaN (Not a Number)

// Truthy Values: Everything else.

// "Hello" (Non-empty string) -> true

// 123 (Number other than 0) -> true

// {} (Empty Object) -> true

// [] (Empty Array) -> true


if ("0") { // "0" is coerced to true
    console.log("This runs!");
}

if (0) { // 0 is coerced to false
    console.log("This doesn't run.");
}
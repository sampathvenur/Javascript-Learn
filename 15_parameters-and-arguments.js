// Parameters and Arguments
// Functions become powerful when we can pass data into them and get data out.

// Parameters : The placeholders you define when writing the function. (The labeled boxes).
// Arguments : The actual values you pass when calling the function. (The items you put in the boxes).

// 'name' is the parameter
function greet(name) {
    console.log(`Hello, ${name}`);
}

// 'Gemini' is the argument
greet("Gemini");


// Default Parameters (ES6)
// You can set a fallback value if the user forgets to pass an argument.

function greet1(name = "Guest") {
    console.log(`Hello, ${name}`);
}

greet1();       // Output: "Hello, Guest" (Uses default)
greet1("Sam");  // Output: "Hello, Sam" (overwrites default)


// Return values
// By default, functions return 'undefined'.
// To send data back to the code that called the function, use return.
// The return keyword STOPS the function immediately. Any code written after it will never run.


function add(a, b) {
    return a + b;
    console.log("I will never print");      // Dead code
}

const result = add(5, 10);      // result is now 15
console.log(result);
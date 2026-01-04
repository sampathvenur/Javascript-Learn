// Function Basics
// A function is a reusable block of code designed to perform a particular task.

// 1. Function Declaration
// use function keyword followed by a name

sayHello();     // Hoisted - you can call the function before you write them in the code.

function sayHello() {
    console.log("Hello there!");
}


// 2. Function Expression
// You can create a function and store it inside a variable (usually the const)

// sayBye();       // This is NOT hoisted, gives error!

const sayBye = function() {
    console.log("Goodbye!");
};

sayBye();       // Works here


// 3. Calling / Invoking a function
// you have to call it to run the code

// sayHello -> Referd to the function itself.
// sayHello() -> Runs the function.
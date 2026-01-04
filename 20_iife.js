// IIFE (Immediately Invoked Function Expressions)
// An IIFE (pronounced "iffy") is a function that runs as soon as it is defined. It doesn't wait to be called later.



// The Syntax (The "Secret Hug")
// It looks a bit weird because of the extra parentheses.

(function() {
  console.log("I run immediately!");
})();

// Breakdown:
// 1. (function() { ... }): The first set of parentheses wraps the function to tell the compiler "This is an expression, not a normal declaration."
// 2. (): The second set at the end is what actually calls (invokes) the function right now.



// Why use it?
// It is mainly used to create a Private Scope.
// Variables declared inside an IIFE disappear immediately after it runs.
// They do not leak into the Global scope or conflict with other variables.

// Analogy: It’s like a disposable camera. You take the picture (run the code), and then the camera is thrown away.

// Example:

(function() {
  const secret = "Super Secret Code";
  console.log("Setup done.");
})();

console.log(secret); // Error! 'secret' is gone.

// Note: In modern JavaScript (with Modules and Block Scope), we use IIFEs less often, but you will see them constantly in older code libraries.
// Scope
// Scope determines where your variables are available.
// If you try to use a variable outside its scope, you get an error.
// Think of scope like tinted windows: You can see out, but outsiders can't see in.

// 1. Global scope
// Variables declared outside of any function or block.
// Visibility: Everywhere.
// Risk: Easy to overwrite accidentally. Avoid using too many global variables.

const globalVar = "I am everywhere";

function test() {
  console.log(globalVar); // Works!
}


// 2. Function Scope
// Variables declared inside a function.
// Visibility: Only inside that specific function.
// Keywords: var, let, and const all respect function scope.

function secret() {
  const code = "1234";
}

console.log(code); // Error: code is not defined


// 3. Block Scope (The Modern Standard)
// Variables declared inside a "block" (curly braces {}).
// Visibility: Only inside that block (e.g., inside an if statement or a for loop).
// Keywords: Only let and const respect this. var ignores it (leaks out).

if (true) {
  let blockVar = "Safe inside";
  var leaker = "I leaked out!";
}

console.log(blockVar); // Error: blockVar is not defined
console.log(leaker);   // Output: "I leaked out!" (Bad!)


// 4. The Scope Chain (Lexical Scoping)
// When you use a variable, JS looks for it in the current scope. If it doesn't find it, it looks to the outer parent scope. It keeps going up until it hits the Global scope.

// Rule: Inner scopes can access outer variables. Outer scopes cannot access inner variables.

const outer = "Outer";

function wrapper() {
  const inner = "Inner";
  
  function deep() {
    console.log(outer); // Works (Looks up 2 levels)
    console.log(inner); // Works (Looks up 1 level)
  }
}
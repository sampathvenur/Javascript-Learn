// variables (var, let, const)

// variables are containers for storing data(values)

// var
// it is old - it ignores block scopes - it can be redeclared

// let
// introduced in ES6(2015) - it stays inside the braces {...} where it is defined - can be reassigned but not redeclared

// const
// introduced in ES6(2015) - it stays inside the braces {...} where it is defined - cannot be reassigned or redeclared

// block scope

if (true) {
    var oldVar = "I survive outside!";
    let newLet = "I am trapped inside.";
    const newConst = "I am also trapped.";
}

console.log(oldVar);   // Output: "I survive outside!" (Leaked out)
console.log(newLet);   // Error: newLet is not defined
console.log(newConst); // Error: newConst is not defined

// reassignment

let score = 10;
score = 20; // Allowed

const pi = 3.14;
pi = 3.14159; // Error: Assignment to constant variable.
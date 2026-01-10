// destructuring (unpacking) - It allows you to extract data from arrays or objects and assign them to variables in a single, clean line.


// 1. object destructuring

const user = { firstName: "Sam", age: 21 };

const { firstName, age } = user;    // variable names must match the object keys (unless you rename them)

console.log(firstName); // "Sam"
console.log(age);       // 21

// Renaming Variables: If you want the variable to have a different name than the key:

const { firstName: myName } = user;
console.log(myName); // "Sam"



// 2. array destructuring - It works based on position (order), not names.

const numbers = [10, 20, 30];

const [a, b] = numbers;     // Put the first item in 'a', second in 'b'

console.log(a); // 10
console.log(b); // 20

// Skipping Items: You can use an empty comma, to skip an index.

const [first, , third] = ["Gold", "Silver", "Bronze"];
console.log(third); // "Bronze"


// swaping variables

let x = 5;
let y = 10;

[x, y] = [y, x];

console.log(x); // 10
console.log(y); // 5
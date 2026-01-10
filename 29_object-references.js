// object references

// 1. primitives = copy by value

// string, number, boolean etc., are stored as value itself.
// When you copy them, you make a totally independent clone.

let a = 10;
let b = a;

b = 20;

console.log(a);     // 10


// 2. objects = copy by reference

// objects, arrays, stores a reference (an address in the memory) pointing to where the data lives.
// When you copy the variable, you are just copying the reference.
// Both variables now point to the same object.

const user1 = { name: "Sam" };
const user2 = user1;    // copy the reference, not the object

user2.name = "Jupiter";

console.log(user1.name); // Jupiter


// To fix this - use spread operator

const users1 = { name: "Sam" };
const users2 = { ...users1 };

users2.name = "Jupiter";

console.log(users1.name); // Sam
// spread operator (...) - It allows an iterable (like an array or string) to be expanded into individual elements.

// 1. spreading arrays

// A. merging arrays (used instead of concat())

const boys = ["Sam", "Mike"];
const girls = ["Sara", "Anna"];

const allFriends = [...boys, ...girls];     // ["Sam", "Mike", "Sara", "Anna"]

// B. adding elements

const parts = ["knees", "toes"];
const lyrics = ["head", "shoulders", ...parts]; // ["head", "shoulders", "knees", "toes"]

// C. cloning arrays

const original = [1, 2, 3];
const copy = [...original]; // creates a shallow copy (breaks the reference link).


// 2. spreading objects - used to merge or clone objects.

// A. merging/updating properties rule: if keys match, the last one wins (overwrites the previous one).

const user = { name: "Sam", age: 21 };
const update = { age: 22, job: "Intern" };

// 1. Spreads user (name: Sam, age: 21)
// 2. Spreads update (age: 22, job: Intern) -> Overwrites age 21
const updatedUser = { ...user, ...update };

console.log(updatedUser); 
// { name: "Sam", age: 22, job: "Intern" }



// 3. Rest parameters

// The ... syntax is also used to collect multiple elements into an array. This is called the "Rest Pattern" (because it collects the rest of the items).

// Spread: Unpacks (Expands). Used in function calls or array definitions.

// Rest: Packs (Collects). Used in function definitions.


// Function accepts ANY number of arguments
function sum(...numbers) {
  // 'numbers' is now an array: [1, 2, 3, 4]
  return numbers.reduce((acc, curr) => acc + curr, 0);
}

console.log(sum(1, 2, 3, 4)); // 10
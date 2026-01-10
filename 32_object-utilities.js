// object utilities - to convert an object into an array so you can loop over it or transform it.

// 1. Object.keys() - returns an array containing all the keys (variable names) of the object.

const user = {
  name: "Sam",
  age: 21,
  role: "Intern"
};

const keys = Object.keys(user);
console.log(keys); // ["name", "age", "role"]


// 2. Object.values() - returns an array containing all the values of the object.

const values = Object.values(user);
console.log(values); // ["Sam", 21, "Intern"]


// 3. Object.entries() - returns an array of arrays, where each inner array is a [key, value] pair object.

const entries = Object.entries(user);
// [ ["name", "Sam"], ["age", 21], ["role", "Intern"] ]

// Looping Example
for (const [key, value] of Object.entries(user)) {
  console.log(`${key}: ${value}`);
}
// array searching

// for simple search
const pets = ["dog", "cat", "cow", "fish"]

// 1. includes(value): returns true or false

console.log(pets.includes("dog"));  // true

// 2. indexOf(value): returns index of the value, if not found returns -1

console.log(pets.indexOf("cat"));



// for condition based search
const users0 = ["sam", "jupiter"];
const users1 = [
    { id: 1, name: "sam" },
    { id: 2, name: "jupiter" },
];

// 1. find(callback): returns only the first item that matches the condition, else returns undefined (note: since undefined is falsy value, be carefull with falsy value in array like 0 or "")

console.log(users0.find(user => user.startsWith('s')));
console.log(users1.find(user => user.id === 1));

// 2. findIndex(callback): returns index of the first item that matches the condition, else returns -1

console.log(users0.findIndex(user => user.startsWith('s')));
console.log(users1.findIndex(user => user.id === 1));



// for boolean check
const number = [1, 2, 3, 4];

// 1. some(callback): checks if atleast one item matches, OR logic.

console.log(number.some(num => num > 2));

// 2. every(callback): checks if all items match, AND logic.

console.log(number.every(num => num > 0));
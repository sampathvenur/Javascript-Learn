// array sorting

// .sort()
// It mutates the original array, it does not return a new array
// It converts everything to string and then compares the character codes (ASCII)
// Hence it works for Characters not Numbers, by default

const fruits = ["banana", "apple", "cherry", "grapes"];
console.log(fruits.sort());     // [ 'apple', 'banana', 'cherry', 'grapes' ]

const numbers = [5, 20, 100, 1];
console.log(numbers.sort());     // [ 1, 100, 20, 5 ]

// Since it treats them as strings, "100" comes before "20" because "1" comes before "2".

// to fix this we use compare functions
// This function takes two numbers (a and b).

// If it returns a negative value, a is sorted before b.

// If it returns a positive value, b is sorted before a.


// Ascending order
numbers.sort((a, b) => a - b);
console.log(numbers); // [1, 5, 20, 100]

// Descending order
numbers.sort((a, b) => b - a);
console.log(numbers); // [100, 20, 5, 1]


// reversing: this mutates the original array
const num = [1, 2, 3, 4];
console.log(num.reverse()); // [4, 3, 2, 1]
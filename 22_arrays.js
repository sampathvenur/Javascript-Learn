// Array is a variable that can store more than one value at a time
// to create array we use []

const alpha = [];   // chars
alpha[0] = "apple";     // indexing start at 0
console.log(typeof alpha);  // object

const num = [1, 2, 3];      // nums
const alpha_num = ["apple", 1, 2, "banana"];    // chars + nums

// add or remove from end - fastest and efficient
let removed = alpha.pop();
alpha.push("orange");

// add or remove from start - slowest and not efficient (slow because computer has to re index all items)
removed = alpha_num.shift();
alpha_num.unshift("orange");
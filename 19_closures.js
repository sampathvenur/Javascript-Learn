// Closures
// A Closure is a function that remembers the variables from the place where it was created, even after that place (the outer function) has finished running.

// 1. The Analogy: The Backpack

// Imagine a function is a hiker. When a function is created, it puts on a backpack.
// Inside that backpack, it packs all the variables that were present in its parent scope at that moment.
// Whenever that function goes later, it carries that backpack with those variables.

// 2. The Code Example

function createCounter() {
  let count = 0; // Local variable inside createCounter

  return function() {
    count++; // It accesses 'count' from the parent
    return count;
  };
}

const myCounter = createCounter(); 
// At this point, createCounter() has FINISHED running. 
// Normally, 'count' should be garbage collected (deleted).
// BUT, myCounter keeps a closure (backpack) containing 'count'.

console.log(myCounter()); // Output: 1
console.log(myCounter()); // Output: 2
console.log(myCounter()); // Output: 3

// 3. Why is this useful?

// It allows for Data Privacy.
// In the example above, nobody can mess with the count variable directly (e.g., count = 1000).
// They can only increment it by calling myCounter().
// This is how private variables are created in JavaScript.

// 4. Summary

// A function inside another function + the outer variables = Closure.
// It "closes over" the variables to preserve them.
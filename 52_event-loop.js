// The Event Loop - Microtasks & Callback Queue

// It explains why some code runs before others, even if it looks like it shouldn't.

// When asynchronous code finishes (like a timer or a fetch), it doesn't go straight back to the main code.
// It goes into a Queue. But there isn't just one queue; there are two.

// 1. Callback Queue (Macrotasks):

// Contains: setTimeout, setInterval, DOM Events (clicks).
// Priority: Low.

// 2. Microtask Queue (VIP):

// Contains: Promises (.then, .catch, .finally), queueMicrotask.
// Priority: High.



// The Event Loop checks the queues in a specific order:

// 1. Run all Synchronous Code (Call Stack) until it is empty.
// 2. Run ALL Microtasks until the Microtask Queue is completely empty.
// 3. Run ONE Macrotask (Callback Queue).
// 4. Repeat.

// Promises (Microtasks) will always run before setTimeout (Macrotasks), even if the timer is set to 0 seconds.



console.log("1. Script Start");

setTimeout(() => {
  console.log("2. setTimeout");
}, 0);

Promise.resolve().then(() => {
  console.log("3. Promise");
});

console.log("4. Script End");


// The Execution:

// "1. Script Start" -> Sync code. Runs immediately.

// setTimeout -> Browser api sees 0ms. Puts callback in Macrotask Queue.

// Promise -> Resolves. Puts callback in Microtask Queue.

// "4. Script End" -> Sync code. Runs immediately.

// Stack is empty. Event Loop looks at Microtasks. Found one!

// "3. Promise" -> Runs.

// Microtasks empty. Event Loop looks at Macrotasks. Found one!

// "2. setTimeout" -> Runs.

// Final Output: 1. Script Start -> 4. Script End -> 3. Promise -> 2. setTimeout



// Why does this matter?
// If you have a heavy loop inside a Microtask (e.g., a massive chain of Promises), the browser will never get to the Callback Queue.
// This means clicks and UI updates (which are Macrotasks) will be blocked, and the page will freeze.
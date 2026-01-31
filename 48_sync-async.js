// sync and async - This shows how javascript talks with the outside world (servers, databases, apis)

// Javascript is synchronous and single threaded BY DEFAULT

// synchronous - execute code line-by-line, in order.
// single threaded - it can only do one thing at a time.

// Synchronous
console.log("1. Start");

for(let i = 0; i < 1000000000; i++) {}

console.log("2. End");      // this prints after some delay - Js has to finish the loop before executing this line


// Asynchronous

// Async code allows Javascript to initiate a task, hand it off to the browser to handle in the background,
// and immediately move on to the next line of code without waiting.

// When the background task is finished, it notifies Javascript: "Hey, I'm done!"


console.log("1. I order Pizza");

// Async func
setTimeout(() => {
    console.log("2. Pizza is ready! (Server Callback)");
}, 3000);   // 3 seconds delay

console.log("3. I call my friend");
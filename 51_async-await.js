// Async/Await - introduced in ES2017

// it is the current industry standard for writing asynchronous code.
// It is built on top of Promises but makes your code look and behave like standard synchronous code.
// It stops the "chaining" madness (.then().then()) and lets you write logic line-by-line.



// 1. The async Keyword

// Placing async before a function declaration does two things:
// 1. It allows you to use the await keyword inside.
// 2. It automatically wraps the return value in a Promise.


// This function returns a Promise that resolves to "Hello"
async function greet() {
  return "Hello"; 
}

greet().then(console.log); // Output: Hello



// 2. The await Keyword

// It can only be used inside an async function.
// When JavaScript sees await, it pauses the execution of that specific function until the Promise is resolved.
// If the Promise resolves, it returns the value.
// If the Promise rejects, it throws an error.

async function getUser() {
  // 1. Pause here until fetch is done
  let response = await fetch('https://api.github.com/users/sam'); 
  
  // 2. Pause here until JSON conversion is done
  let data = await response.json(); 

  // 3. Now we have the data!
  console.log(data);
}



// 3. Comparison (Promises vs Async/Await)

// The Old Way - Promises

fetch('url')
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(err => console.error(err));

// The New Way - Async/Await

const getData = async () => {
  const response = await fetch('url');
  const data = await response.json();
  console.log(data);
};

// Notice how there are no callbacks or nesting. It reads top-to-bottom.



// 4. Error Handling - try...catch

// Since await pauses execution, we can't use .catch() in the same way.
// Instead, we use the standard try...catch block, just like in regular synchronous code.

async function getData() {
  try {
    const response = await fetch('https://broken-url.com');
    const data = await response.json();
    console.log(data);
  } catch (error) {
    // If ANY line in the 'try' block fails, we jump here
    console.error("Something went wrong:", error.message);
  } finally {
    console.log("Cleanup complete.");
  }
}
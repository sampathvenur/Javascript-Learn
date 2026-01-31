// Promise - it is an object that represents the eventual completion or failure of an asynchronous operation.

// A promise can be in one of three states:
// 1. Pending - the initial state, the operation is still in progress.
// 2. Fulfilled - the operation completed successfully.
// 3. Rejected - the operation failed.

// Syntax - creation

const myPromise = new Promise((resolve, reject) => {
  const success = true;

  setTimeout(() => {
    if (success) {
      resolve("Operation Successful!"); // Yay!
    } else {
      reject("Operation Failed."); // Nay!
    }
  }, 2000);
});



// Syntax - consumption

console.log("1. Starting...");

myPromise
  .then((message) => {      // Runs if the promise is Resolved.
    console.log("2. Success:", message);
    // You can return a new value to the NEXT .then()
    return "Next Step Data"; 
  })
  .then((data) => {
    console.log("3. Chaining:", data);
  })
  .catch((error) => {         // Runs if the promise is Rejected.
    console.log("Error:", error);
  })
  .finally(() => {           // Runs regardless of success or failure.
    console.log("4. Cleanup: Loading spinner stopped.");
  });



// fixing callback hell

login(function(user) {
  getUserData(user, function(data) {
    // ...
  });
});


// promise

login()
  .then(user => getUserData(user))
  .then(data => getArticles(data))
  .then(articles => console.log(articles))
  .catch(err => console.log("Something went wrong!"));
// Topic 56: Error Handling (Try...Catch & Custom Errors)

// In the real world, things break. APIs fail, users enter bad data, and networks drop.
// If you don't handle errors, your entire Javascript application crashes (stops running).
// Error handling is how you "catch" the crash and handle it gracefully.



// 1. The Safety Net (try...catch) - Think of this as a safety net for "dangerous" code.

// try: Attempt to run this code.
// catch: If the try block fails (throws an error), jump here immediately. Do not crash.

try {
  // Dangerous code (e.g., accessing a variable that doesn't exist)
  console.log(nonExistentVariable); 
  
  console.log("This line will NEVER run because the error happened above");

} catch (error) {
  // This runs ONLY if there was an error
  console.log("Something broke!");
  console.log("Error message:", error.message); 
}

console.log("The app is still alive and running...");



// 2. The finally Block (Cleanup)

// This block runs no matter what. Whether the code succeeded or failed, finally will execute.
// It is perfect for cleanup tasks, like turning off a "Loading..." spinner.

try {
  showLoadingSpinner();
  await fetchData(); // Might fail
} catch (err) {
  showErrorMessage();
} finally {
  hideLoadingSpinner(); // Runs in BOTH cases
}



// 3. Throwing Errors (Manual Errors)

// Sometimes, the code technically works, but the logic is wrong (e.g., transferring more money than you have in your bank account).
// You can manually throw an error to stop execution and jump to the catch block.

function withdrawMoney(amount, balance) {
  if (amount > balance) {
    // Stop everything! Throw an error manually.
    throw new Error("Insufficient Funds"); 
  }
  return balance - amount;
}

try {
  withdrawMoney(100, 50); // Throws error
} catch (err) {
  console.log(err.message); // "Insufficient Funds"
}



// 4. Custom Errors (Professional Level)

// The built-in Error class is generic. In complex apps, you want to distinguish between a "Network Error" (retry later) and a "Validation Error" (user typed wrong info).
// You can create your own error types by extending the Error class.
// Create a specific error for Database issues

class DatabaseError extends Error {
  constructor(message) {
    super(message);
    this.name = "DatabaseError"; // Custom name
  }
}

try {
  // Simulate a database failure
  throw new DatabaseError("Connection lost");
} catch (err) {
  if (err.name === "DatabaseError") {
    console.log("Alert the DevOps team! The DB is down.");
  } else {
    console.log("Just a generic error.");
  }
}
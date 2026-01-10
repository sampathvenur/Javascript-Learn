// optional chaining - (introduced in ES2020)

// Saves you from dreaded "Cannot read property of undefined" error.
// It allows you to safely access nested properties without having to check if every parent step exits.


// 1. The problem

// imagine you are fetching user data, but some users don't have an address.
const user = {
    name: "Sam",
    // address is missing!!
};

// This causes a CRASH because user.address is undefined
// You cannot read .street from undefined
console.log(user.address.street);       // Uncaught TypeError!


// 2. The fix - ?. operator

// You place a ? before the dot ..
// It asks: "Does the thing before me exist? If yes, keep going. If no, stop and return undefined."

console.log(user.address?.street);      // Output: undefined (No error, the code keeps running)


// It works on Methods and Arrays too.

// Methods: user.adminMode?.() (Only runs the function if it exists).

// Arrays: users[0]?.name (Only accesses name if index 0 exists).
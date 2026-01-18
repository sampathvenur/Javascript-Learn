// Prototypes - Every Javascript object has a hidden link to another object. This parent object is called it's prototype.

// Instead of classes for inheritance, Javascript uses Prototypes.
// Even if you use class keyword, under the hood it is still a Prototype.
// The prototype contains methods and properties that the original object can borrow.


// The Prototype Chain

// When you try to access a property or method (like .toString()) on an object:

// 1. JS checks the object itself. Found? Use it.
// 2. If not, it looks at the object's prototype. Found? Use it.
// 3. If not, it looks at the prototype's prototype.
// 4. It keeps going up until it hits null. (the end of the chain)
// 5. If still not found, it returns undefined.



// Why Arrays Have Methods (.push(), .pop()?)

const myFriend = ["Sam", "Mike"];
console.log(myFriend.push)          // [Function: push]

// 1. myFriend: Just a list of strings. It does not have .push()
// 2. myFriends.__prototype__ (Array Prototype): This is the blueprint for all arrays. It has the .push()
// 3. Javascript uses the function from the prototype.



// Example:

const num = 10;

// 1. The number itself
console.log(num);       // 10

// 2. Number.prototype (Has methods like toFixed)
console.log(num.__proto__);         // {}

// 3. Object.prototype (The greater ancestor of everything)
console.log(num.__proto__.__proto__);           // [Object: null prototype] {}

// 4. null (The End)
console.log(num.__proto__.__proto__.__proto__);         // null



// This saves memory
// Instead of every single array carrying the code for .push(),
// the code exists in one place (the prototype), and all the arrays share it.
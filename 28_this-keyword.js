// this - refers to the object that called the function.

// 1. Inside an object method

// When you use this inside the object's method, this equals the object itself.
// It allows the method to access other data inside the same object.

const user = {
    name: "Sam",
    age: 21,

    printInfo() {
        // "this" means "user"
        console.log(`${this.name} is in year ${this.age}`);
    }
};

user.printInfo();


// 2. The "Left of the dot" rule

// To figure out what this is, look at how the function is called, not where it is written.
// user.printInfo() - Left of the dot is user. so this = user
// car.start() - Left of dot is car. so this = car


// 3. Arrow function Trap: arrow functions DO NOT have their own this.
// If the method is an arrow function, this will NOT point to the object.
// It will point to the Window/global scope, and the code will break

const user1 = {
    name: "Sam",
    sayHi: () => {
        // error - arrow function doesn't user user via this
        console.log(this.name);
    }
};

user1.sayHi();
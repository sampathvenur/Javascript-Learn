// Advanced this (call, apply, bind)

// Sometimes Javascript gets confused about what "this" should be, or you simple want to "borrow" a function from one object and use it on another.

// call, apply, bind methods allow you to manually tell a function:
// "Hey, when you run, I want 'this' to be THAT object".


// 1. .call() - The direct call

// It invokes the function immediately and allows you to specify what "this" should point to.
// syntax: function.call(thisObject, arg1, arg2)

const person1 = {
    fullName: function() {
        return this.firstName + " " + this.lastName;
    }
};

const person2 = {
    firstName: "Sam",
    lastName: "Student"
};

// person2 "borrows" the method from person1
// We are saying: "Run person1.full.Name, but treat 'this' as person2"
console.log(person1.fullName.call(person2));
// output: "Sam Student"



// 2. .apply() - The array version

// It works exactly like .call(), but arguments are passed as an array.
// syntax: function.apply(thisObject, [arg1, arg2])

const user = {
    greet: function(city, country) {
        console.log(`Hello ${this.name} from ${city}, ${country}`);
    }
};

const myData = { name: "Sam" };

// Using call (arguments separated by commas)
user.greet.call(myData, "Mangalore", "India");

// Using apply (arguments in a list)
user.greet.apply(myData, ["Mangalore", "India"]);



// 3. .bind() - The permanent fix

// Unlike the other two, .bind() does not run the function immediately.
// Instead, it returns a new copy of the function where "this" is permanentky tied to a specific object.
// You can run this new function later.

// This is useful for Event Listeners or React, where "this" often gets lost.

const module = {
    x: 42,
    getX: function() {
        return this.x;
    }
};

const unboundGetX = module.getX;
console.log(unboundGetX());     // undefined ('this' is lost in global scope)

const boundGetX = unboundGetX.bind(module);
console.log(boundGetX());       // 42 ('this' is glued to module)
// Accessors (getters and setters)


// Accessors are special methods that look and act like properties.
// They allow you to execute logic (code) when you read or write a value, without the user of your code knowing they are calling a function.
// They are the "Gatekeepers" of your data.


// 1. The Getter (get)

// A getter binds an object property to a function that will be called when that property is looked up.
// It is used to compute a value dynamically.

// Syntax: Use the get keyword before the method name.
// Usage: You access it like a variable obj.prop, not a function obj.prop().

const user1 = {
  firstName: "Sam",
  lastName: "Student",

  // This looks like a property, but it runs code!
  get fullName() {
    return `${this.firstName} ${this.lastName}`;
  }
};

console.log(user1.fullName); // "Sam Student"
// Note: We did NOT use parenthesis ().



// 2. The Setter (set)

// A setter binds an object property to a function to be called when there is an attempt to set that property.
// It is perfect for Validation.

// Syntax: Use the set keyword.
// It must accept exactly one parameter (the new value).

const user2 = {
  // Convention: underscore means "internal/private" variable
  _age: 21, 

  set age(value) {
    if (value < 0) {
      console.log("Error: Age cannot be negative!");
      return;
    }
    this._age = value;
  }
};

user2.age = 25; // Works fine
user2.age = -5; // Output: "Error: Age cannot be negative!"



// 3. Why use them?

// 1. Computed Properties: You don't need to store fullName in the database. You just store first/last name and calculate the full name on the fly. This ensures the full name is never "out of sync."

// 2. Validation/Security: You can prevent users from setting invalid data (like negative age or empty passwords) while keeping the syntax clean (user.age = 5).

// 3. Encapsulation: You can hide the internal complexity of how data is stored.



// 4. Class Syntax

class Circle {
  constructor(radius) {
    this.radius = radius;
  }

  // Getter for area
  get area() {
    return Math.PI * this.radius * this.radius;
  }
  
  // Setter to update radius based on diameter
  set diameter(d) {
    this.radius = d / 2;
  }
}

const c = new Circle(10);
console.log(c.area); // 314.15...
c.diameter = 100;    // This updates the radius to 50
console.log(c.radius); // 50
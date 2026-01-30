// Inheritance - it allows you to create a specific version of a generic class.

// Imagine a generic class called User.
// It has a name and an email.
// Now you need a Admin.
// An Admin is a User, but with extra powers (like deleting posts).
// Instead of rewriting the name and email logic, the Admin class inherits (extends) from User.


// 1. The extends keyword

// This tells JavaScript: "This new class is a child of that parent class."
// It automatically links the prototype chains.

class User {
  constructor(name) {
    this.name = name;
  }
  
  login() {
    console.log(`${this.name} has logged in.`);
  }
}

// Admin inherits everything from User
class Admin extends User {
  deletePost() {
    console.log("Post deleted!");
  }
}

const admin = new Admin("Sam");
admin.login();      // Works! (Inherited from User)
admin.deletePost(); // Works! (Specific to Admin)



// 2. The super() keyword

// If the child class needs its own data (extra properties), you need to write a constructor.
// Inside a child constructor, you MUST call super() before you can use the "this" keyword.

// super() calls the Parent's constructor.
// It essentially says: "Run the setup code for the parent first, then let me add my extra stuff."

class Student extends User {
  constructor(name, year) {
    // 1. Call the parent first (sets this.name)
    super(name); 
    
    // 2. Now add student-specific data
    this.year = year; 
  }

  printDetails() {
    console.log(`${this.name} is in year ${this.year}`);
  }
}

const s = new Student("Gemini", 1);



// 3. Method overriding

// If the child defines a method with the same name as the parent, the child's method wins.

class Admin extends User {
  // Overrides User.login()
  login() {
    console.log("ADMIN LOGIN DETECTED via 2FA");
    // You can even call the original parent method inside here:
    // super.login(); 
  }
}
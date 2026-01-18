// Classes - 2015 (ES6)

// note: under the hood it still uses prototypes. Classes are just syntactic sugar for the same old prototype chain.

// 1. Syntax

// Class is the blueprint.
// You define it once and then you can use it to create as many objects/instances as you want from it.

class Student {
    // The setup function
    constructor(name, year) {
        this.name = name;
        this.year = year; 
    }

    // Method (Shared by all students)
    introduce() {
        console.log(`Hi I'm ${this.name}, a year ${this.year} student.`);
    }
}



// 2. Constructor method - it runs automatically the moment you create a new instance of the class.

// It's job is to initialize the object's properties (data).
// "this" refers to the new object being created.



// 3. creating instances - with new keyword

// "new" triggers the constructor
const sam = new Student("Sam", 4);
const gemini = new Student("Gemini", 1);

sam.introduce();        // Hi I'm Sam, a year 4 student.
gemini.introduce();     // Hi I'm Gemini, a year 1 student.



// 4. Why use classes?

// organization - It keeps your data (properties) and behavior (methods) grouped together logically.
// reusability - You write the logic once (introduce()) and use it for 1,000 of students without rewriting code.


// class - The template (the factory)
// instance - The object produced (the car)
// constructor - The assembly line startup script.
import '../models/topic_model.dart';

/// Phase 5: The DOM (6 Topics)
class Phase5Content {
  static Phase get phase => const Phase(
    number: 5,
    id: '5-the-dom',
    title: 'The DOM',
    description: 'Document Object Model, events, and DOM manipulation.',
    topicCount: 6,
    topics: [
      // Topic 1: Selectors
      Topic(
        id: 'selectors',
        title: 'Selectors',
        phaseNumber: 5,
        phaseId: '5-the-dom',
        description: 'What is the DOM, querySelector, querySelectorAll.',
        sections: [
          TopicSection(
            title: 'What is the DOM?',
            contents: [
              TopicContent.paragraph('The DOM (Document Object Model) is the bridge between your JavaScript code and the HTML on the screen.'),
              TopicContent.paragraph('Without the DOM, JavaScript is just a language calculating numbers in the background. With the DOM, JavaScript becomes the puppeteer of the webpage.'),
            ],
          ),
          TopicSection(
            title: '1. The concept',
            contents: [
              TopicContent.paragraph('When a browser (like Chrome) loads a webpage, it takes your HTML code and builds a Tree Structure in memory.'),
              TopicContent.paragraph('Every HTML tag (<div>, <h1>, <p>) becomes a JavaScript Object (a "Node").'),
              TopicContent.paragraph('Because they are objects, we can change them using JavaScript.'),
            ],
          ),
          TopicSection(
            title: '2. The structure (The family tree)',
            contents: [
              TopicContent.paragraph('The DOM is organized like a family tree.'),
              TopicContent.bulletList([
                'Root : The document object (the starting point).',
                'Parents & Children : <body> is the parent of <h1>. <h1> is the child of <body>.',
                'Siblings : Two <li> tags side-by-side are siblings.',
              ]),
            ],
          ),
          TopicSection(
            title: '3. The document object',
            contents: [
              TopicContent.paragraph('This is your entry point. If you type document in your browser console, you will see the entire HTML code of the page.'),
              TopicContent.bulletList([
                'document.title -> Gives you the title of the tab.',
                'document.URL -> Gives you the current website address.',
                'document.body -> Gives you the entire body content.',
              ]),
            ],
          ),
          TopicSection(
            title: '4. What can we do with it?',
            contents: [
              TopicContent.paragraph('Using the DOM API, JavaScript can:'),
              TopicContent.bulletList([
                'Change Content : Update text inside a paragraph.',
                'Change Style : Turn a button red.',
                'Add/Remove Elements : Create a new list item or delete an image.',
                'React to Events : Run code when a user clicks or types.',
              ]),
            ],
          ),
          TopicSection(
            title: 'Selecting Elements',
            contents: [
              TopicContent.paragraph('Before changing anything on the website, you have to tell the javascript which element to change. (selecting it)'),
            ],
          ),
          TopicSection(
            title: '1. querySelector()',
            contents: [
              TopicContent.paragraph('It allows you to select elements using CSS syntax (just like you do in your .css file).'),
              TopicContent.bulletList([
                "Select by Tag: document.querySelector('h1') (Selects the first <h1>)",
                "Select by Class: document.querySelector('.btn') (Selects the first element with class \"btn\")",
                "Select by ID: document.querySelector('#header') (Selects the element with ID \"header\")",
              ]),
              TopicContent.paragraph('Note: It only returns the FIRST match it finds.'),
              TopicContent.code(CodeBlock(
                filename: 'querySelector.js',
                code: '''const myButton = document.querySelector('.submit-btn');
console.log(myButton); // Prints the HTML element to the console''',
              )),
            ],
          ),
          TopicSection(
            title: '2. querySelectorAll()',
            contents: [
              TopicContent.paragraph('It returns all elements that match.'),
              TopicContent.paragraph('It returns a NodeList (which looks and acts like an Array).'),
              TopicContent.paragraph('You can loop over it using forEach.'),
              TopicContent.code(CodeBlock(
                filename: 'querySelectorAll.js',
                code: '''const allParagraphs = document.querySelectorAll('p');

allParagraphs.forEach(para => {
    console.log(para); // Prints every paragraph one by one
});''',
              )),
            ],
          ),
          TopicSection(
            title: '3. getElementById()',
            contents: [
              TopicContent.paragraph('It is slightly faster than querySelector but only works for IDs.'),
              TopicContent.code(CodeBlock(
                filename: 'getElementById.js',
                code: '''const title = document.getElementById('main-title');
// Note: You do NOT use the hash '#' here, just the name.''',
              )),
              TopicContent.bulletList([
                "Use querySelector for almost everything (it's cleaner).",
                'Use getElementById if you need extreme performance (rarely needed).',
              ]),
            ],
          ),
        ],
      ),

      // Topic 2: Manipulation
      Topic(
        id: 'manipulation',
        title: 'Manipulation',
        phaseNumber: 5,
        phaseId: '5-the-dom',
        description: 'Changing content and styles.',
        sections: [
          TopicSection(
            title: 'Manipulating Content',
            contents: [
              TopicContent.paragraph('To change the content of an html element after selecting it.'),
            ],
          ),
          TopicSection(
            title: '1. .textContent',
            contents: [
              TopicContent.paragraph('This is the most common way to read or change text.'),
              TopicContent.paragraph('It accesses all text contained in the element and its children, including hidden text.'),
              TopicContent.code(CodeBlock(
                filename: 'textContent.js',
                code: '''const title = document.querySelector('h1');

console.log(title.textContent); // Read

title.textContent = "Welcome, Sam!"; // Write
// The browser immediately updates the text on the screen.''',
              )),
            ],
          ),
          TopicSection(
            title: '2. .innerText',
            contents: [
              TopicContent.paragraph('Very similar to textContent, but it respects CSS styles.'),
              TopicContent.paragraph('If an element is hidden (display: none), .innerText will not return it, while .textContent will.'),
              TopicContent.paragraph('Note: Stick to .textContent unless you specifically need only the visible text.'),
            ],
          ),
          TopicSection(
            title: '3. .innerHTML - (The Powerful & Dangerous)',
            contents: [
              TopicContent.paragraph('This allows you to get or set the HTML markup inside an element.'),
              TopicContent.paragraph('This means you can add <strong> tags, links, or entirely new structures.'),
              TopicContent.code(CodeBlock(
                filename: 'innerHTML.js',
                code: '''const box = document.querySelector('.box');

box.innerHTML = "<strong>This is bold text</strong>";       // This renders as BOLD text''',
              )),
            ],
          ),
          TopicSection(
            title: 'Security Warning (XSS Attack)',
            contents: [
              TopicContent.paragraph('Never use .innerHTML with data that comes from a user (like a comment or username).'),
              TopicContent.paragraph('A hacker can insert a <script> tag inside their comment, and your website will run their malicious code.'),
              TopicContent.bulletList([
                'Safe : element.textContent = userComment; (Treats tags as plain text)',
                'Unsafe : element.innerHTML = userComment; (Runs tags as code)',
              ]),
            ],
          ),
          TopicSection(
            title: 'Manipulating Styles',
            contents: [],
          ),
          TopicSection(
            title: '1. The direct way (.style)',
            contents: [
              TopicContent.paragraph('You can access CSS properties directly on the element.'),
              TopicContent.paragraph('Note: CSS properties with hyphens (like background-color) must be converted to camelCase in JavaScript.'),
              TopicContent.bulletList([
                'background-color -> backgroundColor',
                'font-size -> fontSize',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'style.js',
                code: '''const box = document.querySelector('.box');

box.style.backgroundColor = 'red';      // Change background to red

box.style.width = '100px';              // Change width (MUST be a string with units)
// box.style.width = 100; // Won't work!''',
              )),
              TopicContent.paragraph('The Downside: This adds inline styles directly to the HTML tag (<div style="color: red">).'),
              TopicContent.paragraph('It overrides everything else and makes your HTML messy.'),
            ],
          ),
          TopicSection(
            title: '2. The professional way (classList)',
            contents: [
              TopicContent.paragraph('Instead of writing CSS inside JS, you should define a class in your CSS file (e.g., .hidden or .active) and then simply add or remove that class using JavaScript.'),
              TopicContent.paragraph('This keeps your styling in CSS and your logic in JS.'),
              TopicContent.paragraph('The Toolkit:'),
              TopicContent.bulletList([
                "classList.add('className'): Adds a class.",
                "classList.remove('className'): Removes a class.",
                "classList.toggle('className'): Adds it if missing, removes it if present (like a light switch).",
              ]),
              TopicContent.code(CodeBlock(
                filename: 'classList.js',
                code: '''/* In your CSS file */
// .dark-mode {
//   background-color: black;
//   color: white;
// }


/* In your JS file */
const body = document.querySelector('body');

// Activate dark mode
body.classList.add('dark-mode');

// Toggle it on/off (Great for buttons!)
body.classList.toggle('dark-mode');''',
              )),
              TopicContent.bulletList([
                'Use .style for dynamic values (e.g., a progress bar width changing in real-time).',
                'Use .classList for state changes (e.g., active, disabled, hidden, dark-mode).',
              ]),
            ],
          ),
        ],
      ),

      // Topic 3: Traversing
      Topic(
        id: 'traversing',
        title: 'Traversing',
        phaseNumber: 5,
        phaseId: '5-the-dom',
        description: 'Navigating parent, child, and sibling elements.',
        sections: [
          TopicSection(
            title: 'DOM Traversing',
            contents: [
              TopicContent.paragraph("To select an element and access it's neighbour, parent or child"),
            ],
          ),
          TopicSection(
            title: '1. Going down (children)',
            contents: [
              TopicContent.paragraph('To access the elements inside the one you selected.'),
              TopicContent.bulletList([
                '.children: returns a list (html collection) of all direct childrens.',
                '.firstElementChild: the first child.',
                '.lastElementChild: the last child.',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'children.js',
                code: '''const list = document.querySelector('ul');
// make the last child blue
list.firstElementChild.style.color = 'blue';''',
              )),
            ],
          ),
          TopicSection(
            title: '2. Going up (parents)',
            contents: [
              TopicContent.paragraph('To find the container of the element you selected.'),
              TopicContent.bulletList([
                ".parentElement: the direct parent one level up.",
                ".closest('selector'): looks at the element itself and then travels up until it finds the first parent that matches the selector.",
              ]),
              TopicContent.code(CodeBlock(
                filename: 'parents.js',
                code: '''const btn = document.querySelector('.delete-btn');

// "find the closest row (tr) above this button and remove it"
// useful for "delete" buttons in lists/tables
btn.closest('tr').remove();''',
              )),
            ],
          ),
          TopicSection(
            title: '3. Going sideways (siblings)',
            contents: [
              TopicContent.paragraph('To find elements of the same level (brothers/sisters)'),
              TopicContent.bulletList([
                '.nextElementSibling: the element immediately after.',
                '.previousElementSibling: the element immediately before.',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'siblings.js',
                code: '''const currentStep = document.querySelector('.active');

// highlight the next step in the process
currentStep.nextElementSibling.style.opacity = "1";''',
              )),
            ],
          ),
        ],
      ),

      // Topic 4: Events Basics
      Topic(
        id: 'events-basics',
        title: 'Events Basics',
        phaseNumber: 5,
        phaseId: '5-the-dom',
        description: 'addEventListener, mouse and keyboard events.',
        sections: [
          TopicSection(
            title: 'Event Basics',
            contents: [
              TopicContent.paragraph('Events are things that happen in the browser—a click, a keypress, a scroll, or a form submission.'),
            ],
          ),
          TopicSection(
            title: '1. addEventListener',
            contents: [
              TopicContent.paragraph('This is how you tell an element to wait for an event.'),
              TopicContent.paragraph('element.addEventListener(eventType, function)'),
              TopicContent.code(CodeBlock(
                filename: 'addEventListener.js',
                code: '''const btn = document.querySelector('button');

btn.addEventListener('click', function() {
  console.log('Button was clicked!');
});

// it is better than onClick since onClick can only have one function, this can have multiple.''',
              )),
            ],
          ),
          TopicSection(
            title: '2. Mouse events',
            contents: [
              TopicContent.bulletList([
                'click: left click',
                'dblclick: double click',
                'mouseenter/mouseleave: when the mouse hovers over or leaves an element',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'mouseEvents.js',
                code: '''const box = document.querySelector('.box');

box.addEventListener('mouseenter', ()=> {
  box.style.backgroundColor = 'red';
});''',
              )),
            ],
          ),
          TopicSection(
            title: '3. Keyboard events',
            contents: [
              TopicContent.bulletList([
                'keydown: fires the moment you press a key',
                'keyup: fires when you release the key',
              ]),
              TopicContent.paragraph('To know which key was actually pressed the event function automatically receives an event object (named e or event) which contains all the details.'),
              TopicContent.code(CodeBlock(
                filename: 'keyboardEvents.js',
                code: '''document.addEventListener('keydown', function(e) {
  console.log(e.key);

  if (e.key === 'Escape') {
    closeModal(); // close a popup window
  }
});''',
              )),
            ],
          ),
          TopicSection(
            title: '4. Removing listeners',
            contents: [
              TopicContent.paragraph('When you have to stop listening'),
              TopicContent.paragraph('Note: the function must be named function not anonymous.'),
              TopicContent.code(CodeBlock(
                filename: 'removeListener.js',
                code: '''function sayHello() {
  console.log("Hello");
}

// Add
btn.addEventListener('click', sayHello);

// Remove
btn.removeEventListener('click', sayHello);''',
              )),
            ],
          ),
        ],
      ),

      // Topic 5: Event Propagation  
      Topic(
        id: 'event-propagation',
        title: 'Event Propagation',
        phaseNumber: 5,
        phaseId: '5-the-dom',
        description: 'Bubbling and Capturing.',
        sections: [
          TopicSection(
            title: 'Event Propagation',
            contents: [
              TopicContent.paragraph('Explains the order in which the clicks are handled by the browser.'),
              TopicContent.paragraph('3 phases - event travels through DOM in a round trip.'),
              TopicContent.bulletList([
                'capturing phase - the event travels down, from document root to target.',
                'target phase - the event hits the actual element you clicked.',
                'bubbling phase - the event travels up, from target to document root.',
              ]),
            ],
          ),
          TopicSection(
            title: '1. Event bubbling',
            contents: [
              TopicContent.paragraph('Events trigger on the deepest element first, then bubble up, like air bubbles in water.'),
              TopicContent.paragraph('Imagine you have Grandparent > Parent > child (all have click listeners).'),
              TopicContent.paragraph('If you click the Child:'),
              TopicContent.bulletList([
                '1. Child runs first',
                '2. Parent runs second',
                '3. Grandparent runs last',
              ]),
            ],
          ),
          TopicSection(
            title: '2. Stopping the bubble',
            contents: [
              TopicContent.paragraph('Imagine you have a clickable card component that opens a popup.'),
              TopicContent.paragraph('Inside that card is a delete button.'),
              TopicContent.paragraph('Clicking delete deletes the item, but the click bubbles up to the card and opens the popup too.'),
              TopicContent.code(CodeBlock(
                filename: 'stopPropagation.js',
                code: '''// fix
deleteBtn.addEventListener('click', function(e) {
    // runs delete logic...
    console.log("Deleted");

    // stop the event from going to parents
    e.stopPropagation();
});''',
              )),
            ],
          ),
          TopicSection(
            title: '3. Event capturing',
            contents: [
              TopicContent.paragraph('We can force the event to fire downwards (before it reaches the target).'),
              TopicContent.paragraph('This is done by passing a third argument true (or {capture: true}).'),
              TopicContent.code(CodeBlock(
                filename: 'capturing.js',
                code: "grandparent.addEventListener('click', func, true);      // runs first",
              )),
            ],
          ),
        ],
      ),

      // Topic 6: Event Delegation
      Topic(
        id: 'event-delegation',
        title: 'Event Delegation',
        phaseNumber: 5,
        phaseId: '5-the-dom',
        description: 'Efficient event handling pattern.',
        sections: [
          TopicSection(
            title: 'Event Delegation',
            contents: [
              TopicContent.paragraph('This is a design pattern used by senior developers.'),
              TopicContent.paragraph('It solves two major problems: Memory Usage and Dynamic Elements.'),
              TopicContent.paragraph('Instead of attaching an event listener to every single button (which takes up memory), you attach ONE listener to their common parent.'),
              TopicContent.paragraph('You let the events "bubble up" to the parent, and the parent handles them.'),
            ],
          ),
          TopicSection(
            title: '1. Memory Usage',
            contents: [
              TopicContent.paragraph('Imagine you have a list with 1,000 items.'),
              TopicContent.code(CodeBlock(
                filename: 'problem.js',
                code: '''const items = document.querySelectorAll('li');
// You are creating 1,000 separate functions in memory!
items.forEach(item => {
  item.addEventListener('click', deleteItem);
});''',
              )),
              TopicContent.paragraph('Fix - You attach one listener to the <ul> (the parent container).'),
              TopicContent.code(CodeBlock(
                filename: 'delegation.js',
                code: '''const list = document.querySelector('ul');

list.addEventListener('click', function(e) {
  // e.target tells us EXACTLY what was clicked (the child)
  
  // Check if the clicked element is an LI (or inside one)
  if (e.target.tagName === 'LI') {
    console.log("Item clicked:", e.target.textContent);
    // e.target.remove(); // e.g., Delete it
  }
});''',
              )),
            ],
          ),
          TopicSection(
            title: '2. Dynamic Elements',
            contents: [
              TopicContent.paragraph('If you add a new item to the list after the page loads using JavaScript:'),
              TopicContent.bulletList([
                "Standard Listeners : Won't work. The new item didn't exist when you ran querySelectorAll.",
                "Delegation : Works perfectly. The parent is already listening, and the new child's clicks will bubble up just like the old ones.",
              ]),
            ],
          ),
          TopicSection(
            title: 'closest()',
            contents: [
              TopicContent.paragraph('Sometimes e.target is too specific. If you click an icon inside a button, e.target will be the <i> icon, not the <button>.'),
              TopicContent.paragraph('Use .closest() to ensure you catch the right element.'),
              TopicContent.code(CodeBlock(
                filename: 'closest.js',
                code: '''list.addEventListener('click', function(e) {
  // Look for the closest 'li' up the tree from where I clicked
  const item = e.target.closest('li');

  // If found, and it is inside our list
  if (item && list.contains(item)) {
    console.log("Found it!");
  }
});''',
              )),
            ],
          ),
        ],
      ),
    ],
  );
}

/// Phase 6: OOP (5 Topics)
class Phase6Content {
  static Phase get phase => const Phase(
    number: 6,
    id: '6-oop',
    title: 'OOP',
    description: 'Object-Oriented Programming patterns in JavaScript.',
    topicCount: 5,
    topics: [
      // Topic 1: Prototypes
      Topic(
        id: 'prototypes',
        title: 'Prototypes',
        phaseNumber: 6,
        phaseId: '6-oop',
        description: 'The prototype chain and inheritance.',
        sections: [
          TopicSection(
            title: 'Prototypes',
            contents: [
              TopicContent.paragraph("Every Javascript object has a hidden link to another object. This parent object is called it's prototype."),
              TopicContent.paragraph('Instead of classes for inheritance, Javascript uses Prototypes.'),
              TopicContent.paragraph('Even if you use class keyword, under the hood it is still a Prototype.'),
              TopicContent.paragraph('The prototype contains methods and properties that the original object can borrow.'),
            ],
          ),
          TopicSection(
            title: 'The Prototype Chain',
            contents: [
              TopicContent.paragraph('When you try to access a property or method (like .toString()) on an object:'),
              TopicContent.bulletList([
                '1. JS checks the object itself. Found? Use it.',
                "2. If not, it looks at the object's prototype. Found? Use it.",
                "3. If not, it looks at the prototype's prototype.",
                '4. It keeps going up until it hits null. (the end of the chain)',
                '5. If still not found, it returns undefined.',
              ]),
            ],
          ),
          TopicSection(
            title: 'Why Arrays Have Methods (.push(), .pop()?)',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'array-prototype.js',
                code: '''const myFriend = ["Sam", "Mike"];
console.log(myFriend.push)          // [Function: push]

// 1. myFriend: Just a list of strings. It does not have .push()
// 2. myFriends.__prototype__ (Array Prototype): This is the blueprint for all arrays. It has the .push()
// 3. Javascript uses the function from the prototype.''',
              )),
            ],
          ),
          TopicSection(
            title: 'Example',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'prototype-chain.js',
                code: '''const num = 10;

// 1. The number itself
console.log(num);       // 10

// 2. Number.prototype (Has methods like toFixed)
console.log(num.__proto__);         // {}

// 3. Object.prototype (The greater ancestor of everything)
console.log(num.__proto__.__proto__);           // [Object: null prototype] {}

// 4. null (The End)
console.log(num.__proto__.__proto__.__proto__);         // null''',
              )),
            ],
          ),
          TopicSection(
            title: 'This saves memory',
            contents: [
              TopicContent.paragraph('Instead of every single array carrying the code for .push(), the code exists in one place (the prototype), and all the arrays share it.'),
            ],
          ),
        ],
      ),

      // Topic 2: Classes
      Topic(
        id: 'classes',
        title: 'Classes',
        phaseNumber: 6,
        phaseId: '6-oop',
        description: 'ES6 class syntax and instances.',
        sections: [
          TopicSection(
            title: 'Classes - 2015 (ES6)',
            contents: [
              TopicContent.paragraph('Note: under the hood it still uses prototypes. Classes are just syntactic sugar for the same old prototype chain.'),
            ],
          ),
          TopicSection(
            title: '1. Syntax',
            contents: [
              TopicContent.paragraph('Class is the blueprint.'),
              TopicContent.paragraph('You define it once and then you can use it to create as many objects/instances as you want from it.'),
              TopicContent.code(CodeBlock(
                filename: 'class-syntax.js',
                code: '''class Student {
    // The setup function
    constructor(name, year) {
        this.name = name;
        this.year = year; 
    }

    // Method (Shared by all students)
    introduce() {
        console.log(\`Hi I'm \${this.name}, a year \${this.year} student.\`);
    }
}''',
              )),
            ],
          ),
          TopicSection(
            title: '2. Constructor method',
            contents: [
              TopicContent.paragraph('It runs automatically the moment you create a new instance of the class.'),
              TopicContent.paragraph("It's job is to initialize the object's properties (data)."),
              TopicContent.paragraph('"this" refers to the new object being created.'),
            ],
          ),
          TopicSection(
            title: '3. Creating instances - with new keyword',
            contents: [
              TopicContent.paragraph('"new" triggers the constructor'),
              TopicContent.code(CodeBlock(
                filename: 'instances.js',
                code: '''const sam = new Student("Sam", 4);
const gemini = new Student("Gemini", 1);

sam.introduce();        // Hi I'm Sam, a year 4 student.
gemini.introduce();     // Hi I'm Gemini, a year 1 student.''',
              )),
            ],
          ),
          TopicSection(
            title: '4. Why use classes?',
            contents: [
              TopicContent.bulletList([
                'organization - It keeps your data (properties) and behavior (methods) grouped together logically.',
                'reusability - You write the logic once (introduce()) and use it for 1,000 of students without rewriting code.',
              ]),
              TopicContent.bulletList([
                'class - The template (the factory)',
                'instance - The object produced (the car)',
                'constructor - The assembly line startup script.',
              ]),
            ],
          ),
        ],
      ),

      // Topic 3: Inheritance
      Topic(
        id: 'inheritance',
        title: 'Inheritance',
        phaseNumber: 6,
        phaseId: '6-oop',
        description: 'extends, super, and method overriding.',
        sections: [
          TopicSection(
            title: 'Inheritance',
            contents: [
              TopicContent.paragraph('It allows you to create a specific version of a generic class.'),
              TopicContent.paragraph('Imagine a generic class called User. It has a name and an email.'),
              TopicContent.paragraph('Now you need a Admin. An Admin is a User, but with extra powers (like deleting posts).'),
              TopicContent.paragraph('Instead of rewriting the name and email logic, the Admin class inherits (extends) from User.'),
            ],
          ),
          TopicSection(
            title: '1. The extends keyword',
            contents: [
              TopicContent.paragraph('This tells JavaScript: "This new class is a child of that parent class."'),
              TopicContent.paragraph('It automatically links the prototype chains.'),
              TopicContent.code(CodeBlock(
                filename: 'extends.js',
                code: '''class User {
  constructor(name) {
    this.name = name;
  }
  
  login() {
    console.log(\`\${this.name} has logged in.\`);
  }
}

// Admin inherits everything from User
class Admin extends User {
  deletePost() {
    console.log("Post deleted!");
  }
}

const admin = new Admin("Sampath");
admin.login();      // Works! (Inherited from User)
admin.deletePost(); // Works! (Specific to Admin)''',
              )),
            ],
          ),
          TopicSection(
            title: '2. The super() keyword',
            contents: [
              TopicContent.paragraph('If the child class needs its own data (extra properties), you need to write a constructor.'),
              TopicContent.paragraph('Inside a child constructor, you MUST call super() before you can use the "this" keyword.'),
              TopicContent.paragraph("super() calls the Parent's constructor."),
              TopicContent.paragraph('It essentially says: "Run the setup code for the parent first, then let me add my extra stuff."'),
              TopicContent.code(CodeBlock(
                filename: 'super.js',
                code: '''class Student extends User {
  constructor(name, year) {
    // 1. Call the parent first (sets this.name)
    super(name); 
    
    // 2. Now add student-specific data
    this.year = year; 
  }

  printDetails() {
    console.log(\`\${this.name} is in year \${this.year}\`);
  }
}

const s = new Student("Gemini", 1);''',
              )),
            ],
          ),
          TopicSection(
            title: '3. Method overriding',
            contents: [
              TopicContent.paragraph("If the child defines a method with the same name as the parent, the child's method wins."),
              TopicContent.code(CodeBlock(
                filename: 'override.js',
                code: '''class Admin extends User {
  // Overrides User.login()
  login() {
    console.log("ADMIN LOGIN DETECTED via 2FA");
    // You can even call the original parent method inside here:
    // super.login(); 
  }
}''',
              )),
            ],
          ),
        ],
      ),

      // Topic 4: Advanced 'this'
      Topic(
        id: 'advanced-this',
        title: "Advanced 'this'",
        phaseNumber: 6,
        phaseId: '6-oop',
        description: 'call, apply, and bind.',
        sections: [
          TopicSection(
            title: 'Advanced this (call, apply, bind)',
            contents: [
              TopicContent.paragraph('Sometimes Javascript gets confused about what "this" should be, or you simple want to "borrow" a function from one object and use it on another.'),
              TopicContent.paragraph('call, apply, bind methods allow you to manually tell a function: "Hey, when you run, I want \'this\' to be THAT object".'),
            ],
          ),
          TopicSection(
            title: '1. .call() - The direct call',
            contents: [
              TopicContent.paragraph('It invokes the function immediately and allows you to specify what "this" should point to.'),
              TopicContent.paragraph('syntax: function.call(thisObject, arg1, arg2)'),
              TopicContent.code(CodeBlock(
                filename: 'call.js',
                code: '''const person1 = {
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
// output: "Sam Student"''',
              )),
            ],
          ),
          TopicSection(
            title: '2. .apply() - The array version',
            contents: [
              TopicContent.paragraph('It works exactly like .call(), but arguments are passed as an array.'),
              TopicContent.paragraph('syntax: function.apply(thisObject, [arg1, arg2])'),
              TopicContent.code(CodeBlock(
                filename: 'apply.js',
                code: '''const user = {
    greet: function(city, country) {
        console.log(\`Hello \${this.name} from \${city}, \${country}\`);
    }
};

const myData = { name: "Sam" };

// Using call (arguments separated by commas)
user.greet.call(myData, "Mangalore", "India");

// Using apply (arguments in a list)
user.greet.apply(myData, ["Mangalore", "India"]);''',
              )),
            ],
          ),
          TopicSection(
            title: '3. .bind() - The permanent fix',
            contents: [
              TopicContent.paragraph('Unlike the other two, .bind() does not run the function immediately.'),
              TopicContent.paragraph('Instead, it returns a new copy of the function where "this" is permanently tied to a specific object.'),
              TopicContent.paragraph('You can run this new function later.'),
              TopicContent.paragraph('This is useful for Event Listeners or React, where "this" often gets lost.'),
              TopicContent.code(CodeBlock(
                filename: 'bind.js',
                code: '''const module = {
    x: 42,
    getX: function() {
        return this.x;
    }
};

const unboundGetX = module.getX;
console.log(unboundGetX());     // undefined ('this' is lost in global scope)

const boundGetX = unboundGetX.bind(module);
console.log(boundGetX());       // 42 ('this' is glued to module)''',
              )),
            ],
          ),
        ],
      ),

      // Topic 5: Accessors
      Topic(
        id: 'accessors',
        title: 'Accessors',
        phaseNumber: 6,
        phaseId: '6-oop',
        description: 'Getters and Setters.',
        sections: [
          TopicSection(
            title: 'Accessors (getters and setters)',
            contents: [
              TopicContent.paragraph('Accessors are special methods that look and act like properties.'),
              TopicContent.paragraph('They allow you to execute logic (code) when you read or write a value, without the user of your code knowing they are calling a function.'),
              TopicContent.paragraph('They are the "Gatekeepers" of your data.'),
            ],
          ),
          TopicSection(
            title: '1. The Getter (get)',
            contents: [
              TopicContent.paragraph('A getter binds an object property to a function that will be called when that property is looked up.'),
              TopicContent.paragraph('It is used to compute a value dynamically.'),
              TopicContent.paragraph('Syntax: Use the get keyword before the method name.'),
              TopicContent.paragraph('Usage: You access it like a variable obj.prop, not a function obj.prop().'),
              TopicContent.code(CodeBlock(
                filename: 'getter.js',
                code: '''const user1 = {
  firstName: "Sam",
  lastName: "Student",

  // This looks like a property, but it runs code!
  get fullName() {
    return \`\${this.firstName} \${this.lastName}\`;
  }
};

console.log(user1.fullName); // "Sam Student"
// Note: We did NOT use parenthesis ().''',
              )),
            ],
          ),
          TopicSection(
            title: '2. The Setter (set)',
            contents: [
              TopicContent.paragraph('A setter binds an object property to a function to be called when there is an attempt to set that property.'),
              TopicContent.paragraph('It is perfect for Validation.'),
              TopicContent.paragraph('Syntax: Use the set keyword.'),
              TopicContent.paragraph('It must accept exactly one parameter (the new value).'),
              TopicContent.code(CodeBlock(
                filename: 'setter.js',
                code: '''const user2 = {
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
user2.age = -5; // Output: "Error: Age cannot be negative!"''',
              )),
            ],
          ),
          TopicSection(
            title: '3. Why use them?',
            contents: [
              TopicContent.bulletList([
                '1. Computed Properties : You don\'t need to store fullName in the database. You just store first/last name and calculate the full name on the fly. This ensures the full name is never "out of sync."',
                '2. Validation/Security : You can prevent users from setting invalid data (like negative age or empty passwords) while keeping the syntax clean (user.age = 5).',
                '3. Encapsulation : You can hide the internal complexity of how data is stored.',
              ]),
            ],
          ),
          TopicSection(
            title: '4. Class Syntax',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'class-accessors.js',
                code: '''class Circle {
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
console.log(c.radius); // 50''',
              )),
            ],
          ),
        ],
      ),
    ],
  );
}

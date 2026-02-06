import '../models/topic_model.dart';

/// Phase 3: Functions (8 Topics)
class Phase3Content {
  static Phase get phase => const Phase(
    number: 3,
    id: '3-functions',
    title: 'Functions',
    description: 'Functions, scope, closures, and advanced function concepts.',
    topicCount: 8,
    topics: [
      // Topic 1: Function Basics
      Topic(
        id: 'function-basics',
        title: 'Function Basics',
        phaseNumber: 3,
        phaseId: '3-functions',
        description: 'Declaration vs Expression.',
        sections: [
          TopicSection(
            title: 'Function Basics',
            contents: [
              TopicContent.paragraph('A function is a reusable block of code designed to perform a particular task.'),
            ],
          ),
          TopicSection(
            title: '1. Function Declaration',
            contents: [
              TopicContent.paragraph('Use function keyword followed by a name'),
              TopicContent.code(CodeBlock(
                filename: 'function-declaration.js',
                code: '''sayHello();     // Hoisted - you can call the function before you write them in the code.

function sayHello() {
    console.log("Hello there!");
}''',
              )),
            ],
          ),
          TopicSection(
            title: '2. Function Expression',
            contents: [
              TopicContent.paragraph('You can create a function and store it inside a variable (usually the const)'),
              TopicContent.code(CodeBlock(
                filename: 'function-expression.js',
                code: '''// sayBye();       // This is NOT hoisted, gives error!

const sayBye = function() {
    console.log("Goodbye!");
};

sayBye();       // Works here''',
              )),
            ],
          ),
          TopicSection(
            title: '3. Calling / Invoking a function',
            contents: [
              TopicContent.paragraph('You have to call it to run the code'),
              TopicContent.bulletList([
                'sayHello -> Refers to the function itself.',
                'sayHello() -> Runs the function.',
              ]),
            ],
          ),
        ],
      ),

      // Topic 2: Params & Arguments
      Topic(
        id: 'params-arguments',
        title: 'Params & Arguments',
        phaseNumber: 3,
        phaseId: '3-functions',
        description: 'Default params and Returns.',
        sections: [
          TopicSection(
            title: 'Parameters and Arguments',
            contents: [
              TopicContent.paragraph('Functions become powerful when we can pass data into them and get data out.'),
              TopicContent.bulletList([
                'Parameters : The placeholders you define when writing the function. (The labeled boxes).',
                'Arguments : The actual values you pass when calling the function. (The items you put in the boxes).',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'params-args.js',
                code: '''// 'name' is the parameter
function greet(name) {
    console.log(\`Hello, \${name}\`);
}

// 'Gemini' is the argument
greet("Gemini");''',
              )),
            ],
          ),
          TopicSection(
            title: 'Default Parameters (ES6)',
            contents: [
              TopicContent.paragraph('You can set a fallback value if the user forgets to pass an argument.'),
              TopicContent.code(CodeBlock(
                filename: 'default-params.js',
                code: '''function greet1(name = "Guest") {
    console.log(\`Hello, \${name}\`);
}

greet1();       // Output: "Hello, Guest" (Uses default)
greet1("Sam");  // Output: "Hello, Sam" (overwrites default)''',
              )),
            ],
          ),
          TopicSection(
            title: 'Return values',
            contents: [
              TopicContent.paragraph('By default, functions return \'undefined\'.'),
              TopicContent.paragraph('To send data back to the code that called the function, use return.'),
              TopicContent.paragraph('The return keyword STOPS the function immediately. Any code written after it will never run.'),
              TopicContent.code(CodeBlock(
                filename: 'return.js',
                code: '''function add(a, b) {
    return a + b;
    console.log("I will never print");      // Dead code
}

const result = add(5, 10);      // result is now 15
console.log(result);''',
              )),
            ],
          ),
        ],
      ),

      // Topic 3: Arrow Functions
      Topic(
        id: 'arrow-functions',
        title: 'Arrow Functions',
        phaseNumber: 3,
        phaseId: '3-functions',
        description: 'Syntax and implicit returns.',
        sections: [
          TopicSection(
            title: 'Arrow Functions',
            contents: [
              TopicContent.paragraph('This is the modern way to write functions introduced in ES6.'),
              TopicContent.paragraph('You will use these 90% of the time in modern react or node.js development.'),
              TopicContent.paragraph('They are shorter and cleaner.'),
              TopicContent.code(CodeBlock(
                filename: 'arrow-function.js',
                code: '''// The old way
// const add = function (a, b) {
//     return a + b;
// };

// The new way      // Remove the word function and add a "fat arrow" => after the parameters.
const add = (a, b) => {
    return a + b;
};''',
              )),
            ],
          ),
          TopicSection(
            title: '1. Implicit return',
            contents: [
              TopicContent.paragraph('If your function does one thing and returns the result immediately, you can remove the curly braces {} and the keyword return.'),
              TopicContent.code(CodeBlock(
                filename: 'implicit-return.js',
                code: '''// This function...
// const multiply = (x, y) => {
//     return x * y;
// };

// ...becomes this one-liner:
const multiply = (x, y) => x * y;''',
              )),
            ],
          ),
          TopicSection(
            title: '2. Parentheses rule',
            contents: [
              TopicContent.bulletList([
                'Multiple parameters : Parentheses are required. (a, b) => ...',
                'Zero parameters : Parentheses are required. () => ...',
                'One parameter : Parentheses are optional (but I recommend keeping them for consistency).',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'parentheses.js',
                code: '''// const square = x => x * x;   // Valid
const square = (x) => x * x;    // Also valid''',
              )),
            ],
          ),
          TopicSection(
            title: '3. Note',
            contents: [
              TopicContent.paragraph('If you use the curly braces {}, the "implicit return" is turned off. You must write return.'),
              TopicContent.code(CodeBlock(
                filename: 'braces-note.js',
                code: '''// Return undefined because of the braces!
const broken = (a, b) => { a + b };

// works
const fixed = (a, b) => { return a + b };''',
              )),
            ],
          ),
        ],
      ),

      // Topic 4: Scope
      Topic(
        id: 'scope',
        title: 'Scope',
        phaseNumber: 3,
        phaseId: '3-functions',
        description: 'Global, Function, and Block scope.',
        sections: [
          TopicSection(
            title: 'Scope',
            contents: [
              TopicContent.paragraph('Scope determines where your variables are available.'),
              TopicContent.paragraph('If you try to use a variable outside its scope, you get an error.'),
              TopicContent.paragraph('Think of scope like tinted windows: You can see out, but outsiders can\'t see in.'),
            ],
          ),
          TopicSection(
            title: '1. Global scope',
            contents: [
              TopicContent.paragraph('Variables declared outside of any function or block.'),
              TopicContent.paragraph('Visibility: Everywhere.'),
              TopicContent.paragraph('Risk: Easy to overwrite accidentally. Avoid using too many global variables.'),
              TopicContent.code(CodeBlock(
                filename: 'global-scope.js',
                code: '''const globalVar = "I am everywhere";

function test() {
  console.log(globalVar); // Works!
}''',
              )),
            ],
          ),
          TopicSection(
            title: '2. Function Scope',
            contents: [
              TopicContent.paragraph('Variables declared inside a function.'),
              TopicContent.paragraph('Visibility: Only inside that specific function.'),
              TopicContent.paragraph('Keywords: var, let, and const all respect function scope.'),
              TopicContent.code(CodeBlock(
                filename: 'function-scope.js',
                code: '''function secret() {
  const code = "1234";
}

console.log(code); // Error: code is not defined''',
              )),
            ],
          ),
          TopicSection(
            title: '3. Block Scope (The Modern Standard)',
            contents: [
              TopicContent.paragraph('Variables declared inside a "block" (curly braces {}).'),
              TopicContent.paragraph('Visibility: Only inside that block (e.g., inside an if statement or a for loop).'),
              TopicContent.paragraph('Keywords: Only let and const respect this. var ignores it (leaks out).'),
              TopicContent.code(CodeBlock(
                filename: 'block-scope.js',
                code: '''if (true) {
  let blockVar = "Safe inside";
  var leaker = "I leaked out!";
}

console.log(blockVar); // Error: blockVar is not defined
console.log(leaker);   // Output: "I leaked out!" (Bad!)''',
              )),
            ],
          ),
          TopicSection(
            title: '4. The Scope Chain (Lexical Scoping)',
            contents: [
              TopicContent.paragraph('When you use a variable, JS looks for it in the current scope. If it doesn\'t find it, it looks to the outer parent scope. It keeps going up until it hits the Global scope.'),
              TopicContent.paragraph('Rule: Inner scopes can access outer variables. Outer scopes cannot access inner variables.'),
              TopicContent.code(CodeBlock(
                filename: 'scope-chain.js',
                code: '''const outer = "Outer";

function wrapper() {
  const inner = "Inner";
  
  function deep() {
    console.log(outer); // Works (Looks up 2 levels)
    console.log(inner); // Works (Looks up 1 level)
  }
}''',
              )),
            ],
          ),
        ],
      ),

      // Topic 5: Hoisting
      Topic(
        id: 'hoisting',
        title: 'Hoisting',
        phaseNumber: 3,
        phaseId: '3-functions',
        description: 'Variable and Function hoisting.',
        sections: [
          TopicSection(
            title: 'Hoisting',
            contents: [
              TopicContent.paragraph('Hoisting is a behavior where the JavaScript engine moves variable and function declarations to the top of their scope before the code runs.'),
            ],
          ),
          TopicSection(
            title: '1. Function Hoisting',
            contents: [
              TopicContent.paragraph('Function Declarations are fully hoisted. You can call them before they are written.'),
              TopicContent.code(CodeBlock(
                filename: 'function-hoisting.js',
                code: '''greet(); // Output: "Hello!" (It works!)

function greet() {
  console.log("Hello!");
}''',
              )),
            ],
          ),
          TopicSection(
            title: '2. Function Expressions (and Arrow Functions) are NOT hoisted.',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'expression-not-hoisted.js',
                code: '''greet(); // Error: Cannot access 'greet' before initialization

const greet = () => {
  console.log("Hello!");
};''',
              )),
            ],
          ),
          TopicSection(
            title: '3. Variable Hoisting (var vs let/const)',
            contents: [
              TopicContent.paragraph('var Hoisting:'),
              TopicContent.paragraph('The variable is hoisted, but its value is not. It is initialized as undefined.'),
              TopicContent.code(CodeBlock(
                filename: 'var-hoisting.js',
                code: '''console.log(food); // Output: undefined (No error, but no data)
var food = "Pizza";
console.log(food); // Output: "Pizza"

// What JS actually sees:
// var food;          // Moved to top
// console.log(food);
// food = "Pizza";''',
              )),
              TopicContent.paragraph('let and const Hoisting:'),
              TopicContent.paragraph('They are technically hoisted, but they land in a "Temporal Dead Zone" (TDZ).'),
              TopicContent.paragraph('If you try to touch them before the line where they are defined, JS throws an error.'),
              TopicContent.code(CodeBlock(
                filename: 'let-const-hoisting.js',
                code: '''console.log(food); // ReferenceError: Cannot access 'food' before initialization
let food = "Pizza";''',
              )),
            ],
          ),
          TopicSection(
            title: 'Summary Rule',
            contents: [
              TopicContent.paragraph('Don\'t rely on hoisting. It is confusing.'),
              TopicContent.paragraph('Always declare your variables and functions at the top of your scope/file.'),
            ],
          ),
        ],
      ),

      // Topic 6: Closures
      Topic(
        id: 'closures',
        title: 'Closures',
        phaseNumber: 3,
        phaseId: '3-functions',
        description: 'Inner functions accessing outer scope.',
        sections: [
          TopicSection(
            title: 'Closures',
            contents: [
              TopicContent.paragraph('A Closure is a function that remembers the variables from the place where it was created, even after that place (the outer function) has finished running.'),
            ],
          ),
          TopicSection(
            title: '1. The Analogy: The Backpack',
            contents: [
              TopicContent.paragraph('Imagine a function is a hiker. When a function is created, it puts on a backpack.'),
              TopicContent.paragraph('Inside that backpack, it packs all the variables that were present in its parent scope at that moment.'),
              TopicContent.paragraph('Whenever that function goes later, it carries that backpack with those variables.'),
            ],
          ),
          TopicSection(
            title: '2. The Code Example',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'closure.js',
                code: '''function createCounter() {
  let count = 0; // Local variable inside createCounter

  return function() {
    count++; // It accesses 'count' from the parent
    return count;
  };
}

const myCounter = createCounter(); 
// At this point, createCounter() has FINISHED running. 
// Normally, 'count' should be garbage collected (deleted).
// BUT, myCounter keeps a closure (backpack) containing 'count'.

console.log(myCounter()); // Output: 1
console.log(myCounter()); // Output: 2
console.log(myCounter()); // Output: 3''',
              )),
            ],
          ),
          TopicSection(
            title: '3. Why is this useful?',
            contents: [
              TopicContent.paragraph('It allows for Data Privacy.'),
              TopicContent.paragraph('In the example above, nobody can mess with the count variable directly (e.g., count = 1000).'),
              TopicContent.paragraph('They can only increment it by calling myCounter().'),
              TopicContent.paragraph('This is how private variables are created in JavaScript.'),
            ],
          ),
          TopicSection(
            title: '4. Summary',
            contents: [
              TopicContent.paragraph('A function inside another function + the outer variables = Closure.'),
              TopicContent.paragraph('It "closes over" the variables to preserve them.'),
            ],
          ),
        ],
      ),

      // Topic 7: IIFE
      Topic(
        id: 'iife',
        title: 'IIFE',
        phaseNumber: 3,
        phaseId: '3-functions',
        description: 'Immediately Invoked Function Expressions.',
        sections: [
          TopicSection(
            title: 'IIFE (Immediately Invoked Function Expressions)',
            contents: [
              TopicContent.paragraph('An IIFE (pronounced "iffy") is a function that runs as soon as it is defined. It doesn\'t wait to be called later.'),
            ],
          ),
          TopicSection(
            title: 'The Syntax (The "Secret Hug")',
            contents: [
              TopicContent.paragraph('It looks a bit weird because of the extra parentheses.'),
              TopicContent.code(CodeBlock(
                filename: 'iife-syntax.js',
                code: '''(function() {
  console.log("I run immediately!");
})();

// Breakdown:
// 1. (function() { ... }): The first set of parentheses wraps the function to tell the compiler "This is an expression, not a normal declaration."
// 2. (): The second set at the end is what actually calls (invokes) the function right now.''',
              )),
            ],
          ),
          TopicSection(
            title: 'Why use it?',
            contents: [
              TopicContent.paragraph('It is mainly used to create a Private Scope.'),
              TopicContent.paragraph('Variables declared inside an IIFE disappear immediately after it runs.'),
              TopicContent.paragraph('They do not leak into the Global scope or conflict with other variables.'),
              TopicContent.paragraph('Analogy: It\'s like a disposable camera. You take the picture (run the code), and then the camera is thrown away.'),
            ],
          ),
          TopicSection(
            title: 'Example',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'iife-example.js',
                code: '''(function() {
  const secret = "Super Secret Code";
  console.log("Setup done.");
})();

console.log(secret); // Error! 'secret' is gone.''',
              )),
            ],
          ),
          TopicSection(
            title: 'Note',
            contents: [
              TopicContent.paragraph('In modern JavaScript (with Modules and Block Scope), we use IIFEs less often, but you will see them constantly in older code libraries.'),
            ],
          ),
        ],
      ),

      // Topic 8: Recursion
      Topic(
        id: 'recursion',
        title: 'Recursion',
        phaseNumber: 3,
        phaseId: '3-functions',
        description: 'Functions calling themselves.',
        sections: [
          TopicSection(
            title: 'Recursion',
            contents: [
              TopicContent.paragraph('Recursion is when a function calls itself.'),
              TopicContent.paragraph('It sounds like a recipe for an infinite loop (and a browser crash), but if done correctly, it is a powerful way to solve problems that can be broken down into smaller, identical problems.'),
            ],
          ),
          TopicSection(
            title: '1. The Two Rules',
            contents: [
              TopicContent.bulletList([
                '1. The Base Case (The Exit) : A condition that stops the recursion. Without this, the function runs forever until the stack overflows.',
                '2. The Recursive Step : The part where the function calls itself with a smaller piece of the problem.',
              ]),
            ],
          ),
          TopicSection(
            title: '2. Example: Factorial',
            contents: [
              TopicContent.paragraph('Calculate 5! (5 * 4 * 3 * 2 * 1).'),
              TopicContent.code(CodeBlock(
                filename: 'factorial.js',
                code: '''function factorial(n) {
  // 1. Base Case: If n gets down to 1, stop and return 1.
  if (n === 1) {
    return 1;
  }

  // 2. Recursive Step: n * factorial of (n-1)
  return n * factorial(n - 1);
}

console.log(factorial(5)); // Output: 120''',
              )),
            ],
          ),
          TopicSection(
            title: 'How it executes:',
            contents: [
              TopicContent.bulletList([
                'factorial(5) calls factorial(4)',
                'factorial(4) calls factorial(3)',
                'factorial(3) calls factorial(2)',
                'factorial(2) calls factorial(1)',
                'factorial(1) hits the Base Case! Returns 1.',
                'Now the chain resolves backwards: 2*1 -> 3*2 -> 4*6 -> 5*24 -> 120.',
              ]),
            ],
          ),
        ],
      ),
    ],
  );
}

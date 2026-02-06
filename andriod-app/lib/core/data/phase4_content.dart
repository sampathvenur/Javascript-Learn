import '../models/topic_model.dart';

/// Phase 4: Data Structures (13 Topics)
class Phase4Content {
  static Phase get phase => const Phase(
    number: 4,
    id: '4-data-structures',
    title: 'Data Structures',
    description: 'Arrays, Objects, and modern ES6+ features.',
    topicCount: 13,
    topics: [
      // Topic 1: Arrays Basics
      Topic(
        id: 'arrays-basics',
        title: 'Arrays Basics',
        phaseNumber: 4,
        phaseId: '4-data-structures',
        description: 'Creating arrays, push, pop, shift, unshift.',
        sections: [
          TopicSection(
            title: 'Array',
            contents: [
              TopicContent.paragraph('Array is a variable that can store more than one value at a time'),
              TopicContent.paragraph('To create array we use []'),
              TopicContent.code(CodeBlock(
                filename: 'array-basics.js',
                code: '''const alpha = [];   // chars
alpha[0] = "apple";     // indexing start at 0
console.log(typeof alpha);  // object

const num = [1, 2, 3];      // nums
const alpha_num = ["apple", 1, 2, "banana"];    // chars + nums''',
              )),
            ],
          ),
          TopicSection(
            title: 'Add or remove from end - fastest and efficient',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'push-pop.js',
                code: '''let removed = alpha.pop();
alpha.push("orange");''',
              )),
            ],
          ),
          TopicSection(
            title: 'Add or remove from start - slowest and not efficient',
            contents: [
              TopicContent.paragraph('(slow because computer has to re index all items)'),
              TopicContent.code(CodeBlock(
                filename: 'shift-unshift.js',
                code: '''removed = alpha_num.shift();
alpha_num.unshift("orange");''',
              )),
            ],
          ),
        ],
      ),

      // Topic 2: Array Iteration
      Topic(
        id: 'array-iteration',
        title: 'Array Iteration',
        phaseNumber: 4,
        phaseId: '4-data-structures',
        description: 'for...of and forEach.',
        sections: [
          TopicSection(
            title: 'Array Iteration',
            contents: [
              TopicContent.paragraph('To go through every item one by one (iterate).'),
              TopicContent.paragraph('2 ways'),
            ],
          ),
          TopicSection(
            title: 'for...of loop',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'for-of.js',
                code: '''const fruits = ["apple", "orange", "banana", "grapes"];

for (const fruit of fruits) {
    console.log(fruit);
}''',
              )),
              TopicContent.bulletList([
                'pros - readable, continue and break can be used',
                'cons - cannot use index',
              ]),
            ],
          ),
          TopicSection(
            title: 'forEach method',
            contents: [
              TopicContent.paragraph('(a higher function that takes another function (callback function) as input. This function runs once for every item in the array).'),
              TopicContent.code(CodeBlock(
                filename: 'foreach.js',
                code: '''const vegetables = ["potato", "carrot", "brinjal", "tomato"];

// @params (value: string, index: number, array: string[])
vegetables.forEach((fruit, index, array) => {
    console.log(\`Item \${index}: \${fruit}\`);
    console.log(array);
});''',
              )),
              TopicContent.bulletList([
                'pros - gives index as the second argument',
                'cons - cannot use break and continue',
              ]),
            ],
          ),
        ],
      ),

      // Topic 3: Array Transformation
      Topic(
        id: 'array-transformation',
        title: 'Array Transformation',
        phaseNumber: 4,
        phaseId: '4-data-structures',
        description: 'map, filter, reduce.',
        sections: [
          TopicSection(
            title: 'Array Transformation',
            contents: [
              TopicContent.paragraph('Note: They do NOT change the original array. They return a NEW array. (immutable)'),
            ],
          ),
          TopicSection(
            title: 'map',
            contents: [
              TopicContent.paragraph('Transforms every single item into something else (input array(n), output new_array(n))'),
              TopicContent.code(CodeBlock(
                filename: 'map.js',
                code: '''const numbers = [1, 2, 3, 4];

const doubled = numbers.map((item) => item * 2);''',
              )),
            ],
          ),
          TopicSection(
            title: 'filter',
            contents: [
              TopicContent.paragraph('Pick only items that match a specific condition (input array(n), output new_array(<=n))'),
              TopicContent.code(CodeBlock(
                filename: 'filter.js',
                code: 'const even = numbers.filter((item) => item%2 == 0);',
              )),
            ],
          ),
          TopicSection(
            title: 'reduce',
            contents: [
              TopicContent.paragraph('Takes entire array and calculates a single value from it (input array(n), output single_value : number, string, object etc.,)'),
              TopicContent.code(CodeBlock(
                filename: 'reduce.js',
                code: '''const sum0 = numbers.reduce((prev_value, curr_value) => prev_value + curr_value);     // without initial value, prev_value will be the first element and curr_value will be the second element
const sum1 = numbers.reduce((prev_value, curr_value) => prev_value + curr_value, 0);  // initial value is set to 0''',
              )),
            ],
          ),
          TopicSection(
            title: 'Output',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'output.js',
                code: '''console.log(numbers);
console.log(doubled);
console.log(even);
console.log(sum1);

// [ 1, 2, 3, 4 ]
// [ 2, 4, 6, 8 ]
// [ 2, 4 ]
// 10''',
              )),
            ],
          ),
        ],
      ),

      // Topic 4: Array Searching
      Topic(
        id: 'array-searching',
        title: 'Array Searching',
        phaseNumber: 4,
        phaseId: '4-data-structures',
        description: 'includes, indexOf, find, findIndex, some, every.',
        sections: [
          TopicSection(
            title: 'For simple search',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'simple-search.js',
                code: '''const pets = ["dog", "cat", "cow", "fish"]

// 1. includes(value): returns true or false

console.log(pets.includes("dog"));  // true

// 2. indexOf(value): returns index of the value, if not found returns -1

console.log(pets.indexOf("cat"));''',
              )),
            ],
          ),
          TopicSection(
            title: 'For condition based search',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'condition-search.js',
                code: '''const users0 = ["sam", "jupiter"];
const users1 = [
    { id: 1, name: "sam" },
    { id: 2, name: "jupiter" },
];

// 1. find(callback): returns only the first item that matches the condition, else returns undefined (note: since undefined is falsy value, be carefull with falsy value in array like 0 or "")

console.log(users0.find(user => user.startsWith('s')));
console.log(users1.find(user => user.id === 1));

// 2. findIndex(callback): returns index of the first item that matches the condition, else returns -1

console.log(users0.findIndex(user => user.startsWith('s')));
console.log(users1.findIndex(user => user.id === 1));''',
              )),
            ],
          ),
          TopicSection(
            title: 'For boolean check',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'boolean-check.js',
                code: '''const number = [1, 2, 3, 4];

// 1. some(callback): checks if atleast one item matches, OR logic.

console.log(number.some(num => num > 2));

// 2. every(callback): checks if all items match, AND logic.

console.log(number.every(num => num > 0));''',
              )),
            ],
          ),
        ],
      ),

      // Topic 5: Array Sorting
      Topic(
        id: 'array-sorting',
        title: 'Array Sorting',
        phaseNumber: 4,
        phaseId: '4-data-structures',
        description: 'sort, compare functions, reverse.',
        sections: [
          TopicSection(
            title: '.sort()',
            contents: [
              TopicContent.paragraph('It mutates the original array, it does not return a new array'),
              TopicContent.paragraph('It converts everything to string and then compares the character codes (ASCII)'),
              TopicContent.paragraph('Hence it works for Characters not Numbers, by default'),
              TopicContent.code(CodeBlock(
                filename: 'sort-default.js',
                code: '''const fruits = ["banana", "apple", "cherry", "grapes"];
console.log(fruits.sort());     // [ 'apple', 'banana', 'cherry', 'grapes' ]

const numbers = [5, 20, 100, 1];
console.log(numbers.sort());     // [ 1, 100, 20, 5 ]

// Since it treats them as strings, "100" comes before "20" because "1" comes before "2".''',
              )),
            ],
          ),
          TopicSection(
            title: 'Compare Functions',
            contents: [
              TopicContent.paragraph('To fix this we use compare functions'),
              TopicContent.paragraph('This function takes two numbers (a and b).'),
              TopicContent.bulletList([
                'If it returns a negative value, a is sorted before b.',
                'If it returns a positive value, b is sorted before a.',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'compare-function.js',
                code: '''// Ascending order
numbers.sort((a, b) => a - b);
console.log(numbers); // [1, 5, 20, 100]

// Descending order
numbers.sort((a, b) => b - a);
console.log(numbers); // [100, 20, 5, 1]''',
              )),
            ],
          ),
          TopicSection(
            title: 'Reversing',
            contents: [
              TopicContent.paragraph('This mutates the original array'),
              TopicContent.code(CodeBlock(
                filename: 'reverse.js',
                code: '''const num = [1, 2, 3, 4];
console.log(num.reverse()); // [4, 3, 2, 1]''',
              )),
            ],
          ),
        ],
      ),

      // Topic 6: Objects Basics
      Topic(
        id: 'objects-basics',
        title: 'Objects Basics',
        phaseNumber: 4,
        phaseId: '4-data-structures',
        description: 'Creating, accessing, modifying objects.',
        sections: [
          TopicSection(
            title: 'Objects',
            contents: [
              TopicContent.paragraph('If arrays are list, objects are dictionaries.'),
              TopicContent.paragraph('They allow you to store data in key-value pairs.'),
            ],
          ),
          TopicSection(
            title: '1. Creating objects',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'create-object.js',
                code: '''const user = {
    firstName: "Sam",
    role: "Student",
    age: 21,
    isAdmin: false,
    "home address": "Mangalore, India"  // Keys with spaces need quotes
};''',
              )),
            ],
          ),
          TopicSection(
            title: '2. Accessing data',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'access-object.js',
                code: '''// dot notation
console.log(user.firstName);
// console.log(user."home address");    // error - fix : use bracket notation

// bracket notation
console.log(user["age"]);
console.log(user["home address"]);''',
              )),
            ],
          ),
          TopicSection(
            title: '3. When use bracket notation?',
            contents: [
              TopicContent.paragraph('When key is stored inside a variable.'),
              TopicContent.code(CodeBlock(
                filename: 'bracket-notation.js',
                code: '''const target = "role";
console.log(user.target);   // undefined
console.log(user[target]);  // Student''',
              )),
            ],
          ),
          TopicSection(
            title: '4. Modifying objects',
            contents: [
              TopicContent.paragraph('Objects are mutable (even if declared with const)'),
              TopicContent.code(CodeBlock(
                filename: 'modify-object.js',
                code: '''user.email = "sam@123.com";     // add property
user.age = 22;                  // update/modify property
delete user.isAdmin;            // delete property
console.log(user);''',
              )),
            ],
          ),
          TopicSection(
            title: '5. Object methods',
            contents: [
              TopicContent.paragraph('Functions stored inside objects are called methods.'),
              TopicContent.code(CodeBlock(
                filename: 'object-methods.js',
                code: '''const car = {
    brand: "Tesla",
    // Method
    startFSD: function() {
        console.log("Full self driving started");
    },
    // Modern ES6 shorthand (preferred)
    stopFSD() {
        console.log("Full self driving stopped");
    }
};

car.startFSD();             // Full self driving started
car.stopFSD();              // Full self driving stopped
console.log(car);           // { brand: 'Tesla', startFSD: [Function: startFSD], stopFSD: [Function: stopFSD] }
console.log(car.startFSD);  // [Function: startFSD]

console.log(car.startFSD());
// Full self driving started
// undefined

// undefined is caused because the function doesn't return anything.

// when js calls a function it runs the code inside the curly braces and then expects a return value to be returned.



// car.startFSD()
// Full self driving started printed on screen and undefined in not captured

// let a = car.startFSD();
// Full self driving started printed on screen and undefined in captured by a

// console.log(a);      // undefined''',
              )),
            ],
          ),
        ],
      ),

      // Topic 7: The 'this' Keyword
      Topic(
        id: 'this-keyword',
        title: "The 'this' Keyword",
        phaseNumber: 4,
        phaseId: '4-data-structures',
        description: 'Context binding in objects.',
        sections: [
          TopicSection(
            title: 'this',
            contents: [
              TopicContent.paragraph('Refers to the object that called the function.'),
            ],
          ),
          TopicSection(
            title: '1. Inside an object method',
            contents: [
              TopicContent.paragraph('When you use this inside the object\'s method, this equals the object itself.'),
              TopicContent.paragraph('It allows the method to access other data inside the same object.'),
              TopicContent.code(CodeBlock(
                filename: 'this-method.js',
                code: '''const user = {
    name: "Sam",
    age: 21,

    printInfo() {
        // "this" means "user"
        console.log(\`\${this.name} is in year \${this.age}\`);
    }
};

user.printInfo();''',
              )),
            ],
          ),
          TopicSection(
            title: '2. The "Left of the dot" rule',
            contents: [
              TopicContent.paragraph('To figure out what this is, look at how the function is called, not where it is written.'),
              TopicContent.bulletList([
                'user.printInfo() - Left of the dot is user. so this = user',
                'car.start() - Left of dot is car. so this = car',
              ]),
            ],
          ),
          TopicSection(
            title: '3. Arrow function Trap',
            contents: [
              TopicContent.paragraph('Arrow functions DO NOT have their own this.'),
              TopicContent.paragraph('If the method is an arrow function, this will NOT point to the object.'),
              TopicContent.paragraph('It will point to the Window/global scope, and the code will break'),
              TopicContent.code(CodeBlock(
                filename: 'arrow-trap.js',
                code: '''const user1 = {
    name: "Sam",
    sayHi: () => {
        // error - arrow function doesn't user user via this
        console.log(this.name);
    }
};

user1.sayHi();''',
              )),
            ],
          ),
        ],
      ),

      // Topic 8: Object Referencing
      Topic(
        id: 'object-referencing',
        title: 'Object Referencing',
        phaseNumber: 4,
        phaseId: '4-data-structures',
        description: 'Value vs Reference.',
        sections: [
          TopicSection(
            title: 'Object References',
            contents: [],
          ),
          TopicSection(
            title: '1. Primitives = copy by value',
            contents: [
              TopicContent.paragraph('String, number, boolean etc., are stored as value itself.'),
              TopicContent.paragraph('When you copy them, you make a totally independent clone.'),
              TopicContent.code(CodeBlock(
                filename: 'copy-by-value.js',
                code: '''let a = 10;
let b = a;

b = 20;

console.log(a);     // 10''',
              )),
            ],
          ),
          TopicSection(
            title: '2. Objects = copy by reference',
            contents: [
              TopicContent.paragraph('Objects, arrays, stores a reference (an address in the memory) pointing to where the data lives.'),
              TopicContent.paragraph('When you copy the variable, you are just copying the reference.'),
              TopicContent.paragraph('Both variables now point to the same object.'),
              TopicContent.code(CodeBlock(
                filename: 'copy-by-reference.js',
                code: '''const user1 = { name: "Sam" };
const user2 = user1;    // copy the reference, not the object

user2.name = "Jupiter";

console.log(user1.name); // Jupiter''',
              )),
            ],
          ),
          TopicSection(
            title: 'To fix this - use spread operator',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'spread-fix.js',
                code: '''const users1 = { name: "Sam" };
const users2 = { ...users1 };

users2.name = "Jupiter";

console.log(users1.name); // Sam''',
              )),
            ],
          ),
        ],
      ),

      // Topic 9: Object Utilities
      Topic(
        id: 'object-utilities',
        title: 'Object Utilities',
        phaseNumber: 4,
        phaseId: '4-data-structures',
        description: 'Object.keys, values, entries.',
        sections: [
          TopicSection(
            title: 'Object Utilities',
            contents: [
              TopicContent.paragraph('To convert an object into an array so you can loop over it or transform it.'),
            ],
          ),
          TopicSection(
            title: '1. Object.keys()',
            contents: [
              TopicContent.paragraph('Returns an array containing all the keys (variable names) of the object.'),
              TopicContent.code(CodeBlock(
                filename: 'object-keys.js',
                code: '''const user = {
  name: "Sam",
  age: 21,
  role: "Intern"
};

const keys = Object.keys(user);
console.log(keys); // ["name", "age", "role"]''',
              )),
            ],
          ),
          TopicSection(
            title: '2. Object.values()',
            contents: [
              TopicContent.paragraph('Returns an array containing all the values of the object.'),
              TopicContent.code(CodeBlock(
                filename: 'object-values.js',
                code: '''const values = Object.values(user);
console.log(values); // ["Sam", 21, "Intern"]''',
              )),
            ],
          ),
          TopicSection(
            title: '3. Object.entries()',
            contents: [
              TopicContent.paragraph('Returns an array of arrays, where each inner array is a [key, value] pair object.'),
              TopicContent.code(CodeBlock(
                filename: 'object-entries.js',
                code: '''const entries = Object.entries(user);
// [ ["name", "Sam"], ["age", 21], ["role", "Intern"] ]

// Looping Example
for (const [key, value] of Object.entries(user)) {
  console.log(\`\${key}: \${value}\`);
}''',
              )),
            ],
          ),
        ],
      ),

      // Topic 10: ES6 Destructuring
      Topic(
        id: 'es6-destructuring',
        title: 'ES6 Destructuring',
        phaseNumber: 4,
        phaseId: '4-data-structures',
        description: 'Object and Array destructuring.',
        sections: [
          TopicSection(
            title: 'Destructuring (unpacking)',
            contents: [
              TopicContent.paragraph('It allows you to extract data from arrays or objects and assign them to variables in a single, clean line.'),
            ],
          ),
          TopicSection(
            title: '1. Object destructuring',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'object-destructure.js',
                code: '''const user = { firstName: "Sam", age: 21 };

const { firstName, age } = user;    // variable names must match the object keys (unless you rename them)

console.log(firstName); // "Sam"
console.log(age);       // 21

// Renaming Variables: If you want the variable to have a different name than the key:

const { firstName: myName } = user;
console.log(myName); // "Sam"''',
              )),
            ],
          ),
          TopicSection(
            title: '2. Array destructuring',
            contents: [
              TopicContent.paragraph('It works based on position (order), not names.'),
              TopicContent.code(CodeBlock(
                filename: 'array-destructure.js',
                code: '''const numbers = [10, 20, 30];

const [a, b] = numbers;     // Put the first item in 'a', second in 'b'

console.log(a); // 10
console.log(b); // 20

// Skipping Items: You can use an empty comma, to skip an index.

const [first, , third] = ["Gold", "Silver", "Bronze"];
console.log(third); // "Bronze"''',
              )),
            ],
          ),
          TopicSection(
            title: 'Swapping variables',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'swap.js',
                code: '''let x = 5;
let y = 10;

[x, y] = [y, x];

console.log(x); // 10
console.log(y); // 5''',
              )),
            ],
          ),
        ],
      ),

      // Topic 11: Spread & Rest
      Topic(
        id: 'spread-rest',
        title: 'Spread & Rest',
        phaseNumber: 4,
        phaseId: '4-data-structures',
        description: 'Spread operator and Rest parameters.',
        sections: [
          TopicSection(
            title: 'Spread operator (...)',
            contents: [
              TopicContent.paragraph('It allows an iterable (like an array or string) to be expanded into individual elements.'),
            ],
          ),
          TopicSection(
            title: '1. Spreading arrays',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'spread-arrays.js',
                code: '''// A. merging arrays (used instead of concat())

const boys = ["Sam", "Mike"];
const girls = ["Sara", "Anna"];

const allFriends = [...boys, ...girls];     // ["Sam", "Mike", "Sara", "Anna"]

// B. adding elements

const parts = ["knees", "toes"];
const lyrics = ["head", "shoulders", ...parts]; // ["head", "shoulders", "knees", "toes"]

// C. cloning arrays

const original = [1, 2, 3];
const copy = [...original]; // creates a shallow copy (breaks the reference link).''',
              )),
            ],
          ),
          TopicSection(
            title: '2. Spreading objects',
            contents: [
              TopicContent.paragraph('Used to merge or clone objects.'),
              TopicContent.code(CodeBlock(
                filename: 'spread-objects.js',
                code: '''// A. merging/updating properties rule: if keys match, the last one wins (overwrites the previous one).

const user = { name: "Sam", age: 21 };
const update = { age: 22, job: "Intern" };

// 1. Spreads user (name: Sam, age: 21)
// 2. Spreads update (age: 22, job: Intern) -> Overwrites age 21
const updatedUser = { ...user, ...update };

console.log(updatedUser); 
// { name: "Sam", age: 22, job: "Intern" }''',
              )),
            ],
          ),
          TopicSection(
            title: '3. Rest parameters',
            contents: [
              TopicContent.paragraph('The ... syntax is also used to collect multiple elements into an array. This is called the "Rest Pattern" (because it collects the rest of the items).'),
              TopicContent.bulletList([
                'Spread : Unpacks (Expands). Used in function calls or array definitions.',
                'Rest : Packs (Collects). Used in function definitions.',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'rest-params.js',
                code: '''// Function accepts ANY number of arguments
function sum(...numbers) {
  // 'numbers' is now an array: [1, 2, 3, 4]
  return numbers.reduce((acc, curr) => acc + curr, 0);
}

console.log(sum(1, 2, 3, 4)); // 10''',
              )),
            ],
          ),
        ],
      ),

      // Topic 12: Optional Chaining
      Topic(
        id: 'optional-chaining',
        title: 'Optional Chaining',
        phaseNumber: 4,
        phaseId: '4-data-structures',
        description: 'Safe property access with ?.',
        sections: [
          TopicSection(
            title: 'Optional Chaining',
            contents: [
              TopicContent.paragraph('(introduced in ES2020)'),
              TopicContent.paragraph('Saves you from dreaded "Cannot read property of undefined" error.'),
              TopicContent.paragraph('It allows you to safely access nested properties without having to check if every parent step exits.'),
            ],
          ),
          TopicSection(
            title: '1. The problem',
            contents: [
              TopicContent.paragraph('Imagine you are fetching user data, but some users don\'t have an address.'),
              TopicContent.code(CodeBlock(
                filename: 'problem.js',
                code: '''const user = {
    name: "Sam",
    // address is missing!!
};

// This causes a CRASH because user.address is undefined
// You cannot read .street from undefined
console.log(user.address.street);       // Uncaught TypeError!''',
              )),
            ],
          ),
          TopicSection(
            title: '2. The fix - ?. operator',
            contents: [
              TopicContent.paragraph('You place a ? before the dot .'),
              TopicContent.paragraph('It asks: "Does the thing before me exist? If yes, keep going. If no, stop and return undefined."'),
              TopicContent.code(CodeBlock(
                filename: 'fix.js',
                code: 'console.log(user.address?.street);      // Output: undefined (No error, the code keeps running)',
              )),
            ],
          ),
          TopicSection(
            title: 'It works on Methods and Arrays too.',
            contents: [
              TopicContent.bulletList([
                'Methods : user.adminMode?.() (Only runs the function if it exists).',
                'Arrays : users[0]?.name (Only accesses name if index 0 exists).',
              ]),
            ],
          ),
        ],
      ),

      // Topic 13: Nullish Coalescing
      Topic(
        id: 'nullish-coalescing',
        title: 'Nullish Coalescing',
        phaseNumber: 4,
        phaseId: '4-data-structures',
        description: 'Default values with ??.',
        sections: [
          TopicSection(
            title: 'Nullish Coalescing (??)',
            contents: [
              TopicContent.paragraph('Introduced in ES2020 - to solve a specific problem with setting Default Values.'),
            ],
          ),
          TopicSection(
            title: '1. The problem with OR (||)',
            contents: [
              TopicContent.paragraph('For years, developers used || to set defaults. const val = input || "default";'),
              TopicContent.paragraph('The Flaw: The || operator treats 0 and "" (empty string) as False.'),
              TopicContent.paragraph('If a user enters 0 (e.g., score: 0), the || operator thinks it\'s "bad" input and replaces it with the default value.'),
              TopicContent.code(CodeBlock(
                filename: 'problem.js',
                code: '''const userScore = 0; // 0 is a valid score!

// Problem: 0 is "falsy", so it falls back to 10.
const finalScore = userScore || 10; 

console.log(finalScore); // 10''',
              )),
            ],
          ),
          TopicSection(
            title: '2. The fix - ??',
            contents: [
              TopicContent.paragraph('It checks if a value is Nullish (null or undefined). It does not care about 0 or "".'),
              TopicContent.paragraph('Rule: If the left side is null or undefined, use the right side. Otherwise, keep the left side.'),
              TopicContent.code(CodeBlock(
                filename: 'fix.js',
                code: '''const userScore1 = 0;

// Solution: 0 is NOT null/undefined, so it keeps 0.
const finalScore1 = userScore1 ?? 10;

console.log(finalScore1); // 0''',
              )),
            ],
          ),
          TopicSection(
            title: '3. Comparison table',
            contents: [
              TopicContent.paragraph('null ?? "Default" → "Default"'),
              TopicContent.paragraph('undefined ?? "Default" → "Default"'),
              TopicContent.paragraph('0 ?? "Default" → 0 (Valid)'),
              TopicContent.paragraph('"" ?? "Default" → "" (Valid)'),
              TopicContent.paragraph('false ?? "Default" → false (Valid)'),
            ],
          ),
        ],
      ),
    ],
  );
}

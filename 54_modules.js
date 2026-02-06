// ES6 Modules (Import / Export / Default)

// As your projects get bigger, writing all your code in one massive `script.js` file becomes a nightmare.
// Modules allow you to split your code into separate files (e.g., `user.js`, `api.js`, `utils.js`) and share data between them.
// This is the standard for all modern development (React, Vue, Node.js).



// 1. Named Exports - Use this when you want to export multiple things from a file (like a toolbox of utility functions).

// File: mathUtils.js
// You must use the keyword 'export'
export const pi = 3.14;

export function add(a, b) {
  return a + b;
}

// File: main.js (Importing)
// To import named exports, you MUST use curly braces { }. The names must match exactly.

import { pi, add } from './mathUtils.js';

console.log(add(10, 5)); // 15
console.log(pi);         // 3.14



// 2. Default Exports

// Use this when a file has one main purpose (e.g., a single Class or a main Component).
// A file can have only one default export.

// File: User.js
export default class User {
  constructor(name) {
    this.name = name;
  }
}

// File: main.js (Importing)
// To import a default export, you do NOT use curly braces. You can also name it whatever you want.

// No braces! Name it whatever (e.g., MyUser)
import MyUser from './User.js'; 

const u = new MyUser("Sampath");



// 3. Renaming & Importing All

// Sometimes names clash, or you just want everything.
// Renaming (as):

import { add as sum } from './mathUtils.js';
sum(1, 2);

// Import Everything (*):
// This bundles everything into one object.

import * as MathTools from './mathUtils.js';

console.log(MathTools.pi);
console.log(MathTools.add(2, 2));



// 4. The HTML Setup

// Browsers don't support modules by default.
// You must tell the HTML file that you are using them by adding type="module".

<script type="module" src="main.js"></script>
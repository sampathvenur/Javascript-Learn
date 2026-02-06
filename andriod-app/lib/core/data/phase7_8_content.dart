import '../models/topic_model.dart';

/// Phase 7: Async JS (6 Topics)
class Phase7Content {
  static Phase get phase => const Phase(
    number: 7,
    id: '7-async-js',
    title: 'Async JS',
    description: 'Asynchronous JavaScript, Promises, and async/await.',
    topicCount: 6,
    topics: [
      // Topic 1: Sync vs Async
      Topic(
        id: 'sync-vs-async',
        title: 'Sync vs Async',
        phaseNumber: 7,
        phaseId: '7-async-js',
        description: 'Synchronous and Asynchronous code.',
        sections: [
          TopicSection(
            title: 'Sync and Async',
            contents: [
              TopicContent.paragraph('This shows how javascript talks with the outside world (servers, databases, apis)'),
              TopicContent.paragraph('Javascript is synchronous and single threaded BY DEFAULT'),
              TopicContent.bulletList([
                'synchronous - execute code line-by-line, in order.',
                'single threaded - it can only do one thing at a time.',
              ]),
            ],
          ),
          TopicSection(
            title: 'Synchronous',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'sync.js',
                code: '''console.log("1. Start");

for(let i = 0; i < 1000000000; i++) {}

console.log("2. End");      // this prints after some delay - Js has to finish the loop before executing this line''',
              )),
            ],
          ),
          TopicSection(
            title: 'Asynchronous',
            contents: [
              TopicContent.paragraph('Async code allows Javascript to initiate a task, hand it off to the browser to handle in the background, and immediately move on to the next line of code without waiting.'),
              TopicContent.paragraph('When the background task is finished, it notifies Javascript: "Hey, I\'m done!"'),
              TopicContent.code(CodeBlock(
                filename: 'async.js',
                code: '''console.log("1. I order Pizza");

// Async func
setTimeout(() => {
    console.log("2. Pizza is ready! (Server Callback)");
}, 3000);   // 3 seconds delay

console.log("3. I call my friend");''',
              )),
            ],
          ),
        ],
      ),

      // Topic 2: Callbacks
      Topic(
        id: 'callbacks',
        title: 'Callbacks',
        phaseNumber: 7,
        phaseId: '7-async-js',
        description: 'Functions passed as arguments.',
        sections: [
          TopicSection(
            title: 'Callback',
            contents: [
              TopicContent.paragraph('It is a function that you pass into another function as an argument, to be executed later.'),
              TopicContent.code(CodeBlock(
                filename: 'callback.js',
                code: '''function downloadPhoto(url, callback) {
    console.log(\`Downloading from \${url}\`);

    // Fake download taking 2 seconds
    setTimeout(() => {
        console.log("Download complete!");
        callback();
    }, 2000);
}

downloadPhoto('google.com/cat.jpg', function() {
    console.log("Now I can edit the photo");
});''',
              )),
            ],
          ),
          TopicSection(
            title: '1. The problem : sequence',
            contents: [
              TopicContent.paragraph('Real apps rarely have just one step. Usually, you need to:'),
              TopicContent.bulletList([
                '1. Login user.',
                '2. Then fetch user ID.',
                '3. Then fetch user photos.',
                '4. Then fetch comments on the photo.',
              ]),
              TopicContent.paragraph('Since step 2 depends on step 1, you have to nest the functions inside each other.'),
            ],
          ),
          TopicSection(
            title: 'Callback Hell',
            contents: [
              TopicContent.paragraph('When you nest callbacks inside callbacks inside callbacks, you code starts to look like a sideway pyramid.'),
              TopicContent.paragraph('This is known as Callback Hell.'),
              TopicContent.code(CodeBlock(
                filename: 'callback-hell.js',
                code: '''loginUser('sam', (user) => {
    getUserData(user, (data) => {
        getArticles(data.id, (articles) => {
            getComments(articles[0], (comments) => {
                console.log(comments);
            });
        });
    });
});''',
              )),
              TopicContent.paragraph('This is unreadable, hard to debug and inversion of control (you are handing control of your program to the loginUser function).'),
              TopicContent.paragraph('To solve this Promises was invented.'),
            ],
          ),
        ],
      ),

      // Topic 3: Promises
      Topic(
        id: 'promises',
        title: 'Promises',
        phaseNumber: 7,
        phaseId: '7-async-js',
        description: 'then, catch, finally, chaining.',
        sections: [
          TopicSection(
            title: 'Promise',
            contents: [
              TopicContent.paragraph('It is an object that represents the eventual completion or failure of an asynchronous operation.'),
              TopicContent.paragraph('A promise can be in one of three states:'),
              TopicContent.bulletList([
                '1. Pending - the initial state, the operation is still in progress.',
                '2. Fulfilled - the operation completed successfully.',
                '3. Rejected - the operation failed.',
              ]),
            ],
          ),
          TopicSection(
            title: 'Syntax - creation',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'create-promise.js',
                code: '''const myPromise = new Promise((resolve, reject) => {
  const success = true;

  setTimeout(() => {
    if (success) {
      resolve("Operation Successful!"); // Yay!
    } else {
      reject("Operation Failed."); // Nay!
    }
  }, 2000);
});''',
              )),
            ],
          ),
          TopicSection(
            title: 'Syntax - consumption',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'consume-promise.js',
                code: '''console.log("1. Starting...");

myPromise
  .then((message) => {      // Runs if the promise is Resolved.
    console.log("2. Success:", message);
    // You can return a new value to the NEXT .then()
    return "Next Step Data"; 
  })
  .then((data) => {
    console.log("3. Chaining:", data);
  })
  .catch((error) => {         // Runs if the promise is Rejected.
    console.log("Error:", error);
  })
  .finally(() => {           // Runs regardless of success or failure.
    console.log("4. Cleanup: Loading spinner stopped.");
  });''',
              )),
            ],
          ),
          TopicSection(
            title: 'Fixing callback hell',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'promise-chain.js',
                code: '''// callback
login(function(user) {
  getUserData(user, function(data) {
    // ...
  });
});


// promise

login()
  .then(user => getUserData(user))
  .then(data => getArticles(data))
  .then(articles => console.log(articles))
  .catch(err => console.log("Something went wrong!"));''',
              )),
            ],
          ),
        ],
      ),

      // Topic 4: Async/Await
      Topic(
        id: 'async-await',
        title: 'Async/Await',
        phaseNumber: 7,
        phaseId: '7-async-js',
        description: 'Modern async syntax with try/catch.',
        sections: [
          TopicSection(
            title: 'Async/Await - introduced in ES2017',
            contents: [
              TopicContent.paragraph('It is the current industry standard for writing asynchronous code.'),
              TopicContent.paragraph('It is built on top of Promises but makes your code look and behave like standard synchronous code.'),
              TopicContent.paragraph('It stops the "chaining" madness (.then().then()) and lets you write logic line-by-line.'),
            ],
          ),
          TopicSection(
            title: '1. The async Keyword',
            contents: [
              TopicContent.paragraph('Placing async before a function declaration does two things:'),
              TopicContent.bulletList([
                '1. It allows you to use the await keyword inside.',
                '2. It automatically wraps the return value in a Promise.',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'async.js',
                code: '''// This function returns a Promise that resolves to "Hello"
async function greet() {
  return "Hello"; 
}

greet().then(console.log); // Output: Hello''',
              )),
            ],
          ),
          TopicSection(
            title: '2. The await Keyword',
            contents: [
              TopicContent.paragraph('It can only be used inside an async function.'),
              TopicContent.paragraph('When JavaScript sees await, it pauses the execution of that specific function until the Promise is resolved.'),
              TopicContent.bulletList([
                'If the Promise resolves, it returns the value.',
                'If the Promise rejects, it throws an error.',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'await.js',
                code: '''async function getUser() {
  // 1. Pause here until fetch is done
  let response = await fetch('https://api.github.com/users/sam'); 
  
  // 2. Pause here until JSON conversion is done
  let data = await response.json(); 

  // 3. Now we have the data!
  console.log(data);
}''',
              )),
            ],
          ),
          TopicSection(
            title: '3. Comparison (Promises vs Async/Await)',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'comparison.js',
                code: '''// The Old Way - Promises

fetch('url')
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(err => console.error(err));

// The New Way - Async/Await

const getData = async () => {
  const response = await fetch('url');
  const data = await response.json();
  console.log(data);
};

// Notice how there are no callbacks or nesting. It reads top-to-bottom.''',
              )),
            ],
          ),
          TopicSection(
            title: '4. Error Handling - try...catch',
            contents: [
              TopicContent.paragraph("Since await pauses execution, we can't use .catch() in the same way."),
              TopicContent.paragraph('Instead, we use the standard try...catch block, just like in regular synchronous code.'),
              TopicContent.code(CodeBlock(
                filename: 'try-catch.js',
                code: '''async function getData() {
  try {
    const response = await fetch('https://broken-url.com');
    const data = await response.json();
    console.log(data);
  } catch (error) {
    // If ANY line in the 'try' block fails, we jump here
    console.error("Something went wrong:", error.message);
  } finally {
    console.log("Cleanup complete.");
  }
}''',
              )),
            ],
          ),
        ],
      ),

      // Topic 5: Event Loop
      Topic(
        id: 'event-loop',
        title: 'Event Loop',
        phaseNumber: 7,
        phaseId: '7-async-js',
        description: 'Microtasks and Callback Queue.',
        sections: [
          TopicSection(
            title: 'The Event Loop - Microtasks & Callback Queue',
            contents: [
              TopicContent.paragraph("It explains why some code runs before others, even if it looks like it shouldn't."),
              TopicContent.paragraph("When asynchronous code finishes (like a timer or a fetch), it doesn't go straight back to the main code."),
              TopicContent.paragraph("It goes into a Queue. But there isn't just one queue; there are two."),
            ],
          ),
          TopicSection(
            title: '1. Callback Queue (Macrotasks)',
            contents: [
              TopicContent.bulletList([
                'Contains: setTimeout, setInterval, DOM Events (clicks).',
                'Priority: Low.',
              ]),
            ],
          ),
          TopicSection(
            title: '2. Microtask Queue (VIP)',
            contents: [
              TopicContent.bulletList([
                'Contains: Promises (.then, .catch, .finally), queueMicrotask.',
                'Priority: High.',
              ]),
            ],
          ),
          TopicSection(
            title: 'The Event Loop checks the queues in a specific order:',
            contents: [
              TopicContent.bulletList([
                '1. Run all Synchronous Code (Call Stack) until it is empty.',
                '2. Run ALL Microtasks until the Microtask Queue is completely empty.',
                '3. Run ONE Macrotask (Callback Queue).',
                '4. Repeat.',
              ]),
              TopicContent.paragraph('Promises (Microtasks) will always run before setTimeout (Macrotasks), even if the timer is set to 0 seconds.'),
            ],
          ),
          TopicSection(
            title: 'Example',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'event-loop.js',
                code: '''console.log("1. Script Start");

setTimeout(() => {
  console.log("2. setTimeout");
}, 0);

Promise.resolve().then(() => {
  console.log("3. Promise");
});

console.log("4. Script End");''',
              )),
            ],
          ),
          TopicSection(
            title: 'The Execution:',
            contents: [
              TopicContent.bulletList([
                '"1. Script Start" -> Sync code. Runs immediately.',
                'setTimeout -> Browser api sees 0ms. Puts callback in Macrotask Queue.',
                'Promise -> Resolves. Puts callback in Microtask Queue.',
                '"4. Script End" -> Sync code. Runs immediately.',
                'Stack is empty. Event Loop looks at Microtasks. Found one!',
                '"3. Promise" -> Runs.',
                'Microtasks empty. Event Loop looks at Macrotasks. Found one!',
                '"2. setTimeout" -> Runs.',
              ]),
              TopicContent.paragraph('Final Output: 1. Script Start -> 4. Script End -> 3. Promise -> 2. setTimeout'),
            ],
          ),
          TopicSection(
            title: 'Why does this matter?',
            contents: [
              TopicContent.paragraph('If you have a heavy loop inside a Microtask (e.g., a massive chain of Promises), the browser will never get to the Callback Queue.'),
              TopicContent.paragraph('This means clicks and UI updates (which are Macrotasks) will be blocked, and the page will freeze.'),
            ],
          ),
        ],
      ),

      // Topic 6: AJAX & Fetch
      Topic(
        id: 'ajax-fetch',
        title: 'AJAX & Fetch',
        phaseNumber: 7,
        phaseId: '7-async-js',
        description: 'GET and POST requests with Fetch API.',
        sections: [
          TopicSection(
            title: 'AJAX & The Fetch API',
            contents: [
              TopicContent.paragraph('In the old days, we used AJAX (Asynchronous JavaScript And XML) via XMLHttpRequest.'),
              TopicContent.paragraph('It was messy and complex. Today, we use the Fetch API.'),
              TopicContent.paragraph('It is built on Promises, cleaner, and much easier to use.'),
            ],
          ),
          TopicSection(
            title: 'GET Request',
            contents: [
              TopicContent.paragraph('By default fetch makes GET request.'),
              TopicContent.paragraph('When we fetch we get Response Object first (contains headers, status code etc.,)'),
              TopicContent.paragraph('We have to tell Javascript to extract the JSON body.'),
              TopicContent.code(CodeBlock(
                filename: 'get-request.js',
                code: '''async function getUser() {
    // Step 1: Wait for the Server to reply (Headers only)
    const response = await fetch('https://api.github.com/sam');

    // Step 2: Wait for the actual Data to download & parse
    const data = await response.json();

    console.log(data.name);
}


// Server sends: "{ "name": "Sam" }" (String)
// You need: { name: "Sam" } (JavaScript Object)
// The .json() method handles this conversion (Parsing) automatically.''',
              )),
            ],
          ),
          TopicSection(
            title: 'POST Request',
            contents: [
              TopicContent.paragraph('To send data we need to provide the second argument Options Object.'),
              TopicContent.bulletList([
                "1. Method: 'POST'",
                "2. Headers: Tell the server you are sending JSON ('Content-Type': 'application/json').",
                '3. Body: The actual data, converted to a String using JSON.stringify().',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'post-request.js',
                code: '''async function loginUser(username, password) {
  const options = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json' // Essential!
    },
    body: JSON.stringify({ 
      username: username, 
      password: password 
    })
  };

  const response = await fetch('https://api.myapp.com/login', options);
  const result = await response.json();
  console.log(result);
}''',
              )),
            ],
          ),
          TopicSection(
            title: 'Error Handling',
            contents: [
              TopicContent.paragraph('fetch() only rejects (throws an error) if the Network fails (e.g., no internet).'),
              TopicContent.paragraph('If the server returns a 404 (Not Found) or 500 (Server Error), fetch considers that a Success (because the server did reply).'),
              TopicContent.paragraph('You must manually check response.ok.'),
              TopicContent.code(CodeBlock(
                filename: 'error-handling.js',
                code: '''const response = await fetch('https://api.com/bad-url');

if (!response.ok) {
  // Handle 404 or 500 errors here
  throw new Error(\`HTTP Error! Status: \${response.status}\`);
}

const data = await response.json();''',
              )),
            ],
          ),
        ],
      ),
    ],
  );
}

/// Phase 8: Advanced (5 Topics)
class Phase8Content {
  static Phase get phase => const Phase(
    number: 8,
    id: '8-advanced',
    title: 'Advanced',
    description: 'Advanced JavaScript concepts and patterns.',
    topicCount: 5,
    topics: [
      // Topic 1: Modules
      Topic(
        id: 'modules',
        title: 'Modules',
        phaseNumber: 8,
        phaseId: '8-advanced',
        description: 'ES6 Import, Export, and Default.',
        sections: [
          TopicSection(
            title: 'ES6 Modules (Import / Export / Default)',
            contents: [
              TopicContent.paragraph("As your projects get bigger, writing all your code in one massive `script.js` file becomes a nightmare."),
              TopicContent.paragraph("Modules allow you to split your code into separate files (e.g., `user.js`, `api.js`, `utils.js`) and share data between them."),
              TopicContent.paragraph('This is the standard for all modern development (React, Vue, Node.js).'),
            ],
          ),
          TopicSection(
            title: '1. Named Exports',
            contents: [
              TopicContent.paragraph('Use this when you want to export multiple things from a file (like a toolbox of utility functions).'),
              TopicContent.code(CodeBlock(
                filename: 'mathUtils.js',
                code: '''// You must use the keyword 'export'
export const pi = 3.14;

export function add(a, b) {
  return a + b;
}''',
              )),
              TopicContent.code(CodeBlock(
                filename: 'main.js',
                code: '''// To import named exports, you MUST use curly braces { }. The names must match exactly.

import { pi, add } from './mathUtils.js';

console.log(add(10, 5)); // 15
console.log(pi);         // 3.14''',
              )),
            ],
          ),
          TopicSection(
            title: '2. Default Exports',
            contents: [
              TopicContent.paragraph('Use this when a file has one main purpose (e.g., a single Class or a main Component).'),
              TopicContent.paragraph('A file can have only one default export.'),
              TopicContent.code(CodeBlock(
                filename: 'User.js',
                code: '''export default class User {
  constructor(name) {
    this.name = name;
  }
}''',
              )),
              TopicContent.code(CodeBlock(
                filename: 'main.js',
                code: '''// To import a default export, you do NOT use curly braces. You can also name it whatever you want.

// No braces! Name it whatever (e.g., MyUser)
import MyUser from './User.js'; 

const u = new MyUser("Sampath");''',
              )),
            ],
          ),
          TopicSection(
            title: '3. Renaming & Importing All',
            contents: [
              TopicContent.paragraph('Sometimes names clash, or you just want everything.'),
              TopicContent.code(CodeBlock(
                filename: 'renaming.js',
                code: '''// Renaming (as):

import { add as sum } from './mathUtils.js';
sum(1, 2);

// Import Everything (*):
// This bundles everything into one object.

import * as MathTools from './mathUtils.js';

console.log(MathTools.pi);
console.log(MathTools.add(2, 2));''',
              )),
            ],
          ),
          TopicSection(
            title: '4. The HTML Setup',
            contents: [
              TopicContent.paragraph("Browsers don't support modules by default."),
              TopicContent.paragraph('You must tell the HTML file that you are using them by adding type="module".'),
              TopicContent.code(CodeBlock(
                filename: 'index.html',
                language: 'html',
                code: '<script type="module" src="main.js"></script>',
              )),
            ],
          ),
        ],
      ),

      // Topic 2: Storage
      Topic(
        id: 'storage',
        title: 'Storage',
        phaseNumber: 8,
        phaseId: '8-advanced',
        description: 'LocalStorage, SessionStorage, Cookies.',
        sections: [
          TopicSection(
            title: 'Browser Storage (LocalStorage, SessionStorage, Cookies)',
            contents: [
              TopicContent.paragraph("Sometimes you need to save data (like a username, a dark mode preference, or a shopping cart) so it doesn't disappear when the user refreshes the page."),
            ],
          ),
          TopicSection(
            title: '1. LocalStorage (The Permanent Box)',
            contents: [
              TopicContent.paragraph('This is the most common way to store data.'),
              TopicContent.bulletList([
                'Capacity : ~5MB (Huge for text).',
                'Lifespan : Forever (until you manually delete it or the user clears browser cache).',
                'Scope : Shared across all tabs/windows of the same website.',
              ]),
              TopicContent.paragraph('The catch: It can only store Strings. You cannot store Objects or Arrays directly.'),
              TopicContent.code(CodeBlock(
                filename: 'localStorage.js',
                code: '''// 1. Saving Data (setItem)
localStorage.setItem('username', 'Sampath');

// 2. Saving Complex Data (Use JSON.stringify!)
const settings = { theme: 'dark', notifications: true };
localStorage.setItem('userSettings', JSON.stringify(settings));

// 3. Reading Data (getItem)
const name = localStorage.getItem('username'); // "Sampath"

// 4. Reading Complex Data (Use JSON.parse!)
const storedSettings = localStorage.getItem('userSettings');
const parsedSettings = JSON.parse(storedSettings); 
console.log(parsedSettings.theme); // "dark"

// 5. Deleting
localStorage.removeItem('username'); // Delete one
localStorage.clear(); // Delete EVERYTHING''',
              )),
            ],
          ),
          TopicSection(
            title: '2. SessionStorage (The Temporary Box)',
            contents: [
              TopicContent.paragraph("It works exactly the same as LocalStorage (same code syntax: `setItem`, `getItem`)."),
              TopicContent.bulletList([
                'The Difference : It dies when you close the tab.',
                "Use Case : Sensitive data (like banking session details) or temporary form data you don't want persisting after the user leaves.",
              ]),
            ],
          ),
          TopicSection(
            title: '3. Cookies (The Carrier Pigeon)',
            contents: [
              TopicContent.paragraph('Cookies are the "Old School" method. They are very different from Storage.'),
              TopicContent.bulletList([
                'Capacity : Tiny (4KB).',
                'Lifespan : You set an expiration date.',
                'Crucial Feature : Cookies are automatically sent to the server with every single HTTP Request.',
              ]),
              TopicContent.paragraph('Use Case: Authentication Tokens. When you log in, the server gives you a cookie. Every time you click a link, your browser shows that cookie to the server to prove who you are.'),
            ],
          ),
          TopicSection(
            title: 'Summary Comparison',
            contents: [
              TopicContent.paragraph('Feature | LocalStorage | SessionStorage | Cookies'),
              TopicContent.paragraph('Lifespan | Forever | Until Tab Close | Manually set (Expiry)'),
              TopicContent.paragraph('Capacity | ~5MB | ~5MB | 4KB (Tiny)'),
              TopicContent.paragraph('Server Access | No (Client only) | No (Client only) | Yes (Sent on request)'),
              TopicContent.paragraph('Ease of Use | Easy | Easy | Hard (Messy syntax)'),
            ],
          ),
        ],
      ),

      // Topic 3: Error Handling
      Topic(
        id: 'error-handling',
        title: 'Error Handling',
        phaseNumber: 8,
        phaseId: '8-advanced',
        description: 'Try...Catch and Custom Errors.',
        sections: [
          TopicSection(
            title: 'Error Handling (Try...Catch & Custom Errors)',
            contents: [
              TopicContent.paragraph('In the real world, things break. APIs fail, users enter bad data, and networks drop.'),
              TopicContent.paragraph("If you don't handle errors, your entire Javascript application crashes (stops running)."),
              TopicContent.paragraph('Error handling is how you "catch" the crash and handle it gracefully.'),
            ],
          ),
          TopicSection(
            title: '1. The Safety Net (try...catch)',
            contents: [
              TopicContent.paragraph('Think of this as a safety net for "dangerous" code.'),
              TopicContent.bulletList([
                'try : Attempt to run this code.',
                'catch : If the try block fails (throws an error), jump here immediately. Do not crash.',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'try-catch.js',
                code: '''try {
  // Dangerous code (e.g., accessing a variable that doesn't exist)
  console.log(nonExistentVariable); 
  
  console.log("This line will NEVER run because the error happened above");

} catch (error) {
  // This runs ONLY if there was an error
  console.log("Something broke!");
  console.log("Error message:", error.message); 
}

console.log("The app is still alive and running...");''',
              )),
            ],
          ),
          TopicSection(
            title: '2. The finally Block (Cleanup)',
            contents: [
              TopicContent.paragraph('This block runs no matter what. Whether the code succeeded or failed, finally will execute.'),
              TopicContent.paragraph('It is perfect for cleanup tasks, like turning off a "Loading..." spinner.'),
              TopicContent.code(CodeBlock(
                filename: 'finally.js',
                code: '''try {
  showLoadingSpinner();
  await fetchData(); // Might fail
} catch (err) {
  showErrorMessage();
} finally {
  hideLoadingSpinner(); // Runs in BOTH cases
}''',
              )),
            ],
          ),
          TopicSection(
            title: '3. Throwing Errors (Manual Errors)',
            contents: [
              TopicContent.paragraph('Sometimes, the code technically works, but the logic is wrong (e.g., transferring more money than you have in your bank account).'),
              TopicContent.paragraph('You can manually throw an error to stop execution and jump to the catch block.'),
              TopicContent.code(CodeBlock(
                filename: 'throw.js',
                code: '''function withdrawMoney(amount, balance) {
  if (amount > balance) {
    // Stop everything! Throw an error manually.
    throw new Error("Insufficient Funds"); 
  }
  return balance - amount;
}

try {
  withdrawMoney(100, 50); // Throws error
} catch (err) {
  console.log(err.message); // "Insufficient Funds"
}''',
              )),
            ],
          ),
          TopicSection(
            title: '4. Custom Errors (Professional Level)',
            contents: [
              TopicContent.paragraph('The built-in Error class is generic. In complex apps, you want to distinguish between a "Network Error" (retry later) and a "Validation Error" (user typed wrong info).'),
              TopicContent.paragraph('You can create your own error types by extending the Error class.'),
              TopicContent.code(CodeBlock(
                filename: 'custom-error.js',
                code: '''// Create a specific error for Database issues

class DatabaseError extends Error {
  constructor(message) {
    super(message);
    this.name = "DatabaseError"; // Custom name
  }
}

try {
  // Simulate a database failure
  throw new DatabaseError("Connection lost");
} catch (err) {
  if (err.name === "DatabaseError") {
    console.log("Alert the DevOps team! The DB is down.");
  } else {
    console.log("Just a generic error.");
  }
}''',
              )),
            ],
          ),
        ],
      ),

      // Topic 4: Regex
      Topic(
        id: 'regex',
        title: 'Regex',
        phaseNumber: 8,
        phaseId: '8-advanced',
        description: 'Regular Expressions for pattern matching.',
        sections: [
          TopicSection(
            title: 'Regular Expressions (Regex)',
            contents: [
              TopicContent.paragraph('Regular Expressions (Regex) are a language within a language.'),
              TopicContent.paragraph('They are patterns used to match character combinations in strings.'),
              TopicContent.paragraph('Think of it as "Super Search." Instead of searching for the exact word "color", you can search for "color OR colour, at the start of a sentence, followed by a number."'),
            ],
          ),
          TopicSection(
            title: '1. Creating a Regex',
            contents: [
              TopicContent.paragraph('In JavaScript, a Regex is wrapped between two forward slashes /.../.'),
              TopicContent.code(CodeBlock(
                filename: 'create-regex.js',
                code: 'const pattern = /hello/;',
              )),
            ],
          ),
          TopicSection(
            title: '2. The Cheat Sheet (Basic Symbols)',
            contents: [
              TopicContent.paragraph('Regex uses special characters to define rules.'),
              TopicContent.paragraph('Symbol | Meaning | Example | Matches'),
              TopicContent.paragraph('. | Any character | /h.t/ | "hat", "hot", "hit"'),
              TopicContent.paragraph('\\d | Digit (0-9) | /\\d/ | "5", "9"'),
              TopicContent.paragraph('\\w | Word char (Letter, Number, _ ) | /\\w/ | "a", "Z", "5", "_"'),
              TopicContent.paragraph('\\s | Whitespace (Space, Tab) | /\\s/ | " "'),
              TopicContent.paragraph('^ | Start of string | /^Hi/ | "Hi there" (Not "Oh Hi")'),
              TopicContent.paragraph('\$ | End of string | /Bye\$/ | "Good Bye" (Not "Bye Now")'),
            ],
          ),
          TopicSection(
            title: '3. Quantifiers (How Many?)',
            contents: [
              TopicContent.paragraph('These symbols tell the engine "how many times" the previous character should appear.'),
              TopicContent.bulletList([
                '+ : One or more (e.g., /Go+d/ matches "God", "Good", "Gooooood").',
                "* : Zero or more (It might not be there at all).",
                '? : Optional (Zero or one). Use this for "color" vs "colour". let regex = /colou?r/; matches both "color" and "colour".',
              ]),
            ],
          ),
          TopicSection(
            title: '4. Character Classes [...]',
            contents: [
              TopicContent.paragraph('If you want to match specific characters, put them in brackets.'),
              TopicContent.bulletList([
                '/[aeiou]/ -> Matches any vowel.',
                '/[a-z]/ -> Matches any lowercase letter.',
                '/[0-9]/ -> Same as \\d.',
              ]),
            ],
          ),
          TopicSection(
            title: '5. Using Regex in JavaScript',
            contents: [
              TopicContent.paragraph('There are two main methods you will use 99% of the time.'),
              TopicContent.paragraph('A. test() (Validation)'),
              TopicContent.paragraph('Returns true or false. Perfect for checking if an input is valid.'),
              TopicContent.code(CodeBlock(
                filename: 'test.js',
                code: '''const emailPattern = /@/; // Very simple check
const input = "sam@gmail.com";

console.log(emailPattern.test(input)); // true''',
              )),
              TopicContent.paragraph('B. replace() (Modification)'),
              TopicContent.paragraph('Finds the pattern and replaces it.'),
              TopicContent.code(CodeBlock(
                filename: 'replace.js',
                code: '''const text = "I hate bugs. Bugs are bad.";
// The 'g' flag means "Global" (Replace ALL, not just the first one)
// The 'i' flag means "Case Insensitive" (matches "bugs" and "Bugs")
const newText = text.replace(/bugs/gi, "features");

console.log(newText); // "I hate features. features are bad."''',
              )),
            ],
          ),
          TopicSection(
            title: '6. Summary Example: Phone Number Validation',
            contents: [
              TopicContent.paragraph("Let's validate a simple 10-digit number."),
              TopicContent.bulletList([
                '^: Start of line.',
                '\\d: Digit.',
                '{10}: Exactly 10 times.',
                '\$: End of line.',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'phone-validation.js',
                code: '''const phoneRegex = /^\\d{10}\$/;
console.log(phoneRegex.test("1234567890")); // true
console.log(phoneRegex.test("123-456-7890")); // false (contains hyphens)''',
              )),
            ],
          ),
        ],
      ),

      // Topic 5: Memory Management
      Topic(
        id: 'memory-management',
        title: 'Memory Management',
        phaseNumber: 8,
        phaseId: '8-advanced',
        description: 'Garbage Collection and Memory Leaks.',
        sections: [
          TopicSection(
            title: 'Memory Management & Garbage Collection',
            contents: [
              TopicContent.paragraph('In languages like C or C++, you have to manually ask the computer for memory and manually give it back. If you forget, your app crashes.'),
              TopicContent.paragraph('In JavaScript, this happens automatically. This process is called Garbage Collection (GC).'),
            ],
          ),
          TopicSection(
            title: '1. The Concept: Reachability',
            contents: [
              TopicContent.paragraph('JavaScript manages memory based on a simple concept: Reachability.'),
              TopicContent.bulletList([
                'Reachable values are those that are accessible or usable somehow. They are guaranteed to be stored in memory.',
                "Unreachable values are \"Garbage.\" The engine assumes you don't need them anymore and deletes them to free up space.",
              ]),
              TopicContent.paragraph('The "Roots": There is a base set of inherently reachable values called Roots:'),
              TopicContent.bulletList([
                'Global variables (e.g., window).',
                'Currently executing functions and their local variables.',
              ]),
            ],
          ),
          TopicSection(
            title: '2. The Algorithm: Mark-and-Sweep',
            contents: [
              TopicContent.paragraph('Most modern JavaScript engines (like V8 in Chrome) use an algorithm called Mark-and-Sweep. It runs periodically in the background.'),
              TopicContent.paragraph('How it works:'),
              TopicContent.bulletList([
                '1. Mark : The Garbage Collector starts at the "Roots" and traverses down. It "marks" every object it can find (reference) as "Alive."',
                '2. Sweep : Once it stops finding new objects, it looks at the memory. Anything that was NOT marked is considered "Unreachable" (disconnected) and is deleted.',
              ]),
            ],
          ),
          TopicSection(
            title: '3. Example in Code',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'gc-example.js',
                code: '''// 1. We create an object. 'user' references it.
let user = { name: "Sam" }; 

// The object {name: "Sam"} is REACHABLE because 'user' points to it.

// 2. We overwrite 'user' with null.
user = null;

// Now, the object {name: "Sam"} has ZERO references pointing to it.
// It is UNREACHABLE.
// The Garbage Collector will sweep it away and free the memory.''',
              )),
            ],
          ),
          TopicSection(
            title: '4. Interlinked Objects (The Family)',
            contents: [
              TopicContent.paragraph("Even if objects reference each other, they can still be garbage collected if the root can't reach them."),
              TopicContent.code(CodeBlock(
                filename: 'interlinked.js',
                code: '''function marry(man, woman) {
  man.wife = woman;
  woman.husband = man;
  return {
    father: man,
    mother: woman
  }
}

let family = marry({name: "John"}, {name: "Alice"});
// Both John and Alice are reachable via 'family'.

// If we delete the root reference:
family = null; 

// Even though John and Alice reference EACH OTHER, 
// no one from the outside (Root) can reach them. 
// They are BOTH deleted.''',
              )),
            ],
          ),
          TopicSection(
            title: '5. Memory Leaks (When GC Fails)',
            contents: [
              TopicContent.paragraph('A memory leak happens when you accidentally keep a reference to an object you thought you deleted, preventing the Garbage Collector from cleaning it up.'),
              TopicContent.paragraph('Common Causes:'),
              TopicContent.bulletList([
                '1. Unwanted Global Variables : Accidental globals (variables without let/const) stay alive as long as the window is open.',
                '2. Forgotten Timers : A setInterval that runs forever will keep all variables inside it alive forever.',
                "3. Detached DOM Elements : If you store a DOM element in a JS variable but remove it from the HTML, it still exists in memory because your JS variable is holding onto it.",
              ]),
            ],
          ),
        ],
      ),
    ],
  );
}

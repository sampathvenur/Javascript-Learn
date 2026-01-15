// manipulating-content - to change the content of an html element after selecting it.

// 1. .textContent

// This is the most common way to read or change text.
// It accesses all text contained in the element and its children, including hidden text.

const title = document.querySelector('h1');

console.log(title.textContent); // Read

title.textContent = "Welcome, Sam!"; // Write
// The browser immediately updates the text on the screen.


// 2. .innerText

// Very similar to textContent, but it respects CSS styles.
// If an element is hidden (display: none), .innerText will not return it, while .textContent will.

// note: Stick to .textContent unless you specifically need only the visible text.


// 3. .innerHTML - (The Powerful & Dangerous)

// This allows you to get or set the HTML markup inside an element.
// This means you can add <strong> tags, links, or entirely new structures.

const box = document.querySelector('.box');

box.innerHTML = "<strong>This is bold text</strong>";       // This renders as BOLD text



// Security Warning (XSS Attack): 
 
// Never use .innerHTML with data that comes from a user (like a comment or username).
// A hacker can insert a <script> tag inside their comment, and your website will run their malicious code.

// Safe: element.textContent = userComment; (Treats tags as plain text)
// Unsafe: element.innerHTML = userComment; (Runs tags as code)
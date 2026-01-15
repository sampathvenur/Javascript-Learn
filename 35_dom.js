// What is the DOM?

// The DOM (Document Object Model) is the bridge between your JavaScript code and the HTML on the screen.
// Without the DOM, JavaScript is just a language calculating numbers in the background. With the DOM, JavaScript becomes the puppeteer of the webpage.


// 1. The concept

// When a browser (like Chrome) loads a webpage, it takes your HTML code and builds a Tree Structure in memory.

// Every HTML tag (<div>, <h1>, <p>) becomes a JavaScript Object (a "Node").

// Because they are objects, we can change them using JavaScript.


// 2. The structure (The family tree)

// The DOM is organized like a family tree.

// * Root: The document object (the starting point).
// * Parents & Children: <body> is the parent of <h1>. <h1> is the child of <body>.
// * Siblings: Two <li> tags side-by-side are siblings.


// 3. The document object

// This is your entry point. If you type document in your browser console, you will see the entire HTML code of the page.

// * document.title -> Gives you the title of the tab.
// * document.URL -> Gives you the current website address.
// * document.body -> Gives you the entire body content.


// 4. what can we do with it?

// Using the DOM API, JavaScript can:

// * Change Content: Update text inside a paragraph.
// * Change Style: Turn a button red.
// * Add/Remove Elements: Create a new list item or delete an image.
// * React to Events: Run code when a user clicks or types.
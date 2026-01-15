// manipulating styles

// 1. The direct way (.style)

// You can access CSS properties directly on the element.

// note: CSS properties with hyphens (like background-color) must be converted to camelCase in JavaScript.
// * background-color -> backgroundColor
// * font-size -> fontSize

const box = document.querySelector('.box');

box.style.backgroundColor = 'red';      // Change background to red

box.style.width = '100px';              // Change width (MUST be a string with units)
// box.style.width = 100; // Won't work!

// The Downside: This adds inline styles directly to the HTML tag (<div style="color: red">).
// It overrides everything else and makes your HTML messy.



// 2. The professional way (classList)

// Instead of writing CSS inside JS, you should define a class in your CSS file (e.g., .hidden or .active) and then simply add or remove that class using JavaScript.

// This keeps your styling in CSS and your logic in JS.

// The Toolkit:

// * classList.add('className'): Adds a class.
// * classList.remove('className'): Removes a class.
// * classList.toggle('className'): Adds it if missing, removes it if present (like a light switch).

/* In your CSS file */
// .dark-mode {
//   background-color: black;
//   color: white;
// }


/* In your JS file */
const body = document.querySelector('body');

// Activate dark mode
body.classList.add('dark-mode');

// Toggle it on/off (Great for buttons!)
body.classList.toggle('dark-mode');


// * Use .style for dynamic values (e.g., a progress bar width changing in real-time).
// * Use .classList for state changes (e.g., active, disabled, hidden, dark-mode).
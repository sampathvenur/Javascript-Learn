// 3 methods to link js
// 1. Internal - within the html file
// 2. External - in a separate file
// 3. Inline - within the html file 

// Inline
// <button onclick="alert('Hello')">Click me</button>

// Internal
// <script>
//     console.log('Hello');
// </script>

// External
// <script src="script.js"></script>

// if it is written inside head tag then browser reads html file from top to bottom
// so it will start downloading and executing the js code, before displaying any html ui

// therefore we use defer attribute, which downloads the js code parallely as the html is parsed
// and then execute the js only after full html is parsed
// <head>
//     <script src="script.js" defer></script>
// </head>

// we can also write the external js link after the body tag ends



// Defer vs Async (Important)
// When you put scripts in the <head>, you should use one of these to prevent blocking the HTML.

// async:

// Downloads during HTML parsing.

// Pauses HTML parsing immediately to execute as soon as it's downloaded.

// Use case: Analytics scripts (independent scripts that don't care about the DOM or order).

// defer:

// Downloads during HTML parsing.

// Waits until the HTML is fully parsed to execute.

// Respects order (script A runs before script B).

// Use case: Everything else. This is your default.
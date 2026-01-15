// selecting elements - before changing anything on the website, you have to tell the javascript which element to change. (selecting it)

// 1. querySelector() - It allows you to select elements using CSS syntax (just like you do in your .css file).

// * Select by Tag: document.querySelector('h1') (Selects the first <h1>)
// * Select by Class: document.querySelector('.btn') (Selects the first element with class "btn")
// * Select by ID: document.querySelector('#header') (Selects the element with ID "header")

// note: It only returns the FIRST match it finds.

const myButton = document.querySelector('.submit-btn');
console.log(myButton); // Prints the HTML element to the console


// 2. querySelectorAll() - It returns all elements that match.

// It returns a NodeList (which looks and acts like an Array).

// You can loop over it using forEach.

const allParagraphs = document.querySelectorAll('p');

allParagraphs.forEach(para => {
    console.log(para); // Prints every paragraph one by one
});


// 3. getElementById() - It is slightly faster than querySelector but only works for IDs.

const title = document.getElementById('main-title');
// Note: You do NOT use the hash '#' here, just the name.


// Use querySelector for almost everything (it's cleaner).
// Use getElementById if you need extreme performance (rarely needed).
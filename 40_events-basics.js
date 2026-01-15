// Event basics

// Events are things that happen in the browser—a click, a keypress, a scroll, or a form submission.

// 1. addEventListener - This is how you tell an element to wait for an event.

// element.addEventListener(eventType, function)

const btn = document.querySelector('button');

btn.addEventListener('click', function() {
  console.log('Button was clicked!');
});

// it is better than onClick since onClick can only have one function, this can have multiple.



// 2. mouse event

// *click: left click
// *dblclick: double click
// *mouseenter/mouseleave: when the mouse hovers over or leaves an element

const box = document.querySelector('.box');

box.addEventListener('mouseenter', ()=> {
  box.style.backgroundColor = 'red';
});



// 3. keyboard event

// *keydown: fires the moment you press a key
// *keyup: fires when you release the key

// To know which key was actually pressed the event function automatically receives an event object (named e or event) which contains all the details.

document.addEventListener('keydown', function(e) {
  console.log(e.key);

  if (e.key === 'Escape') {
    closeModal(); // close a popup window
  }
});



// 4. removing listeners - when you have to stop listening

// note: the function must be named function not anonymous.

function sayHello() {
  console.log("Hello");
}

// Add
btn.addEventListener('click', sayHello);

// Remove
btn.removeEventListener('click', sayHello);
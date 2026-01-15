// DOM Transversing

// to select an element and access it's neighbour, parent or child

// 1. Going down (children) - to access the elements inside the one you selected.

// *.children: returns a list (html collection) of all direct childrens.
// *.firstElementChild: the first child.
// *.lastElementChild: the last child.

const list = document.querySelector('ul');
// make the last child blue
list.firstElementChild.style.color = 'blue';



// 2. Going up (parents) - to find the container of the element you selected.

// *.parentElement: the direct parent one level up.
// *.closest('selector'): looks at the element itself and then travels up until it finds the first parent that matches the selector.

const btn = document.querySelector('.delete-btn');

// "find the closest row (tr) above this button and remove it"
// useful for "delete" buttons in lists/tables
btn.closest('tr').remove();



// 3. Going sideways (siblings) - to find elements of the same level (brothers/sisters)

// *.nextElementSibling: the element immediately after.
// *.previousElementSibling: the element immediately before.

const currentStep = document.querySelector('.active');

// highlight the next step in the process
currentStep.nextElementSibling.style.opacity = "1";
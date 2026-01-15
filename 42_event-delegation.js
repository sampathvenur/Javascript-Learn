// Event delegation

// This is a design pattern used by senior developers.
// It solves two major problems: Memory Usage and Dynamic Elements.

// Instead of attaching an event listener to every single button (which takes up memory), you attach ONE listener to their common parent.
// You let the events "bubble up" to the parent, and the parent handles them.

// 1. Memory Usage

// Imagine you have a list with 1,000 items.

const items = document.querySelectorAll('li');
// You are creating 1,000 separate functions in memory!
items.forEach(item => {
  item.addEventListener('click', deleteItem);
});


// fix - You attach one listener to the <ul> (the parent container).

const list = document.querySelector('ul');

list.addEventListener('click', function(e) {
  // e.target tells us EXACTLY what was clicked (the child)
  
  // Check if the clicked element is an LI (or inside one)
  if (e.target.tagName === 'LI') {
    console.log("Item clicked:", e.target.textContent);
    // e.target.remove(); // e.g., Delete it
  }
});



// 2. Dynamic Elements

// If you add a new item to the list after the page loads using JavaScript:

// Standard Listeners: Won't work. The new item didn't exist when you ran querySelectorAll.
// Delegation: Works perfectly. The parent is already listening, and the new child's clicks will bubble up just like the old ones.



// closest()

// Sometimes e.target is too specific. If you click an icon inside a button, e.target will be the <i> icon, not the <button>.
// Use .closest() to ensure you catch the right element.

list.addEventListener('click', function(e) {
  // Look for the closest 'li' up the tree from where I clicked
  const item = e.target.closest('li');

  // If found, and it is inside our list
  if (item && list.contains(item)) {
    console.log("Found it!");
  }
});
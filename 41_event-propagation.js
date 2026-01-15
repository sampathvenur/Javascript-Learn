// Event Propagation - explains the order in which the clicks are handled by the browser.

// 3 phases - event travels through DOM in a round trip.
// capturing phase - the event travels down, from document root to target.
// target phase - the event hits the actual element you clicked.
// bubbling phase - the event travels up, from target to document root.

// 1. event bubbling - events trigger on the deepest element first, then bubble up, like air bubbles in water.

// imagine you have Grandparent > Parent > child (all have click listeners).

// if you click the Child:
// 1. Child runs first
// 2. Parent runs second
// 3. Grandparent runs last



// 2. stopping the bubble

// imagine you have a clickable card component that opens a popup.
// inside that card is a delete button.
// clicking delete deletes the item, but the click bubbles up to the card and opens the popup too.

// fix
deleteBtn.addEventListener('click', function(e) {
    // runs delete logic...
    console.log("Deleted");

    // stop the event from going to parents
    e.stopPropagation();
});



// 3. event capturing

// we can force the event to fire downwards (before it reaches the target).
// This is done by passing a third argument true (or {capture: true}).

grandparent.addEventListener('click', func, true);      // runs first
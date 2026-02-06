// Memory Management & Garbage Collection

// In languages like C or C++, you have to manually ask the computer for memory and manually give it back. If you forget, your app crashes.
// In JavaScript, this happens automatically. This process is called Garbage Collection (GC).



// 1. The Concept: Reachability

// JavaScript manages memory based on a simple concept: Reachability.

// Reachable values are those that are accessible or usable somehow. They are guaranteed to be stored in memory.
// Unreachable values are "Garbage." The engine assumes you don't need them anymore and deletes them to free up space.

// The "Roots":
// There is a base set of inherently reachable values called Roots:

// Global variables (e.g., window).
// Currently executing functions and their local variables.



// 2. The Algorithm: Mark-and-Sweep

// Most modern JavaScript engines (like V8 in Chrome) use an algorithm called Mark-and-Sweep. It runs periodically in the background.

// How it works:

// 1. Mark: The Garbage Collector starts at the "Roots" and traverses down. It "marks" every object it can find (reference) as "Alive."
// 2. Sweep: Once it stops finding new objects, it looks at the memory. Anything that was NOT marked is considered "Unreachable" (disconnected) and is deleted.



// 3. Example in Code

// 1. We create an object. 'user' references it.
let user = { name: "Sam" }; 

// The object {name: "Sam"} is REACHABLE because 'user' points to it.

// 2. We overwrite 'user' with null.
user = null;

// Now, the object {name: "Sam"} has ZERO references pointing to it.
// It is UNREACHABLE.
// The Garbage Collector will sweep it away and free the memory.



// 4. Interlinked Objects (The Family)

// Even if objects reference each other, they can still be garbage collected if the root can't reach them.

function marry(man, woman) {
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
// They are BOTH deleted.



// 5. Memory Leaks (When GC Fails)

// A memory leak happens when you accidentally keep a reference to an object you thought you deleted, preventing the Garbage Collector from cleaning it up.

// Common Causes:

// 1. Unwanted Global Variables: Accidental globals (variables without let/const) stay alive as long as the window is open.
// 2. Forgotten Timers: A setInterval that runs forever will keep all variables inside it alive forever.
// 3. Detached DOM Elements: If you store a DOM element in a JS variable but remove it from the HTML, it still exists in memory because your JS variable is holding onto it.
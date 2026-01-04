// Recursion
// Recursion is when a function calls itself.
// It sounds like a recipe for an infinite loop (and a browser crash),
// but if done correctly, it is a powerful way to solve problems that can be broken down into smaller, identical problems.



// 1. The Two Rules

// 1. The Base Case (The Exit): A condition that stops the recursion. Without this, the function runs forever until the stack overflows.
// 2. The Recursive Step: The part where the function calls itself with a smaller piece of the problem.



// 2. Example: Factorial
// Calculate 5! (5 * 4 * 3 * 2 * 1).

function factorial(n) {
  // 1. Base Case: If n gets down to 1, stop and return 1.
  if (n === 1) {
    return 1;
  }

  // 2. Recursive Step: n * factorial of (n-1)
  return n * factorial(n - 1);
}

console.log(factorial(5)); // Output: 120



// How it executes:

// factorial(5) calls factorial(4)
// factorial(4) calls factorial(3)
// factorial(3) calls factorial(2)
// factorial(2) calls factorial(1)
// factorial(1) hits the Base Case! Returns 1.
// Now the chain resolves backwards: 2*1 -> 3*2 -> 4*6 -> 5*24 -> 120.
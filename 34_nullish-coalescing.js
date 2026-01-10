// nullish-coalescing (??) - introduced in ES2020 - to solve a specific problem with setting Default Values.

// 1. The problem with OR (||)

// For years, developers used || to set defaults. const val = input || "default";

// The Flaw: The || operator treats 0 and "" (empty string) as False.
// If a user enters 0 (e.g., score: 0), the || operator thinks it's "bad" input and replaces it with the default value.

const userScore = 0; // 0 is a valid score!

// Problem: 0 is "falsy", so it falls back to 10.
const finalScore = userScore || 10; 

console.log(finalScore); // 10


// 2. The fix - ?? - it checks if a value is Nullish (null or undefined). It does not care about 0 or "".

// Rule: If the left side is null or undefined, use the right side. Otherwise, keep the left side.

const userScore1 = 0;

// Solution: 0 is NOT null/undefined, so it keeps 0.
const finalScore1 = userScore1 ?? 10;

console.log(finalScore1); // 0


// 3. comparison table

// input value      | operator      | result

// null             | ?? "Default"  | "Default"
// undefined        | ?? "Default"  | "Default"
// 0                | ?? "Default"  | 0 (Valid)
// ""               | ?? "Default"  | "" (Valid)
// false            | ?? "Default"  | false (Valid)
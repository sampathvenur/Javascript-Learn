// Regular Expressions (Regex)

// Regular Expressions (Regex) are a language within a language.
// They are patterns used to match character combinations in strings.

// Think of it as "Super Search."
// Instead of searching for the exact word "color", you can search for "color OR colour, at the start of a sentence, followed by a number."



// 1. Creating a Regex

// In JavaScript, a Regex is wrapped between two forward slashes /.../.

const pattern = /hello/;



// 2. The Cheat Sheet (Basic Symbols) - Regex uses special characters to define rules.

// | Symbol    | Meaning                         | Example | Matches                   |
// | --------- | ------------------------------- | ------- | ------------------------- |
// |   .       | Any character                   |  /h.t/  | "hat", "hot", "hit"       |
// |   \d      | Digit (0-9)                     |  /\d/   | "5", "9"                  |
// |   \w      | Word char (Letter, Number, _ )  |  /\w/   | "a", "Z", "5", "_"        |
// |   \s      | Whitespace (Space, Tab)         |  /\s/   | " "                       |
// |   ^       | Start of string                 |  /^Hi/  | "Hi there" (Not "Oh Hi")  |
// |   $       | End of string                   |  /Bye$/ | "Good Bye" (Not "Bye Now")|



// 3. Quantifiers (How Many?) - These symbols tell the engine "how many times" the previous character should appear.

// + : One or more (e.g., /Go+d/ matches "God", "Good", "Gooooood").
// * : Zero or more (It might not be there at all).
// ? : Optional (Zero or one). Use this for "color" vs "colour".
// let regex = /colou?r/; matches both "color" and "colour".



// 4. Character Classes [...] - If you want to match specific characters, put them in brackets.

// /[aeiou]/ -> Matches any vowel.
// /[a-z]/ -> Matches any lowercase letter.
// /[0-9]/ -> Same as \d.



// 5. Using Regex in JavaScript - There are two main methods you will use 99% of the time.

// A. test() (Validation) - Returns true or false. Perfect for checking if an input is valid.

const emailPattern = /@/; // Very simple check
const input = "sam@gmail.com";

console.log(emailPattern.test(input)); // true

// B. replace() (Modification) - Finds the pattern and replaces it.

const text = "I hate bugs. Bugs are bad.";
// The 'g' flag means "Global" (Replace ALL, not just the first one)
// The 'i' flag means "Case Insensitive" (matches "bugs" and "Bugs")
const newText = text.replace(/bugs/gi, "features");

console.log(newText); // "I hate features. features are bad."



// 6. Summary Example: Phone Number Validation - Let's validate a simple 10-digit number.

// ^: Start of line.
// \d: Digit.
// {10}: Exactly 10 times.
// $: End of line.

const phoneRegex = /^\d{10}$/;
console.log(phoneRegex.test("1234567890")); // true
console.log(phoneRegex.test("123-456-7890")); // false (contains hyphens)   
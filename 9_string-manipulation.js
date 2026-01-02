// String Manipulation

// 1. Template Literals
// Instead of using single(') or double(") quotes, use Backticks(`)
// String interpolation : You can inject variables directly into ${...}
// Multi-line : You can press enter and string keeps going.

// The old way
const name = "Gemini";
console.log("Hello " + name + ", welcome back!");

// The new way
const name1 = "Gemini";
console.log(`Hello ${name1}, welcome back!`);


// 2. Important string methods

// length ( note : This is a property, no parenthesis ())
let text = "abcdef";
console.log(text.length);   // 6

// toUpperCase()/toLowerCase()
console.log("hello".toUpperCase());     // "HELLO"

// slice(start, end) : cuts a piece of the string
// start is inclusive, end is exclusive
let str = "Hello World";
console.log(str.slice(0, 5));     // "Hello"

// replace(search, replacement)
let str1 = "I Love Python";
console.log(str1.replace("Python", "JavaScript"));     // "I Love JavaScript"

// trim() : removes whitespace from both ends of a string (great for user input)
let email = "   user@gmail.com      ";
console.log(email.trim());  // "user@gmail.com"

// split(separator, limit) : Converts string into an array(splits it up)
let str2 = "apple,banana,cherry";
console.log(str2.split(","));  // ["apple", "banana", "cherry"]

// charAt(index) : Returns the character at the specified index
let str3 = "Hello";
console.log(str3.charAt(0));  // "H"

// charCodeAt(index) : Returns the Unicode of the character at the specified index
let str4 = "Hello";
console.log(str4.charCodeAt(0));  // 72

// concat(str1, str2, ...)
// Joins two or more strings
let str5 = "Hello";
console.log(str5.concat(" World"));  // "Hello World"

// indexOf(search, fromIndex)
// Returns the index of the first occurrence of a specified value in a string
let str6 = "Hello World";
console.log(str6.indexOf("World"));  // 6

// lastIndexOf(search, fromIndex)
// Returns the index of the last occurrence of a specified value in a string
let str7 = "Hello World";
console.log(str7.lastIndexOf("World"));  // 6

// startsWith(search, fromIndex)
let str8 = "Hello World";
console.log(str8.startsWith("Hello"));  // true

// endsWith(search, fromIndex)
let str9 = "Hello World";
console.log(str9.endsWith("World"));  // true

// includes(search, fromIndex)
let str10 = "Hello World";
console.log(str10.includes("World"));  // true

// repeat(count)
let str11 = "Hello";
console.log(str11.repeat(3));  // "HelloHelloHello"
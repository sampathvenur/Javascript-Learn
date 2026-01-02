// Switch Statements
// The switch statement is an alternative to writing many else if blocks.
// It is best used when you are checking one specific variable against many known values.

// 1. The Syntax
// case : The value you are checking for.
// break: Crucial. It tells JS to stop checking. If you forget this, JS will keep running the code in the next case too (this is called "fall-through").
// default: Runs if none of the cases match (like the final else).

const day = "Monday";

switch (day) {
  case "Monday": // Does day === "Monday"?
    console.log("Start of the work week.");
    break; // STOP here.
  case "Friday":
    console.log("Weekend is coming!");
    break;
  case "Saturday":
  case "Sunday": // You can stack cases
    console.log("Enjoy the weekend.");
    break;
  default:
    console.log("Just a regular day.");
}


// 2. When to use Switch vs If-Else?
// Use switch when you have a single variable (e.g., userRole) and you want to check it against specific values ('admin', 'editor', 'guest'). It looks cleaner.
// Use if / else when you have ranges (e.g., age < 18) or complex combinations (age > 18 && hasLicense). Switch cannot handle ranges easily.


// 3. Important Note
//Switch uses Strict Equality (===).
// If you switch on the string "5", case 5: (number) will not match.
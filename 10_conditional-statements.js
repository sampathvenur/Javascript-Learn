// Conditional Statements (if, else)
// This is how your code makes decisions. if this is true, do this. otherwise, do that

// 1. The basic structure
// if : The entry points. checks a condition
// else if : checks a new condition if the previous one was false. You can have many of these.
// else : The backup plan. Runs if all previous conditions were false.


// 2. The syntax
const hour = 14; // 2 PM

if (hour < 12) {
    console.log("Good Morning");
} else if (hour < 18) {
    console.log("Good Afternoon");
} else {
    console.log("Good Evening");
}
// Output: "Good Afternoon"


// 3. Nesting (Warning)
// You can put an if inside another if, but be careful. It makes code hard to read("Spaghetti code").

const isWeekend = true;
const time = 20;

if (isWeekend) {
    if (time > 18) {
         console.log("Party time!");
    }
}
// Better to use logical operators: if (isWeekend && time > 18) ...
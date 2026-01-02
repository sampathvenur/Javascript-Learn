// Ternary Operator
// Condition ? If true : If False

// with if-else
const age = 20;
let message;

if (age >= 18) {
    message = "Adult";
} else {
    message = "Minor";
}

// with ternary operator
const age1 = 20;
const message1 = age1 >= 18 ? "Adult" : "Minor";
// Is age >= 18? If yes, "Adult". If no, "Minor".


// Never nest the ternary operators, it becomes unreadable
const item = isRaining ? "Umbrella" : isSunny ? "Sunglasses" : "Nothing";
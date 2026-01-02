// Loops - loops allow you to run the same block of code multiple times.

// 1. for Loop
// Used when you know exactly how many times you want to repeat something.

// syntax : for(initialization; condition; increment)
// initialization: start the counter
// condition : keep running as long as this is true
// increment : update the counter after every run

for (let i = 0; i < 5; i++) {
    console.log(`Repetition number ${i}`);
}
// Output : 0, 1, 2, 3, 4


// 2. while Loop
// Used when you don't know how many times to repeat, but you know the condition to stop.

let i = 0;
while (i < 5) {
    console.log(i);
    i++;    // Don't forget this, or you get an INFINITE LOOP (crashes browser)
}


// 3. do...while Loop
// similar to while, but it guarantees the code runs at least once, even if the condition is false initially.

let j = 10;
do {
    console.log(j);     // Prints 10
    j++;
} while (j < 5);        // stops here because 10 is not < 5


// 4. controlling the loop (break vs continue)
// break : stops the loop completely and exits.
for (let i = 0; i < 10; i++) {
    if ( i === 5) break;    // stops the whole loop when i hits 5
    console.log(i);
}

// continue : skips the current turn and jumps to the next one.
for (let i = 0; i < 5; i++) {
    if ( i === 2) continue;    // Skips 2, but prints 0, 1, 3, 4
    console.log(i);
}
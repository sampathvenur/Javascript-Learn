import '../models/topic_model.dart';

/// Phase 2: Control Flow (4 Topics)
class Phase2Content {
  static Phase get phase => const Phase(
    number: 2,
    id: '2-control-flow',
    title: 'Control Flow',
    description: 'Conditional statements, loops, and program flow control.',
    topicCount: 4,
    topics: [
      // Topic 1: Conditional Statements
      Topic(
        id: 'conditional-statements',
        title: 'Conditional Statements',
        phaseNumber: 2,
        phaseId: '2-control-flow',
        description: 'if, else, and else if statements.',
        sections: [
          TopicSection(
            title: 'Conditional Statements (if, else)',
            contents: [
              TopicContent.paragraph('This is how your code makes decisions. if this is true, do this. otherwise, do that'),
            ],
          ),
          TopicSection(
            title: '1. The basic structure',
            contents: [
              TopicContent.bulletList([
                'if : The entry points. checks a condition',
                'else if : checks a new condition if the previous one was false. You can have many of these.',
                'else : The backup plan. Runs if all previous conditions were false.',
              ]),
            ],
          ),
          TopicSection(
            title: '2. The syntax',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'conditional.js',
                code: '''const hour = 14; // 2 PM

if (hour < 12) {
    console.log("Good Morning");
} else if (hour < 18) {
    console.log("Good Afternoon");
} else {
    console.log("Good Evening");
}
// Output: "Good Afternoon"''',
              )),
            ],
          ),
          TopicSection(
            title: '3. Nesting (Warning)',
            contents: [
              TopicContent.paragraph('You can put an if inside another if, but be careful. It makes code hard to read("Spaghetti code").'),
              TopicContent.code(CodeBlock(
                filename: 'nesting.js',
                code: '''const isWeekend = true;
const time = 20;

if (isWeekend) {
    if (time > 18) {
         console.log("Party time!");
    }
}
// Better to use logical operators: if (isWeekend && time > 18) ...''',
              )),
            ],
          ),
        ],
      ),

      // Topic 2: Switch Statements
      Topic(
        id: 'switch-statements',
        title: 'Switch Statements',
        phaseNumber: 2,
        phaseId: '2-control-flow',
        description: 'Syntax, break, and default cases.',
        sections: [
          TopicSection(
            title: 'Switch Statements',
            contents: [
              TopicContent.paragraph('The switch statement is an alternative to writing many else if blocks.'),
              TopicContent.paragraph('It is best used when you are checking one specific variable against many known values.'),
            ],
          ),
          TopicSection(
            title: '1. The Syntax',
            contents: [
              TopicContent.bulletList([
                'case : The value you are checking for.',
                'break : Crucial. It tells JS to stop checking. If you forget this, JS will keep running the code in the next case too (this is called "fall-through").',
                'default : Runs if none of the cases match (like the final else).',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'switch.js',
                code: '''const day = "Monday";

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
}''',
              )),
            ],
          ),
          TopicSection(
            title: '2. When to use Switch vs If-Else?',
            contents: [
              TopicContent.bulletList([
                'Use switch when you have a single variable (e.g., userRole) and you want to check it against specific values (\'admin\', \'editor\', \'guest\'). It looks cleaner.',
                'Use if / else when you have ranges (e.g., age < 18) or complex combinations (age > 18 && hasLicense). Switch cannot handle ranges easily.',
              ]),
            ],
          ),
          TopicSection(
            title: '3. Important Note',
            contents: [
              TopicContent.paragraph('Switch uses Strict Equality (===).'),
              TopicContent.paragraph('If you switch on the string "5", case 5: (number) will not match.'),
            ],
          ),
        ],
      ),

      // Topic 3: Ternary Operator
      Topic(
        id: 'ternary-operator',
        title: 'Ternary Operator',
        phaseNumber: 2,
        phaseId: '2-control-flow',
        description: 'Conditional one-liners with the ternary operator.',
        sections: [
          TopicSection(
            title: 'Ternary Operator',
            contents: [
              TopicContent.paragraph('Condition ? If true : If False'),
            ],
          ),
          TopicSection(
            title: 'With if-else',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'if-else.js',
                code: '''const age = 20;
let message;

if (age >= 18) {
    message = "Adult";
} else {
    message = "Minor";
}''',
              )),
            ],
          ),
          TopicSection(
            title: 'With ternary operator',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'ternary.js',
                code: '''const age1 = 20;
const message1 = age1 >= 18 ? "Adult" : "Minor";
// Is age >= 18? If yes, "Adult". If no, "Minor".''',
              )),
            ],
          ),
          TopicSection(
            title: 'Warning',
            contents: [
              TopicContent.paragraph('Never nest the ternary operators, it becomes unreadable'),
              TopicContent.code(CodeBlock(
                filename: 'nested-bad.js',
                code: 'const item = isRaining ? "Umbrella" : isSunny ? "Sunglasses" : "Nothing";',
              )),
            ],
          ),
        ],
      ),

      // Topic 4: Loops
      Topic(
        id: 'loops',
        title: 'Loops',
        phaseNumber: 2,
        phaseId: '2-control-flow',
        description: 'For, While, Do-While, Break and Continue.',
        sections: [
          TopicSection(
            title: 'Loops',
            contents: [
              TopicContent.paragraph('Loops allow you to run the same block of code multiple times.'),
            ],
          ),
          TopicSection(
            title: '1. for Loop',
            contents: [
              TopicContent.paragraph('Used when you know exactly how many times you want to repeat something.'),
              TopicContent.paragraph('syntax : for(initialization; condition; increment)'),
              TopicContent.bulletList([
                'initialization : start the counter',
                'condition : keep running as long as this is true',
                'increment : update the counter after every run',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'for-loop.js',
                code: '''for (let i = 0; i < 5; i++) {
    console.log(\`Repetition number \${i}\`);
}
// Output : 0, 1, 2, 3, 4''',
              )),
            ],
          ),
          TopicSection(
            title: '2. while Loop',
            contents: [
              TopicContent.paragraph('Used when you don\'t know how many times to repeat, but you know the condition to stop.'),
              TopicContent.code(CodeBlock(
                filename: 'while-loop.js',
                code: '''let i = 0;
while (i < 5) {
    console.log(i);
    i++;    // Don't forget this, or you get an INFINITE LOOP (crashes browser)
}''',
              )),
            ],
          ),
          TopicSection(
            title: '3. do...while Loop',
            contents: [
              TopicContent.paragraph('Similar to while, but it guarantees the code runs at least once, even if the condition is false initially.'),
              TopicContent.code(CodeBlock(
                filename: 'do-while-loop.js',
                code: '''let j = 10;
do {
    console.log(j);     // Prints 10
    j++;
} while (j < 5);        // stops here because 10 is not < 5''',
              )),
            ],
          ),
          TopicSection(
            title: '4. Controlling the loop (break vs continue)',
            contents: [
              TopicContent.paragraph('break : stops the loop completely and exits.'),
              TopicContent.code(CodeBlock(
                filename: 'break.js',
                code: '''for (let i = 0; i < 10; i++) {
    if ( i === 5) break;    // stops the whole loop when i hits 5
    console.log(i);
}''',
              )),
              TopicContent.paragraph('continue : skips the current turn and jumps to the next one.'),
              TopicContent.code(CodeBlock(
                filename: 'continue.js',
                code: '''for (let i = 0; i < 5; i++) {
    if ( i === 2) continue;    // Skips 2, but prints 0, 1, 3, 4
    console.log(i);
}''',
              )),
            ],
          ),
        ],
      ),
    ],
  );
}

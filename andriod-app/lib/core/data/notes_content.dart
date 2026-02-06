import '../models/topic_model.dart';
import 'phase2_content.dart';
import 'phase3_content.dart';
import 'phase4_content.dart';
import 'phase5_6_content.dart';
import 'phase7_8_content.dart';

/// All JavaScript Notes content data organized by phases
class NotesContent {
  /// Get all phases
  static List<Phase> get phases => [
    phase1Foundations,
    Phase2Content.phase,
    Phase3Content.phase,
    Phase4Content.phase,
    Phase5Content.phase,
    Phase6Content.phase,
    Phase7Content.phase,
    Phase8Content.phase,
  ];

  /// Get a topic by its path
  static Topic? getTopicByPath(String path) {
    for (final phase in phases) {
      for (final topic in phase.topics) {
        if (topic.fullPath == path) {
          return topic;
        }
      }
    }
    return null;
  }

  /// Get all topics as a flat list
  static List<Topic> get allTopics {
    final topics = <Topic>[];
    for (final phase in phases) {
      topics.addAll(phase.topics);
    }
    return topics;
  }
  
  /// Get next topic in sequence
  static Topic? getNextTopic(Topic currentTopic) {
    final topics = allTopics;
    final index = topics.indexWhere((t) => t.fullPath == currentTopic.fullPath);
    if (index >= 0 && index < topics.length - 1) {
      return topics[index + 1];
    }
    return null;
  }
  
  /// Get previous topic in sequence
  static Topic? getPreviousTopic(Topic currentTopic) {
    final topics = allTopics;
    final index = topics.indexWhere((t) => t.fullPath == currentTopic.fullPath);
    if (index > 0) {
      return topics[index - 1];
    }
    return null;
  }

  // ============================================================
  // PHASE 1: FOUNDATIONS (9 Topics)
  // ============================================================
  static Phase get phase1Foundations => const Phase(
    number: 1,
    id: '1-foundations',
    title: 'Foundations',
    description: 'Variables, Data Types, Operators, and the basics of how JavaScript works.',
    topicCount: 9,
    topics: [
      // Topic 1: How JavaScript Works
      Topic(
        id: 'how-javascript-works',
        title: 'How JavaScript Works',
        phaseNumber: 1,
        phaseId: '1-foundations',
        description: 'Understanding the V8 Engine, JIT Compilation, and the Call Stack.',
        sections: [
          TopicSection(
            title: 'The V8 Engine',
            contents: [
              TopicContent.bulletList([
                'Javascript runs on a engine called V8',
                'This engine is found in Google chrome, node js etc.,',
                'This engine converts written code into machine code',
              ]),
            ],
          ),
          TopicSection(
            title: 'JIT (Just In Time) Compilation',
            contents: [
              TopicContent.bulletList([
                'During the origin Javascript was interpreted',
                'But now using the engine it is JIT (Just In Time) Compilation',
                'That means, it starts fast as interpreter and optimize as compiler for repeatative task',
              ]),
            ],
          ),
          TopicSection(
            title: 'Single Threaded & Call Stack',
            contents: [
              TopicContent.bulletList([
                'Javascript is single threaded - it can only do one thing at a time',
                'It uses call stack to track where it is in the program',
                'This call stack is LIFO - The last function called is first to finish',
              ]),
            ],
          ),
        ],
      ),

      // Topic 2: Linking JavaScript
      Topic(
        id: 'linking-js',
        title: 'Linking JavaScript',
        phaseNumber: 1,
        phaseId: '1-foundations',
        description: 'Script tags, external files, defer and async attributes.',
        sections: [
          TopicSection(
            title: '3 Methods to Link JS',
            contents: [
              TopicContent.bulletList([
                '1. Internal - within the html file',
                '2. External - in a separate file',
                '3. Inline - within the html file',
              ]),
            ],
          ),
          TopicSection(
            title: 'Inline',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'inline.html',
                language: 'html',
                code: '<button onclick="alert(\'Hello\')">Click me</button>',
              )),
            ],
          ),
          TopicSection(
            title: 'Internal',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'internal.html',
                language: 'html',
                code: '''<script>
    console.log('Hello');
</script>''',
              )),
            ],
          ),
          TopicSection(
            title: 'External',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'external.html',
                language: 'html',
                code: '<script src="script.js"></script>',
              )),
            ],
          ),
          TopicSection(
            title: 'Script in Head Tag',
            contents: [
              TopicContent.bulletList([
                'If it is written inside head tag then browser reads html file from top to bottom',
                'So it will start downloading and executing the js code, before displaying any html ui',
              ]),
            ],
          ),
          TopicSection(
            title: 'The defer Attribute',
            contents: [
              TopicContent.bulletList([
                'Therefore we use defer attribute, which downloads the js code parallely as the html is parsed',
                'And then execute the js only after full html is parsed',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'defer.html',
                language: 'html',
                code: '''<head>
    <script src="script.js" defer></script>
</head>''',
              )),
              TopicContent.paragraph('We can also write the external js link after the body tag ends'),
            ],
          ),
          TopicSection(
            title: 'Defer vs Async (Important)',
            contents: [
              TopicContent.paragraph('When you put scripts in the <head>, you should use one of these to prevent blocking the HTML.'),
              TopicContent.paragraph('async:'),
              TopicContent.bulletList([
                'Downloads during HTML parsing.',
                'Pauses HTML parsing immediately to execute as soon as it\'s downloaded.',
                'Use case: Analytics scripts (independent scripts that don\'t care about the DOM or order).',
              ]),
              TopicContent.paragraph('defer:'),
              TopicContent.bulletList([
                'Downloads during HTML parsing.',
                'Waits until the HTML is fully parsed to execute.',
                'Respects order (script A runs before script B).',
                'Use case: Everything else. This is your default.',
              ]),
            ],
          ),
        ],
      ),

      // Topic 3: Variables
      Topic(
        id: 'variables',
        title: 'Variables',
        phaseNumber: 1,
        phaseId: '1-foundations',
        description: 'var vs let vs const, scope, and mutability.',
        sections: [
          TopicSection(
            title: 'Variables (var, let, const)',
            contents: [
              TopicContent.paragraph('Variables are containers for storing data(values)'),
            ],
          ),
          TopicSection(
            title: 'var',
            contents: [
              TopicContent.bulletList([
                'It is old - it ignores block scopes - it can be redeclared',
              ]),
            ],
          ),
          TopicSection(
            title: 'let',
            contents: [
              TopicContent.bulletList([
                'Introduced in ES6(2015) - it stays inside the braces {...} where it is defined - can be reassigned but not redeclared',
              ]),
            ],
          ),
          TopicSection(
            title: 'const',
            contents: [
              TopicContent.bulletList([
                'Introduced in ES6(2015) - it stays inside the braces {...} where it is defined - cannot be reassigned or redeclared',
              ]),
            ],
          ),
          TopicSection(
            title: 'Block Scope',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'block-scope.js',
                code: '''if (true) {
    var oldVar = "I survive outside!";
    let newLet = "I am trapped inside.";
    const newConst = "I am also trapped.";
}

console.log(oldVar);   // Output: "I survive outside!" (Leaked out)
console.log(newLet);   // Error: newLet is not defined
console.log(newConst); // Error: newConst is not defined''',
              )),
            ],
          ),
          TopicSection(
            title: 'Reassignment',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'reassignment.js',
                code: '''let score = 10;
score = 20; // Allowed

const pi = 3.14;
pi = 3.14159; // Error: Assignment to constant variable.''',
              )),
            ],
          ),
        ],
      ),

      // Topic 4: Data Types
      Topic(
        id: 'data-types',
        title: 'Data Types',
        phaseNumber: 1,
        phaseId: '1-foundations',
        description: 'String, Number, Boolean, Null, Undefined, Symbol, BigInt.',
        sections: [
          TopicSection(
            title: 'Data Types',
            contents: [
              TopicContent.paragraph('In Javascript "Primitive" is the data which is not an object and has no methods'),
            ],
          ),
          TopicSection(
            title: '7 Primitives',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'primitives.js',
                code: '''// String: Text data. Wrapped in quotes.
let name = "Gemini";
let char = 'A';

// Number: Floating point number.
let age = 25;
let price = 9999.99;

// Boolean: True or false value.
let isDone = true;
let isReady = false;

// Undefined: Variable declared, but no value assigned.
let city;

// Null: Explicitly set as no value.
let state = null;

// Symbol (ES6): Used to create unique identifiers for objects.
let id = Symbol("id");

// BigInt (ES11): Large integers (approx 9 quadrillion).
let hugeNum = 9007199254740991n; // Notice the 'n' at the end
// n stands for BigInt''',
              )),
            ],
          ),
          TopicSection(
            title: 'Null vs. Undefined (The Interview Favorite)',
            contents: [
              TopicContent.bulletList([
                'Undefined: "I haven\'t set this yet." (The engine does this automatically).',
                'Null: "I am setting this to nothing." (You do this manually).',
              ]),
            ],
          ),
          TopicSection(
            title: 'Dynamic Typing',
            contents: [
              TopicContent.paragraph('JavaScript is dynamically typed. You don\'t tell the engine "this is a number." It figures it out. You can also change a variable\'s type later (though you usually shouldn\'t).'),
              TopicContent.code(CodeBlock(
                filename: 'dynamic-typing.js',
                code: '''let data = 42;    // Now it's a Number
data = "Hello";   // Now it's a String (Allowed, but careful)
console.log(typeof(data)); // output: string''',
              )),
            ],
          ),
        ],
      ),

      // Topic 5: Type Coercion
      Topic(
        id: 'type-coercion',
        title: 'Type Coercion',
        phaseNumber: 1,
        phaseId: '1-foundations',
        description: 'Implicit vs Explicit, Truthy and Falsy values.',
        sections: [
          TopicSection(
            title: 'Type Coercion',
            contents: [
              TopicContent.paragraph('Coercion is the process of converting a value from one type to another (e.g., String to Number).'),
            ],
          ),
          TopicSection(
            title: 'Implicit Coercion (The Automatic Way)',
            contents: [
              TopicContent.paragraph('When the engine automatically converts one type to another.'),
              TopicContent.code(CodeBlock(
                filename: 'implicit-coercion.js',
                code: '''// string wins(+) - if we use '+' operator, the number will be converted to string
console.log("S" + 2); // output: "S2"

// number wins(-, *, /) - if we use '-', '*', '/' operator, the string will be converted to number
console.log("5" - 2); // output: 3
console.log("S" - 2); // output: NaN''',
              )),
            ],
          ),
          TopicSection(
            title: 'Explicit Coercion (The Manual Way)',
            contents: [
              TopicContent.paragraph('When we manually convert one type to another.'),
              TopicContent.code(CodeBlock(
                filename: 'explicit-coercion.js',
                code: '''// Number() function
console.log(Number("123")); // output: 123

// String() function
console.log(String(123)); // output: "123"

// Boolean() function
console.log(Boolean(1)); // output: true''',
              )),
            ],
          ),
          TopicSection(
            title: 'Truthy vs. Falsy Values',
            contents: [
              TopicContent.paragraph('When you put a value into an if statement, JS converts it to a Boolean.'),
              TopicContent.paragraph('Falsy Values:'),
              TopicContent.paragraph('There are only 5 values (plus false itself) that become false. Memorize these:'),
              TopicContent.bulletList([
                '0',
                '"" (Empty String)',
                'undefined',
                'null',
                'NaN (Not a Number)',
              ]),
              TopicContent.paragraph('Truthy Values:'),
              TopicContent.paragraph('Everything else.'),
              TopicContent.bulletList([
                '"Hello" (Non-empty string) -> true',
                '123 (Number other than 0) -> true',
                '{} (Empty Object) -> true',
                '[] (Empty Array) -> true',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'truthy-falsy.js',
                code: '''if ("0") { // "0" is coerced to true
    console.log("This runs!");
}

if (0) { // 0 is coerced to false
    console.log("This doesn't run.");
}''',
              )),
            ],
          ),
        ],
      ),

      // Topic 6: Basic Operators
      Topic(
        id: 'basic-operators',
        title: 'Basic Operators',
        phaseNumber: 1,
        phaseId: '1-foundations',
        description: 'Arithmetic, Modulus, Increment/Decrement.',
        sections: [
          TopicSection(
            title: 'Basic Operators',
            contents: [
              TopicContent.paragraph('Operators allow us to perform actions on data.'),
            ],
          ),
          TopicSection(
            title: '1. Arithmetic Operators',
            contents: [
              TopicContent.paragraph('Standard math you learned in school.'),
              TopicContent.bulletList([
                '+ (Addition): 10 + 5 -> 15',
                '- (Subtraction): 10 - 5 -> 5',
                '* (Multiplication): 10 * 5 -> 50',
                '/ (Division): 10 / 5 -> 2',
                '** (Exponentiation): 2 ** 3 (2 to the power of 3) -> 8',
              ]),
            ],
          ),
          TopicSection(
            title: '2. The Modulus Operator (%)',
            contents: [
              TopicContent.paragraph('This is the Remainder operator. It divides the first number by the second and returns what is left over.'),
              TopicContent.bulletList([
                '10 % 2 -> 0 (10 divides perfectly by 2)',
                '10 % 3 -> 1 (3 goes into 10 three times, remainder is 1)',
              ]),
              TopicContent.paragraph('Common Use: Checking if a number is Even or Odd.'),
              TopicContent.code(CodeBlock(
                filename: 'modulus.js',
                code: '''const x = 5;
// If x % 2 is 0, it's even. If 1, it's odd.''',
              )),
            ],
          ),
          TopicSection(
            title: '3. Increment & Decrement',
            contents: [
              TopicContent.paragraph('Shortcuts to add or subtract 1.'),
              TopicContent.bulletList([
                '++ (Add 1)',
                '-- (Subtract 1)',
              ]),
              TopicContent.paragraph('Prefix vs Postfix (Tricky):'),
              TopicContent.bulletList([
                'x++ (Postfix): Returns the value before changing it.',
                '++x (Prefix): Changes the value before returning it.',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'increment-decrement.js',
                code: '''let counter = 10;
console.log(counter++); // Output: 10 (Prints, then updates to 11)
console.log(counter);   // Output: 11

let score = 10;
console.log(++score);   // Output: 11 (Updates to 11, then prints)''',
              )),
            ],
          ),
          TopicSection(
            title: '4. Assignment Operators',
            contents: [
              TopicContent.paragraph('Shortcuts to update a variable.'),
              TopicContent.bulletList([
                'x += 5 is the same as x = x + 5',
                'x -= 5 is the same as x = x - 5',
                'x *= 5 is the same as x = x * 5',
              ]),
            ],
          ),
        ],
      ),

      // Topic 7: Comparison Operators
      Topic(
        id: 'comparison-operators',
        title: 'Comparison Operators',
        phaseNumber: 1,
        phaseId: '1-foundations',
        description: 'Equality, inequality, greater/less than.',
        sections: [
          TopicSection(
            title: 'Comparison Operators',
            contents: [
              TopicContent.paragraph('This operator compares two values and always returns a boolean value'),
            ],
          ),
          TopicSection(
            title: '1. Equality - always use ===(its predictable and safer)',
            contents: [
              TopicContent.paragraph('== (Loose Equality)'),
              TopicContent.paragraph('Does Type Coercion - tries to convert types to match before comparing'),
              TopicContent.code(CodeBlock(
                filename: 'loose-equality.js',
                code: 'console.log("5" == 5);      // true - Is the string "5" equal to the number 5? JS says "Close enough"',
              )),
              TopicContent.paragraph('=== (Strict Equality)'),
              TopicContent.paragraph('Does not do type coercion - it checks both value and type'),
              TopicContent.code(CodeBlock(
                filename: 'strict-equality.js',
                code: 'console.log("5" === 5);     // false - Is the string "5" equal to the number 5? JS says "No, one is text, one is a number"',
              )),
            ],
          ),
          TopicSection(
            title: '2. Inequality',
            contents: [
              TopicContent.paragraph('!= (Loose Inequality)'),
              TopicContent.paragraph('Convert types then checks'),
              TopicContent.code(CodeBlock(
                filename: 'loose-inequality.js',
                code: 'console.log("5" != 5);      // false (Because it thinks they are equal)',
              )),
              TopicContent.paragraph('!== (Strict Inequality)'),
              TopicContent.paragraph('Checks values and type'),
              TopicContent.code(CodeBlock(
                filename: 'strict-inequality.js',
                code: 'console.log("5" !== 5);     // true (Correct! They are different types)',
              )),
            ],
          ),
          TopicSection(
            title: '3. Greater/Less than',
            contents: [
              TopicContent.paragraph('This works like normal maths'),
              TopicContent.bulletList([
                '> (Greater than)',
                '< (Less than)',
                '>= (Greater than or equal to)',
                '<= (Less than or equal to)',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'greater-less.js',
                code: '''const age = 18;
if (age >= 18) {
    console.log("You can vote.");
}''',
              )),
            ],
          ),
        ],
      ),

      // Topic 8: Logical Operators
      Topic(
        id: 'logical-operators',
        title: 'Logical Operators',
        phaseNumber: 1,
        phaseId: '1-foundations',
        description: 'AND, OR, NOT, Short-circuiting.',
        sections: [
          TopicSection(
            title: 'Logical Operators',
            contents: [
              TopicContent.paragraph('These operators are used to combine multiple conditions.'),
              TopicContent.paragraph('They are fundamental for decision making in logic.'),
            ],
          ),
          TopicSection(
            title: '1. && (AND) - Returns true only if BOTH sides are true.',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'and-operator.js',
                code: '''const hasLicence = true;
const hasCar = true;
console.log(hasLicence && hasCar); // true''',
              )),
            ],
          ),
          TopicSection(
            title: '2. || (OR) - Returns true if AT LEAST ONE side is true.',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'or-operator.js',
                code: '''const isSaturday = false;
const isSunday = true;
console.log(isSaturday || isSunday); // true''',
              )),
            ],
          ),
          TopicSection(
            title: '3. ! (NOT) - Returns the boolean value. True becomes False, False becomes True.',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'not-operator.js',
                code: '''const isTired = false;
console.log(!isTired); // true''',
              )),
            ],
          ),
          TopicSection(
            title: 'Short - Circuiting',
            contents: [
              TopicContent.paragraph('Javascript is lazy.'),
              TopicContent.paragraph('It evaluates expressions from left to right and stops as soon as the result is guaranteed.'),
              TopicContent.code(CodeBlock(
                filename: 'short-circuiting.js',
                code: '''// AND (&&) - if the first value is false, JS stops immediately
false && console.log("This will not run");  // The log never happens

// OR (||) - if the first value is true, JS stops immediately
true || console.log("This will not run");  // The log never happens''',
              )),
            ],
          ),
          TopicSection(
            title: 'Real - world use case',
            contents: [
              TopicContent.paragraph('Developers often use || to set default values.'),
              TopicContent.code(CodeBlock(
                filename: 'default-values.js',
                code: '''let userParams = null;
// If userParams is null(falsy), use "Default Value"
let finalValue = userParams || "Default Value";
console.log(finalValue);    // "Default Value"''',
              )),
            ],
          ),
        ],
      ),

      // Topic 9: String Manipulation
      Topic(
        id: 'string-manipulation',
        title: 'String Manipulation',
        phaseNumber: 1,
        phaseId: '1-foundations',
        description: 'Template Literals, slice, replace, and more string methods.',
        sections: [
          TopicSection(
            title: '1. Template Literals',
            contents: [
              TopicContent.bulletList([
                'Instead of using single(\') or double(") quotes, use Backticks(`)',
                'String interpolation : You can inject variables directly into \${...}',
                'Multi-line : You can press enter and string keeps going.',
              ]),
              TopicContent.code(CodeBlock(
                filename: 'template-literals.js',
                code: '''// The old way
const name = "Gemini";
console.log("Hello " + name + ", welcome back!");

// The new way
const name1 = "Gemini";
console.log(\`Hello \${name1}, welcome back!\`);''',
              )),
            ],
          ),
          TopicSection(
            title: '2. Important string methods',
            contents: [
              TopicContent.code(CodeBlock(
                filename: 'string-methods.js',
                code: '''// length ( note : This is a property, no parenthesis ())
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
console.log(str11.repeat(3));  // "HelloHelloHello"''',
              )),
            ],
          ),
        ],
      ),
    ],
  );
}

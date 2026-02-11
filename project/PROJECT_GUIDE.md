# 🚀 TaskFlow — A JavaScript Mastery Project

> **Purpose**: This project exists for one reason — to use every single one of the 58 JavaScript concepts you learned, in a real, working application. It's not about building the most impressive resume project. It's about **proving to yourself** that you can take theory and turn it into practice.

> **Your Role**: YOU write every line of code. Think, struggle, debug, google, re-read your notes. That's how learning cements.
> **My Role (Senior Engineer)**: I've laid out the architecture, the tasks, and exactly where each concept fits. I'm the map, you're the driver.

---

## 📋 Table of Contents

1. [Project Overview](#-project-overview)
2. [Tech Stack & Setup](#-tech-stack--setup)
3. [Folder Structure](#-folder-structure)
4. [The 58 Topics — Complete Mapping](#-the-58-topics--complete-mapping)
5. [Task Breakdown](#-task-breakdown)
6. [Task Details](#-task-details)
7. [Tips & Ground Rules](#-tips--ground-rules)

---

## 🎯 Project Overview

**TaskFlow** is a browser-based Task Management Application. Users can:

- Create, edit, delete, and complete tasks
- Organize tasks into categories (Work, Personal, Learning, Health)
- Set priority levels (Low, Medium, High, Critical)
- Search and filter tasks by keyword, category, priority, or status
- View task statistics on a dashboard
- Persist all data in the browser (localStorage/sessionStorage)
- Fetch motivational quotes from an external API
- Have a user profile with editable settings
- Get toast notifications for actions
- Full keyboard navigation support

**Why this project?** A task manager is the perfect sandbox. It has CRUD operations, DOM manipulation, data structures, user interaction, storage, async operations, OOP patterns — everything you've learned naturally fits into it.

---

## 🛠 Tech Stack & Setup

- **HTML** — Structure (single `index.html` or multi-page if you want)
- **CSS** — Styling (you write your own, keep it simple or go fancy)
- **Vanilla JavaScript** — No frameworks. No React. No libraries. Just you and the language.
- **ES6 Modules** — Code split into multiple `.js` files using `import`/`export`
- **External API** — Free quote APIs for async/fetch practice
- **Live Server** — Use VS Code's Live Server extension (needed for ES6 modules to work in browser)

### How to Start

1. Open the `project/` folder
2. Create your `index.html` with `<script type="module" src="./js/app.js"></script>`
3. Use VS Code Live Server to serve it
4. Build task by task, commit after each task

---

## 📁 Folder Structure

```
project/
├── PROJECT_GUIDE.md          ← You are here (the master document)
├── PROGRESS.md               ← Track your progress here (create this yourself)
├── index.html                ← Main HTML page
├── style.css                 ← Your styles
├── js/
│   ├── app.js                ← Entry point (imports everything, initializes app)
│   ├── config.js             ← Constants, defaults, configuration
│   ├── utils.js              ← Utility/helper functions
│   ├── Task.js               ← Task class (OOP)
│   ├── Category.js           ← Category class (OOP, Inheritance)
│   ├── TaskManager.js        ← Core logic: add, delete, edit, filter, sort tasks
│   ├── UIController.js       ← All DOM manipulation and rendering
│   ├── StorageManager.js     ← localStorage / sessionStorage logic
│   ├── APIService.js         ← Fetch API calls (quotes, etc.)
│   ├── EventHandlers.js      ← Event listeners, delegation, propagation
│   ├── Validators.js         ← Input validation with regex and error handling
│   └── ProfileManager.js     ← User profile logic
```

---

## 🗺 The 58 Topics — Complete Mapping

This is the heart of the document. Every single topic you learned, and exactly WHERE it shows up in the project.

| #   | Topic                       | File(s) Used In                                       | How It's Used                                                                                                                                                                                                                             |
| --- | --------------------------- | ----------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1   | How JS Works                | `app.js`                                              | Understanding that your app runs on V8, single-threaded, uses call stack. You'll see this when debugging — functions stacking up in DevTools.                                                                                             |
| 2   | Linking JS                  | `index.html`                                          | Your `<script type="module" src="./js/app.js"></script>` at the bottom of the body.                                                                                                                                                       |
| 3   | Variables                   | Everywhere                                            | `let` for task lists that change, `const` for configuration values, avoid `var`.                                                                                                                                                          |
| 4   | Data Types                  | `Task.js`, `config.js`                                | Strings for task titles, Numbers for priorities, Booleans for completion status, Arrays for task lists, Objects for task data.                                                                                                            |
| 5   | Type Coercion               | `Validators.js`, `UIController.js`                    | When reading input values (always strings), converting to numbers for priority. Understanding `==` vs `===` when comparing values.                                                                                                        |
| 6   | Basic Operators             | `TaskManager.js`, `utils.js`                          | Arithmetic for statistics (task counts, percentages), assignment operators for updating values.                                                                                                                                           |
| 7   | Comparison Operators        | `TaskManager.js`, `Validators.js`                     | Comparing priorities (`task.priority > 2`), checking completion status, strict equality (`===`) everywhere.                                                                                                                               |
| 8   | Logical Operators           | `TaskManager.js`, `Validators.js`                     | Combining filter conditions (`isComplete && isHighPriority`), short-circuit evaluation for defaults.                                                                                                                                      |
| 9   | String Manipulation         | `utils.js`, `Validators.js`, `UIController.js`        | Trimming input (`.trim()`), converting case for search (`.toLowerCase()`), building HTML strings with template literals, truncating long task descriptions.                                                                               |
| 10  | Conditional Statements      | Everywhere                                            | `if/else` for checking task status, empty states, validation results, permission checks.                                                                                                                                                  |
| 11  | Switch Statements           | `UIController.js`, `EventHandlers.js`                 | Rendering different priority badges based on priority level, handling different keyboard shortcuts.                                                                                                                                       |
| 12  | Ternary Operator            | `UIController.js`, `TaskManager.js`                   | Inline conditional rendering: `task.completed ? '✅' : '⬜'`, compact status text.                                                                                                                                                        |
| 13  | Loops                       | `UIController.js`, `TaskManager.js`                   | `for...of` to iterate task arrays for rendering, `for` loop for generating statistics, `while` for pagination logic.                                                                                                                      |
| 14  | Function Basics             | Everywhere                                            | Every module exports functions. `function addTask()`, `function renderTasks()`, etc.                                                                                                                                                      |
| 15  | Parameters & Arguments      | Everywhere                                            | Functions like `createTask(title, description, priority, category)`, default parameters for optional settings.                                                                                                                            |
| 16  | Arrow Functions             | Everywhere                                            | Callbacks in `.filter()`, `.map()`, `.forEach()`, event handlers, short utility functions.                                                                                                                                                |
| 17  | Scope                       | `TaskManager.js`, `app.js`                            | Module-level variables (module scope), block-scoped variables inside functions, understanding why variables inside `if` blocks don't leak out.                                                                                            |
| 18  | Hoisting                    | `app.js`, debugging                                   | Understanding why `const`/`let` throw errors if used before declaration (TDZ), while function declarations work anywhere.                                                                                                                 |
| 19  | Closures                    | `UIController.js`, `utils.js`                         | Creating a `createIdGenerator()` function that remembers the last ID. Toast notification timers that capture the correct element. Debounce function for search.                                                                           |
| 20  | IIFE                        | `app.js` or `config.js`                               | Wrapping initialization code, creating a private configuration module, or safely bootstrapping the app.                                                                                                                                   |
| 21  | Recursion                   | `utils.js`, `Category.js`                             | Flattening nested category structures (if categories have subcategories), deep cloning task objects.                                                                                                                                      |
| 22  | Arrays                      | `TaskManager.js`                                      | The core data structure — `this.tasks = []` holds all tasks.                                                                                                                                                                              |
| 23  | Array Iteration             | `UIController.js`, `TaskManager.js`                   | `.forEach()` to render each task to the DOM, iterate over categories for filters.                                                                                                                                                         |
| 24  | Array Transformation        | `TaskManager.js`, `UIController.js`                   | `.map()` to transform task objects into HTML strings, `.filter()` to get active/completed tasks, `.reduce()` to calculate statistics.                                                                                                     |
| 25  | Array Searching             | `TaskManager.js`                                      | `.find()` to get a specific task by ID, `.findIndex()` to locate it for updating, `.includes()` for checking categories.                                                                                                                  |
| 26  | Array Sorting               | `TaskManager.js`                                      | `.sort()` tasks by priority, by date created, by title alphabetically. Custom comparator functions.                                                                                                                                       |
| 27  | Objects                     | `Task.js`, `config.js`                                | Task objects with properties (`{ id, title, description, priority, category, completed, createdAt }`). Config objects.                                                                                                                    |
| 28  | `this` Keyword              | `Task.js`, `TaskManager.js`                           | Inside class methods — `this.tasks`, `this.title`. Understanding context in methods vs arrow functions.                                                                                                                                   |
| 29  | Object References           | `TaskManager.js`                                      | When editing a task, understanding that objects are passed by reference — modifying a found task modifies the original array entry.                                                                                                       |
| 30  | Destructuring               | Everywhere                                            | `const { title, priority, category } = taskData;` when creating tasks. Destructuring function params. Destructuring imported modules.                                                                                                     |
| 31  | Spread Operator             | `TaskManager.js`, `StorageManager.js`                 | Cloning task arrays `[...this.tasks]` before sorting (to avoid mutating original). Merging config objects `{...defaults, ...userPrefs}`.                                                                                                  |
| 32  | Object Utilities            | `TaskManager.js`, `utils.js`                          | `Object.keys()` to get task property names, `Object.values()` for statistics, `Object.entries()` for iterating config. `Object.freeze()` for constant configs.                                                                            |
| 33  | Optional Chaining           | `UIController.js`, `ProfileManager.js`                | Safely accessing nested properties: `user?.profile?.avatar`, `task?.category?.name`. Prevents crashes from undefined data.                                                                                                                |
| 34  | Nullish Coalescing          | `config.js`, `StorageManager.js`                      | Setting defaults: `const theme = savedTheme ?? 'light'`, `const pageSize = settings.pageSize ?? 10`.                                                                                                                                      |
| 35  | DOM                         | `UIController.js`                                     | Understanding the Document Object Model — your tasks are objects that become HTML elements on the page.                                                                                                                                   |
| 36  | Selecting Elements          | `UIController.js`, `EventHandlers.js`                 | `document.getElementById('task-list')`, `document.querySelector('.add-btn')`, `document.querySelectorAll('.task-card')`.                                                                                                                  |
| 37  | Manipulating Content        | `UIController.js`                                     | Setting `innerHTML` for task list rendering, `textContent` for statistics counters, `createElement()` for individual task cards.                                                                                                          |
| 38  | Manipulating Styles         | `UIController.js`                                     | Adding/removing CSS classes for completed tasks (`.classList.add('completed')`), toggling dark mode, priority-based color coding.                                                                                                         |
| 39  | DOM Traversing              | `EventHandlers.js`, `UIController.js`                 | From a clicked delete button, traversing up to the parent task card (`event.target.closest('.task-card')`), finding sibling elements.                                                                                                     |
| 40  | Events Basics               | `EventHandlers.js`                                    | Click events on buttons, submit events on forms, input events for real-time search, keyboard events for shortcuts.                                                                                                                        |
| 41  | Event Propagation           | `EventHandlers.js`                                    | Understanding why clicking a delete button inside a task card also triggers the card's click event. Using `stopPropagation()` and understanding bubbling/capturing.                                                                       |
| 42  | Event Delegation            | `EventHandlers.js`                                    | Instead of adding click listeners to every individual task button, adding ONE listener on the parent `#task-list` container and using `event.target` to determine which button was clicked. This is critical for dynamically added tasks! |
| 43  | Prototypes                  | `Task.js` (understanding)                             | Understanding that your class methods live on the prototype. When you do `task.toString()`, JS walks up the prototype chain.                                                                                                              |
| 44  | Classes                     | `Task.js`, `TaskManager.js`, `Category.js`            | `class Task { constructor(title, priority) { ... } }`, `class TaskManager { ... }` — the backbone of your app structure.                                                                                                                  |
| 45  | Inheritance                 | `Category.js` or specialized tasks                    | A `HighPriorityTask` class that extends `Task` and adds extra behavior (auto-notification). Or `Category extends BaseEntity`.                                                                                                             |
| 46  | Advanced `this`             | `EventHandlers.js`, `TaskManager.js`                  | Using `.bind(this)` when passing class methods as event handlers. Understanding why arrow functions don't have their own `this`. Using `call()`/`apply()` for utility functions.                                                          |
| 47  | Accessors (Getters/Setters) | `Task.js`, `ProfileManager.js`                        | `get formattedDate()` that returns a human-readable date string. `set priority(value)` that validates the priority level before setting it.                                                                                               |
| 48  | Sync vs Async               | `APIService.js`, `app.js`                             | Understanding that fetching a quote doesn't block UI rendering. Your app initializes synchronously but loads quotes asynchronously.                                                                                                       |
| 49  | Callbacks                   | `utils.js`, `EventHandlers.js`                        | Passing functions as arguments — `tasks.filter(callback)`, `setTimeout(callback, delay)`, custom callbacks for confirmation dialogs.                                                                                                      |
| 50  | Promises                    | `APIService.js`                                       | Wrapping API calls in promises, chaining `.then()` and `.catch()` for data processing and error handling.                                                                                                                                 |
| 51  | Async/Await                 | `APIService.js`, `app.js`                             | `async function fetchQuote() { const response = await fetch(url); }` — cleaner async code for API calls.                                                                                                                                  |
| 52  | Event Loop                  | `app.js`, debugging                                   | Understanding why `setTimeout(() => renderTasks(), 0)` can be useful to defer rendering. Micro-tasks (Promises) vs Macro-tasks (setTimeout).                                                                                              |
| 53  | AJAX/Fetch API              | `APIService.js`                                       | `fetch('https://api.quotable.io/random')` to get motivational quotes. Handling JSON responses, status codes, network errors.                                                                                                              |
| 54  | Modules                     | Every `.js` file                                      | `export class Task { ... }` in `Task.js`, `import { Task } from './Task.js'` in `TaskManager.js`. Named exports, default exports, module organization.                                                                                    |
| 55  | Storage                     | `StorageManager.js`                                   | `localStorage.setItem('tasks', JSON.stringify(tasks))` to save tasks. `sessionStorage` for temporary session data (current filter). Parsing stored JSON back to objects.                                                                  |
| 56  | Error Handling              | `Validators.js`, `APIService.js`, `StorageManager.js` | `try/catch` around API calls, `throw new Error('Task title is required')` in validation, custom error classes, `finally` for cleanup.                                                                                                     |
| 57  | Regex                       | `Validators.js`                                       | Validating task titles (no special characters), validating email format for profile, search pattern matching, input sanitization.                                                                                                         |
| 58  | Memory Management           | `UIController.js`, `EventHandlers.js`                 | Removing event listeners when task cards are deleted, nullifying references to removed DOM elements, understanding timer cleanup (`clearInterval`), avoiding memory leaks.                                                                |

---

## 📦 Task Breakdown

The project is divided into **10 tasks**. Complete them in order. Each task builds on the previous one.

| Task | Name                        | Concepts Covered                                                            | Estimated Time |
| ---- | --------------------------- | --------------------------------------------------------------------------- | -------------- |
| 1    | Project Setup & Foundation  | #1, #2, #3, #4, #54                                                         | 30-45 min      |
| 2    | The Task Class (OOP Core)   | #27, #28, #44, #47, #43                                                     | 45-60 min      |
| 3    | TaskManager — Core Logic    | #6, #7, #8, #10, #14, #15, #16, #17, #22, #23, #24, #25, #26, #29, #30, #31 | 2-3 hours      |
| 4    | UI Rendering (DOM)          | #9, #12, #13, #35, #36, #37, #38, #39                                       | 2-3 hours      |
| 5    | Events & Interactivity      | #40, #41, #42, #46, #49, #58                                                | 2-3 hours      |
| 6    | Data Persistence (Storage)  | #34, #55                                                                    | 1-1.5 hours    |
| 7    | Validation & Error Handling | #5, #11, #56, #57                                                           | 1.5-2 hours    |
| 8    | Async — API Integration     | #48, #50, #51, #52, #53                                                     | 1.5-2 hours    |
| 9    | Advanced Features           | #18, #19, #20, #21, #32, #33, #45                                           | 2-3 hours      |
| 10   | User Profile & Polish       | #15 (defaults), #34, #47, #33, #31                                          | 1.5-2 hours    |

---

## 📝 Task Details

---

### Task 1: Project Setup & Foundation

**Goal**: Get the project skeleton running. A blank page that loads correctly with modules connected.

**What to do**:

1. Create `index.html` with basic HTML boilerplate
2. Add `<script type="module" src="./js/app.js"></script>` — **this is Topic #2 (Linking JS)**
3. Create the `js/` folder and all empty `.js` files listed in the folder structure
4. In `app.js`, write a simple `console.log("TaskFlow is running!")` — **Topic #1 (How JS Works)** — open DevTools, see it in the call stack
5. In `config.js`, define constants using `const` — categories array, priority levels, default settings — **Topic #3 (Variables)** and **Topic #4 (Data Types)**
6. Export the constants from `config.js` and import them in `app.js` — **Topic #54 (Modules)**
7. Verify everything loads without errors in the browser console

**Concepts**: #1, #2, #3, #4, #54

**Checklist**:

- [ ] HTML file created with module script tag
- [ ] All JS files created (empty stubs)
- [ ] `config.js` exports constants
- [ ] `app.js` imports and logs them
- [ ] Browser console shows no errors

---

### Task 2: The Task Class (OOP Core)

**Goal**: Build the `Task` class — the data model that represents a single task.

**What to do**:

1. In `Task.js`, create a `class Task` with a `constructor` — **Topic #44 (Classes)**
2. Properties: `id`, `title`, `description`, `priority`, `category`, `completed`, `createdAt`
3. Use `this` to assign properties — **Topic #28 (this Keyword)**
4. Add a getter `get formattedDate()` that returns a readable date string — **Topic #47 (Accessors)**
5. Add a setter `set priority(value)` that validates the value (1-4) before setting — **Topic #47**
6. Add a `toggleComplete()` method
7. Add a `toJSON()` method that returns a plain object (for storage later) — **Topic #27 (Objects)**
8. Understand that methods you wrote live on `Task.prototype` — **Topic #43 (Prototypes)** — verify in console with `console.log(Task.prototype)`
9. Export the class

**Concepts**: #27, #28, #43, #44, #47

**Checklist**:

- [ ] `Task` class created with constructor
- [ ] `this` used correctly to assign properties
- [ ] Getter for formatted date works
- [ ] Setter for priority validates input
- [ ] `toJSON()` returns plain object
- [ ] Prototype explored in console
- [ ] Class exported as module

---

### Task 3: TaskManager — Core Logic

**Goal**: Build the brain of the app. This module manages the array of tasks and all operations on it.

**What to do**:

1. Create `class TaskManager` in `TaskManager.js` — manages `this.tasks = []` — **Topic #22 (Arrays)**
2. `addTask(taskData)` — create a new Task, push to array. Use **destructuring** to extract params — **Topic #30 (Destructuring)**
3. `deleteTask(id)` — find the task index with `.findIndex()` and remove with `.splice()` — **Topic #25 (Array Searching)**
4. `getTask(id)` — use `.find()` to get a specific task — **Topic #25**
5. `updateTask(id, updates)` — find the task (understand it's a **reference**, not a copy — **Topic #29 (Object References)**), update its properties using **spread operator** `{...task, ...updates}` or direct mutation — **Topic #31 (Spread Operator)**
6. `toggleTask(id)` — find and toggle completion
7. `getFilteredTasks(filters)` — use `.filter()` with combined **logical operators** — **Topic #8 (Logical Operators)**, **Topic #7 (Comparison Operators)**, **Topic #24 (Array Transformation)**
8. `getSortedTasks(sortBy)` — use `.sort()` with a custom comparator — **Topic #26 (Array Sorting)**. Clone array first with `[...this.tasks]` before sorting — **Topic #31**
9. `getStatistics()` — use `.reduce()` to count completed, pending, per category — **Topic #24**, **Topic #6 (Basic Operators)**
10. `searchTasks(query)` — use `.filter()` with `.toLowerCase()` and `.includes()` — **Topic #24**, **Topic #9 (String Manipulation)** (used later but the logic lives here)
11. Use `if/else` for validation inside methods — **Topic #10 (Conditional Statements)**
12. Write pure **functions** with clear **parameters** — **Topic #14 (Function Basics)**, **Topic #15 (Parameters)**
13. Use **arrow functions** for all callbacks — **Topic #16 (Arrow Functions)**
14. Notice how variables are **scoped** to their blocks/functions — **Topic #17 (Scope)**
15. Iterate arrays using `.forEach()` where needed — **Topic #23 (Array Iteration)**
16. Export everything

**Concepts**: #6, #7, #8, #10, #14, #15, #16, #17, #22, #23, #24, #25, #26, #29, #30, #31

**Checklist**:

- [ ] `TaskManager` class created with tasks array
- [ ] Add, delete, get, update, toggle methods work
- [ ] Filtering works with multiple criteria
- [ ] Sorting works by priority, date, title
- [ ] Statistics calculated with reduce
- [ ] Search works (case-insensitive)
- [ ] All methods use proper JS concepts (arrow fns, destructuring, spread, etc.)
- [ ] Test all methods in console before moving to UI

---

### Task 4: UI Rendering (DOM)

**Goal**: Build the visual layer. Take your data and paint it on the screen.

**What to do**:

1. Build the HTML structure: header, task form, filter bar, task list container, statistics panel — **Topic #35 (DOM)**
2. In `UIController.js`, select DOM elements using `getElementById`, `querySelector`, `querySelectorAll` — **Topic #36 (Selecting Elements)**
3. Create a `renderTasks(tasks)` function that:
   - Clears the task list container
   - Loops through tasks with `for...of` — **Topic #13 (Loops)**
   - For each task, builds HTML using **template literals** and **string manipulation** — **Topic #9 (String Manipulation)**
   - Uses **ternary operator** for inline conditionals (`completed ? '✅' : '⬜'`) — **Topic #12 (Ternary Operator)**
   - Sets `innerHTML` or creates elements with `createElement` — **Topic #37 (Manipulating Content)**
4. Create `renderStatistics(stats)` — updates counter elements with `textContent`
5. Add CSS **class manipulation** for task states — `.classList.add('completed')`, `.classList.toggle('active')` — **Topic #38 (Manipulating Styles)**
6. Use **DOM traversing** — when rendering, you'll need to find child elements within task cards — **Topic #39 (DOM Traversing)**
7. Build `showToast(message, type)` — create a notification element, append to body, remove after timeout
8. Style everything in `style.css` — make it look clean and usable

**Concepts**: #9, #12, #13, #35, #36, #37, #38, #39

**Checklist**:

- [ ] HTML structure built with semantic elements
- [ ] Elements selected correctly in UIController
- [ ] Tasks render as cards/list items
- [ ] Statistics update when tasks change
- [ ] CSS classes toggle for completed tasks
- [ ] Toast notification system works
- [ ] App looks presentable (doesn't have to be beautiful yet)

---

### Task 5: Events & Interactivity

**Goal**: Make the app respond to user actions. Wire up all the buttons, forms, and inputs.

**What to do**:

1. In `EventHandlers.js`, set up **event listeners** on the task form (submit), filter dropdowns (change), search input (input) — **Topic #40 (Events Basics)**
2. Use **event delegation** on the task list container — ONE listener that handles all clicks (delete, edit, toggle) on dynamically added tasks — **Topic #42 (Event Delegation)**. This is crucial because your task cards are added/removed dynamically!
3. Handle **event propagation** — when clicking a delete button inside a task card, prevent the card's click event from firing with `stopPropagation()` — **Topic #41 (Event Propagation)**
4. Pass **callback functions** to event handlers — **Topic #49 (Callbacks)** — e.g., `setupEventListeners(onAddTask, onDeleteTask, onFilterChange)`
5. Use `.bind(this)` or arrow functions when passing class methods as handlers — **Topic #46 (Advanced this)** — this is a common gotcha!
6. Add keyboard shortcuts (e.g., `Ctrl+N` for new task, `Escape` to close modal)
7. **Memory management** — when removing task cards from DOM, make sure you clean up any references or timers — **Topic #58 (Memory Management)**. Clear `setInterval`/`setTimeout` when tasks are deleted.

**Concepts**: #40, #41, #42, #46, #49, #58

**Checklist**:

- [ ] Form submission creates a new task and renders it
- [ ] Delete, edit, toggle buttons work on each task card
- [ ] Event delegation working on task list (not individual listeners)
- [ ] Event propagation handled correctly
- [ ] Class methods bound correctly as handlers
- [ ] Keyboard shortcuts work
- [ ] No memory leaks from orphaned listeners or timers

---

### Task 6: Data Persistence (Storage)

**Goal**: Save tasks so they survive page refreshes.

**What to do**:

1. In `StorageManager.js`, create methods:
   - `saveTasks(tasks)` — `localStorage.setItem('taskflow_tasks', JSON.stringify(tasks))` — **Topic #55 (Storage)**
   - `loadTasks()` — `JSON.parse(localStorage.getItem('taskflow_tasks'))` — **#55**
   - `saveSessionFilter(filter)` — `sessionStorage.setItem(...)` for temporary filter state — **#55**
   - `loadSessionFilter()` — **#55**
   - `clearAll()` — **#55**
2. Use **nullish coalescing** for defaults when loading: `const tasks = loaded ?? []` — **Topic #34 (Nullish Coalescing)**
3. Integrate storage into the app flow:
   - On app load → load tasks from storage
   - On every change (add, delete, edit, toggle) → save to storage
4. Handle the edge case where stored data is corrupted (wrap in try/catch — we'll formalize this in Task 7)

**Concepts**: #34, #55

**Checklist**:

- [ ] Tasks persist across page refreshes
- [ ] Filter state saved in sessionStorage
- [ ] Default values used when storage is empty (nullish coalescing)
- [ ] Clear storage function works
- [ ] App loads correctly even if storage has no data

---

### Task 7: Validation & Error Handling

**Goal**: Make the app robust. Validate all inputs and handle errors gracefully.

**What to do**:

1. In `Validators.js`, create validation functions:
   - `validateTaskTitle(title)` — must not be empty, max length, use **regex** to check for valid characters — **Topic #57 (Regex)**
   - `validateEmail(email)` — regex email pattern — **#57**
   - `validatePriority(value)` — convert string to number, understand **type coercion** — **Topic #5 (Type Coercion)**
2. Use **switch statements** in validation to handle different error types — **Topic #11 (Switch Statements)**
3. In `APIService.js` and `StorageManager.js`, wrap risky operations in `try/catch/finally`:
   - `try { const data = JSON.parse(stored); } catch (error) { console.error('Corrupted data'); }` — **Topic #56 (Error Handling)**
   - `throw new Error('Invalid task data')` for custom errors — **#56**
   - Create a custom `ValidationError` class extending `Error` — **#56**
   - Use `finally` to always hide loading spinners — **#56**
4. Show user-friendly error messages through the toast system (from Task 4)

**Concepts**: #5, #11, #56, #57

**Checklist**:

- [ ] Empty/invalid task titles rejected with error message
- [ ] Priority values validated and coerced correctly
- [ ] Regex validation for title characters and email format
- [ ] Switch statement handles different error types
- [ ] try/catch wraps all risky operations (API, storage parsing)
- [ ] Custom `ValidationError` class created
- [ ] User never sees raw JavaScript errors — always friendly messages

---

### Task 8: Async — API Integration

**Goal**: Connect your app to the outside world. Fetch data from external APIs.

**What to do**:

1. In `APIService.js`, create:
   - `fetchQuote()` — fetches a random motivational quote from a free API (e.g., `https://dummyjson.com/quotes/random`) — **Topic #53 (AJAX/Fetch API)**
   - Alternatively, create your own mock API function that returns a Promise — **Topic #50 (Promises)**
2. First, write it with `.then().catch()` — **Topic #50 (Promises)**
3. Then refactor it to `async/await` — **Topic #51 (Async/Await)**
4. Add a loading state while fetching — update the UI to show "Loading..." and then the quote
5. Understand that fetching doesn't block your UI — **Topic #48 (Sync vs Async)** — the task list still renders while the quote loads
6. Understand the **Event Loop** — **Topic #52 (Event Loop)** — add a `console.log` before and after `await` and observe the execution order in console
7. Handle network errors with try/catch (builds on Task 7)
8. Display the quote on the dashboard

**Concepts**: #48, #50, #51, #52, #53

**Checklist**:

- [ ] Quote displays on the dashboard
- [ ] Written first with `.then()`, then refactored to `async/await`
- [ ] Loading state shown while fetching
- [ ] Network errors handled gracefully
- [ ] Understand async execution order (log it, observe event loop)
- [ ] UI doesn't freeze during fetch

---

### Task 9: Advanced Features

**Goal**: Add the polish features that exercise the remaining advanced concepts.

**What to do**:

1. **Closures** — **Topic #19**: Create a `createIdGenerator()` function in `utils.js` that returns a function. Each call to the returned function gives the next ID. The counter variable is "closed over" — private and persistent. Also create a `debounce()` function for the search input.
2. **IIFE** — **Topic #20**: In `app.js` or `config.js`, wrap some initialization code in an IIFE to create a private scope. E.g., `const AppConfig = (() => { const secret = 'internal'; return { get: () => secret }; })();`
3. **Recursion** — **Topic #21**: If you implement nested categories (sub-categories), write a recursive function to find all tasks in a category and its children. Or a `deepClone(obj)` function that handles nested objects.
4. **Inheritance** — **Topic #45**: Create a `UrgentTask` class that extends `Task`. It overrides `formattedDate` to also show how overdue it is. Or create `BaseEntity` and have both `Task` and `Category` extend it.
5. **Object Utilities** — **Topic #32**: Use `Object.keys(task)` to dynamically render task properties, `Object.freeze(CONFIG)` to make config immutable, `Object.entries()` for iterating settings.
6. **Optional Chaining** — **Topic #33**: Use `user?.preferences?.theme` when accessing profile data that might not exist yet. Use in the category traversal: `category?.subcategories?.length`.
7. **Hoisting** — **Topic #18**: Write a comment/test in `app.js` that demonstrates hoisting. Call a function before its declaration (works with `function` declarations). Try to access a `let` variable before declaration (TDZ error). This is a learning exercise, not a feature.

**Concepts**: #18, #19, #20, #21, #32, #33, #45

**Checklist**:

- [ ] ID generator using closures works
- [ ] Debounce function delays search input processing
- [ ] IIFE used for private configuration
- [ ] Recursive function for deep clone or nested categories
- [ ] `UrgentTask` or similar inherits from `Task`
- [ ] `Object.freeze()`, `Object.keys()`, `Object.entries()` used appropriately
- [ ] Optional chaining prevents crash on undefined nested properties
- [ ] Hoisting behavior tested and understood (with comments explaining it)

---

### Task 10: User Profile & Polish

**Goal**: Add user profile, dark mode toggle, and final polish. Tie up any remaining concepts.

**What to do**:

1. In `ProfileManager.js`, create user profile functionality:
   - Store user name, email, preferred theme in localStorage
   - Use **getters/setters** for profile properties — **Topic #47** (reinforcement)
   - Validate email with **regex** — **Topic #57** (reinforcement)
   - Use **optional chaining** when loading profile that might not exist — **Topic #33** (reinforcement)
   - Use **spread operator** to merge default profile with saved profile — **Topic #31** (reinforcement)
   - Use **nullish coalescing** for defaults — **Topic #34** (reinforcement)
   - Use **default parameters** in the constructor — **Topic #15** (reinforcement)
2. Add dark mode toggle using **manipulating styles** — `.classList.toggle('dark-mode')` on `document.body`
3. Final code review:
   - Make sure every module uses `export`/`import` properly — **Topic #54**
   - No `var` anywhere — all `let` and `const` — **Topic #3**
   - Console is clean — no errors, no warnings
4. Create `PROGRESS.md` and write which tasks you completed, what you learned, and any struggles

**Concepts**: Reinforcement of #15, #31, #33, #34, #47, #57 + polish

**Checklist**:

- [ ] User profile saves and loads correctly
- [ ] Dark mode toggle works
- [ ] All imports/exports clean
- [ ] No console errors
- [ ] `PROGRESS.md` written

---

## 💡 Tips & Ground Rules

### For You (The Builder)

1. **Test in console first**. Before building any UI, make sure your classes and logic work by testing them directly in the browser console.
2. **Commit after every task**. Use git. Each task is a sensible commit.
3. **Read your notes**. When you're stuck on how `.reduce()` works, go back to `24_array-transformation.js`. That's why you wrote them.
4. **Don't copy-paste from ChatGPT**. The moment you copy code you don't understand, you've defeated the purpose.
5. **Struggle is learning**. If something takes you 2 hours instead of 30 minutes, that's the 2 hours where the real learning happens.
6. **Use DevTools**. Console, debugger, breakpoints, Network tab — these are your best friends.

### Debugging Strategy

- **Console.log everything** at first. No shame in it.
- **Use breakpoints** in DevTools > Sources tab.
- **Read the error message**. It tells you the file, line number, and what went wrong.
- **Check the Network tab** for API issues.
- **Check Application tab** for storage issues.

### How to Know You're Done

When you can open `index.html`, add tasks, filter them, sort them, search them, see statistics, toggle dark mode, see a quote, refresh the page and everything is still there — **you're done**. And more importantly, you can look at every line of code and explain exactly what it does and why.

---

## 🔄 Context Recovery

> **If starting a fresh conversation**, paste this to your AI assistant:
>
> _"I'm building a JavaScript project called TaskFlow — a browser-based task manager. The master plan is in `d:\codebase\Javascript-Learn\project\PROJECT_GUIDE.md`. I have 58 JS concept files in `d:\codebase\Javascript-Learn\`. The goal is to use ALL 58 concepts in this one project. Check PROJECT_GUIDE.md for the full task breakdown and concept mapping. I'm currently on Task [X]. Help me as a senior engineer — guide me, don't write code for me."_

---

## 📊 Concept Coverage Verification

Every concept appears at least once. Here's a quick count check:

```
Topics 1-10:   ✅ Tasks 1, 3, 4, 7
Topics 11-20:  ✅ Tasks 3, 4, 7, 9
Topics 21-30:  ✅ Tasks 2, 3, 9
Topics 31-40:  ✅ Tasks 3, 4, 6, 9, 10
Topics 41-50:  ✅ Tasks 2, 5, 8, 9
Topics 51-58:  ✅ Tasks 6, 7, 8, 5
```

All 58 topics are covered. No gaps. Go build it. 🔥

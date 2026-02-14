# 📊 TaskFlow — Progress Tracker

> Started: February 11, 2026

---

## Current Status: 🟡 Task 3 — TaskManager — Core Logic

---

## Task Progress

| Task | Name                        | Status         | Started      | Completed    | Notes                                                      |
| ---- | --------------------------- | -------------- | ------------ | ------------ | ---------------------------------------------------------- |
| 1    | Project Setup & Foundation  | ✅ Done        | Feb 11, 2026 | Feb 11, 2026 | All files created, modules connected, console shows output |
| 2    | The Task Class (OOP Core)   | ✅ Done        | Feb 11, 2026 | Feb 14, 2026 | Getter/setter pair, static ID, default params, toJSON      |
| 3    | TaskManager — Core Logic    | 🟡 In Progress | Feb 14, 2026 | —            | —                                                          |
| 4    | UI Rendering (DOM)          | ⬜ Not Started | —            | —            | —                                                          |
| 5    | Events & Interactivity      | ⬜ Not Started | —            | —            | —                                                          |
| 6    | Data Persistence (Storage)  | ⬜ Not Started | —            | —            | —                                                          |
| 7    | Validation & Error Handling | ⬜ Not Started | —            | —            | —                                                          |
| 8    | Async — API Integration     | ⬜ Not Started | —            | —            | —                                                          |
| 9    | Advanced Features           | ⬜ Not Started | —            | —            | —                                                          |
| 10   | User Profile & Polish       | ⬜ Not Started | —            | —            | —                                                          |

---

## Concepts Covered So Far: 10 / 58

✅ #1 How JS Works · #2 Linking JS · #3 Variables · #4 Data Types · #54 Modules
✅ #27 Objects · #28 this Keyword · #43 Prototypes · #44 Classes · #47 Accessors

---

## Task Log

### Task 1 — Project Setup & Foundation ✅

- **Completed**: Feb 11, 2026
- **Concepts Used**: #1, #2, #3, #4, #54
- **What was done**:
  - Created `index.html` with `type="module"` script tag and linked `style.css`
  - Created all 12 JS stub files in `js/` folder
  - Defined exported constants in `config.js` (array, object, string, number, boolean)
  - Imported and logged them in `app.js`

### Task 2 — The Task Class (OOP Core) ✅

- **Completed**: Feb 14, 2026
- **Concepts Used**: #27, #28, #43, #44, #47
- **What was done**:
  - Built `Task` class with constructor, default params (`completed=false`)
  - `static nextId` for auto-incrementing IDs
  - `get formattedDate()` using `toLocaleDateString()`
  - `get/set priority()` pair with `_priority` backing field and validation (1-4)
  - `toggleComplete()` and `toJSON()` methods
  - Default export
- **Bugs encountered & fixed**:
  - Missing `.js` in import path → 404 error (learned: browser modules need full extensions)
  - Curly braces on default import → learned difference between named/default imports
  - `Date.now()` vs `new Date()` → learned one returns number, other returns Date object
  - Missing `get priority()` → `task.priority` returned undefined without the getter pair
- **Lessons**: Getter/setter pairs must be complete. Module scope ≠ global scope (can't test in console without `window.X`).

### Task 3 — TaskManager — Core Logic

- **Status**: 🟡 In Progress
- **Concepts**: #6, #7, #8, #10, #14, #15, #16, #17, #22, #23, #24, #25, #26, #29, #30, #31
- **Notes**: —

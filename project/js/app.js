import { category, priorityLevels, appName, pageSize, darkMode } from "./config.js";
import Task from "./Task.js";

const t = new Task('Buy groceries', 'Milk and eggs', 2, 'Personal');
console.log(t);
console.log(t.formattedDate);
t.toggleComplete()
console.log(t.completed);
console.log(t.toJSON());
console.log(`pp: ${t.priority}`);
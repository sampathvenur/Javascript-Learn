// Task Class

export default class Task {

  static nextId = 1;

    // constructor
  constructor(title, description, priority, category, completed=false) {
    this.id = Task.nextId++;        // number
    this.title = title;             // string
    this.description = description; // string
    this.priority = priority;       // number
    this.category = category;       // string
    this.completed = completed;     // boolean
    this.createdAt = new Date();    // Date
  }

  // private variable
  _priority = 1;

  // getter
  get formattedDate() {
    return `${this.createdAt.toLocaleDateString()}`;
  }

  get priority() {
    return this._priority;
  }

  // setter
  set priority(value) {
    if(value >= 1 && value <= 4) {
      this._priority = value;
    } else {
      console.log("Invalid priority level");
    }
  }

  // methods
  toggleComplete() {
    this.completed = !this.completed;
  }

  toJSON() {
    return {
      id: this.id,
      title: this.title,
      description: this.description,
      priority: this.priority,
      category: this.category,
      completed: this.completed,
      createdAt: this.createdAt
    }
  }
}
// Browser Storage (LocalStorage, SessionStorage, Cookies)

// Sometimes you need to save data (like a username, a dark mode preference, or a shopping cart) so it doesn't disappear when the user refreshes the page.



// 1. LocalStorage (The Permanent Box) - This is the most common way to store data.

// * Capacity: ~5MB (Huge for text).
// * Lifespan: Forever (until you manually delete it or the user clears browser cache).
// * Scope: Shared across all tabs/windows of the same website.

// The catch: It can only store Strings. You cannot store Objects or Arrays directly.

// How to use it:

// 1. Saving Data (setItem)
localStorage.setItem('username', 'Sampath');

// 2. Saving Complex Data (Use JSON.stringify!)
const settings = { theme: 'dark', notifications: true };
localStorage.setItem('userSettings', JSON.stringify(settings));

// 3. Reading Data (getItem)
const name = localStorage.getItem('username'); // "Sampath"

// 4. Reading Complex Data (Use JSON.parse!)
const storedSettings = localStorage.getItem('userSettings');
const parsedSettings = JSON.parse(storedSettings); 
console.log(parsedSettings.theme); // "dark"

// 5. Deleting
localStorage.removeItem('username'); // Delete one
localStorage.clear(); // Delete EVERYTHING



// 2. SessionStorage (The Temporary Box) - It works exactly the same as LocalStorage (same code syntax: `setItem`, `getItem`).

// * The Difference: It dies when you close the tab.
// * Use Case: Sensitive data (like banking session details) or temporary form data you don't want persisting after the user leaves.



// 3. Cookies (The Carrier Pigeon) - Cookies are the "Old School" method. They are very different from Storage.

// * Capacity: Tiny (4KB).
// * Lifespan: You set an expiration date.
// * Crucial Feature: Cookies are automatically sent to the server with every single HTTP Request.

// Use Case: Authentication Tokens. When you log in, the server gives you a cookie.
// Every time you click a link, your browser shows that cookie to the server to prove who you are.

// Summary Comparison

// | Feature       | LocalStorage     | SessionStorage     | Cookies               |
// | ------------- | ---------------- | ------------------ | --------------------- |
// | Lifespan      | Forever          | Until Tab Close    | Manually set (Expiry) |
// | Capacity      | ~5MB             | ~5MB               | 4KB (Tiny)            |
// | Server Access | No (Client only) | No (Client only)   | Yes (Sent on request) |
// | Ease of Use   | Easy             | Easy               | Hard (Messy syntax)   |
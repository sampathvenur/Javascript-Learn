// AJAX & The Fetch API

// In the old days, we used AJAX (Asynchronous JavaScript And XML) via XMLHttpRequest.
// It was messy and complex. Today, we use the Fetch API.
// It is built on Promises, cleaner, and much easier to use.



// GET Request

// by default fetch makes GET request
// when we fetch we get Response Object first (contains headers, status code etc.,)
// we have to tell Javascript to extract the JSON body

async function getUser() {
    // Step 1: Wait for the Server to reply (Headers only)
    const response = await fetch('https://api.github.com/sam');

    // Step 2: Wait for the actual Data to download & parse
    const data = await response.json();

    console.log(data.name);
}


// Server sends: "{ "name": "Sam" }" (String)
// You need: { name: "Sam" } (JavaScript Object)
// The .json() method handles this conversion (Parsing) automatically.



// POST Request

// To send data we need to provide the second argument Options Object.

// 1. Method: 'POST'
// 2. Headers: Tell the server you are sending JSON ('Content-Type': 'application/json').
// 3. Body: The actual data, converted to a String using JSON.stringify().


async function loginUser(username, password) {
  const options = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json' // Essential!
    },
    body: JSON.stringify({ 
      username: username, 
      password: password 
    })
  };

  const response = await fetch('https://api.myapp.com/login', options);
  const result = await response.json();
  console.log(result);
}



// fetch() only rejects (throws an error) if the Network fails (e.g., no internet).
// If the server returns a 404 (Not Found) or 500 (Server Error), fetch considers that a Success (because the server did reply).
// You must manually check response.ok.


const response = await fetch('https://api.com/bad-url');

if (!response.ok) {
  // Handle 404 or 500 errors here
  throw new Error(`HTTP Error! Status: ${response.status}`);
}

const data = await response.json();
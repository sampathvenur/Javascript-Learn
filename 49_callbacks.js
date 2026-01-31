// Callback - it is a function that you pass into another function as an argument, to be executed later.

function downloadPhoto(url, callback) {
    console.log(`Downloading from ${url}`);

    // Fake download taking 2 seconds
    setTimeout(() => {
        console.log("Download complete!");
        callback();
    }, 2000);
}

downloadPhoto('google.com/cat.jpg', function() {
    console.log("Now I can edit the photo");
});


// 1. The problem : sequence

// Real apps rarely have just one step. Usually, you need to:
// 1. Login user.
// 2. Then fetch user ID.
// 3. Then fetch user photos.
// 4. Then fetch comments on the photo.

// since step 2 depends on step 1, you have to nest the functions inside each other.



// Callback hell

// When you nest callbacks inside callbacks inside callbacks, you code starts to look like a sideway pyramid.
// This is known as Callback Hell.

loginUser('sam', (user) => {
    getUserData(user, (data) => {
        getArticles(data.id, (articles) => {
            getComments(articles[0], (comments) => {
                console.log(comments);
            });
        });
    });
});

// This is unreadable, hard to debug and inversion of control (you are handing control of your program to the loginUser function).


// To solve this Promises was invented.
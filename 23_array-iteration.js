// array iteration - to go through every item one by one (iterate).

// 2 ways

// for...of loop

const fruits = ["apple", "orange", "banana", "grapes"];

for (const fruit of fruits) {
    console.log(fruit);
}

// pros - readable, continue and break can be used
// cons - cannot use index


// forEach method - (a higher function that takes another function (callback function) as input. This function runs once for every item in the array).

const vegetables = ["potato", "carrot", "brinjal", "tomato"];

// @params (value: string, index: number, array: string[])
vegetables.forEach((fruit, index, array) => {
    console.log(`Item ${index}: ${fruit}`);
    console.log(array);
});

// pros - gives index as the second argument
// cons - cannot use break and continue
// array transformation

// note: They do NOT change the original array. They return a NEW array. (immutable)

// map - transforms every single item into something else (input array(n), output new_array(n))

const numbers = [1, 2, 3, 4];

const doubled = numbers.map((item) => item * 2);

// filter - pick only items that match a specific condition (input array(n), output new_array(<=n))

const even = numbers.filter((item) => item%2 == 0);

// reduce - takes entire array and calculates a single value from it (input array(n), output single_value : number, string, object etc.,)

const sum0 = numbers.reduce((prev_value, curr_value) => prev_value + curr_value);     // without initial value, prev_value will be the first element and curr_value will be the second element
const sum1 = numbers.reduce((prev_value, curr_value) => prev_value + curr_value, 0);  // initial value is set to 0


console.log(numbers);
console.log(doubled);
console.log(even);
console.log(sum1);

// [ 1, 2, 3, 4 ]
// [ 2, 4, 6, 8 ]
// [ 2, 4 ]
// 10
// 1

// function sum(num) {
//   let array = String(num).split("");
//   let sum = 0; 
//   for (let i = 0; i < array.length; i++) {
//     sum += Number(array[i]);
//   }
//   return sum;
// }


// function sum(num) {
//   return String(num).split("").map(Number).reduce((accumulator, digit) => accumulator + digit);
// }

// console.log(sum(23));           // 5
// console.log(sum(496));          // 19
// console.log(sum(123456789));    // 45

// 2




// 3

// function multiplyAllPairs(array1, array2) {
//   let result = [];
//   let longer = [];
//   let shorter = [];
//   if (array1.length <= array2.length) {
//     longer = array2;
//     shorter = array1;
//   }
//   else {
//     longer = array1;
//     shorter = array2;
//   }

//   for (let i = 0; i < longer.length; i++) {
//     for (let index = 0; index < shorter.length; index++) {
//       result.push(longer[i] * shorter[index]);
//     }
//   }
//   return result.sort((a, b) => a - b);
// }


// console.log(multiplyAllPairs([2, 4], [4, 3, 1, 2]));    // [2, 4, 4, 6, 8, 8, 12, 16]


// 4

// function sumOfSums(array) {
//   let sum = 0;
//   let count = 0;
//   for (let i = 0; i < array.length; i++) {
//     count += array[i];
//     sum += count;
//   }
//   return sum;
// }

// console.log(sumOfSums([3, 5, 2]));        // (3) + (3 + 5) + (3 + 5 + 2) --> 21
// console.log(sumOfSums([1, 5, 7, 3]));     // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) --> 36
// console.log(sumOfSums([4]));              // 4
// console.log(sumOfSums([1, 2, 3, 4, 5]));  // 35


// 5

// function leadingSubstrings(string) {
//   let result = [];
//   for (let i = 1; i <= string.length; i++) {
//     result.push(string.substring(0, i));
//   }
//   return result;
// }

// console.log(leadingSubstrings('abc'));      // ["a", "ab", "abc"]
// console.log(leadingSubstrings('a'));        // ["a"]
// console.log(leadingSubstrings('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]


// 6

// First Try

// function leadingSubstrings(string, leading) {
//   let result = [];
//   for (let i = 1; i <= string.length; i++) {
//     result.push(string.substring(leading, i));
//   }
//   return result;
// }

// function substring(string) {
//   let all = [];

//   for (let i = 0; i < string.length; i++) {
//     all.push(leadingSubstrings(string, i))
//   }
//   let final = []

//   for (let i = 0; i < all.length; i++) {
//     for (let index = 0; index < all[i].length; index++) {
//       if (all[i][index] !== "") {
//         final.push(all[i][index])
//       }
//     }
//   }
//   return final;
// }

// console.log(substring('abcde'));

// returns
// [ "a", "ab", "abc", "abcd", "abcde",
//   "b", "bc", "bcd", "bcde",
//   "c", "cd", "cde",
//   "d", "de",
//   "e" ]

// 7 



// 8

// function buyFruit(array) {
//   let result = [];

//   for (let i = 0; i < array.length; i++) {
//     let count = array[i][1];

//     for (let index = 0; index < count; index ++) {
//       result.push(array[i][0]);
//     }
//   }
//   return result;
// }


// console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// // returns ["apple", "apple", "apple", "orange", "banana", "banana"]


// 9

// first try

// function transactionsFor(item, trans) {
//   let result = [];
//   trans.forEach(element => {
//     if (element.id === item) {
//       result.push(element);
//     }
//   });
//   return result;
// }

// // second try

// function transactionsFor(item, trans) {
//   return trans.filter(({id}) => id === item);
// }



// const transactions = [ { id: 101, movement: 'in',  quantity:  5 },
//                        { id: 105, movement: 'in',  quantity: 10 },
//                        { id: 102, movement: 'out', quantity: 17 },
//                        { id: 101, movement: 'in',  quantity: 12 },
//                        { id: 103, movement: 'out', quantity: 15 },
//                        { id: 102, movement: 'out', quantity: 15 },
//                        { id: 105, movement: 'in',  quantity: 25 },
//                        { id: 101, movement: 'out', quantity: 18 },
//                        { id: 102, movement: 'in',  quantity: 22 },
//                        { id: 103, movement: 'out', quantity: 15 }, ];

// console.log(transactionsFor(101, transactions));
// // returns
// // [ { id: 101, movement: "in",  quantity:  5 },
// //   { id: 101, movement: "in",  quantity: 12 },
// //   { id: 101, movement: "out", quantity: 18 }, ]


// 10

// function transactionsFor(item, trans) {
//   return trans.filter(({id}) => id === item);
// }

// function isItemAvailable(item, trans) {
//   let array = transactionsFor(item, trans);
//   let sum = 0;
//   for (let i = 0; i < array.length; i++) {
//     if (array[i]["movement"] === "in") {
//       sum += array[i]["quantity"];
//     }
//     else {
//       sum -= array[i]["quantity"];
//     }
//   }
//   return (sum > 0 ? true : false);
// }


// const transactions = [ { id: 101, movement: 'in',  quantity:  5 },
//                        { id: 105, movement: 'in',  quantity: 10 },
//                        { id: 102, movement: 'out', quantity: 17 },
//                        { id: 101, movement: 'in',  quantity: 12 },
//                        { id: 103, movement: 'out', quantity: 15 },
//                        { id: 102, movement: 'out', quantity: 15 },
//                        { id: 105, movement: 'in',  quantity: 25 },
//                        { id: 101, movement: 'out', quantity: 18 },
//                        { id: 102, movement: 'in',  quantity: 22 },
//                        { id: 103, movement: 'out', quantity: 15 }, ];

// console.log(isItemAvailable(101, transactions));     // false
// console.log(isItemAvailable(105, transactions));     // true

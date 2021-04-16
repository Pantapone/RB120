// 1


// const DEGREE = '\xB0';
// const MINUTES_PER_DEGREE = 60;
// const SECONDS_PER_MINUTE = 60;
// const SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE;

// function dms(degreesFloat) {
//   const degreesInt = Math.floor(degreesFloat);
//   const minutes = Math.floor((degreesFloat - degreesInt) * MINUTES_PER_DEGREE);
//   const seconds = Math.floor(
//     (degreesFloat - degreesInt - (minutes / MINUTES_PER_DEGREE)) *
//     SECONDS_PER_DEGREE
//   );

//   return `${String(degreesInt) + DEGREE + padZeroes(minutes)}'${padZeroes(seconds)}"`;
// }

// function padZeroes(number) {
//   const numString = String(number);
//   return numString.length < 2 ? (`0${numString}`) : numString;
// }


// dms(30);           // 30°00'00"
// dms(76.73);        // 76°43'48"
// dms(254.6);        // 254°35'59"
// dms(93.034773);    // 93°02'05"
// dms(0);            // 0°00'00"
// dms(360);          // 360°00'00" or 0°00'00"


// 2

// function union(array1, array2) {
//   let result = [];

//   for (let i = 0; i < array1.length; i++) {
//     if (!result.includes(array1[i])) {
//       result.push(array1[i]); 
//     }
//   }
//   for (let i = 0; i < array2.length; i++) {
//     if (!result.includes(array2[i])) {
//       result.push(array2[i]); 
//     }
//   }
//   return result
// }

// console.log(union([1, 3, 4, 3, 5], [3, 6, 9]));    // [1, 3, 5, 6, 9]

// 3

// function halvsies(array) {
//   let middle = Math.round(array.length / 2);
//   let array1 = array.slice(0, middle);
//   let array2 = array.slice(middle, array.length);
//   return [array1, array2]
// }


// console.log(halvsies([1, 2, 3, 4]));       // [[1, 2], [3, 4]]
// console.log(halvsies([1, 5, 2, 4, 3]));    // [[1, 5, 2], [4, 3]]
// console.log(halvsies([5]));                // [[5], []]
// console.log(halvsies([]));                 // [[], []]


// 4

// function findDup(array) {
//   let duplicate = 0;
//   let newArray = [];

//   for (let i = 0; i < array.length; i++) {
//     if (newArray.includes(array[i])) {
//       duplicate = array[i];
//       break
//     }
//     else {
//     newArray.push(array[i]);
//     }
//   } 
//   return duplicate

// }

// console.log(findDup([1, 5, 3, 1]));                                // 1
// console.log(findDup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
//          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
//          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
//          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
//          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
//          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
//          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
//          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
//          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
//           7, 34, 57, 74, 45, 11, 88, 67,  5, 58]));    // 73

// 5

// function interleave(array1, array2) {
//   let result = []
//   for (let i = 0; i < array2.length; i++) {
//     result.push(array1[i]);
//     result.push(array2[i]);
//   }
//   return result;
// }

// console.log(interleave([1, 2, 3], ['a', 'b', 'c']));    // [1, "a", 2, "b", 3, "c"]

// 6

// function showMultiplicativeAverage(array) {
//   let result = 1; 

//   for (let i = 0; i < array.length; i++) {
//     result *= array[i];
//   }
//   return (result/array.length).toFixed(3);

// }


// console.log(showMultiplicativeAverage([3, 5]));                   // "7.500"
// console.log(showMultiplicativeAverage([2, 5, 7, 11, 13, 17]));    // "28361.667"

// 7

// function multiplyList(array1, array2) {
//   let result = [];
//   for (let i = 0; i < array2.length; i++) {
//     result.push((array1[i] * array2[i]));
//   }
//   return result;
// }


// console.log(multiplyList([3, 5, 7], [9, 10, 11]));    // [27, 50, 77]

// 8

// function digitList(num) {
//   let result = [];
//   let array = (String(num)).split("");
//   for (let i = 0; i < array.length; i++) {
//     result.push(Number(array[i]));
//   }
//   return result;
// }


// function digitList(num) {
//   return (String(num)).split("").map(Number);
// }

// console.log(digitList(12345));       // [1, 2, 3, 4, 5]
// console.log(digitList(7));           // [7]
// console.log(digitList(375290));      // [3, 7, 5, 2, 9, 0]
// console.log(digitList(444));         // [4, 4, 4]


// 9

// function countOccurrences(array) {
//   let hash = {};
//   for (let i = 0; i < array.length; i++) {
//     hash[array[i]] = hash[array[i]] || 0;
//     hash[array[i]] += 1;
//   }

//   for (let item in hash) {
//     console.log(`${item} => ${String(hash[item])}`);
//   }
// }



// const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
//                 'motorcycle', 'motorcycle', 'car', 'truck'];

// countOccurrences(vehicles);

// console output
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2

// 10

// function average(array) {
//   let sum = 0;
//   for (let i = 0; i < array.length; i++) {
//     sum += array[i];
//   }
//   return Math.floor(sum/array.length)
// }


// console.log(average([1, 5, 87, 45, 8, 8]));       // 25
// console.log(average([9, 47, 23, 95, 16, 52]));    // 40
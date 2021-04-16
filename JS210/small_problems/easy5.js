// // 1

// function repeater(string) {
//   let result = [];
//   let array = string.split("");
  
//   for (let i = 0; i < array.length; i++) {
//     result.push(array[i], array[i]);
//   }
//   return result.join("");
// }


// console.log(repeater('Hello'));        // "HHeelllloo"
// console.log(repeater('Good job!'));    // "GGoooodd  jjoobb!!"
// console.log(repeater(''));             // ""


// 2

// function doubleConsonants(string) {
//   let result = [];
//   let array = string.split("");
  
//   for (let i = 0; i < array.length; i++) {
//     if (/[aeiou\d]/.test(array[i])) { 
//     result.push(array[i]);
//     }
//     else {
//       result.push(array[i], array[i])
//     }
//   }
//   return result.join("");
// }

// console.log(doubleConsonants('String'));          // "SSttrrinngg"
// console.log(doubleConsonants('Hello-World!'));    // "HHellllo-WWorrlldd!"
// console.log(doubleConsonants('July 4th'));        // "JJullyy 4tthh"
// console.log(doubleConsonants(''));                // ""


// 3

// function reverseNumber(num) {
//   let array = String(num).split("")
//   let result = [];

//   for (let i = 0; i < array.length; i++) {
//     result.push(array[array.length - 1 - i]);
//   }
//   return Number(result.join(""));

// }

// console.log(reverseNumber(12345));    // 54321
// console.log(reverseNumber(12213));    // 31221
// console.log(reverseNumber(456));      // 654
// console.log(reverseNumber(12000));    // 21 -- Note that zeros get dropped!
// console.log(reverseNumber(1));        // 1


// 4


// function centerOf(string) {
//   if (string.length % 2 !== 0) {
//     let middle = Math.floor(string.length / 2);
//     return string[middle];
//   }
//   else {
//     let first = (string.length / 2) - 1;
//     let second = (string.length / 2) + 1;
//     return string.substring(first, second);
//   }
// }

// console.log(centerOf('I Love JavaScript')); // "a"
// console.log(centerOf('Launch School'));     // " "
// console.log(centerOf('Launch'));            // "un"
// console.log(centerOf('Launchschool'));      // "hs"
// console.log(centerOf('x'));                 // "x"


// 5

// function negative(num) {
//   return (num < 0 ? num : -num);
// }

// console.log(negative(5));     // -5
// console.log(negative(-3));    // -3
// console.log(negative(0));     // -0


// 6

// function sequence(num) {
//   let result = []; 

//   for (let i = 1; i <= num; i++) {
//     result.push(i);
//   }
//   return result;
// }


// console.log(sequence(5));    // [1, 2, 3, 4, 5]
// console.log(sequence(3));    // [1, 2, 3]
// console.log(sequence(1));    // [1]


// 7

// function swapName(name) {
//   return name.split(" ").reverse().join(" ");
// }

// console.log(swapName('Joe Roberts'));    // "Roberts, Joe"


// 8

// function sequence(count, num) {
//   let result = [];
//   let accu = 0;
//   for (let i = 1; i <= count; i++) {
//     accu += num;
//     result.push(accu);
//   }
//   return result;
// }

// console.log(sequence(5, 1));          // [1, 2, 3, 4, 5]
// console.log(sequence(4, -7));         // [-7, -14, -21, -28]
// console.log(sequence(3, 0));          // [0, 0, 0]
// console.log(sequence(0, 1000000));    // []

// 9

// function reverseSentence(string) {
//   return string.split(" ").reverse().join(" ")
// }


// console.log(reverseSentence(''));                       // ""
// console.log(reverseSentence('Hello World'));            // "World Hello"
// console.log(reverseSentence('Reverse these words'));    // "words these Reverse"


// 10

// function reverseWords(sentence) {
//   let words = sentence.split(" ");
//   let result = [];

//   for (let i = 0; i < words.length; i++) {
//     if (words[i].length < 5) {
//       result.push(words[i]);
//     }
//     else {
//       result.push(words[i].split("").reverse().join(""));
//     }
//   }
//   return result.join(" ");
// }


// console.log(reverseWords('Professional'));             // "lanoisseforP"
// console.log(reverseWords('Walk around the block'));    // "Walk dnuora the kcolb"
// console.log(reverseWords('Launch School'));            // "hcnuaL loohcS"
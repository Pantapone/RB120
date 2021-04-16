// 1

// function crunch(letters) {
//   let results = "";
  
//   for (let a = 0; a < letters.length; a++) {
//     if (letters[a] !== letters[a + 1]) {
//     results += letters[a];
//     }
//   }
//   return results
// }

// console.log(crunch('ddaaiillyy ddoouubbllee'));    // "daily double"
// console.log(crunch('4444abcabccba'));              // "4abcabcba"
// console.log(crunch('ggggggggggggggg'));            // "g"
// console.log(crunch('a'));                          // "a"
// console.log(crunch(''));                           // ""


// 2


// 3

// function stringy(num) {
//   let result = "";
//   for (let i = 0; i < num; i++) {
//     if (i % 2 === 0) {
//       result += "1";
//     }
//     else {
//       result += "0";
//     }
//   }
//   return result;
// }

// stringy(6);    // "101010"
// stringy(9);    // "101010101"
// stringy(4);    // "1010"
// stringy(7);    // "1010101"


// 4


// 5


// 6

// let read = require("readline-sync");

// console.log("Enter a noun:")
// let noun = read.prompt();

// console.log("Enter a verb:");
// let verb = read.prompt();

// console.log("Enter an adjective:");
// let adjective = read.prompt();

// console.log("Enter an adverb:");
// let adverb = read.prompt();

// console.log(`Do you ${verb} your ${adjective} ${noun} ${adverb}? That's hilarious!`)


// 7

// - even length
// - left side === right side
// - index from begining to first half === index to second half (slice?)


// function twice(num) {
//   let number = String(num);
//   let index = number.length / 2;
//   let rightHalf = number.substr(0, index);
//   let leftHalf = number.substr(index, index);
  
//   if (number.length % 2 === 0 && rightHalf === leftHalf) {
//     return num;
//   }
//   else {
//     return num * 2;
//   }
// }


// console.log(twice(37));          // 74
// console.log(twice(44));          // 44
// console.log(twice(334433));      // 668866
// console.log(twice(444));         // 888
// console.log(twice(107));         // 214
// console.log(twice(103103));      // 103103
// console.log(twice(3333));        // 3333
// console.log(twice(7676));        // 7676


// 8

// function getGrade(grade1, grade2, grade3) {
//   let average = (grade1 + grade2 + grade3) / 3;

//   switch(true) {
//     case average >= 90: return "A";
//     case average >= 80: return "B";
//     case average >= 70: return "C";
//     case average >= 60: return "D";
//     default: "F";
//   }
// }


// console.log(getGrade(95, 90, 93));    // "A"
// console.log(getGrade(50, 50, 95));    // "D"


// 9

// function cleanUp(sentence) {
//   return sentence.replace(/[^a-z]+/gi, " ")
// }


// 10
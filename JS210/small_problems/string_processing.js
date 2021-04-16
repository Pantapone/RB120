// 1

// function isUppercase(string) {
//  return !/[a-z]/.test(string);
// }

// console.log(isUppercase('t'));               // false
// console.log(isUppercase('T'));               // true
// console.log(isUppercase('Four Score'));      // false
// console.log(isUppercase('FOUR SCORE'));      // true
// console.log(isUppercase('4SCORE!'));         // true
// console.log(isUppercase(''));                // true


// 2

// function removeVowels(array) {
//   let result = [];

//   for (let i = 0; i < array.length; i++) {
//     let subarray = array[i].split("");
//     let result1 = [];
//     for (let a = 0; a < subarray.length; a++) {
//       if(!/[aeiou]/i.test(subarray[a])) {
//         result1.push(subarray[a]);
//       }
//     }
//     result.push(result1.join(""));
//   }
//   return result
// }


// console.log(removeVowels(['abcdefghijklmnopqrstuvwxyz']));         // ["bcdfghjklmnpqrstvwxyz"]
// console.log(removeVowels(['green', 'YELLOW', 'black', 'white']));  // ["grn", "YLLW", "blck", "wht"]
// console.log(removeVowels(['ABC', 'AEIOU', 'XYZ']));                // ["BC", "", "XYZ"]


// 3
// function letterCaseCount(string) {
//   let result = {
//     lowercase: 0,
//     uppercase: 0,
//     neither: 0
//   };

//   let array = string.split("");

//   for (let i = 0; i < array.length; i++) {
//     if (/[A-Z]/.test(array[i])) {
//       result.uppercase += 1;
//     }
//     else if (/[a-z]/.test(array[i])) {
//       result.lowercase += 1;
//     }
//     else {
//       result.neither += 1;
//     }
//   }
//   return result;
// }


// console.log(letterCaseCount('abCdef 123'));  // { lowercase: 5, uppercase: 1, neither: 4 }
// console.log(letterCaseCount('AbCd +Ef'));    // { lowercase: 3, uppercase: 3, neither: 2 }
// console.log(letterCaseCount('123'));         // { lowercase: 0, uppercase: 0, neither: 3 }
// console.log(letterCaseCount(''));            // { lowercase: 0, uppercase: 0, neither: 0 }


// 4

// function wordCap(sentence) {
//   let words = sentence.split(" ");
//   let newSentence = [];

//   for (let i = 0; i < words.length; i++) {
//     let letters = words[i].split("");
//     let result = []
//     for (let idx = 0; idx < letters.length; idx++) {
//       if (idx === 0) {
//         result.push(letters[idx].toUpperCase());
//       }
//       else {
//         result.push(letters[idx].toLowerCase());
//       }
//     }
//     newSentence.push(result.join(""));
//   }
//   return newSentence.join(" ");
// }

// function wordCap(sentence) {
//    return sentence.split(" ")
//                   .map(word => word.slice(0, 1).toUpperCase() + word.slice(1).toLowerCase())
//                   .join(" ");
// }

// console.log(wordCap('four score and seven'));       // "Four Score And Seven"
// console.log(wordCap('the javaScript language'));    // "The Javascript Language"
// console.log(wordCap('this is a "quoted" word'));    // 'This Is A "quoted" Word'


// 5
// function swapCase(words) {
//   return words.split("")
//               .map(letter => {
//                 if (/[a-z]/.test(letter)) {
//                   return letter.toUpperCase();
//                 }
//                 else if (/[A-Z]/.test(letter)) {
//                   return letter.toLowerCase();
//                 }
//                 else {
//                   return letter
//                 }
//               }).join("");
// }


// console.log(swapCase('CamelCase'));              // "cAMELcASE"
// console.log(swapCase('Tonight on XYZ-TV'));      // "tONIGHT ON xyz-tv"

// 6

// function staggeredCase(sentence) {
//   return sentence.split("").map((letter, i) => {
//     if (i % 2 === 0) {
//       return letter.toUpperCase();
//     }
//     else {
//       return letter.toLowerCase();
//     }

//   }).join("")

// }

// console.log(staggeredCase('I Love Launch School!'));        // "I LoVe lAuNcH ScHoOl!"
// console.log(staggeredCase('ALL_CAPS'));                     // "AlL_CaPs"
// console.log(staggeredCase('ignore 77 the 4444 numbers'));   // "IgNoRe 77 ThE 4444 nUmBeRs"

// 7

// function staggeredCase(sentence) {
//   let count = true;
//   let newLetter;
//   return sentence.split("").map((letter) => {
//     if (/[a-z]/i.test(letter)) {
//       if(count) {
//         newLetter = letter.toUpperCase();
//         count = false;
//       }
//       else {
//         newLetter = letter.toLowerCase();
//         count = true;
//       }
//       return newLetter;
//     }
//     else {
//       return letter
//     }

//   }).join("")

// }

// console.log(staggeredCase('I Love Launch School!'));        // "I lOvE lAuNcH sChOoL!"
// console.log(staggeredCase('ALL CAPS'));                     // "AlL cApS"
// console.log(staggeredCase('ignore 77 the 444 numbers'));    // "IgNoRe 77 ThE 444 nUmBeRs"

// 8

// function wordLengths(string) {
//   if (arguments.length === 0 || string.length === 0) {
//     return [];
// }
// else {
//   return string.split(" ").map(word => {
//     return `${word} ${word.length}`
//   });
// }

// }


// console.log(wordLengths('cow sheep chicken'));
// // ["cow 3", "sheep 5", "chicken 7"]

// console.log(wordLengths('baseball hot dogs and apple pie'));
// // ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

// console.log(wordLengths("It ain't easy, is it?"));
// // ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

// console.log(wordLengths('Supercalifragilisticexpialidocious'));
// // ["Supercalifragilisticexpialidocious 34"]

// console.log(wordLengths(''));      // []
// // wordLengths();        // []


// 9



// 10

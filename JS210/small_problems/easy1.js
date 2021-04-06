// 1

// for (let i = 1; i < 100; i += 2) {
//   console.log(i);
// }


// 2

// for (let i = 2; i < 100; i += 2) {
//   console.log(i);
// }

// 3

// let rlSync = require("readline-sync");
// const squareMeter = 10.7639;

// console.log("Enter the length of the room in meters:");
// let length = rlSync.prompt();
// length = parseInt(length, 10);
// console.log("Enter the width of the room in meters:");

// let width = rlSync.prompt();
// width = parseInt(width, 10);
// let area = length * width;

// console.log(`The area of the room is ${area.toFixed(2)} square meters (${(area * squareMeter).toFixed(2)} square feet).`)

// 4

// let rlSync = require("readline-sync");

// console.log("What is the bill?");
// let bill = rlSync.prompt();
// bill = parseFloat(bill);

// console.log("What is the tip percentage?");
// let tip_percent = rlSync.prompt();
// tip_percent = parseFloat(tip_percent);

// let tip = (tip_percent / 100) * bill;
// let total = tip + bill;

// console.log(`The tip is $${tip.toFixed(2)}`);

// console.log(`The total is $${(total).toFixed(2)}`)

// 5

// let rlSync = require("readline-sync");

// let number = rlSync.prompt(console.log("Please enter an integer greater than 0:"));
// let answer = rlSync.prompt(console.log("Enter 's' to compute the sum, or 'p' to compute the product."));
// let sum = 0

// for (let i = 1; i <= answer; i++) {
//   sum += i;
// }

// let product = 1

// for (let i = 1; i <= answer; i++) {
//   product *= i;
// }


// if (answer === "s") {
//   console.log(`The sum of the integers between 1 and ${number} is ${sum}.`);
// }
// else if (answer === "p") {
//   console.log(`The product of the integers between 1 and ${number} is ${product}.`);
// }
// else {
//   console.log("Please enter a valid operation.")
// }


// 6

// function shortLongShort(string1, string2) {
//   let long = "";
//   let short = "";

//   if (string1.length > string2.length) {
//     long = string1;
//     short = string2;
//   }
//   else {
//     long = string2; 
//     short = string1;
//   }

//   return short + long + short; 

// }

// console.log(shortLongShort('abc', 'defgh'));    // "abcdefghabc"
// console.log(shortLongShort('abcde', 'fgh'));    // "fghabcdefgh"
// console.log(shortLongShort('', 'xyz'));         // "xyz"


// 7

// leap year if the year is divisible by 4 && not by 100, except if its also by 400
// 


function isLeapYear(year) {
if (!(year % 4 === 0)) {
  return false;
}
else if (year % 100 === 0 && year % 400 === 0) {
  return true;
}
else {
  return false;
}
}


console.log(isLeapYear(2016));      // true
isLeapYear(2015);      // false
isLeapYear(2100);      // false
isLeapYear(2400);      // true
isLeapYear(240000);    // true
isLeapYear(240001);    // false
isLeapYear(2000);      // true
isLeapYear(1900);      // false
isLeapYear(1752);      // true
isLeapYear(1700);      // false
isLeapYear(1);         // false
isLeapYear(100);       // false
isLeapYear(400);       // true



(false && undefined);
(false || undefined);
((false && undefined) || (false || undefined));
((false || undefined) || (false && undefined));
((false && undefined) && (false || undefined));
((false || undefined) && (false && undefined));
('a' || (false && undefined) || '');
((false && undefined) || 'a' || '');
('a' && (false || undefined) && '');
((false || undefined) && 'a' && '');

false
undefined


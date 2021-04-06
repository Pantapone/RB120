// let name = "Victor";

// console.log(`Good Morning, ${name}`);
// console.log(`Good Afternoon, ${name}.`);
// console.log(`Good Evening, ${name}.`);

// let age = 20;
// let future = 10;
// let n_future = 0;

// console.log(`You are ${age} years old.`);
// while (age < 60) {
//   age += future;
//   n_future += future;
//   console.log(`In ${n_future}, you will be ${age} years old.`);
// }


// let rlSync = require('readline-sync');
// let name = rlSync.question("What's your name?\n");
// console.log(`Good Morning, ${name}!`);

// let greetingMessage = "Good Morning!";
// console.log(greetingMessage);


// let a = "hello";

// function greet() {
//   console.log(a);
// }

// greet()

// let greetPeople = () => console.log("Good Morning!");
// greetPeople();

// let bar = 1; 
// function foo() {
//   let bar = 2;
// }

// foo()
// console.log(bar);


// function getName(input) {
//   let readlineSync = require('readline-sync');
//   let name = readlineSync.question(input);
//   return name;
// }

// let firstName = getName('What is your first name?');
// let lastName = getName("What is your last name?");
// console.log(`Hello, ${firstName} ${lastName}!`);


// function scream(words) {
//   words = words + '!!!!';
//   return;
//   console.log(words);
// }

// scream('Yipeee');

// function scream(words) {
//   return words + '!!!!';
// }

// scream('Yipeee');


// let a = 5;
// switch (a) {
//   case 5:
//     console.log("a is 5");
//     break;
//   case 6: 
//     console.log("a is 6");
//     break;
//   default:
//     console.log('a is neither 4, nor 6');
//     break;
// }

// function evenOrOdd(a) {
//   if (a % 2 === 0) {
//     console.log("even");
//   }
//   else {
//     console.log("odd");
//   }
// }

// evenOrOdd(5);

// if (foo()) {
//   return "bar";
// }
// else {
//   return qux();
// }


// function changeString(string) {
//   if (string.length > 10) {
//     return string.toUpperCase();
//   }
//   else {
//     return string;
//   }
// }

// function numberRange(num) {
//   if (num >= 0 && num <= 50) {
//     console.log(`${num} is between 0 and 50`);
//   }
//   else if (num > 50 && num <= 100) {
//     console.log(`${num} is between 51 and 100`);
//   }
//   else if (num > 100) {
//     console.log(`${num} is greater than 100`);
//   }
//   else {
//     console.log(`${num} is less than 0`);
//   }
// }
// numberRange(25);
// numberRange(75);
// numberRange(125);
// numberRange(-25);


// let names = ['Chris', 'Kevin', 'Naveed', 'Pete', 'Victor'];

// let upperNames = [];

// index = 0

// while (index < names.length) {
//   let upperNamesname = names[index].toUpperCase();
//   upperNames.push(upperNamesname);
//   index += 1;
// }
// console.log(upperNames);

// let names = ["Chris", "Kevin", "Karl"];
// let upperNames = [];

// for (let index = 0; index < names.length; index+=1) {
//   let upperNamesname = names[index].toUpperCase();
//   upperNames.push(upperNamesname);
// }

// console.log(upperNames);


// for (let age = 0; age < 100; age += 10) {
//   console.log(age);
// }
// for (let future = 10; future <= 40; future += 10) {
//   console.log(future);
// }

// let array = ["hello", "no"];

// array.forEach (function (item, index, array) {
//   if (item === "hello") {
//     item = item.toUpperCase();
//   }
//   else {
//     item = item.toLowerCase();
//   }
//     console.log(index, item);
// });

// let myArray = [1, 3, 6, 11, 4, 2,
//   4, 9, 17, 16, 0];

// myArray.forEach(function(item) {
//   if (item % 2 === 0) {
//     console.log(item);
//   }
// });


// let rlSync = require("radline-sync");
// let name = rlSync.question("What is your name?)"); 
// console.log("Good")


// function calculateBMI(height, weight) {
//   let bmi = (weight/((height**2)/100));
//   return bmi.toFixed(2);
// }

// calculateBMI(180, 80); // "24.69"

// function catAge(age) {
//   let total = 0;
//   switch(age)  0 
//     age--;
//     total += 15;
//   }
// }


// catAge(0); // 0
// catAge(1); // 15
// catAge(2); // 24
// catAge(3); // 28
// catAge(4); // 32


// let initGame = () => ({
//   level: 1, 
//   score: 0
// })

// let circle = {
//   radius: 1,
//   location: {
//     x: 1, 
//     y: 2
//   },
//   draw: function() {
//     console.log("draw");
//   }
// };


// circle.draw();


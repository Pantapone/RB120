// const readLineSync = require("readline-sync");

// console.log("Enter the first number:");
// let firstNumber = Number(readLineSync.prompt());

// console.log("Enter the second number:")
// let secondNumber = Number(readLineSync.prompt());

// console.log(`${firstNumber} + ${secondNumber} = ${firstNumber + secondNumber}`);


// const readlineSync = require("readline-sync");

// console.log("Enter a phrase:");
// let phrase = String(readlineSync.question());
// phraseLength = phrase.replace(/\s/g, "").length;

// console.log(`There are ${phraseLength} characters in ${phrase}.`);


// const DIGITS = {
//   '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
//   '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
// };


// function stringToInteger(string) {
//   let value = 0;
//   const numbers = stringToNumbers(string);

//   for (let i = 0; i < numbers.length; i++) {
//     value = 10 * value + numbers[i]
//   }
//   return value
// }

// function stringToNumber(string) {
//   const result = [];

//   for (let i = 0; i < string.length; i++) {
//     result.push(DIGITS[string[i]]);
//   }
//   return result;
// }

// stringToInteger('4321');      // 4321
// stringToInteger('570');       // 570



// const DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];


// function integerToString(number) {
//   let result = "";

//   do {
//     let remainder = number % 10;
//     number = Math.floor(number / 10);

//     result = DIGITS[remainder] + result;
//   } while (number > 0);

//   return result;
// }


// integerToString(4321);      // "4321"
// integerToString(0);         // "0"
// integerToString(5000);      // "5000"



// var myVar = 'This is global';

// function someFunction() {
//   console.log(myVar);
//   var myVar = 'This is local';
// }

// someFunction();



// let c = ["water", "cat", "house"];


// [1, 2, 3, 4].reduceRight(function(accumulator, currentValue, index, array) {
//   return accumulator * currentValue;
// });


// d.find(function(ele, index, array) {
//   if (ele > 2) {
//     return `found ${ele} at ${index} within ${array}`;
//    }
//   });

//   let testVar = ""

//   ["hello", "my", "name", "is"].filter(function(ele, index, array) {
//     if (ele.length > 3) {
//       return ele;
//       this
//     }
//   });


//   let testVar = [1, 2, 3, 4];

//   testVar.find(function(num){
//     num > 3;
//   });




// let student = {
//   name: "bob",
//   age: 4, 
//   hobby: "dance"
// }

// // let newStudent = Object.create(student);
// // newStudent.job = "sani";

// // console.log(newStudent);
// // console.log(newStudent.name)


// for (let i = 0; i < student.length; i++) {
//   console.log(`key ${student[i]}`)
// }


// function signedIntegerToString(num) {
//   if (num < 0) {
//     return ("-" + integerToString(-number));
//   }

// }


// signedIntegerToString(4321);      // "+4321"
// signedIntegerToString(-123);      // "-123"
// signedIntegerToString(0);


// let array1 = [1, 2, 3, 4];
// let array2 = []

// for (let i = 0; i < array1.length; i++) {
//   array2.push(array1[i]);
// } 

// console.log(array2)
// console.log(array2 === array1);

// let array3 = array1; 

// let array4 = array1.slice();

// console.log(array1 === array3);
// console.log(array1 === array4);


// let ask = require("readline-sync");

// let bill = parseFloat(ask.question("What is the bill? "));
// let tip_percent = parseFloat(ask.question("What is the tip percentage? "));

// let tip = ((tip_percent/100) * bill);
// let total = (tip + bill);


// console.log(`The tip is $${tip.toFixed(2)}.`);
// console.log(`The total is $${total.toFixed(2)}.`);




// function concat(array1, secondArgument) {
//   let newArray = [];

//   for (let i = 0; i < array1.length; i++) {
//     newArray[i] = array1[i];
//   }

//   if (Array.isArray(secondArgument)) {
//     for (let i = 0; i < secondArgument.length; i++) {
//       newArray[newArray.length] = secondArgument[i];
//     }
//   }
//   else {
//     newArray.push(secondArgument);
//   }
//   return newArray;
// }

// concat([1, 2, 3], [4, 5, 6]);          // [1, 2, 3, 4, 5, 6]
// concat([1, 2], 3);                     // [1, 2, 3]
// concat([2, 3], ['two', 'three']);      // [2, 3, "two", "three"]
// concat([2, 3], 'four');                // [2, 3, "four"]


// const obj = { a: 2, b: 3 };
// const newArray = concat([2, 3], obj);
// newArray;                              // [2, 3, { a: 2, b: 3 }]
// obj.a = 'two';
// newArray;                              // [2, 3, { a: "two", b: 3 }]

// const arr1 = [1, 2, 3];
// const arr2 = [4, 5, obj];
// const arr3 = concat(arr1, arr2);
// arr3;                                  // [1, 2, 3, 4, 5, { a: "two", b: 3 }]
// obj.b = 'three';
// arr3;                                  // [1, 2, 3, 4, 5, { a: "two", b: "three" }]

// arr3[5].b = 3;                         // or, `arr3[5]['b'] = 3;`
// obj;                                   // { a: "two", b: 3 }


// function randomGreeting() {
//   const words = ['Hello', 'Howdy', 'Hi', 'Hey there', 'What\'s up',
//                'Greetings', 'Salutations', 'Good to see you'];

//   const idx = Math.floor(Math.random() * words.length);

//   return words[idx];
// }

// function greet(...args) {
//   const names = Array.prototype.slice.call(args);

//   for (let i = 0; i < names.length; i++) {
//     const name = names[i];
//     const greeting = randomGreeting();

//     console.log(`${greeting}, ${name}!`);
//   }
// }

// greet('Hannah', 'Jose', 'Beatrix', 'Julie', 'Ian');

// function includesFalse(list) {
//   for (let i = 0; i < list.length; i++) {
//     let element = list[i];

//     if (element === false) {
//       return true;
//     }
//   }

//   return false;
// }
//                                                                   // returns:
// includesFalse([8, null, 'abc', true, 'launch', 11, false]);       // true
// includesFalse(['programming', undefined, 37, 64, true, 'false']); // false
// includesFalse([9422, 'lambda', true, 0, '54', null]);             // true



// let placeBet = function(guess) {
//   function generateRandomInt() {
//     return Math.floor(Math.random() * 25) + 1;
//   };

//   const winningNumbers = generateRandomInt();

//   if (guess < 1 || guess > 25) {
//     return 'Invalid guess. Valid guesses are between 1 and 25.';
//   }

//   if (guess === winningNumbers) {
//     return "Congratulations, you win!";
//   } else {
//     return "Wrong-o! You lose.";
//   }
// }

// const userGuesses = parseInt(prompt('Input a guess between 1-25'), 10);
// alert(placeBet(userGuesses));


// function wantToVisit(museum, city) {
//   return museum.includes('Computer')
//       || museum.includes('Science')
//       || (museum.includes('Modern')
//         && museum.includes('Art')
//        && ((museum.includes('Andy Warhol'))
//         || (city === 'Amsterdam'))
//       );
// }

// // Tests (should all print 'true')

// console.log(wantToVisit('Computer Games Museum', 'Berlin') === true);
// console.log(wantToVisit('National Museum of Nature and Science', 'Tokyo') === true);
// console.log(wantToVisit('Museum of Modern Art', 'New York') === false);
// console.log(wantToVisit('El Paso Museum of Archaeology', 'El Paso') === false);
// console.log(wantToVisit('NEMO Science Museum', 'Amsterdam') === true);
// console.log(wantToVisit('National Museum of Modern Art', 'Paris') === false);
// console.log(wantToVisit('Andy Warhol Museum of Modern Art', 'Medzilaborce') === true);
// console.log(wantToVisit('Moco: Modern Contemporary Art', 'Amsterdam') === true);
// console.log(wantToVisit('Van Gogh Museum', 'Amsterdam') === false);
// console.log(wantToVisit('Andy Warhol Museum', 'Melbourne') === false);



// const transactionLog = [];

// function processInput(input) {
//   const numericalData = parseFloat(input);

//   if (Number.isNaN(numericalData)) {
//     throw (new Error('Data could not be converted to numerical amount.'));
//   }

//   return numericalData;
// }

// function logTransaction() {
//   let data = prompt('Please enter the transaction amount: ');
//   let error = "hello";

//   try {
//     data = processInput(data);
//     transactionLog.push(data);

//     alert('Thank you. Data accepted.');
//   } catch(error) {
//     alert(error.message);
//   }
// }

// function transactionTotal() {
//   let total = 0;

//   for (let i = 0; i < transactionLog.length; i++) {
//     total += transactionLog[i];
//   }

//   return total;
// }

// logTransaction();
// logTransaction();
// logTransaction();

// console.log(transactionTotal());

// const species = ['wolf', 'human', 'wasp', 'squirrel', 'weasel', 'dinosaur'];
// const isMidnight = true;
// const isFullmoon = true;

// function isTransformable(species) {
//   return species[0] === 'w';
// }

// function transform(species) {
//   return `were${species}`;
// }

// for (let index = 0; index < species.length; index++) {
//   const thisSpecies = species[index];
//   let newSpecies;

//   if (isMidnight && isFullmoon && isTransformable(thisSpecies)) {
//     newSpecies = transform(thisSpecies);
//   }

//   if (newSpecies) {
//     console.log(`Beware of the ${newSpecies}!`);
//   }
// }


// Roles (salary still to be determined)

// const ceo = {
//   tasks: ['company strategy', 'resource allocation', 'performance monitoring'],
//   salary: 0,
// };

// const developer = {
//   tasks: ['turn product vision into code'],
//   salary: 0,
// };

// const scrumMaster = {
//   tasks: ['organize scrum process', 'manage scrum teams'],
//   salary: 0,
// };

// // Team -- we're hiring!

// const team = {};

// team['ceo'] = 'Kim';
// team['scrumMaster'] = 'Alice';
// team['developer'] = undefined;


// const company = {
//   name: 'Space Design',
//   team,
//   projectedRevenue: 500000,
// };

// console.log(`----{ ${company.name} }----`);
// console.log(`CEO: ${company.team[ceo]}`);
// console.log(`Scrum master: ${company.team[scrumMaster]}`);
// console.log(`Projected revenue: $${company.projectedRevenue}`);

// // ----{ Space Design }----
// // CEO: undefined
// // Scrum master: undefined
// // Projected revenue: $500000





// // The shopping cart is a list of items, where each item
// // is an object { name: <string>, amount: <number> }.
// let shoppingCart = [];

// // Currently available products with prices.
// const prices = {
//   'notebook': 9.99,
//   'pencil': 1.70,
//   'coffee': 3.00,
//   'smoothie': 2.10,
// };

// function price({name}) {
//   return prices[name];
// }

// // Adding an item to the shopping cart.
// // The amount is optional and defaults to 1.
// // If the item is already in the cart, its amount is updated.
// function updateCart(name, amount) {
//   amount = amount || 1;

//   let alreadyInCart = false;

//   for (let i = 0; i < shoppingCart.length; i += 1) {
//     let item = shoppingCart[i];

//     if (item.name === name) {
//       item.amount = amount;
//       alreadyInCart = true;
//       break;
//     }
//   }

//   if (!alreadyInCart) {
//     shoppingCart.push({ name, amount });
//   }
// }

// // Calculating the price for the whole shopping cart.
// function total() {
//   let total = 0;

//   for (let i = 0; i < shoppingCart.length; i += 1) {
//     let item = shoppingCart[i];

//     total += (item.amount * price(item));
//   }

//   return total.toFixed(2);
// }

// function pay() {
//   // omitted

//   console.log(`You have been charged $${total()}.`);
// }

// function checkout() {
//   pay();
//   shoppingCart = {};
// }

// // Example purchase.

// updateCart('notebook');
// updateCart('pencil', 2);
// updateCart('coffee', 1);
// // "Oh, wait, I do have pencils..."
// updateCart('pencil', 0);

// checkout();
// // You have been charged $14.69.


// const totalPages = 364;
// let energy = 100;
// let currentPage = 1;
// function read() {
//   while (energy > 0 && currentPage < totalPages) {
//     currentPage += 1;
//     energy -= (5 + currentPage * 0.1);
//   }

//   console.log(`Made it to page ${String(currentPage)}.`);

//   // Drink a cup of coffee.
//   energy = 100;

//   // Continue reading.
//   if (currentPage < totalPages) {
//     read();
//   } else {
//     console.log('Done!');
//   }
// }

// read();

// let i = 0;
// while (i < 10) {
//   if (i % 3 === 0) {
//     console.log(i);
//     i++;
//   } else {
//     i += 1;
//   }
// }


// function padLeft(number) {
//   const stringNumber = String(number);
//   switch (stringNumber.length) {
//     case 1:  return `  ${stringNumber}`;
//     case 2:  return ` ${stringNumber}`;
//     default: return stringNumber;
//   }
// }

// for (let i = 1; i <= 10; i += 1) {
//   let row = '';
//   for (let j = 1; j <= 10; j += 1) {
//     row += `${padLeft(i * j)} `;
//   }

//   console.log(row);
// }



// const person = {
//   firstName() {
//     return 'Victor';
//   },
//   lastName() {
//     return 'Reyes';
//   },
// };

// console.log(`${person.firstName()} ${person.lastName()}`);


// function calculateBonus(bonus) {
//   return _________[1] ? bonus / 2 : 0;
// }

// calculateBonus(2800, true);               // 1400
// calculateBonus(1000, false);              // 0
// calculateBonus(50000, true);              // 25000


function penultimate(string) {
  console.log(string.split(' ')[string.split(" ").length - 2]);
}

penultimate('last word');                    // expected: "last"
penultimate('Launch School is great!');      // expected: "is"
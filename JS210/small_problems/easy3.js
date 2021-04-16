// 1

// function getRandomInt(min, max) {
//   min = Math.ceil(min);
//   max = Math.floor(max);
//   return Math.floor(Math.random() * (max - min + 1) + min); //The maximum is exclusive and the minimum is inclusive
// }

// let age = getRandomInt(20, 200);

// console.log(`Teddy is ${age} years old!`);


// return Math.floor(Math.random() * (max - min + 1)) + 1 

// 2

// const numbers = [];

// numbers.push(prompt('Enter the 1st number:'));
// numbers.push(prompt('Enter the 2nd number:'));
// numbers.push(prompt('Enter the 3rd number:'));
// numbers.push(prompt('Enter the 4th number:'));
// numbers.push(prompt('Enter the 5th number:'));

// let lastNumber = prompt('Enter the last number:');

// if (numbers.includes(lastNumber)) {
//   console.log(`The number ${lastNumber} appears in [${numbers.join(', ')}].`);
// } else {
//   console.log(`The number ${lastNumber} does not appear in [${numbers.join(', ')}].`);
// }


// 3

const age = parseInt(prompt('What is your age?'), 10);
const retirementAge = parseInt(prompt('At what age would you like to retire?'), 10);

const today = new Date();

const currentYear = today.getFullYear();
const workYearsToGo = retirementAge - age;
const retirementYear = currentYear + workYearsToGo;

console.log(`It's ${currentYear}. You will retire in ${retirementYear}.`);
console.log(`You have only ${workYearsToGo} years of work to go!`);


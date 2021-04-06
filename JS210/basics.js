


// Loops
// ------------------------------------------------------------------------------

// 1

// for (let i = 0; i <= 10; i += 2) {
//   console.log(i);
// }

// 2

// for (let i = 10; i > 0; i -= 1) {
//   console.log(i);
//   if (i === 1) {
//     console.log("launch");
//   }
// }

// 3

// let greeting = "Aloha!";

// for (let i = 3; i > 0; i -= 1) {
//   console.log(greeting);
// }

// 4

// for (let i = 1; i <= 100; i += 1) {
//   console.log(i * 2);
// }


// 5

// let array = [1, 2, 3, 4];
// let index = 0;

// while (index <= array.length) {
//   console.log(array[index]);
//   index += 1;
// }

// 6

// let cities = ['Istanbul', 'Los Angeles', 'Tokyo', null, 'Vienna', null, 'London', 'Beijing', null];

// for (let i = 0; i <= cities.length; i += 1) {
//   if (cities[i] === null) {
//     continue;
//   }
//   console.log(cities[i]);
// }

// 7

// for (let i = 0; ; i += 1) {
//   if (i === 1) {
//     break;
//   }
//   console.log("and on");
// }

// 8

// let num = 1;
// while (num <= 40) {
//   if (num % 2 !== 0) {
//     console.log(num);
//   }
//   num += 1;
// }


// 9

// let fish = ['Dory', 'Marlin', 'Gill', 'Nemo', 'Bruce'];

// let i = 0;
// while (i <= fish.length) {
//   console.log(fish[i]);
//   if (fish[i] === "Nemo") {
//     break;
//   }
//   i += 1
// }

// 10

// Conditionals

// -------------------------------------------------------------------------

// 1

// 0
// -0
// 0n
// false
// ""
// undefined
// null
// NaN


// 2

// let randomNumber = Math.round(Math.random());

// if (randomNumber) {
//   console.log("Yes");
// }
// else {
//   console.log("No");
// }

// 3

// let randomNumber = Math.round(Math.random());

// randomNumber ? console.log("yes") : console.log("no");


// 4

// let weather = "sunny";

// if (weather === "sunny") {
//   console.log("It's a beautiful day!");
// }
// else if (weather === "rainy") {
//   console.log("Grab your umbreally");
// }
// else {
//   console.log("Lets stay insie");
// }


// 5

// let animal = 'horse';

// switch (animal) {
//   case 'duck':
//     console.log('quack');
//   case 'squirrel':
//     console.log('nook nook');
//   case 'horse':
//     console.log('neigh');
//   case 'bird':
//     console.log('tweet tweet');
//   default:
//     console.log('*cricket*');
// }

// 6

// let weather = "sunny";
// switch(weather) {
//   case "sunny":
//     console.log("It's a beautiful day!");
//     break;
//   case "rainy":
//     console.log("Grab your umbreally");
//     break;
//   default:
//     console.log("Lets stay insie");
// }

// 7

// if (false || true) {
//   console.log('Yes!');
// } else {
//   console.log('No...');
// }

// 8

// if (true && false) {
//   console.log('Yes!');
// } else {
//   console.log('No...');
// }

// 9
// let sale = true;
// let admissionPrice = !sale ? 5.25 : 3.99;

// console.log('$' + admissionPrice);


// 10
// let speed = 0;
// let acceleration = 24;
// let brakingForce = 19;

// let isMoving = brakingForce < acceleration && (speed > 0 || acceleration > 0);

// console.log(isMoving);


// Functions 1

// -------------------------------------------------------------------------

// 1

// function sum(x, y) {
//   return x + y;
// }


// // 2

// function brendanEichQuote() {
//   console.log('Always bet on JavaScript.');
// }

// brendanEichQuote
// // 3

// function cite(author, quote) {
//   console.log(`${author} said: "${quote}"`);
// }


// // 4

// function squaredNumber (num) {
//   return num*num
// }

// squaredNumber(3); // 9

// // 5

// function multiplesOfThree() {
//   let divisor = 1;

//   for (let dividend = 3; dividend <= 30; dividend += 3) {
//     console.log(dividend + ' / ' + divisor + ' = 3');
//     divisor += 1;
//   }
// }

// multiplesOfThree();

// 6

// function compareByLength(string1, string2) {
//   if (string1.length > string2.length) {
//     return 1;
//   }
//   else if (string1.length > string2.length) {
//     return -1;
//   }
//   else {
//     return 0;
//   }
// }


// compareByLength('patience', 'perseverance'); // -1
// compareByLength('strength', 'dignity');      //  1
// compareByLength('humor', 'grace');           //  0


// // 7

// 'Captain Ruby'.replace('Ruby', 'JavaScript');

// // 8

// function greet(languageCode) {
//   switch (languageCode) {
//     case 'en': return 'Hi!';
//     case 'fr': return 'Salut!';
//     case 'pt': return 'Olá!';
//     case 'de': return 'Hallo!';
//     case 'sv': return 'Hej!';
//     case 'af': return 'Haai!';
//   }
// }

// // Example:
// console.log(greet('sv'));

// 9

// function extractLanguage(languageCode) {
//   switch(languageCode) {
//     case 'en_US.UTF-8' || 'en_GB.UTF-8': return "en";
//     case 'ko_KR.UTF-16': return 'ko';
//   }
// }


// extractLanguage('en_US.UTF-8');  // 'en'
// extractLanguage('en_GB.UTF-8');  // 'en'
// extractLanguage('ko_KR.UTF-16'); // 'ko'

// // 10
// function extractRegion(locale) {
//   return locale.split('.')[0]
//                .split('_')[1];
// }

// // Examples:
// console.log(extractRegion('en_US.UTF-8'));
// console.log(extractRegion('en_GB.UTF-8'));
// console.log(extractRegion('ko_KR.UTF-16'));

// // 11

// function localGreet(locale) {
//   let language = extractLanguage(locale);
//   let region = extractRegion(locale);

//   switch (region) {
//     case 'US': return 'Hey!';
//     case 'GB': return 'Hello!';
//     case 'AU': return 'Howdy!';
//     default: return greet(language);
//   }
// }



// Strings

// -------------------------------------------------------------------------

// 1

// console.log("These aren't the droids you're looking for.".length);

// 2

// console.log('confetti floating everywhere'.toUpperCase());


// 3

// function repeat(times, string) {
//   let index = 1;
//   while(index <= times) {
//   console.log(string);
//   index += 1;
//   }
// }
// repeat(3, 'ha'); // 'hahaha'

// // 4

// let pirate = "A pirate I was meant to be!\nTrim the sails and roam the sea!";
// console.log(pirate);

// 5

// let string1 = 'Polar Bear';
// let string2 = 'Polar bear';
// let string3 = 'Penguin';

// string1.toLowerCase() === string2.toLowerCase(); // true
// string1.toLowerCase() === string3.toLowerCase(); // false


// 6

// let byteSequence = 'TXkgaG92ZXJjcmFmdCBpcyBmdWxsIG9mIGVlbHMu';

// byteSequence.includes("x");


// 7

// function isBlank(string) {
//   return string.length === 0;
// }

// isBlank('mars'); // false
// isBlank('  ');   // false
// isBlank('');     // true

// 8

function isBlank(string) {
  return string.trim().length === 0;
}

// 9

let string = 'launch school tech & talk';
let words = string.split(" ");
let newArr = [];

for (let i = 0; i < words.length; i++) {
  let word = words[i]
  newArr.push(word[0].toUpperCase() + word.slice(1));
}

newArr.join(" ");


// Arrays

// -------------------------------------------------------------------------

// 1
function first(array) {
  return array[0];
}

// 2

function last(array) {
  return array[array.length -1];
}

last(['Earth', 'Moon', 'Mars']); // 'Mars'

// 3

let energy = ['fossil', 'solar', 'wind', 'tidal', 'fusion'];

energy.shift("fossil")
energy.push("geothermal")

// 4
let alphabet = 'abcdefghijklmnopqrstuvwxyz';
alphabet.split("");


// 5

// let scores = [96, 47, 113, 89, 100, 102];

// let count = 0;

// let index = 0;

// while (index < scores.length) {
//   if (scores[index] >= 100) {
//     count++;
//   }
//   index++;
// }

// let count = 0;
// for (let i = 0; i < scores.length; i++) {
//   if (scores[i] >= 100) {
//     count++;
//   }
// }

// 6

// let vocabulary = [
//   ['happy', 'cheerful', 'merry', 'glad'],
//   ['tired', 'sleepy', 'fatigued', 'drained'],
//   ['excited', 'eager', 'enthused', 'animated']
// ];


// vocabulary.forEach(function(nestedArray){
//   nestedArray.forEach(function(word) {
//     console.log(word);
//   });
// });

// // Expected output:
// // happy
// // cheerful
// // merry
// // etc...

// 7


// 8

// 9

// 10


// Functions

// -------------------------------------------------------------------------

// 1

function greet(greeting = "hello") {
  console.log(greeting + ', world!');
}

greet('Salutations'); // logs: Salutations, world!

greet();              // logs: undefined, world!
                      // should log: Hello, world!

// 2

function greet(greet = "Hello", para = "world") {
  console.log(greet + para);
}
greet();

// 3

// 4

// 5

// 6

// 7

// 8

// 9

// 10


// Objects

// -------------------------------------------------------------------------

// 1


let jane = {
  firstName: 'Jane',
  lastName: 'Harrelson',
  age: 32,
  location: {
    country: 'Denmark',
    city: 'Aarhus'
  },
  occupation: 'engineer',
  greet: function(name) {
    console.log(`Hey, ${name}`);
  }
};

jane.greet('Bobby'); // Hej, Bobby!
// 2

// 3

// 4

// 5

// 6

// 7

// 8

// 9

// 10


//

// -------------------------------------------------------------------------

// 1

// 2

// 3

// 4

// 5

// 6

// 7

// 8

// 9

// 10

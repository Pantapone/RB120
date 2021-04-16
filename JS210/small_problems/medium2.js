// 1

// function letterPercentages(string) {
//   let up = 0;
//   let low = 0;
//   let ne = 0;

//   string.split("").forEach((letter) => {
//     if (/[a-z]/.test(letter)) {
//       low+= 1;
//     }
//     else if (/[A-Z]/.test(letter)) {
//       up += 1;
//     }
//     else {
//       ne += 1;
//     } 
//   });
//   let length = string.length
//   low = String((low / length * 100).toFixed(2));
//   up = String((up / length * 100).toFixed(2));
//   ne = String((ne / length * 100).toFixed(2));

//   let result = {
//     lowercase: low, 
//     uppercase: up,
//     neither: ne
//   }
// return result;

// }


// console.log(letterPercentages('abCdef 123'));
// // { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

// console.log(letterPercentages('AbCd +Ef'));
// // { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

// console.log(letterPercentages('123'));
// // { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }


// 2

// function triangle(side1, side2, side3) {
//   const perimeter = side1 + side2 + side3;
//   const longest = Math.max(side1, side2, side3);
//   const shortest = Math.min(side1, side2, side3);
//   const middle = perimeter - longest - shortest;

//   if (isValid(shortest, middle, longest)) {
//     return getTriangleType(side1, side2, side3);
//   } else {
//     return 'invalid';
//   }
// }

// function isValid(shortest, middle, longest) {
//   return shortest > 0 && (shortest + middle > longest);
// }

// function getTriangleType(side1, side2, side3) {
//   if (side1 === side2 && side2 === side3) {
//     return 'equilateral';
//   } else if (side1 === side2 || side1 === side3 || side2 === side3) {
//     return 'isosceles';
//   } else {
//     return 'scalene';
//   }
// }


// console.log(triangle(3, 3, 3));        // "equilateral"
// console.log(triangle(3, 3, 1.5));      // "isosceles"
// console.log(triangle(3, 4, 5));        // "scalene"
// console.log(triangle(0, 3, 3));        // "invalid"
// console.log(triangle(3, 1, 1));        // "invalid"



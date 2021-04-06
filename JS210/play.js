let age = 20;
let future = 10;


console.log(`You are ${age} years old.`);
let n_future;
while (age < 60) {
    age += future;
    n_future += future;
    console.log(`In ${n_future}, you will be ${age} years old.`);
}
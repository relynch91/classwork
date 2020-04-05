const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

// reader.question("What is your name?", function (answer) {
//   console.log(`Hello ${answer}!`);
// });

// console.log("Last program line");

function addNumbers(sum, numsLeft, completionCallback) {
  if (!numsLeft) {
    return completionCallback(sum);
  }

  if (numsLeft > 0) {
    reader.question("Give me a number", function (answer) {
      let response = parseInt(answer);
      sum += response;
      console.log(sum);
      numsLeft -= 1;
      addNumbers(sum, numsLeft, completionCallback);
    });
  }
  console.log("hello")
}

addNumbers(0, 3, sum => {
  console.log(`Total Sum: ${sum}`);
  reader.close();
});
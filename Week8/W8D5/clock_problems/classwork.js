class Clock {
  constructor() {
    // 1. Create a Date object.
    this.date = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hours = this.date.getHours();
    this.minutes = this.date.getMinutes();
    this.seconds = this.date.getSeconds();
    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    let self = this;
    setInterval(this._tick.bind(this), 1000);
    //1000
  }
  
  printTime() {
    // Format the time in HH:MM:SS
    //let time = this.date.toTimeString().split(" ")[0];
    let time = `${this.hours}:${this.minutes}:${this.seconds}`;
    // Use console.log to print it.
    console.log(time);
  }
  
  _tick() {
    // 1. Increment the time by one second.
    this.seconds += 1;
    let newTime = { hours: this.hours, minutes: this.minutes, seconds : this.seconds};
    let clockFlag = false;
      //debugger;
      if (newTime.seconds === 60) {
        this.seconds = 0;
        this.minutes += 1;
      }

      if (newTime.minutes === 60) {
        this.minutes = 0;
        this.hours += 1;
      }

      if (newTime.hours === 24) {
        this.hours = 0;
      }
      // 2. Call printTime.
      this.printTime();
  }
}

const clock = new Clock();


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
    if (!numsLeft){
        return completionCallback(sum);
    }

    if (numsLeft > 0) {
        reader.question("Give me a number", function(answer) {
            let response = parseInt(answer);
            sum += response;
            console.log(sum);
            numsLeft -= 1;
            addNumbers(sum, numsLeft, completionCallback);
        });
    }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
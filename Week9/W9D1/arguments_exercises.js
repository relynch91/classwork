// // function sum() {
// //     let total = 0;
// //     for(let i = 0; i < arguments.length; i ++) {
// //         total += arguments[i];
// //     }
// //     return total;
// // }


// function sum(...numbers) {
//     let total = 0;
//     for (let i = 0; i < numbers.length; i++) {
//         total += numbers[i];
//     }
//     return total;
// }

// // console.log(sum(1, 2, 3, 4) === 10);
// // console.log(sum(1, 2, 3, 4, 5) === 15);

// // Function.prototype.myBind = function (context) {
// //     let that = this;
// //     // console.log(this)
// //     let fargs = Array.from(arguments).slice(1);
// //       return function () {
// //         //   console.log(arguments)
// //         let callArgs = Array.from(arguments);
// //         // let allArgs = fargs.concat(callArgs);
// //         that.apply(context, fargs.concat(callArgs));
// //         // console.log(allArgs);
// //       }
// // }

// Function.prototype.myBind = function (...args) {
//     let that = this;
//     let ctx = args.shift();
//     let bound_args = args;
//       return function (...call_args) {
//         // console.log(call_args)
//         // console.log(bound_args)
//         that.apply(ctx, bound_args.concat(call_args));
//       }
// }

// class Cat {
//   constructor(name) {
//     this.name = name;
//   }

//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }

// class Dog {
//   constructor(name) {
//     this.name = name;
//   }
// }

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // notMarkovSays("woof", "me");
// // notMarkovSays("moo", "me");
// // notMarkovSays("squeek", "me");
// // // Pavlov says meow to me!
// // true


function curriedSum(numArgs) {
  let numbers = [];
    // console.log(number)
  function _curriedSum(number) {
    numbers.push(number);
    let sum = 0;
    if (numbers.length === numArgs) {
      for (let i = 0; i < numbers.length; i++) {
        sum += numbers[i];
      };
      return sum;
    } else {
      return _curriedSum;
    };
  }
  
  return _curriedSum;
}

// const total = curriedSum(4);
// // console.log(total)
// console.log(total(5)(30)); // => 56

// console.log(curriedSum(4)(5)(30)(20)(1));

Function.prototype.curry = function (numArgs) {
    let args = [];
    let that = this;

    function _curried(args) {
        args.push(arg)
        if (args.length === numArgs) {
            that.apply()
        } else {
            return _curried;
        }
    }
    return _curried;
}


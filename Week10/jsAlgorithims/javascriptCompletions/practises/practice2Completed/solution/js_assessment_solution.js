// Write a recursive function, `factorialsRec(num)`, that returns the first
// `num` factorial numbers. Note that the 1st factorial number is 0!, which 
// equals 1. The 2nd factorial is 1!, the 3rd factorial is 2!, etc.
function factorialsRec(num) {
  if (num === 1) return [1];

  const facts = factorialsRec(num - 1);
  facts.push(facts[facts.length - 1] * (num - 1));
  return facts;
}

// Write an `Array.prototype.twoSum` method, that finds all pairs of positions
// where the elements at those positions sum to zero.

// NB: ordering matters. Each pair must be sorted with the smaller index
// before bigger index. The array of pairs must be sorted
// "dictionary-wise":
// [0, 2] before [1, 2] (smaller first elements come first)
// [0, 1] before [0, 2] (then smaller second elements come first)
Array.prototype.twoSum = function () {
  const pairs = [];
  for (let i = 0; i < this.length - 1; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) pairs.push([i, j]);
    }
  }

  return pairs;
};

// Write a function `titleize(str)` that capitalizes each word in a string like
// a book title. 
// Do not capitalize the following words (unless they are the first word in the 
// string): ["a", "and", "of", "over", "the"]
function titleize(title) {
  const littleWords = ['a', 'and', 'of', 'over', 'the'];

  const words = title.split(' ');
  const titleizedWords = words.map( (word, idx) => {
    if (idx !== 0 && littleWords.indexOf(word) >= 0) {
      return word.toLowerCase();
    } else {
      return word.slice(0, 1).toUpperCase() + word.slice(1);
    }
  });

  return titleizedWords.join(' ');
}

// Write an `Array.prototype.myEach(callback)` method that invokes a callback
// for every element in an array and returns undefined. Do NOT use the built-in
// `Array.prototype.forEach`.
Array.prototype.myEach = function (func) {
  for (let i = 0; i < this.length; i++) {
    func(this[i]);
  }
};

// Write an `Array.prototype.myReduce(callback, acc)` method which takes a
// callback and an optional argument of a default accumulator. If myReduce only 
// receives one argument, then use the first element of the array as the default 
// accumulator. Use the `Array.prototype.myEach` method you defined above. Do 
// NOT call in the built-in `Array.prototype.reduce` or `Array.prototype.forEach` 
// methods.
Array.prototype.myReduce = function (callback, acc) {
  const array = this.slice();
  if (typeof acc === 'undefined') {
    acc = array.shift();
  }

  array.myEach(el => {
    acc = callback(acc, el);
  });

  return acc;
};

// Write an `Array.prototype.mergeSort` method that merge sorts an array. It
// should take an optional callback that compares two elements, returning -1 if 
// the first element should appear before the second, 0 if they are equal, and 1 
// if the first element should appear after the second. Define and use a helper 
// method, `merge(left, right, comparator)`, to merge the halves. 
//
// **IMPORTANT: Make sure to use a function declaration (`function merge`) as
// opposed to a function expression (`const merge = function`) for `merge`. Do
// NOT use the built-in `Array.prototype.sort` method in your implementation.**
//
// Here's a summary of the merge sort algorithm:
//
// Split the array into left and right halves, then merge sort them recursively
// until a base case is reached. Use a helper method, merge, to combine the
// halves in sorted order, and return the merged array.
Array.prototype.mergeSort = function (func) {
  if (this.length <= 1) return this;

  if (!func) func = (left, right) => {
    return left < right ? -1 : left > right ? 1 : 0;
  };

  const midpoint = Math.floor(this.length / 2);
  const sortedLeft = this.slice(0, midpoint).mergeSort(func);
  const sortedRight = this.slice(midpoint).mergeSort(func);
  return merge(sortedLeft, sortedRight, func);
};

function merge(left, right, comparator) {
  let merged = [];

  while (left.length && right.length) {
    switch (comparator(left[0], right[0])) {
      case -1:
        merged.push(left.shift());
        break;
      case 0:
        merged.push(left.shift());
        break;
      case 1:
        merged.push(right.shift());
        break;
    }
  }

  merged = merged.concat(left, right);
  return merged;
}

// Write a `Function.prototype.inherits(ParentClass)` method. It should extend
// the methods of `ParentClass.prototype` to `ChildClass.prototype`.
//
// **Do NOT use `Object.create`, `Object.assign`, `Object.setPrototypeOf`, or
// modify the `__proto__` property of any object directly.**
Function.prototype.inherits = function(Parent) {
  function Surrogate() {}
  Surrogate.prototype = Parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

// Write a `Function.prototype.myApply(context, argsArr)` method that accepts an
// object and an array of additional arguments. It should call the function with 
// the passed-in object as `this`, also passing the arguments array. Do NOT use 
// the built-in `Function.prototype.apply` or `Function.prototype.call` methods
// in your implementation.
Function.prototype.myApply = function (context, args = []) {
  return this.bind(context)(...args);
};

// Also works (passing arguments at bind-time vs call-time)
Function.prototype.myApply = function (context, args = []) {
  return this.bind(context, ...args)();
};

// Write a `Function.prototype.myCurry(numArgs)` method that collects arguments
// until the number of arguments collected is equal to the original `numArgs` 
// value and then invokes the curried function.
Function.prototype.myCurry = function (numArgs) {
  let nums = [];
  let fcn = this;
  return function _myCurry (el) {
    nums.push(el);
    if (nums.length < numArgs) {
      return _myCurry;
    } else {
      return fcn(...nums);
    }
  };
};


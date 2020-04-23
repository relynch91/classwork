// Write a function, `exponent(b, n)`, that calculates b^n recursively.
// Your solution should accept negative values for n. Do NOT use ** or Math.pow
function exponent(b, n) {
  if (n === 0) return 1;

  if (n > 0) {
    return b * exponent(b, n - 1);
  } else {
    return 1/b * exponent(b, n + 1);
  }
}

// Write a recursive function `recSum(numArr)` that returns the sum of all
// elements in an array. Assume all elements are numbers.
function recSum(nums) {
  if (!nums.length) return 0;
  return nums[0] + recSum(nums.splice(1));
}

// Write a recursive function `stringIncludeKey(string, key)` that takes in
// a string to search and a key string. Return true if the string contains all 
// of the characters in the key in the same order that they appear in the key.
//
// stringIncludeKey("cadbpc", "abc") => true
// stringIncludeKey("cba", "abc") => false
function stringIncludeKey(string, key) {
  if (!key.length) return true;

  let nextKeyChar = key[0];
  let keyIndex = string.indexOf(nextKeyChar);

  if (keyIndex < 0) return false;
  return stringIncludeKey(string.slice(keyIndex + 1), key.slice(1));
}

// Write a function `firstEvenNumbersSum(n)` that returns the sum of the
// first n even numbers recursively. Assume n > 0
function firstEvenNumbersSum(n) {
  if (n === 1) return 2;
  return 2 * n + firstEvenNumbersSum(n - 1);
}

// Write a function, `fibsSum(n)`, that finds the sum of the first n
// fibonacci numbers recursively. Assume n > 0.
// Note that for this problem, the fibonacci sequence starts with [1, 1]. 
function fibsSum(n) {
  if (n === 1) return 1;
  if (n === 2) return 2;

  return fibsSum(n - 1) + fib(n);
}

// Helper Method to calculate nth fib
function fib(n) {
  if (n === 1) return 1;
  if (n === 2) return 1;
  return fib(n - 1) + fib(n - 2);
}

// Alternate solution - one neat trick to calculate fibs sum is to take the 
// previous two fib sums and add 1 to it. This works because of the nature of 
// the fibonacci sequence.
function fibsSum(n) {
  if (n === 1) return 1;
  if (n === 2) return 2;

  return fibsSum(n - 1) + fibsSum(n - 2) + 1;
}

// Write a function, `digitalRoot(num)`. It should sum the digits of a positive
// integer. If the result is greater than 9 (i.e. more than one digit), sum the 
// digits of the resulting number. Keep repeating until there is only one digit 
// in the result, called the "digital root". 
// **Do not use string conversion within your method.** 
// For further explanation on the digital root concept, refer here: https://en.wikipedia.org/wiki/Digital_root
//
// You may wish to use a helper function, `digitalRootStep(num)` which performs
// one step of the process.
function digitalRoot(num) {
  while (num > 10) {
    num = digitalRootStep(num);
  }

  return num;
}

function digitalRootStep(num) {
  let root = 0;

  while (num > 0) {
    root += num % 10;
    num = Math.floor(num/10);
  }

  return root;
}

// Alternate Solution
function digitalRoot(num) {
  const digits = [];

  while (num > 0) {
    digits.push(num % 10);
    num = Math.floor(num/10);
  }

  const digitSum = digits.reduce((sum, digit) => sum + digit);

  return digitSum > 10 ? digitalRoot(digitSum) : digitSum;
}

// Magical one - line solution
function digitalRoot(num) {
  return num < 10 ? num : digitalRoot(digitalRoot(Math.floor(num / 10)) + (num % 10));
}

// Write a function, `deepDup(arr)`, that will perform a "deep" duplication of
// the array and any interior arrays. A deep duplication means that the array 
// itself, as well as any nested arrays (no matter how deeply nested) are duped 
// and are completely different objects in memory than those in the original 
// array.
function deepDup(arr) {
  return arr.map(el => el instanceof Array ? deepDup(el) : el);
}

// Write a recursive function, `factorialsRec(num)`, that returns the first
// `num` factorial numbers. Note that the 1st factorial number is 0!, which 
// equals 1. The 2nd factorial is 1!, the 3rd factorial is 2!, etc.
function factorialsRec(num) {
  if (num === 1) return [1];

  const facts = factorialsRec(num - 1);
  facts.push(facts[facts.length - 1] * (num - 1));
  return facts;
}


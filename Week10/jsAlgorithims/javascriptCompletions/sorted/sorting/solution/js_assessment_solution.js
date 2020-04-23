// Write a recursive function, `binarySearch(sortedArray, target)`, that returns
// the index of `target` in `sortedArray`, or -1 if it is not found.
//
// Here's a quick summary of the binary search algorithm:
//
// Start by looking at the middle item of the array. If it matches the target,
// return its index. Otherwise, recursively search either the left or the right
// half of the array until the target is found or the base case (empty array) is
// reached.
function binarySearch(array, target) {
  if (array.length === 0) return -1;
  
  const midpoint = Math.floor(array.length / 2);
  if (array[midpoint] > target) {
    return binarySearch(array.slice(0, midpoint), target);
  } else if (array[midpoint] < target) {
    const subResult = binarySearch(array.slice(midpoint + 1), target);
    return subResult === -1 ? -1 : subResult + midpoint + 1;
  } else {
    return midpoint;
  }
}

// Write an `Array.prototype.bubbleSort(callback)` method, that bubble sorts an array.
// It should take an optional callback that compares two elements, returning
// -1 if the first element should appear before the second, 0 if they are
// equal, and 1 if the first element should appear after the second. Do NOT call
// the built-in Array.prototype.sort method in your implementation. Also, do NOT
// modify the original array.
//
// Here's a quick summary of the bubble sort algorithm:
//
// Iterate over the elements of the array. If the current element is unsorted
// with respect to the next element, swap them. If any swaps are made before
// reaching the end of the array, repeat the process. Otherwise, return the
// sorted array.
const defaultCallback = (num1, num2) => {
  if (num1 < num2) {
    return -1;
  } else if (num1 === num2) {
    return 0;
  } else {
    return 1;
  }
};

Array.prototype.bubbleSort = function (callback) {
  if (typeof callback !== "function") {
    callback = defaultCallback;
  }

  let resultArr = this.slice();
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (let i = 1, n = resultArr.length; i < n; i++) {
      if (callback(resultArr[i - 1], resultArr[i]) === 1) {
        sorted = false;
        let swap = resultArr[i - 1];
        resultArr[i - 1] = resultArr[i];
        resultArr[i] = swap;
      }
    }
  }
  return resultArr;
};

// Write a function `jumbleSort(string, alphabet)`.
// Jumble sort takes a string and an alphabet. It returns a copy of the string
// with the letters re-ordered according to their positions in the alphabet. If
// no alphabet is passed in, it defaults to normal alphabetical order (a-z).
//
// The English alphabet, in order, is 'abcdefghijklmnopqrstuvwxyz'
//
// **Do NOT use the built-in `Array.prototype.sort` in your implementation.**
//
// Example:
// jumbleSort("hello") => "ehllo"
// jumbleSort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'
function jumbleSort(str, alphabet = null) {
  alphabet = alphabet || 'abcdefghijklmnopqrstuvwxyz'.split('');
  str = str.split('');

  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (let i = 0; i < str.length; i++) {
      if (i === str.length - 1) break;
      let current = str[i];
      let next = str[i + 1];
      if (alphabet.indexOf(current) > alphabet.indexOf(next)) {
        str[i] = next;
        str[i + 1] = current;
        sorted = false;
      }
    }
  }

  return str.join('');
}

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

// Write an `Array.prototype.quickSort(callback)` method that quick sorts an array.
// It should take an optional callback that compares two elements, returning -1 
// if the first element should appear before the second, 0 if they are equal, and
// 1 if the first element should appear after the second. Do NOT call the 
// built-in Array.prototype.sort method in your implementation.
//
// Here's a summary of the quick sort algorithm:
//
// Choose a pivot element, then iterate over the rest of the array, moving the 
// remaining elements on to the appropriate side of the pivot. Recursively quick 
// sort each side of the array until a base case is reached. 
Array.prototype.quickSort = function (func) {
  if (this.length < 2) return this;

  if (!func) {
    func = (x, y) => {
      if (x < y) return - 1;
      return 1;
    };
  }

  const pivot = this[0];
  let left = this.slice(1).filter((el) => func(el, pivot) === -1);
  let right = this.slice(1).filter((el) => func(el, pivot) !== -1);
  left = left.quickSort(func);
  right = right.quickSort(func);

  return left.concat([pivot]).concat(right);
};


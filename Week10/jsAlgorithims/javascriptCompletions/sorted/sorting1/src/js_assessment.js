// Write a recursive function, `binarySearch(sortedArray, target)`, that returns
// the index of `target` in `sortedArray`, or -1 if it is not found. Do NOT use
// the built-in `Array.prototype.indexOf` or `Array.prototype.includes` methods 
// in your implementation.

function binarySearch(array, target) {
  if (array.length === 0) {
      return -1;
  }
  let midpoint = Math.floor(array.length / 2);

  if (array[midpoint] > target) {
      return binarySearch(array.slice(0, midpoint), target);
  } else if (array[midpoint] < target) {
    let answer = (binarySearch(array.slice(midpoint + 1), target));
    if (answer === -1) {
        return -1;
    } else {
        return (midpoint + answer + 1)
    }
  } else if(array[midpoint] === target) {
      return midpoint;
  }
}

// let array = [1, 2, 3, 4, 5, 6, 7];
// console.log(binarySearch(array, 7))
// Here's a quick summary of the binary search algorithm:
//
// Start by looking at the middle item of the array. If it matches the target,
// return its index. Otherwise, recursively search either the left or the right
// half of the array until the target is found or the base case (empty array) is
// reached.

// Write an `Array.prototype.mergeSort` method that merge sorts an array. It
// should take an optional callback that compares two elements, returning -1 if 
// the first element should appear before the second, 0 if they are equal, and 1 
// if the first element should appear after the second. Define and use a helper 
// method, `merge(left, right, comparator)`, to merge the halves. 
Array.prototype.mergeSort= function(helper) {
    if (this.length <= 1) {
        return this;
    }
    let midpoint = Math.floor(this.length / 2)
    let sortedLeft = this.slice(0, midpoint).mergeSort(helper);
    let sortedRight = this.slice(midpoint).mergeSort(helper);
    console.log(sortedLeft);
    console.log(sortedRight);
    return merge(sortedLeft, sortedRight, helper)
}

let array = [1, 5, 2, 4, 3];
// console.log(array.mergeSort());

// let left = [1, 3, 5];
// let right = [2, 4, 6];

function merge(left, right, helper) {
    if (!helper) {
        helper = (left, right) => {
            if (left < right) {
                return -1;
            } else if (left === right) {
                return 0;
            } else {
                return 1;
            }
        };
    };
    let merged = [];
    
    while (left.length && right.length) {
        switch(helper(left[0], right[0])) {
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
    return (merged.concat(left, right));
}
// console.log(merge(left, right))
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

// Write a function `jumbleSort(string, alphabet)`.
// Jumble sort takes a string and an alphabet. It returns a copy of the string
// with the letters re-ordered according to their positions in the alphabet. If
// no alphabet is passed in, it defaults to normal alphabetical order (a-z).
//
// The English alphabet, in order, is 'abcdefghijklmnopqrstuvwxyz'
//
// **Do NOT use the built-in `Array.prototype.sort` in your implementation.**

// Example:
// jumbleSort("hello") => "ehllo"
// jumbleSort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

function jumbleSort(string, alphabet) {
    if (!alphabet) {
        alphabet = 'abcdefghijklmnopqrstuvwxyz'
    }
    let pos = [];
    for (let i = 0; i < string.length; i ++) {
        let value = alphabet.indexOf(string[i]);
        pos.push(value);
    }
    let newPos = [];
    while (pos.length != 0) {
        let min = pos[0];
        let idx = 0;
        for(let j = 0; j < pos.length; j ++) {
            if (pos[j] < min) {
                min = pos[j];
                idx = j;
            }
        }
        let ele = pos.splice(idx, 1);
        newPos.push(ele)
    }
    let answer = ""
    for (let j = 0; j < newPos.length; j ++) {
        let letter = alphabet[newPos[j]];
        answer += letter
    }
    return answer;
}

console.log(jumbleSort("hello"));
console.log(jumbleSort("hello", ['o', 'l', 'h', 'e']))

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

Array.prototype.quickSort = function(callback) {
    if (!callback) {
        callback = (one, two) => {
            if (one < two) {
                return -1;
            } else if (one === two) {
                return 0;
            } else {
                return 1;
            }
        }
    }
    if (this.length === 0) {
        return [];
    }
    else if (this.length === 1) {
        return this;
    }
    let pivot = this[0];
    let right = [];
    let left = [];
    for (let i = 1; i < this.length; i ++) {
        if (callback(pivot, this[i]) === 1) {
            left.push(this[i]);
        } else {
            right.push(this[i]);
        }
    }
    left = left.quickSort(callback);
    right = right.quickSort(callback);
    return left.concat([pivot]).concat(right);
}
// const a = [2, 1, 3, 5, 0, 8, 4, 7, 6];
// console.log(a.quickSort());


// Write an `Array.prototype.bubbleSort(callback)` method, that bubble sorts an array.
// It should take an optional callback that compares two elements, returning
// -1 if the first element should appear before the second, 0 if they are
// equal, and 1 if the first element should appear after the second. Do NOT call
// the built-in `Array.prototype.sort` method in your implementation. Also, do NOT
// modify the original array.
//
// Here's a quick summary of the bubble sort algorithm:
//
// Iterate over the elements of the array. If the current element is unsorted
// with respect to the next element, swap them. If any swaps are made before
// reaching the end of the array, repeat the process. Otherwise, return the
// sorted array.

let array1 = [4, 2, 6, 8, 1];

Array.prototype.bubbleSort = function(callback) {
    if (!callback) {
        callback = function(one, two) {
            if (one < two) {
                return -1;
            } else {
                return 1;
            }
        }
    }
    sorted = true;
    // console.log(this)
    let array = this.slice();
    while (sorted) {
        sorted = false;
        for (let i = 0; i < array.length - 1; i ++) {
            let first = array[i];
            let second = array[i + 1];
            console.log(first, second);
            if (callback(first, second) != -1) {
                let oldi = array[i];
                let oldi2 = array[i + 1]
                array[i] = oldi2;
                array[i + 1] = oldi;
                sorted = true;
                // console.log(this[i], this[i + 1]);
                
                // break;
            }
        }

    }
    return array
}
console.log(array1.bubbleSort())

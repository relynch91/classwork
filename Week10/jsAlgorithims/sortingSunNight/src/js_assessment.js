// Write a recursive function, `binarySearch(sortedArray, target)`, that returns
// the index of `target` in `sortedArray`, or -1 if it is not found. Do NOT use
// the built-in `Array.prototype.indexOf` or `Array.prototype.includes` methods 
// in your implementation.
//
// Here's a quick summary of the binary search algorithm:
//
// Start by looking at the middle item of the array. If it matches the target,
// return its index. Otherwise, recursively search either the left or the right
// half of the array until the target is found or the base case (empty array) is
// reached.
let array = [1, 2, 3, 4, 5, 6, 7];

function binarySearch(array, target) {
    if (array.length === 0) {
        return -1;
    }
    let mid = Math.floor((array.length / 2));
    if (array[mid] === target) {
        return mid;
    } else if (array[mid] > target) {
        return binarySearch(array.slice(0, mid), target);
    } else {
        let idx = binarySearch(array.slice(mid + 1), target);
        if (idx === -1) {
            return -1;
        } else {
            return mid + idx + 1;
        }
    }
}

console.log(binarySearch(array, 7));


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
let other = [1, 5, 2, 4, 3];
function helper(num1, num2) {
    if (num1 < num2) {
        return -1;
    } else if (num1 === num2) {
        return 0;
    } else {
        return 1;
    }
}
Array.prototype.mergeSort = function(callback) {
    if (!callback) {
        callback = helper;
    }
    if (this.length <= 1) {
        return this;
    }
    let mid = Math.floor(this.length / 2);
    let left = this.slice(0, mid).mergeSort(callback);
    let right = this.slice(mid).mergeSort(callback);
    return merge(left, right, callback);
}

function merge(left, right, comparator) {
    let merged = [];
    while (left.length && right.length) {
        let answer = comparator(left[0], right[0]);
        if (answer === -1) {
            merged.push(left.shift());
        } else {
            merged.push(right.shift());
        }
    }
    return merged.concat(left).concat(right);
}

console.log(other.mergeSort());
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

// Write an `Array.prototype.quickSort(callback)` method that quick sorts an array. 
// It should take an optional callback that compares two elements, returning -1 
// if the first element should appear before the second, 0 if they are equal, and
// 1 if the first element should appear after the second. Do NOT call the 
// built-in Array.prototype.sort method in your implementation.
//
// Here's a summary of the quick sort algorithm:

function defaultCallback(num1, num2) {
    if (num1 < num2) {
        return -1;
    } else if (num1 === num2) {
        return 0;
    } else {
        return 1;
    }
}

Array.prototype.quickSort(callback) {
    if (!callback) {
        callback = defaultCallback();
    }
    if (this.length === 0) {
        return -1;
    }
    let pivot = this[0];
    let less = this.slice(1).filter((el) => funct
    })
}
//
// Choose a pivot element, then iterate over the rest of the array, moving the 
// remaining elements on to the appropriate side of the pivot. Recursively quick 
// sort each side of the array until a base case is reached. 

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


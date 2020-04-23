// Write a recursive function, `binarySearch(sortedArray, target)`, that returns
// the index of `target` in `sortedArray`, or -1 if it is not found. Do NOT use
// the built-in `Array.prototype.indexOf` or `Array.prototype.includes` methods 
// in your implementation.
//
// Here's a quick summary of the binary search algorithm:
//
// Start by looking at the middle item of the array. If it matches the target,
// return its index. Otherwise, recursively search either the left or the right
// half of the array until the target is found or the base case (empty array) 
// reached.
function binarySearch(array, target) {
    if (array.length === 0) {
        return -1;
    }
    let copy = array.slice();
    let mid = Math.floor(copy.length / 2);
    if (copy[mid] < target) {
        let found = binarySearch(array.slice(mid + 1), target);
        if (found === -1) {
            return -1;
        } else {
            return (mid + 1 + found)

        }
    } else if (copy[mid] > target) {
        return binarySearch(array.slice(0, mid), target)
    } else {
        return mid;
    }
}

// let array = [1, 2, 3, 4, 5, 6, 7];
// console.log(binarySearch(array, 5))
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

const optional = function(num1, num2) {
    if (num1 < num2) {
        return -1;
    } else if (num1 === num2) {
        return 0;
    } else {
        return 1;
    }
}

Array.prototype.bubbleSort = function(callback) {
    if(!callback) {
        console.log(callback)
        callback = optional;
    }
    console.log(callback)
    let that = this.slice();
    sorted = true;
    while (sorted) {
        sorted = false;
        for(let i = 0; i < that.length - 1; i ++) {
            if (callback(that[i], that[i + 1]) === 1){
                let swap = that[i];
                that[i] = that[i + 1];
                that[i + 1] = swap;
                sorted = true;
            }
        }
    }
    return that;
}

// let array = [1, 3, 2, 4, 7, 6, 5];
// console.log(array.bubbleSort());

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

function jumbleSort(string, alphabet) {
    if (!alphabet) {
        alphabet = 'abcdefghijklmnopqrstuvwxyz';
    }
    let indexes = [];
    for (let i = 0; i < string.length; i ++) {
        let idx = alphabet.indexOf(string[i]);
        indexes.push(idx);
    }
    let newArray = [];
    console.log(indexes)
    let exist = true;
    while (exist) {
        if (indexes.length === 0) {
            console.log("here")
            exist = false;
        }
        let leastIdx = 0; 
        for (let j = 0; j < indexes.length; j ++) {
            if (indexes[j] < indexes[leastIdx]) {
                leastIdx = j;
                exist = true;
            }
        }
        let next = indexes.splice(leastIdx, leastIdx + 1);
        newArray.push(next)
    }
    return newArray
}

// console.log(jumbleSort("zebra"))
// console.log(jumbleSort("hello", ['o', 'l', 'h', 'e']))

// Write an `Array.prototype.mergeSort` method that merge sorts an array. It
// should take an optional callback that compares two elements, returning -1 if 
// the first element should appear before the second, 0 if they are equal, and 1 
// if the first element should appear after the second. Define and use a helper 
// method, `merge(left, right, comparator)`, to merge the halves. 

Array.prototype.mergeSort = function(func) {
    if(this.length <= 1) {
        return this;
    }
    if (!func) {
        func = (left, right) => {
            if (left > right) {
                return 1;
            } else if (left === right) {
                return 0;
            } else {
                return -1;
            }
        }
    }
    const mid = Math.floor(this.length / 2);
    const smaller = this.slice(0, mid).mergeSort(func);
    const larger = this.slice(mid).mergeSort(func);
    return merge(smaller, larger, func);
}

function merge(smaller, larger, func) {
    let merged = [];
    while (smaller.length && larger.length) {
        switch(func(smaller[0], larger[0])) {
            case -1: 
                console.log("yes")
                merged.push(smaller.shift());
                break;
            case 0: 
                console.log("no")
                merged.push(smaller.shift());
                break;
            case 1: 
                console.log("fuck")
                merged.push(larger.shift());
                break;
        }
    }
    console.log(merged)
    return merged.concat(smaller).concat(larger)
}
// console.log([3, 4, 2, 5, 1].mergeSort());
// **IMPORTANT: Make sure to use a function declaration (`function merge`) as
// opposed to a function expression (`const merge = function`) for `merge`. Do
// NOT use the built-in `Array.prototype.sort` method in your implementation.**
//
// Here's a summary of the merge sort algorithm:
//
// Split the array into left and right halves, then merge sort them recursively
// until a base case is reached. Use a helper method, merge, to combine the
// halves in sorted order, and return the merged array.

// Write an `Array.prototype.quickSort(callback)` method that quick sorts an array. 
// It should take an optional callback that compares two elements, returning -1 
// if the first element should appear before the second, 0 if they are equal, and
// 1 if the first element should appear after the second. Do NOT call the 
// built-in Array.prototype.sort method in your implementation.
//
// Here's a summary of the quick sort algorithm:

Array.prototype.quickSort = function (func) {
    if (this.length < 2) {
        return this;
    }
    if(!func) {
        func = (num1, num2) => {
            if (num1 < num2) {
                return -1;
            } else if (num1 === num2) {
                return 0;
            } else {
                return 1;
            }
        }
    }
    let pivot = this[0];
    let left = this.slice(1).filter((el) => func(el, pivot) === -1);
    let right = this.slice(1).filter((el) => func(el, pivot) > -1);
    left = left.quickSort(func);
    right = right.quickSort(func);
    console.log(left)
    console.log(right)
    return left.concat([pivot]).concat(right);
}

console.log([1, 5, 2, 4, 3].quickSort())
//
// Choose a pivot element, then iterate over the rest of the array, moving the 
// remaining elements on to the appropriate side of the pivot. Recursively quick 
// sort each side of the array until a base case is reached. 


// Write a function, `exponent(b, n)`, that calculates b^n recursively. 
// Your solution should accept negative values for n. Do NOT use ** or Math.pow
function exponent(b, n) {
    if (n === 0) {
        return 1;
    } else if (n === 1) {
        return b;
    }
    let flagged = false;
    if (n < 0) {
        n = n * (-1);
        flagged = true;
    }
    let next = exponent(b, (n - 1));

    if (flagged) {
        return (1 / (b * next));
    } else {
        return b * next;
    }
}
// console.log(exponent(5, -3))

// Write an `Array.prototype.median` method that returns the median of elements
// in an array. If the length is even, return the average of the middle two 
// elements.
let array = [3, 2, 6, 7, 1];
Array.prototype.median = function () {
    if (this.length === 0) {
        return null;
    }
    let sorted = this.sort();
    let mid = Math.floor(sorted.length / 2)
    console.log(sorted)

    if ((sorted.length % 2) === 1){
        return sorted[mid];
    } else {
        let average = ((sorted[mid] + sorted[mid -1]) / 2);
        return average;
    }
}

// console.log(array.median()); 

// Write a `String.prototype.symmetricSubstrings` method that returns an array
// of substrings which are palindromes in alphabetical order. Only include 
// substrings of length > 1.
// e.g. "cool".symmetricSubstrings() => ["oo"]

String.prototype.symmetricSubstrings = function () {
    let answer = [];

    for (let i = 0; i < this.length; i ++) {
        for (let j = i + 1; j < this.length; j ++) {
            let word = this.slice(i, j + 1);
            let reverse = word.split("").reverse().join("");
            console.log(word);
            console.log(reverse);
            if (word === reverse) {
                answer.push(word);
            }
        }
    }
    return answer.sort();
}

// console.log("aba1cdc".symmetricSubstrings());
// Write an `Array.prototype.myEach(callback)` method that invokes a callback
// for every element in an array and returns undefined. Do NOT use the built-in
// `Array.prototype.forEach`.
Array.prototype.myEach = function(callback) {
    for (let i = 0; i < this.length; i ++){
        callback(this[i]);
    }
    return undefined;
}

// Write an `Array.prototype.myEvery(callback)` method that returns true 
// if the callback returns true for every element in the array, and otherwise 
// returns false. Use the `Array.prototype.myEach` method you defined above. Do 
// NOT call the built-in `Array.prototype.every` or `Array.prototype.forEach` 
// methods.
Array.prototype.myEvery = function(callback) {
    let count = true;
    for (let i = 0; i < this.length; i ++) {
        this.myEach(callback)
    }
    this.myEach((el) => {
        if (!callback(el)) count = false;
    })
    return count;

}

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
function defaultHelper (num1, num2) {
    if (num1 > num2) {
        return 1;
    } else {
        return -1;
    }
}

Array.prototype.bubbleSort = function(callback) {
    if (!callback) {
        callback = defaultHelper;
    }
    // console.log(callback);
    sorted = true
    let copy = this.slice();
    while (sorted) {
        sorted = false;
        for(let i = 0; i < copy.length - 1; i ++) {
            if (callback(copy[i], copy[i + 1]) === 1){
                let swap = copy[i];
                copy[i] = copy[i + 1];
                copy[i + 1] = swap;
                sorted = true;
            }
        }
    }
    return copy;
}

console.log([1, 3, 2, 5, 2].bubbleSort());


// Write a `Function.prototype.inherits(ParentClass)` method. It should extend
// the methods of `ParentClass.prototype` to `ChildClass.prototype`.
//
// **Do NOT use `Object.create`, `Object.assign`, `Object.setPrototypeOf`, or
// modify the `__proto__` property of any object directly.**
Function.prototype.inherits = function(Parent) {
    function Surrogate () {}
    Surrogate.prototype = Parent.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
}


// Write a `Function.prototype.myCurry(numArgs)` method that collects arguments 
// until the number of arguments collected is equal to the original `numArgs` 
// value and then invokes the curried function.
Function.prototype.myCurry = function(numArgs) {
    let nums = [];
    let fcn = this;
    return function _myCurry(el) {
        nums.push(el);
        if(nums.length < numArgs) {
            return _myCurry;
        } else {
            return fcn(...nums);
        }
    }
}


// Write a `Function.prototype.myBind(context)` method. It should return a copy
// of the original function, where `this` is set to `context`. It should allow 
// arguments to the function to be passed both at bind-time and call-time.
// Note that you are NOT allowed to use ES6 arrow syntax for this problem.

Function.prototype.myBind = function (context, ...bindArgs) {
    let that = this;
    return function (...callArgs) {
        return that.apply(context, bindArgs.concat(callArgs))
    }
}
   


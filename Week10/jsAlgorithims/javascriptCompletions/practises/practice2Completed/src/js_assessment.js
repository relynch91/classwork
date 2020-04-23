// Write a recursive function, `factorialsRec(num)`, that returns the first 
// `num` factorial numbers. Note that the 1st factorial number is 0!, which 
// equals 1. The 2nd factorial is 1!, the 3rd factorial is 2!, etc.
function factorialsRec(num) {
    let answer = [1];
    if (num === 1) {
        return answer;
    }
    let nextNum = factorialsRec((num - 1))
    nextNum.push(nextNum[nextNum.length - 1] * (num - 1) );
    return nextNum;
}

// Write an `Array.prototype.twoSum` method, that finds all pairs of positions 
// where the elements at those positions sum to zero.

Array.prototype.twoSum = function() {
    let answer = [];
    for(let i = 0; i < this.length - 1; i ++) {
        for(let j = i + 1; j < this.length; j ++) {
            if ((this[i] + this[j]) === 0) {
                answer.push([i, j]);
            }
        }
    }
    return answer
}

// NB: ordering matters. Each pair must be sorted with the smaller index
// before bigger index. The array of pairs must be sorted
// "dictionary-wise":
// [0, 2] before [1, 2] (smaller first elements come first)
// [0, 1] before [0, 2] (then smaller second elements come first)

// Write a function `titleize(str)` that capitalizes each word in a string like
// a book title. 
// Do not capitalize the following words (unless they are the first word in the 
// string): ["a", "and", "of", "over", "the"]
function titleize(str) {
    let answer = [];
    let dictionary = ["a", "and", "of", "over", "the"]
    let words = str.split(" ");
    for(let i = 0; i < words.length; i ++) {
        let word = words[i];
        if (i === 0) {
            let firstLetter = word.slice(0, 1);
            let newWord = firstLetter.toUpperCase() + word.slice(1);
            answer.push(newWord);
        } else if (!dictionary.includes(word)) {
            let firstLetter = word.slice(0, 1);
            let newWord = firstLetter.toUpperCase() + word.slice(1);
            answer.push(newWord);
        } else {
            answer.push(word);
        }
    }
    return answer.join(" ")
}

// console.log(titleize("david copperfield"))
// console.log(titleize("jaws"))


// Write an `Array.prototype.myEach(callback)` method that invokes a callback
// for every element in an array and returns undefined. Do NOT use the built-in
// `Array.prototype.forEach`.
Array.prototype.myEach = function (callback) {
    for (let i = 0; i < this.length; i ++){
        callback(this[i]);
    }

}

// Write an `Array.prototype.myReduce(callback, acc)` method which takes a 
// callback and an optional argument of a default accumulator. If myReduce only 
// receives one argument, then use the first element of the array as the default 
// accumulator. Use the `Array.prototype.myEach` method you defined above. Do 
// NOT call in the built-in `Array.prototype.reduce` or `Array.prototype.forEach` 
// methods.
Array.prototype.myReduce = function(callback, acc) {
    let array = this.slice();
    if (typeof acc === "undefined") {
        acc = array.shift();
    }
    array.myEach(el => {
        acc = callback(acc, el);
    })
    return acc;
}


// console.log(myReduce(callback, acc))

// Write an `Array.prototype.mergeSort` method that merge sorts an array. It
// should take an optional callback that compares two elements, returning -1 if 
// the first element should appear before the second, 0 if they are equal, and 1 
// if the first element should appear after the second. Define and use a helper 
// method, `merge(left, right, comparator)`, to merge the halves.
let array = [1, 4, 3, 5, 2]
let callback = undefined;

Array.prototype.mergeSort = function (callback) {
    if (this.length <= 1) {
        return this;
    } 
    if (!callback) callback = (left, right) => {
        return left < right ? -1 : left > right ? 1 : 0;
    };
    let mid = Math.floor(this.length / 2);
    let sortedLeft = this.slice(0, mid).mergeSort(callback);
    let sortedRight = this.slice(mid).mergeSort(callback);
    console.log(sortedLeft);
    console.log(sortedRight);
    return merge(sortedLeft, sortedRight, callback)
}
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
console.log(array.mergeSort(callback));

// **IMPORTANT: Make sure to use a function declaration (`function merge`) as
// opposed to a function expression (`const merge = function`) for `merge`. Do
// NOT use the built-in `Array.prototype.sort` method in your implementation.**
//
// Here's a summary of the merge sort algorithm:
//
// Split the array into left and right halves, then merge sort them recursively
// until a base case is reached. Use a helper method, merge, to combine the
// halves in sorted order, and return the merged array.

// Write a `Function.prototype.inherits(ParentClass)` method. It should extend
// the methods of `ParentClass.prototype` to `ChildClass.prototype`.
Function.prototype.inherits = function(Parent) {
    function Surrogate() {};
    Surrogate.prototype = Parent.prototype;
    this.prototype = new Surrogate ();
    this.prototype.constructor = this;
}

//
// **Do NOT use `Object.create`, `Object.assign`, `Object.setPrototypeOf`, or
// modify the `__proto__` property of any object directly.**

// Write a `Function.prototype.myApply(context, argsArr)` method that accepts an
// object and an array of additional arguments. It should call the function with 
// the passed-in object as `this`, also passing the arguments array. Do NOT use 
// the built-in `Function.prototype.apply` or `Function.prototype.call` methods
// in your implementation.
Function.prototype.myApply = function (context, args = []) {
    return this.bind(context, ...args)();
}

// Write a `Function.prototype.myCurry(numArgs)` method that collects arguments 
// until the number of arguments collected is equal to the original `numArgs` 
// value and then invokes the curried function.

Function.prototype.myCurry = function(numArgs) {
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


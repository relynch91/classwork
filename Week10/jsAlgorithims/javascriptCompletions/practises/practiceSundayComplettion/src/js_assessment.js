// Write a function `firstEvenNumbersSum(n)` that returns the sum of the
// first n even numbers recursively. Assume n > 0
function firstEvenNumbersSum(n) {
    if (n === 1) {
        return 2;
    }
    let previous = firstEvenNumbersSum(n - 1);
    let next = previous + n*2;
    return next
}

// console.log(firstEvenNumbersSum(6));

// Write a `String.prototype.mySlice(startIdx, endIdx)` method. It should take 
// a start index and an (optional) end index and return a new string. Do NOT 
// use the built-in string methods `slice`, `substr`, or `substring`. 
// ex. 
// `abcde`.mySlice(2) => `cde`
// `abcde`.mySlice(1, 3) => `bc`
String.prototype.mySlice = function(startIdx, endIdx) {
    if (typeof endIdx === "undefined") {
        endIdx = this.length;
    }
    if (endIdx > this.length - 1) {
        endIdx = this.length;
    }
    console.log(startIdx);
    console.log(endIdx);
    if (startIdx > endIdx) {
        return "";
    }
    let newString = "";
    for(let i = startIdx; i < endIdx; i ++) {
        newString += this[i];
    }
    return newString;
}

// console.log("empty!".mySlice(1, 0))

// Write a `String.prototype.realWordsInString(dictionary)` method, that returns
// an array containing the substrings of `string` that appear in `dictionary`.
// sorted alphabetically. This method does NOT return any duplicates.
String.prototype.realWordsInString = function(dictionary) {
    let answer = [];
    for (let i = 0; i < this.length; i ++) {
        for (let j = i + 1; j <= this.length; j ++) {
            let subWord = this.slice(i, j);
            console.log(subWord);
            if (dictionary.includes(subWord) && (!answer.includes(subWord))) {
                answer.push(subWord);
            }
        }
    }
    return answer.sort();
}

// console.log("cabcarcat".realWordsInString(["cat", "car", "cab"]))

// Write an `Array.prototype.myEach(callback)` method that invokes a callback
// for every element in an array and returns undefined. Do NOT use the built-in
// `Array.prototype.forEach`.
Array.prototype.myEach = function (callback) {
    for (let i = 0; i < this.length; i ++) {
        callback(this[i]);
    }
}

// Write an `Array.prototype.myFilter(callback)` that takes a callback and 
// returns a new array which includes every element for which the callback 
// returned true. Use the `Array.prototype.myEach` method you defined above. Do 
// NOT call the built-in `Array.prototype.filter` or `Array.prototype.forEach` 
// methods.

Array.prototype.myFilter = function(callback) {
    let newArray = [];
    this.myEach((el) => {
        if(callback(el)) {
            newArray.push(el);
        }
    })
    return newArray;
}

// Write an `Array.prototype.bubbleSort(callback)` method, that bubble sorts an array.
// It should take an optional callback that compares two elements, returning
// -1 if the first element should appear before the second, 0 if they are
// equal, and 1 if the first element should appear after the second. Do NOT call
// the built-in `Array.prototype.sort` method in your implementation. Also, do NOT
// modify the original array.
//
// Here's a quick summary of the bubble sort algorithm:
const defaultCallback = (num1, num2) => {
    if(num1 < num2) {
        return -1;
    } else if (num1 === num2) {
        return 0;
    } else {
        return 1;
    }
}

Array.prototype.bubbleSort = function(callback) {
    if(!callback) {
        callback = defaultCallback;
    }
    let that = this.slice();
    sorted = true;
    while (sorted) {
        sorted = false
        for(let i = 0; i < that.length; i ++) {
            if (callback(that[i], that[i + 1]) === -1){
                let swap = that[i];
                that[i] = that[i + 1];
                that[i + 1] = swap;
                sorted = true;
            }
        }
    }
    return that.reverse();
}
console.log([3, 1, 2, 5, 4].bubbleSort());


// Iterate over the elements of the array. If the current element is unsorted
// with respect to the next element, swap them. If any swaps are made before
// reaching the end of the array, repeat the process. Otherwise, return the
// sorted array.

// Write a `Function.prototype.inherits(ParentClass)` method. It should extend
// the methods of `ParentClass.prototype` to `ChildClass.prototype`.


Function.prototype.inherits = function(Parent) {
    function Surrogate () {};
    Surrogate.prototype = Parent.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
}
//
// **Do NOT use `Object.create`, `Object.assign`, `Object.setPrototypeOf`, or
// modify the `__proto__` property of any object directly.**

// Write a `Function.prototype.myCurry(numArgs)` method that collects arguments 
// until the number of arguments collected is equal to the original `numArgs` 
// value and then invokes the curried function.

Function.prototype.myCurry = function(numbArgs) {
    let nums = [];
    let fcn = this;
    return function _myCurry(el) {
        nums.push(el);
        if (nums.length < numbArgs) {
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

Function.prototype.myBind = function(context, ...bindArgs) {
    let that = this;
    return function (...callArgs) {
        return that.apply(context, bindArgs.concat(callArgs))
    }
}


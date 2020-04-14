// Write a function, `longestSymmetricSubstring(string)`, that returns the
// longest substring that is the same forwards and in reverse (for example,
// "abba"). If two substrings are the same length, take the first one.

function longestSymmetricSubstring(string) {
    let array = [];
    for (let i = 0; i < string.length; i ++) {
        for(let j = 0; j < string.length; j ++) {
            let word = string.slice(i, j + 1)
            let otherWord = word.split("").reverse().join("");
            // console.log(word);
            if (word.length > 1) {
                if(word === otherWord){
                    array.push(otherWord);
                }
            }
        }
    }
    if (array.length === 0) {
        return string[0];
    }
    let long = array[0].herelength;
    let idx = 0;
    for(let k = 0; k < array.length; k ++) {
        if ((array[k].length) > long) {
            long = array[k].length;
            idx = k;
        }
    }
    
    return array[idx];
    
}

console.log(longestSymmetricSubstring("abcdefc"));

// Write an `Array.prototype.myEach(callback)` method that invokes a callback
// for every element in an array and returns undefined. 
//
// **Do NOT use the built-in `Array.prototype.forEach` method in your 
// implementation.**
Array.prototype.myEach = function(callback) {
    for (let i = 0; i < this.length; i ++) {
        callback(this[i]);
    }
}


// Write an `Array.prototype.myMap(callback)` method, that takes a callback and 
// returns a new array containing the result of the callback for each element in 
// the array. Use the `Array.prototype.myEach` method you defined above. 
//
// **Do NOT call the built-in `Array.prototype.forEach` or `Array.prototype.map` 
// methods in your implementation.**
Array.prototype.myMap = function(callback) {
    let array = [];
    this.myEach(el => {
        array.push(callback(el));
    })
    return array;
}


// Write a function `pairMatch(array, callback)`. It should return all pairs
// of indices ([i, j]) for which `callback(array[i], array[j])` returns true.
//
// NB: Keep in mind that the order of the arguments to the callback may matter.
// e.g., callback = function(a, b) { return a < b }
const sumToZero = (x, y) => { return x + y === 0; };

const sumToEven = (x, y) => { return (x + y) % 2 === 0; };

const isGreater = (x, y) => { return x > y; };
let array = [1, 0, -1];

function pairMatch(array, callback) {
    let pairs = [];
    for (let i = 0; i < array.length; i ++) {
        for (let j = 0; j < array.length; j ++) {
            let first = array[i];
            let second = array[j];
            if (callback(first, second) === true) {
                if (i !== j) {
                pairs.push([i, j]);
                }
            }
        }
    }
    return pairs;
}
// console.log(pairMatch(array, sumToZero))

// Write a recursive function, `binarySearch(sortedArray, target)`, that returns
// the index of `target` in `sortedArray`, or -1 if it is not found. 
//
// **Do NOT use the built-in `Array.prototype.indexOf` or
// `Array.prototype.includes` methods in your implementation.**
//
// Here's a quick summary of the binary search algorithm:
//
// Start by looking at the middle item of the array. If it matches the target,
// return its index. Otherwise, recursively search either the left or the right
// half of the array until the target is found or the base case (empty array) is
// reached.
function binarySearch(array, target) {
    if(array.length === 0) {
        return -1;
    } 
    const mid = Math.floor(array.length / 2);
    if(array[mid] > target) {
        return binarySearch(array.slice(0, mid), target);
    } else if(array[mid] < target) {
        const sub = binarySearch(array.slice(mid + 1), target);
        if (sub === -1) {
            return -1;
        } else {
            return (sub + mid + 1)
        }
    } else {
        return mid;
    }
}

// Write a `Function.prototype.myBind(context)` method. It should return a copy
// of the original function, where `this` is set to `context`. It should allow 
// arguments to the function to be passed both at bind-time and call-time.
Function.prototype.myBind = function (context, ...bindArgs) {
    let that = this;
    return function (...callArgs) {
        return that.apply(context, bindArgs.concat(callArgs));
    }
}


// Write a function, `inherits(ChildClass, ParentClass)`. It should extend the
// methods of `ParentClass.prototype` to `ChildClass.prototype`. 
//
// **Do NOT use `Object.create`, `Object.assign`, `Object.setPrototypeOf`, or
// modify the `__proto__` property of any object directly.**
function inherits(Child, Parent) {
    function Surrogate () {};
    Surrogate.prototype = Parent.prototype;
    Child.prototype = new Surrogate ();
    Child.prototype.constructor = Child;
}


// Write a function `myCurry(fn, object, numArgs)`, that curries the function.
// Remember that a curried function is invoked with one argument at a time. For
// example, the curried form of `sum(1, 2, 3)` would be written as
// `curriedSum(1)(2)(3)`. After `numArgs` have been passed in, invoke the
// original `fn` with the accumulated arguments, using `object` as the
// context.

function myCurry(fn, object, numArgs) {
    let nums = [];
    // return function _myCurry(el) {
    //     nums.push(el);
    //     if (nums.length < numArgs) {
    //         return _myCurry;
    //     } else {
    //         return {
    //             fn(...nums);
    //         }
    //     }
    // }
}


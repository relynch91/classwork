// Write a function, `deepDup(arr)`, that will perform a "deep" duplication of
// the array and any interior arrays. A deep duplication means that the array 
// itself, as well as any nested arrays (no matter how deeply nested) are duped 
// and are completely different objects in memory than those in the original 
// array.
function deepDup(arr) {
    let answer = [];
    for(let i = 0; i < arr.length; i ++) {
        if (arr[i] instanceof Array === true) {
            let ele = deepDup(arr[i]);
            answer.push(ele);
        } else {
            answer.push(arr[i]);
        }
    }
    return answer;
}

// Write an `Array.prototype.myJoin(separator)` method, which joins the elements
// of an array into a string. If an argument is provided to `myJoin`, use that
// between each element. Otherwise, use an empty string.
// Do NOT call the built-in `Array.prototype.join` method.
// ex.
// [1, 2, 3].myJoin() => '123'
// [1, 2, 3].myJoin('$') => '1$2$3'
Array.prototype.myJoin = function(separator) {
    if (!separator) {
        separator = "";
    }
    let answer = "";
    for(let i = 0; i < this.length; i ++) {
        answer += this[i];
        if (i === this.length -1) {
            return answer;
        }
        answer += separator;

    }
    return answer;
}

// Write a function `titleize(str)` that capitalizes each word in a string like
// a book title. 
// Do not capitalize the following words (unless they are the first word in the 
// string): ["a", "and", "of", "over", "the"]
function titleize(str) {
    let words = str.split(" ");
    let dictionary = ["a", "and", "of", "over", "the"]
    let answer = "";
    console.log(words)
    for(let i = 0; i < words.length; i ++) {
        if (i === 0) {
            let word = words[i].split("");
            let first = word.shift().toUpperCase();
            word = first.concat(word.join(""));
            answer += word + " ";
        } else if (!dictionary.includes(words[i])) {
            let word = words[i].split("");
            let first = word.shift().toUpperCase();
            word = first.concat(word.join(""));
            answer += word + " ";
        } else {
            answer += words[i] + " ";
        }
    }
    answer = answer.slice(0, answer.length-1)
    return answer;
}

console.log(titleize("Jaws"));

// Write an `Array.prototype.myEach(callback)` method that invokes a callback
// for every element in an array and returns undefined. Do NOT use the built-in
// `Array.prototype.forEach`.

Array.prototype.myEach = function (callback) {
    for(let i = 0; i < this.length; i ++) {
        callback(this[i]);
    }
}

// Write an `Array.prototype.mySome(callback)` method which takes a callback 
// and returns true if the callback returns true for ANY element in the array. 
// Otherwise, return false. 
// Use the `Array.prototype.myEach` method you defined above. Do NOT call the
// built-in `Array.prototype.some` or `Array.prototype.forEach` methods.
Array.prototype.mySome = function(callback) {
    let flag = false;
    this.myEach((el) => {
        if (callback(el) === true){
            flag = true;
        }
    })
    return flag;
}

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



// Write a `Function.prototype.inherits(ParentClass)` method. It should extend
// the methods of `ParentClass.prototype` to `ChildClass.prototype`.
//
// **Do NOT use `Object.create`, `Object.assign`, `Object.setPrototypeOf`, or
// modify the `__proto__` property of any object directly.**

Function.prototype.inherits = function (Parent) {
    function Surrogate () {};
    Surrogate.prototype = Parent.prototype;
    this.prototype = new Surrogate ();
    this.prototype.constructor = this;
}

// Write a `Function.prototype.myApply(context, argsArr)` method that accepts an
// object and an array of additional arguments. It should call the function with 
// the passed-in object as `this`, also passing the arguments array. Do NOT use 
// the built-in `Function.prototype.apply` or `Function.prototype.call` methods
// in your implementation.
Function.prototype.myApply = function(context, args = []) {
    return this.bind(context)(...args);
}

// Write a `Function.prototype.myBind(context)` method. It should return a copy
// of the original function, where `this` is set to `context`. It should allow 
// arguments to the function to be passed both at bind-time and call-time.
// Note that you are NOT allowed to use ES6 arrow syntax for this problem.

Function.prototype.myBind = function(context, ...bindArgs){
    let that = this;
    return function (...callArgs) {
        return that.apply(context, bindArgs.concat(callArgs));
    }
}




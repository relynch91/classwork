// Write a recursive function, `factorialsRec(num)`, that returns the first 
// `num` factorial numbers. Note that the 1st factorial number is 0!, which 
// equals 1. The 2nd factorial is 1!, the 3rd factorial is 2!, etc.
function factorialsRec(num) {
    if (num <= 1) {
        return [1];
    }
    let facts = factorialsRec(num - 1);
    facts.push(facts[facts.length - 1] * (num - 1));
    return facts
}

// Write an `Array.prototype.myJoin(separator)` method, which joins the elements
// of an array into a string. If an argument is provided to `myJoin`, use that
// between each element. Otherwise, use an empty string.
// Do NOT call the built-in `Array.prototype.join` method.
// ex.
// [1, 2, 3].myJoin() => '123'
// [1, 2, 3].myJoin('$') => '1$2$3'

Array.prototype.myJoin = function(seperator) {
    let word = ""
    if (seperator === undefined) {
        seperator = "";
    }
    for(let i = 0; i < this.length; i ++) {
        if (i === this.length - 1) {
            word += this[i];
            return word
        }else {
        word += this[i];
        word += seperator;
        }
    }
    return word;
}


// Write a function `titleize(str)` that capitalizes each word in a string like
// a book title. 
// Do not capitalize the following words (unless they are the first word in the 
// string): ["a", "and", "of", "over", "the"]

function titleize(string) {
    let words = string.split(" ");
    let newWord = [];
    let dictionary = ["a", "and", "of", "over", "the"]
    
    for (let i = 0; i < words.length; i ++) {
        let word = words[i];
        if (i === 0) {
            let first = word.slice(0, 1).toUpperCase();
            let rest = word.slice(1);
            let next = first + rest;
            newWord.push(next);
        } else if (dictionary.includes(word)) {
            newWord.push(word);
        } else {
            let first = word.slice(0, 1).toUpperCase();
            let rest = word.slice(1);
            let next = first + rest;
            newWord.push(next);
        }
    }
    return newWord.join(" ");
}

console.log(titleize("david copperfield"))

// Write an `Array.prototype.myEach(callback)` method that invokes a callback
// for every element in an array and returns undefined. Do NOT use the built-in
// `Array.prototype.forEach`.

Array.prototype.myEach = function (callback) {
    for (let i = 0; i < this.length; i += 1) {
        callback(this[i]);
    }
}

// Write an `Array.prototype.myFilter(callback)` that takes a callback and 
// returns a new array which includes every element for which the callback 
// returned true. Use the `Array.prototype.myEach` method you defined above. Do 
// NOT call the built-in `Array.prototype.filter` or `Array.prototype.forEach` 
// methods.
Array.prototype.myFilter = function(callback) {
    let answer = [];

    this.myEach((el) => {
        if (callback(el)) {
            answer.push(el);
        }
    })

    return answer;
}


// Write a function `jumbleSort(string, alphabet)`.
// Jumble sort takes a string and an alphabet. It returns a copy of the string
// with the letters re-ordered according to their positions in the alphabet. If
// no alphabet is passed in, it defaults to normal alphabetical order (a-z).
//
// The English alphabet, in order, is 'abcdefghijklmnopqrstuvwxyz'
//
// **Do NOT use the built-in `Array.prototype.sort` in your implementation.**

function jumbleSort(string, alphabet = undefined) {
    if (typeof alphabet === 'undefined') { 
        alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    }
    let locations = [];
    let count = 0;
    let answerLocations = [];
    for (let i = 0; i < string.length; i ++) {
        let idx = alphabet.indexOf(string[i])
        locations.push(idx);
    }
    while (!(locations.length === 0)) {
        let min = locations[0];
        let minidx = 0
        for (let j = 0; j < locations.length; j ++){
            if (min > locations[j]) {
                min = locations[j];
                minidx = j;
            }
        }
        answerLocations.push(locations.splice(minidx, 1))
    }
    let answer = "";
    for(let k = 0; k < answerLocations.length; k ++) {
        answer += alphabet[answerLocations[k]]; 
    }
    return answer;
}


console.log(jumbleSort("hello"));
console.log(jumbleSort("hello", ['o', 'l', 'h', 'e']));

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
Function.prototype.myApply = function (context, args = []) {
    return this.bind(context)(...args);
}

// Write a `Function.prototype.myCall(context)` method, that accepts an object, 
// and any number of additional arguments. It should call the function with the
// passed-in object as `this`, also passing the remaining arguments. Do NOT use
// the built-in `Function.prototype.call` or `Function.prototype.apply` methods 
// in your implementation.

Function.prototype.myCall = function (context, ...args) {
    return this.bind(context, ...args)();
}

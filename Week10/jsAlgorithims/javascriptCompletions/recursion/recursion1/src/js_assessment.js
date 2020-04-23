// Write a recursive function `stringIncludeKey(string, key)` that takes in 
// a string to search and a key string. Return true if the string contains all 
// of the characters in the key in the same order that they appear in the key.
//
// stringIncludeKey("cadbpc", "abc") => true
// stringIncludeKey("cba", "abc") => false
function stringIncludeKey(string, key) {
    if (key.length === undefined) {
        return true;
    }
    let idx = string.indexOf(key[0]);
    if (idx < 0) {
        console.log(key)
        return false;
    }
    let newString = string.slice(idx + 1);
    let newKey = key.slice(1);
    if (newKey.length === 0) {
        return true;
    }
    // console.log("this one")
    return stringIncludeKey(newString, newKey);
}


// console.log(stringIncludeKey("cadbpc", "abc"));
// console.log(stringIncludeKey("cba", "abc"));

// Write a recursive function `recSum(numArr)` that returns the sum of all
// elements in an array. Assume all elements are numbers.
function recSum(numArr) {
    let length = numArr.length
    if (length === 0) {
        return 0;
    }
    if (numArr.length === 1) {
        return numArr[0];
    }
    let value = numArr[0];
    value += recSum(numArr.splice(1, numArr.length))
    return value;
}

// Write a recursive function, `factorialsRec(num)`, that returns the first 
// `num` factorial numbers. Note that the 1st factorial number is 0!, which 
// equals 1. The 2nd factorial is 1!, the 3rd factorial is 2!, etc.
function factorialsRec(num) {
    if (num <= 1) {
        return [1];
    }
    let previousAnswer = factorialsRec(num-1)
    let previous = previousAnswer[num - 2]
    let nextNum = (num - 1) * previous;
    previousAnswer.push(nextNum);
    return previousAnswer;
}

// console.log(factorialsRec(2))

// Write a function `firstEvenNumbersSum(n)` that returns the sum of the
// first n even numbers recursively. Assume n > 0
function firstEvenNumbersSum(n) {
    if (n <= 1) {
        return 2;
    }
    let previous = (firstEvenNumbersSum(n - 1));
    let sum = ((n * 2) + previous);
    return sum;
}
console.log(firstEvenNumbersSum(6))

// Write a function, `deepDup(arr)`, that will perform a "deep" duplication of
// the array and any interior arrays. A deep duplication means that the array 
// itself, as well as any nested arrays (no matter how deeply nested) are duped 
// and are completely different objects in memory than those in the original 
// array.

function deepDup(arr) {
    let answer = [];
    for(let i = 0; i < arr.length; i ++) {
        if (Array.isArray(arr[i])) {
            let deep = deepDup(arr[i]);
            answer.push(deep);
        } else {
            answer.push(arr[i]);
        }
    }
    return answer;
}

// Write a function, `fibsSum(n)`, that finds the sum of the first n
// fibonacci numbers recursively. Assume n > 0.
// Note that for this problem, the fibonacci sequence starts with [1, 1]. 
function fibsSum(n) {
    if (n === 1) return 1;
    if (n === 2) return 2;
    let sum = fibsSum(n - 1) + fibsSum(n - 2) + 1;
    return sum;
}

// Write a function, `digitalRoot(num)`. It should sum the digits of a positive
// integer. If the result is greater than 9 (i.e. more than one digit), sum the 
// digits of the resulting number. Keep repeating until there is only one digit 
// in the result, called the "digital root". 
// **Do not use string conversion within your method.** 
// For further explanation on the digital root concept, refer here: https://en.wikipedia.org/wiki/Digital_root
//
// You may wish to use a helper function, `digitalRootStep(num)` which performs
// one step of the process.

function digitalRoot(num) {
    while (num > 10) {
        num = digitalRootHelp(num);
    }
    return num;
}

function digitalRootHelp(num) {
    let root = 0;
    while (num > 0) {
        root += (num % 10);
        num = Math.floor(num/10);
    }
    return root;
}

// Write a function, `exponent(b, n)`, that calculates b^n recursively. 
// Your solution should accept negative values for n. Do NOT use ** or Math.pow
function exponent(b, n) {
    let flag = false;
    if (n === 0) {
        return 1
    }
    if (n < 0) {
        flag = true;
        n = (n * (-1));
    }
    let num = b * exponent(b, n - 1);
    if (flag) {
        return (1 / num);
    }
    return num;
}


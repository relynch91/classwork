// Write a function, `anagrams(str1, str2)`, that takes in two words and returns 
// a boolean indicating whether or not the words are anagrams. Anagrams are 
// words that contain the same characters but not necessarily in the same order. 
// Solve this without using Array.prototype.sort.
// 
// Examples:
// true false 

function anagrams (word1, word2) {
    let letters = {};
    for (let i = 0; i < word1.length; i ++) {
        let ele = word1[i];
        if (letters[ele]) {
            // console.log("0 is true");
            letters[ele] += 1;
        } else {
            letters[ele] = 0;
            letters[ele] += 1;
        }
    }
    console.log(letters) 
    for (let j = 0; j < word2.length; j++) {
        let alpha = word2[j];
        if (letters[alpha]) {
            letters[alpha] -= 1;
        } else {
            letters[alpha] = 0;
            letters[alpha] -= 1;
        }
    }
    // console.log(letters)
    return Object.values(letters).every(number => number === 0)
}

// console.log(anagrams('aiuwehfxzxcvmneowieurahsde', 'nsewceaerihfawzueouxdihmxv'));
// console.log(anagrams('aiuwehfxzxcvmneowieurahsde', 'nsewceaerihfawzueouxdihmxw'))
// console.log(anagrams('god', 'dog'))


// Write a function `titleize(str)` that capitalizes each word in a string like
// a book title. 
// Do not capitalize the following words (unless they are the first word in the 
// string): ["a", "and", "of", "over", "the"]
function titleize(str) {
    const specials = ["a", "and", "of", "over", "the"];
    const answer = []
    let words = str.split(" ");

    for(let i = 0; i < words.length; i ++) {
        let word = words[i];
        if (i === 0) {
            let upperword = word.slice(0, 1).toUpperCase() + word.slice(1);
            answer.push(upperword);
        } 
        else if(specials.includes(word)) {
            answer.push(word);
        } else {
            let upperword = word.slice(0, 1).toUpperCase() + word.slice(1);
            answer.push(upperword);
        }
    }
    return answer.join(" ");
}

// console.log(titleize("jaws was here"))

// Write a `String.prototype.realWordsInString(dictionary)` method, that returns
// an array containing the substrings of `string` that appear in `dictionary`.
// // sorted alphabetically. This method does NOT return any duplicates.
// const dictionary = ["this"]
// const word = "this"

String.prototype.realWordsInString = function (dictionary) {
  const real_words = [];
  for(let i = 0; i < this.length; i ++) {
      for(let j = i; j < this.length; j ++) {
          let current_word = this.slice(i, j + 1);

          if (dictionary.indexOf(current_word) > -1) {
            if (real_words.indexOf(current_word) < 0) {
                real_words.push(current_word)
            }
          }
      }
  }
  return real_words.sort();
}

// console.log(word1.realWordsInString(dictionary));
// console.log(word2.realWordsInString(dictionary));
// console.log(word3.realWordsInString(dictionary));


// Write a `String.prototype.symmetricSubstrings` method that returns an array
// of substrings which are palindromes in alphabetical order. Only include 
// substrings of length > 1.
// e.g. "cool".symmetricSubstrings() => ["oo"]
// const word = "abc";
// const word1 = "aba";
// const word2 = "aba1cdc";
// const word3 = "xabax";

String.prototype.symmetricSubstrings = function() {
    let answer = [];
    for(let i = 0; i < this.length; i ++) {
        for(let j = i; j < this.length; j ++) {
            let current_word = this.slice(i, j + 1);
            let other_word = current_word.split("").reverse().join("");
            // console.log(other_word);
            // console.log(current_word);
            if ((current_word === other_word) && (current_word.length > 1)) {
                // console.log("we in business");
                answer.push(current_word)
            }
        }
    }
    return answer.sort();
}

// console.log(word.symmetricSubstrings());
// console.log(word1.symmetricSubstrings());
// console.log(word2.symmetricSubstrings());
// console.log(word3.symmetricSubstrings());


const word = "abcd";
const word1 = "foobar";
const word2 = "empty!";
const word3 = "super long string";

// Write a `String.prototype.mySlice(startIdx, endIdx)` method. It should take 
// a start index and an (optional) end index and return a new string. Do NOT 
// use the built-in string methods `slice`, `substr`, or `substring`. 
// ex. 
// `abcde`.mySlice(2) => `cde`
// `abcde`.mySlice(1, 3) => `bc`

String.prototype.mySlice = function (startIdx, endIdx) {
    if (endIdx === undefined) {
        endIdx = this.length;
    }
    // console.log(startIdx, endIdx)
    if (startIdx > endIdx) {
        return "";
    }
    let answer = ""
    for(let i = startIdx; i < endIdx; i ++) {
        // console.log(this[i])
        if ( i >= this.length){
            return answer;
        }
        answer += (this[i]);
    }
    return answer;
}

// console.log(word.mySlice(0, 2));
// console.log(word1.mySlice(3));
// console.log(word2.mySlice(1, 0));
// console.log(word3.mySlice(0, 200));

// Write an `Array.prototype.myJoin(separator)` method, which joins the elements
// of an array into a string. If an argument is provided to `myJoin`, use that
// between each element. Otherwise, use an empty string.
// Do NOT call the built-in `Array.prototype.join` method.
// ex.
// [1, 2, 3].myJoin() => '123'
// [1, 2, 3].myJoin('$') => '1$2$3'

Array.prototype.myJoin = function (seperator) {
    let answer = "";
    if (this.length === 0) {
        return answer
    }
    for(let i = 0; i < this.length; i ++) {
        if (seperator === undefined) {
            seperator = "";
        }
        else if (i === this.length - 1) {
            answer += (this[i]);
            return answer;
        }
        answer += (this[i]);
        answer += seperator;
    }
}

// console.log(['a', 'b', 'c', 'd'].myJoin("$"))

// Write a function, `doubler(arr)`, that returns a copy of the input array 
// with all elements doubled. You do not need to worry about invalid input.
//
// Example:
// doubler([1, 2, 3]) => [2, 4, 6]

function doubler(arr) {
    let answer = [];
    for (let i = 0; i < arr.length; i ++) {
        answer.push(arr[i] * 2);
    }
    return answer 
}

// Write a function `myFind(array, callback)` that returns the first
// element for which the callback returns true. If none is found, the 
// function should return `undefined`
// Do not use the built-in `Array.prototype.find` method.

function myFind(array, callback) {
    for (let i = 0; i < array.length; i ++) {
        if (callback(array[i]) === true) {
            return array[i];
        }
    }
    return undefined
}


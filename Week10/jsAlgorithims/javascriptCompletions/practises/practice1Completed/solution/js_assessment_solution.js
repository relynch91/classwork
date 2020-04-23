// Write a function, `anagrams(str1, str2)`, that takes in two words and returns
// a boolean indicating whether or not the words are anagrams. Anagrams are 
// words that contain the same characters but not necessarily in the same order. 
// Solve this without using Array.prototype.sort.
// 
// Examples:
// anagrams('listen', 'silent') => true
// anagrams('listen', 'potato') => false
function anagrams(str1, str2) {
  const letters = {};

  str1.split("").forEach(char => {
    if (!letters[char]) letters[char] = 0;
    letters[char] += 1;
  });
  
  str2.split("").forEach(char => {
    if (!letters[char]) letters[char] = 0;
    letters[char] -= 1;
  });

  return Object.values(letters).every(letterCount => letterCount === 0);
}

// Write a function `titleize(str)` that capitalizes each word in a string like
// a book title. 
// Do not capitalize the following words (unless they are the first word in the 
// string): ["a", "and", "of", "over", "the"]
function titleize(title) {
  const littleWords = ['a', 'and', 'of', 'over', 'the'];

  const words = title.split(' ');
  const titleizedWords = words.map( (word, idx) => {
    if (idx !== 0 && littleWords.indexOf(word) >= 0) {
      return word.toLowerCase();
    } else {
      return word.slice(0, 1).toUpperCase() + word.slice(1);
    }
  });

  return titleizedWords.join(' ');
}

// Write a `String.prototype.realWordsInString(dictionary)` method, that returns
// an array containing the substrings of `string` that appear in `dictionary`.
// sorted alphabetically. This method does NOT return any duplicates.

// Solution 1
String.prototype.realWordsInString = function (dictionary) {
  const realWords = [];

  dictionary.forEach((el) => {
    if (this.includes(el)) realWords.push(el);
  });
  return realWords.sort();
};

// Solution 2
String.prototype.realWordsInString = function (dictionary) {
  const realWords = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i; j < this.length; j++) {
      let word = this.slice(i, j+1);

      if (dictionary.indexOf(word) > -1) {
        if (realWords.indexOf(word) < 0) realWords.push(word);
      }
    }
  }

  return realWords.sort();
};

// Write a `String.prototype.symmetricSubstrings` method that returns an array
// of substrings which are palindromes in alphabetical order. Only include 
// substrings of length > 1.
// e.g. "cool".symmetricSubstrings() => ["oo"]
String.prototype.symmetricSubstrings = function () {
  const symmetric = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = 2; j <= this.length - i; j++) {
      const subst = this.slice(i, i + j);
      const reversed = subst.split('').reverse().join('');

      if (subst === reversed) symmetric.push(subst);
    }
  }

  return symmetric.sort();
};

// Write a `String.prototype.mySlice(startIdx, endIdx)` method. It should take
// a start index and an (optional) end index and return a new string. Do NOT 
// use the built-in string methods `slice`, `substr`, or `substring`. 
// ex. 
// `abcde`.mySlice(2) => `cde`
// `abcde`.mySlice(1, 3) => `bc`
String.prototype.mySlice = function(start, end) {
  let slice = "";

  if (typeof end === 'undefined') {
    end = this.length;
  }

  for (let i = start; i < end && i < this.length; i++) {
    slice += this[i];
  }
  return slice;
};

// Write an `Array.prototype.myJoin(separator)` method, which joins the elements 
// of an array into a string. If an argument is provided to `myJoin`, use that
// between each element. Otherwise, use an empty string.
// Do NOT call the built-in `Array.prototype.join` method.
// ex.
// [1, 2, 3].myJoin() => '123'
// [1, 2, 3].myJoin('$') => '1$2$3'
Array.prototype.myJoin = function (separator = '') {
  let newString = '';

  this.forEach( (el, idx) => {
    newString += `${el}`;
    if (idx < this.length - 1) newString += separator;
  });

  return newString;
};

// Write a function, `doubler(arr)`, that returns a copy of the input array
// with all elements doubled. You do not need to worry about invalid input.
//
// Example:
// doubler([1, 2, 3]) => [2, 4, 6]
function doubler(array) {
  return array.map(el => el * 2);
}

// Write a function `myFind(array, callback)` that returns the first
// element for which the callback returns true. If none is found, the 
// function should return `undefined`
// Do not use the built-in `Array.prototype.find` method.
function myFind (array, callback) {
  for (let i = 0; i < array.length; i++) {
    if (callback(array[i])) {
      return array[i];
    }
  }
}


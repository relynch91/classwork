describe('anagrams', () => {
  beforeEach(() => {
    spyOn(Array.prototype, 'sort').and.callThrough();
  });

  afterEach(() => {
    expect(Array.prototype.sort).not.toHaveBeenCalled();
  });
  
  it('returns true if words are anagrams', () => {
    expect(anagrams('abc', 'cba')).toBe(true);
  });

  it('returns false if words are not anagrams', () => {
    expect(anagrams('abc', 'aba')).toBe(false);
  });

  it('does not count words with same letters but varying lengths as anagrams', () => {
    expect(anagrams('abc', 'cbaa')).toBe(false);
  });

  it('can handle large words with letters extremely scrambled', () => {
    expect(anagrams('aiuwehfxzxcvmneowieurahsde', 'nsewceaerihfawzueouxdihmxv')).toBe(true);
    expect(anagrams('aiuwehfxzxcvmneowieurahsde', 'nsewceaerihfawzueouxdihmxw')).toBe(false);
  });
});

describe("titleize", () => {
  it("capitalizes a word", () => {
    expect(titleize("jaws")).toEqual("Jaws");
  });

  it("capitalizes every word (aka title case)", () => {
    expect(titleize("david copperfield")).toEqual("David Copperfield");
  });

  it("doesn't capitalize 'little words' in a title", () => {
    expect(titleize("war and peace")).toEqual("War and Peace");
  });

  it("does capitalize 'little words' at the start of a title", () => {
    expect(
      titleize("the bridge over the river kwai")
    ).toEqual("The Bridge over the River Kwai");
  });
});

describe("String.prototype.realWordsInString", () => {
  it("finds a simple word", () => {
    const words = "asdfcatqwer".realWordsInString(["cat", "car"]);
    expect(words).toEqual(["cat"]);
  });

  it("doesn't find words not in the dictionary", () => {
    const words = "batcabtarbrat".realWordsInString(["cat", "car"]);
    expect(words).toEqual([]);
  });

  it("does not return duplicates", () => {
    const words = "catcarcat".realWordsInString(["cat", "car"]);
    expect(words).toEqual(["car", "cat"])
  });

  it("finds words at the end of the string", () => {
    const words = "cabcarcat".realWordsInString(["cat", "car", "cab"]);
    expect(words).toEqual(["cab", "car", "cat"]);
  });

  it("finds words within words", () => {
    const dictionary = ["bears", "ear", "a", "army"];
    const words = "erbearsweatmyajs".realWordsInString(dictionary);
    expect(words).toEqual(["a", "bears", "ear"]);
  });
});

describe("String.prototype.symmetricSubstrings", () => {
  it("returns an empty array if there are no symmetric substrings", () => {
    expect("abc".symmetricSubstrings()).toEqual([]);
  });
  
  it("handles a simple example", () => {
    expect("aba".symmetricSubstrings()).toEqual(["aba"]);
  });

  it("handles two substrings", () => {
    expect("aba1cdc".symmetricSubstrings()).toEqual(["aba", "cdc"]);
  });

  it("handles nested substrings", () => {
    expect("xabax".symmetricSubstrings()).toEqual(["aba", "xabax"]);
  });
});

describe("String.prototype.mySlice", () => {
  beforeEach(() => {
    spyOn(String.prototype, 'slice').and.callThrough();
    spyOn(String.prototype, 'substring').and.callThrough();
    spyOn(String.prototype, 'substr').and.callThrough();
  });

  afterEach(() => {
    expect(String.prototype.slice).not.toHaveBeenCalled();
    expect(String.prototype.substring).not.toHaveBeenCalled();
    expect(String.prototype.substr).not.toHaveBeenCalled();
  });

  it("slices the string from the start index to the end index", () => {
    expect("abcd".mySlice(0, 2)).toEqual("ab");
  });

  it("slices to the end of the string when no second argument is passed", () => {
    expect("foobar".mySlice(3)).toEqual("bar");
  });

  it("returns an empty string when the first argument is higher", () => {
    expect("empty!".mySlice(1, 0)).toEqual("");
  });

  it("slices to the end of the string when the end index is greater than the string's length", () => {
    expect("super long string".mySlice(0, 200)).toEqual("super long string");
  });
});

describe("myJoin", () => {
  beforeEach(() => {
    spyOn(Array.prototype, 'join').and.callThrough();
  });

  afterEach(() => {
    expect(Array.prototype.join).not.toHaveBeenCalled();
  });

  it("returns an empty string for an empty array", () => {
    const empty = [];
    expect(empty.myJoin()).toEqual("");
  });

  it("joins an array with an empty string if no argument is passed", () => {
    const a = ['a', 'b', 'c', 'd'];
    expect(a.myJoin()).toEqual("abcd");
  });

  it("joins an array with argument if an argument is passed", () => {
    const a = ['a', 'b', 'c', 'd'];
    expect(a.myJoin("$")).toEqual("a$b$c$d");
  });
});

describe("doubler", () => {
  let array;

  beforeEach(() => {
    array = [1, 2, 3]
  });

  it("doubles the elements of the array", () => {
    expect(doubler(array)).toEqual([2, 4, 6]);
  });

  it("does not modify the original array", () => {
    const dupArray = array.slice(0);
    doubler(array);

    expect(array).toEqual(dupArray);
  });
});

describe("myFind", () => {
  let arr, spy;
  beforeEach(() => {
    arr = [1, 2, 3];
    spy = {
      callback: (el) => false
    };

    spyOn(Array.prototype, 'find');
  });

  afterEach(() => {
    expect(Array.prototype.find).not.toHaveBeenCalled();
  });

  it("calls the callback passed to it", () => {
    spyOn(spy, "callback");

    myFind(arr, spy.callback);

    expect(spy.callback).toHaveBeenCalled();
  });

  it("returns an element for which the callback is true", () => {
    expect(myFind([1,2,3], el => el > 2)).toEqual(3);
  });

  it("returns undefined if the callback never returns true", () => {
    expect(myFind([1,2,3], el => el > 4)).toEqual(undefined);
  });

  it("returns the only the first applicable element", () => {
    expect(myFind([1,2,3], el => el > 1)).toEqual(2);
  });
});


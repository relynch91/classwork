describe("factorialsRec", () => {
  it("returns first factorial number", () => {
    expect(factorialsRec(1)).toEqual([1]);
  });

  it("returns first two factorial numbers", () => {
    expect(factorialsRec(2)).toEqual([1, 1]);
  });

  it("returns many factorials numbers", () => {
    expect(factorialsRec(6)).toEqual([1, 1, 2, 6, 24, 120]);
  });

  it("calls itself recursively", () => {
    spyOn(window, "factorialsRec").and.callThrough();
    factorialsRec(6);
    expect(factorialsRec).toHaveBeenCalledTimes(6);
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

describe("Array.prototype.myEach", () => {
  let originalArray;
  let testArray;
  let result;
  const spy = {
    callback: (el) => { return el + 1; }
  };

  beforeEach(() => {
    spyOn(Array.prototype, 'forEach').and.callThrough();
  });

  afterEach(() => {
    expect(Array.prototype.forEach).not.toHaveBeenCalled();
  });

  it("calls the callback passed to it", () => {
    spyOn(spy, "callback");
    [1, 2, 3].myEach(spy.callback);
    expect(spy.callback).toHaveBeenCalled();
  });

  it("yields each element to the callback and has no return value", () => {
    spyOn(spy, "callback");
    result = [1, 2].myEach(spy.callback);
    expect(spy.callback).toHaveBeenCalledWith(1);
    expect(spy.callback).toHaveBeenCalledWith(2);
    expect(result).toBeUndefined();
  });

  it("does not modify the original array", () => {
    originalArray = ["original array"];
    testArray = ["original array"];
    testArray.myEach(spy.callback);
    expect(testArray).toEqual(originalArray);
  });
});

describe('Array.prototype.myFilter', () => {
  let originalArray;
  const spy = {
    callback: (el) => { return true }
  }

  // it does not call forEach or filter (setup)
  beforeEach(() => {
    spyOn(Array.prototype, 'forEach').and.callThrough();
    spyOn(Array.prototype, 'filter').and.callThrough();
  });

  // it does not call forEach or filter (verification)
  afterEach(() => {
    expect(Array.prototype.forEach).not.toHaveBeenCalled();
    expect(Array.prototype.filter).not.toHaveBeenCalled();
  });

  const isEven = function (num) { return num % 2 === 0; };

  const isLessThanThree = function (num) { return num < 3; };

  it("calls the callback passed to it", () => {
    spyOn(spy, "callback");
    [1, 2, 3].myFilter(spy.callback);
    expect(spy.callback).toHaveBeenCalled();
  });

  it("yields each element to the callback", () => {
    spyOn(spy, "callback");
    [1, 2, 3].myFilter(spy.callback);
    expect(spy.callback).toHaveBeenCalledWith(1);
    expect(spy.callback).toHaveBeenCalledWith(2);
    expect(spy.callback).toHaveBeenCalledWith(3);
  });

  it("calls the Array.prototype.myEach method", () => {
    originalArray = [1, 2, 3];
    spyOn(originalArray, "myEach");
    originalArray.myFilter(spy.callback);
    expect(originalArray.myEach).toHaveBeenCalled();
  });

  it("returns an array of filtered items", () => {
    const testArray = [1, 2, 3, 4, 5];
    expect(testArray.myFilter(isEven)).toEqual([2, 4]);
    expect(testArray.myFilter(isLessThanThree)).toEqual([1, 2]);
  });

  it("does not modify the original array", () => {
    originalArray = [1, 2, 3];
    originalArray.myFilter(isEven);
    expect(originalArray).toEqual([1, 2, 3]);
  });
});

describe("jumbleSort", () => {
  beforeEach(() => {
    spyOn(Array.prototype, "sort").and.callThrough();
  });

  afterEach(() => {
    expect(Array.prototype.sort).not.toHaveBeenCalled();
  });
  
  it("defaults to alphabetical order", () => {
    expect(jumbleSort("hello")).toEqual("ehllo");
  });

  it("takes an alphabet array and sorts by that order", () => {
    const alphabet = 'helo'.split('');
    expect(jumbleSort("hello", alphabet)).toEqual("hello");
  });

  it("sorts by a reversed alphabet", () => {
    const reverseAlpha = 'abcdefghijklmnopqrstuvwxyz'.split('').reverse().join('');
    expect(jumbleSort("hello", reverseAlpha)).toEqual("ollhe");
  });
});

describe("Function.prototype.inherits", () => {
  let Animal;
  let Dog;
  let dog;

  beforeEach(() => {
    spyOn(Object, 'create').and.callThrough();
    spyOn(Object, 'assign').and.callThrough();
    spyOn(Object, 'setPrototypeOf').and.callThrough();
    
    Animal = function() {
      this.name = "Yogi";
    };

    Animal.prototype.makeNoise = function() { return "Hi!"; };

    Dog = function() {
      this.age = 7;
    };

    Dog.inherits(Animal);
    Dog.prototype.bark = function() { return "Woof!"; };
    dog = new Dog();
  });

  afterEach(() => {
    expect(Object.create).not.toHaveBeenCalled();
    expect(Object.assign).not.toHaveBeenCalled();
    expect(Object.setPrototypeOf).not.toHaveBeenCalled();
    expect(Function.prototype.inherits.toString().includes("__proto__"))
      .toBeFalsy('Do not modify the __proto__ property directly (this spec will fail even if it is commented out)');  
  });

  it("should properly set up the prototype chain between a child and parent", () => {
    expect(dog.bark()).toBe("Woof!");
    expect(dog.makeNoise()).toBe("Hi!");
  });

  it("should not call the parent's constructor function", () => {
    expect(dog.name).toBeUndefined();
  });

  it("should maintain separation of parent and child prototypes", () => {
    Dog.prototype.someProperty = 42;
    const animal = new Animal();
    expect(animal.someProperty).toBeUndefined();
    expect(animal.makeNoise()).toBe("Hi!");
  });

  it("should properly work for longer inheritance chains", () => {
    const Poodle = function () { this.name = "Bill"; };
    Poodle.inherits(Dog);
    Poodle.prototype.shave = function() { return "Brrr."; };
    const poodle = new Poodle();
    
    expect(poodle.name).toBe("Bill");
    expect(poodle.shave()).toBe("Brrr.");
    expect(poodle.makeNoise()).toBe("Hi!");
    expect(poodle.bark()).toBe("Woof!");
  });
});

describe("Function.prototype.myApply", () => {
  let Cat;
  let sally, markov, curie;

  beforeEach(() => {
    Cat = function Cat(name) {
      this.name = name;
    };

    Cat.prototype.sayHello = function () {
      return this.name + " says hello!";
    };

    Cat.prototype.greetOne = function (otherCat) {
      return this.name + " says hello to " + otherCat.name;
    };

    Cat.prototype.greetTwo = function (otherCat1, otherCat2) {
      return this.name + " says hello to " + otherCat1.name + " and " +
        otherCat2.name;
    };

    sally = new Cat("Sally");
    markov = new Cat("Markov");
    curie = new Cat("Curie");
  });

  afterEach(() => {
    const stringifiedFn = Function.prototype.myApply.toString();
    expect(stringifiedFn.includes("call"))
      .toBeFalsy('Function.prototype.call not allowed (spec will fail even if it is commented out)');
    expect(stringifiedFn.includes("apply"))
      .toBeFalsy('Function.prototype.apply not allowed (spec will fail even if it is commented out)');
  });

  it("invokes the function it is called on", () => {
    expect(sally.greetOne.myApply(sally, [markov])).toEqual("Sally says hello to Markov");
  });

  it("can take any number of arguments", () => {
    expect(sally.greetTwo.myApply(sally, [markov, curie]))
      .toEqual("Sally says hello to Markov and Curie");
  });

  it("should call the function method style on the context", () => {
    expect(sally.sayHello.myApply(markov)).toEqual("Markov says hello!");
  });
});

describe("Function.prototype.myCall", () => {
  let Cat;
  let sally, markov, curie;

  beforeEach(() => {
    Cat = function Cat(name) {
      this.name = name;
    };

    Cat.prototype.sayHello = function () {
      return this.name + " says hello!";
    };

    Cat.prototype.greetOne = function (otherCat) {
      return this.name + " says hello to " + otherCat.name;
    };

    Cat.prototype.greetTwo = function (otherCat1, otherCat2) {
      return this.name + " says hello to " + otherCat1.name + " and " +
        otherCat2.name;
    };

    sally = new Cat("Sally");
    markov = new Cat("Markov");
    curie = new Cat("Curie");
  });

  afterEach(() => {
    const stringifiedFn = Function.prototype.myCall.toString();
    expect(stringifiedFn.includes("call"))
      .toBeFalsy('Function.prototype.call not allowed (spec will fail even if it is commented out)');
    expect(stringifiedFn.includes("apply"))
      .toBeFalsy('Function.prototype.apply not allowed (spec will fail even if it is commented out)');
  });

  it("invokes the function it is called on", () => {
    expect(sally.greetOne.myCall(sally, markov)).toEqual("Sally says hello to Markov");
  });

  it("can take any number of arguments", () => {
    expect(sally.greetTwo.myCall(sally, markov, curie))
      .toEqual("Sally says hello to Markov and Curie");
  });

  it("should call the function method style on the context", () => {
    expect(sally.sayHello.myCall(markov)).toEqual("Markov says hello!");
  });
});


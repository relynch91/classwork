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

describe("Array.prototype.twoSum", () => {
  it("returns positions of pairs of numbers that add to zero", () => {
    expect([5, 1, -7, -5].twoSum()).toEqual([[0, 3]]);
  });

  it("finds multiple pairs", () => {
    expect([5, -1, -5, 1].twoSum()).toEqual([[0, 2], [1, 3]]);
  });

  it("finds pairs with same element", () => {
    expect([5, -5, -5].twoSum()).toEqual([[0, 1], [0, 2]]);
  });

  it("returns [] when no pair is found", () => {
    expect([5, 5, 3, 1].twoSum()).toEqual([]);
  });

  it("won't find spurious zero pairs", () => {
    expect([0, 1, 2, 3].twoSum()).toEqual([]);
  });

  it("will find real zero pairs", () => {
    expect([0, 1, 2, 0].twoSum()).toEqual([[0, 3]]);
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

describe('Array.prototype.myReduce', () => {
  let myArray;
  const noOp = (accum, el) => accum;

  const spy = {
    sum: (accum, el) => accum + el
  };

  beforeEach(() => {
    spyOn(Array.prototype, 'forEach').and.callThrough();
    spyOn(Array.prototype, 'reduce').and.callThrough();
  });

  afterEach(() => {
    expect(Array.prototype.forEach).not.toHaveBeenCalled();
    expect(Array.prototype.reduce).not.toHaveBeenCalled();
  });

  it("calls the callback, passing in the accumulator and each element", () => {
    myArray = [1, 2, 3];
    spyOn(spy, "sum").and.callThrough();

    myArray.myReduce(spy.sum);

    expect(spy.sum).toHaveBeenCalledWith(1, 2);
    expect(spy.sum).toHaveBeenCalledWith(3, 3);
  });

  it("works with a sum callback", () => {
    myArray = [1, 2, 3, 4];
    expect(myArray.myReduce(spy.sum)).toEqual(10);
  });

  it("works with a multiplier callback", () => {
    myArray = [4, 4, 4];
    const times = (accum, el) => accum * el;

    expect(myArray.myReduce(times)).toEqual(64);
  });

  it("uses the given argument as the initial accumulator", () => {
    myArray = [1, 2, 3, 4];
    expect(myArray.myReduce(noOp, 5)).toEqual(5);
  });

  it("uses the first item as the accumulator if none is given", () => {
    myArray = [1, 2, 3, 4];
    expect(myArray.myReduce(noOp)).toEqual(1);
  });

  it("calls the Array.prototype.myEach method", () => {
    myArray = [1, 2, 3];
    spyOn(Array.prototype, "myEach");
    myArray.myReduce(spy.sum);
    expect(Array.prototype.myEach).toHaveBeenCalled();
  });
});

describe("Array.prototype.mergeSort", () => {
  let array;

  beforeEach(() => {
    array = [1, 5, 2, 4, 3];
    spyOn(Array.prototype, 'sort').and.callThrough();
  });

  afterEach(() => {
    expect(Array.prototype.sort).not.toHaveBeenCalled();
  });

  it("works with an empty array", () => {
    expect([].mergeSort()).toEqual([]);
  });

  it("works with an array of one item", () => {
    expect([1].mergeSort()).toEqual([1]);
  });

  it("sorts numbers", () => {
    const sortedArray = [1, 2, 3, 4, 5];
    expect(array.mergeSort()).toEqual(sortedArray);
  });

  it("sorts arrays with duplicates", () => {
    expect([5, 4, 3, 3, 2, 1].mergeSort()).toEqual([1, 2, 3, 3, 4, 5]);
  });

  it("uses a comparator function if passed in", () => {
    const reversed = array.mergeSort((x, y) => {
      if (x === y) {
        return 0;
      } else if (x < y) {
        return 1;
      } else {
        return -1;
      }
    });
    expect(reversed).toEqual([5, 4, 3, 2, 1]);
  });

  it("does not modify original", () => {
    const dupedArray = [1, 5, 2, 4, 3];
    dupedArray.mergeSort();
    expect(dupedArray).toEqual(array);
  });

  it("calls the merge helper method", () => {
    spyOn(window, 'merge');
    array.mergeSort();
    expect(merge).toHaveBeenCalled();
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

describe("Function.prototype.myCurry", () => {
  it("if numArgs is 1, should call function first time the curried function is invoked with an argument", () => {
    const echo = function (arg) {
      return arg;
    };

    const first = echo.myCurry(1);
    expect(first("one")).toMatch(/one/);
  });

  it("curries arguments and calls function after called with total num args", () => {
    const dubs = function (a, b, c) {
      return (a + b + c) * 2;
    };

    const curriedSum = dubs.myCurry(3);
    const result = curriedSum(1)(2)(3);
    expect(result).toEqual(12);
  });

  it("should return itself if there are too few arguments", () => {
    const threeSum = function (x, y, z) {
      return x + y + z;
    };

    const myCurryResult = threeSum.myCurry(3)(1)(2);
    expect(myCurryResult).not.toEqual(6);
    expect(typeof (myCurryResult)).toEqual("function");
  });
});


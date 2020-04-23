describe("exponent", () => {
  beforeEach(() => {
    spyOn(Math, 'pow').and.callThrough();
  });

  afterEach(() => {
    expect(Math.pow).not.toHaveBeenCalled();
  });
  
  it("correctly handles positive powers", () => {
    expect(exponent(5, 3)).toEqual(125);
  });

  it("correctly handles negative powers", () => {
    expect(exponent(2, -3)).toEqual(1/8.0);
  });

  it("correctly handles 0", () => {
    expect(exponent(2, 0)).toEqual(1);
  });

  it("calculates the exponent recursively", () => {
    spyOn(window, "exponent").and.callThrough();
    exponent(5, 3);
    expect(exponent.calls.count()).not.toBeLessThan(3);
  });
});

describe("recSum", () => {
  it("returns 0 if the array is empty", () => {
    expect(recSum([])).toEqual(0);
  });
  
  it("works with an array of 1 element", () => {
    expect(recSum([25])).toEqual(25);
  });

  it("returns the sums of all elements in an array", () => {
    const arr = [1,2,3,4];
    expect(recSum(arr)).toEqual(10);
  });

  it("calls itself recursively", () => {
    const arr = [1,2,3,4]
    spyOn(window, 'recSum').and.callThrough();
    recSum(arr)
    expect(recSum.calls.count()).not.toBeLessThan(4);
  });
});

describe("stringIncludeKey", () => {
  it("returns true for the same string", () => {
    expect(stringIncludeKey("adblfci", "abc")).toEqual(true);
  });

  it("handles keys with duplicate characters: case 1", () => {
    expect(stringIncludeKey("adbblfci", "abbc")).toEqual(true);
  });

  it("handles keys with duplicate characters: case 2", () => {
    expect(stringIncludeKey("adbclfci", "abbc")).toEqual(false);
  });

  it("returns false if the key characters are in the wrong order", () => {
    expect(stringIncludeKey("dblfcia", "abc")).toEqual(false);
  });

  it("returns false if the string doesn't contain the key", () => {
    expect(stringIncludeKey("db", "abc")).toEqual(false);
  });

  it("calls itself recursively", () => {
    spyOn(window, "stringIncludeKey").and.callThrough();
    stringIncludeKey("adbblfci", "abbc");
    expect(stringIncludeKey.calls.count()).not.toBeLessThan(4);
  });
});

describe('firstEvenNumbersSum', () => {
  it("Correctly returns the sum of the first even number", () => {
    expect(firstEvenNumbersSum(1)).toEqual(2);
  });

  it("Returns the sum of the first n even numbers", () => {
    expect(firstEvenNumbersSum(6)).toEqual(42);
  });

  it("calls itself recursively", () => {
    spyOn(window, "firstEvenNumbersSum").and.callThrough();
    firstEvenNumbersSum(4);
    expect(firstEvenNumbersSum).toHaveBeenCalledTimes(4);
  });
});

describe('fibsSum', () => {
  it('returns the sum of the first fibonacci number', () => {
    expect(fibsSum(1)).toEqual(1);
  });

  it('returns the sum of the first 2 fibonacci numbers', () => {
    expect(fibsSum(2)).toEqual(2);
  });

  it('returns the sum of the first 6 fibonacci numbers', () => {
    expect(fibsSum(6)).toEqual(20);
  });

  it("calls itself recursively", () => {
    spyOn(window, "fibsSum").and.callThrough();
    fibsSum(6);
    expect(fibsSum.calls.count()).not.toBeLessThan(5);
  });
});

describe("digitalRoot", () => {
  it("calculates the digital root of a single-digit number", () => {
    expect(digitalRoot(9)).toEqual(9);
  });

  it("calculates the digital root of a larger number", () => {
    expect(digitalRoot(44322)).toEqual(6);
  });
  
  it("does not call Number#toString on the argument", () => {
    spyOn(Number.prototype, 'toString').and.callThrough();
    digitalRoot(4322);
    expect(Number.prototype.toString).not.toHaveBeenCalled();
  });
});

describe("deepDup", () => {
  const robotParts = [
    ["nuts", "bolts", "washers"],
    ["capacitors", "resistors", "inductors"]
  ];
  let copy;

  beforeEach(() => {
    copy = deepDup(robotParts);
  });

  it("makes a copy of the original array", () => {
    expect(copy).toEqual(robotParts);
    expect(copy).not.toBe(robotParts);
  });

  it("deeply copies arrays", () => {
    copy[1].push("LEDs");
    expect(robotParts[1]).toEqual(["capacitors", "resistors", "inductors"]);
    expect(copy[1]).not.toBe(robotParts[1]);
  });

  it("calls itself recursively", () => {
    spyOn(window, "deepDup").and.callThrough();
    deepDup(robotParts);
    expect(deepDup).toHaveBeenCalledTimes(3);
  })
});

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


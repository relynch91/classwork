describe('Array.prototype.myEvery', () => {
  let arr;
  const spy = {
    callback: x => x % 2 === 0
  }

  beforeEach(() => {
    arr = [2, 4, 6];
    spyOn(Array.prototype, 'forEach').and.callThrough();
    spyOn(Array.prototype, 'every').and.callThrough();
  });

  afterEach(() => {
    expect(Array.prototype.forEach).not.toHaveBeenCalled();
    expect(Array.prototype.every).not.toHaveBeenCalled();
  });

  it("returns true if all elements match the block", () => {
    expect(arr.myEvery(spy.callback)).toBe(true);
  });

  it("returns false if not all elements match the block", () => {
    const callback = x => x % 3 === 0;
    expect(arr.myEvery(callback)).toBe(false);
  });

  it("calls the Array.prototype.myEach method", () => {
    spyOn(arr, "myEach");
    arr.myEvery(spy.callback);
    expect(arr.myEach).toHaveBeenCalled();
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

describe('Array.prototype.mySome', () => {
  let a;
  const spy = {
    callback: x => x > 1
  }

  beforeEach(() => {
    a = [1, 2, 3];
    spyOn(Array.prototype, 'forEach').and.callThrough();
    spyOn(Array.prototype, "some").and.callThrough();
  });

  afterEach(() => {
    expect(Array.prototype.forEach).not.toHaveBeenCalled();
    expect(Array.prototype.some).not.toHaveBeenCalled();
  });

  it("returns true if any element matches the callback", () => {
    expect(a.mySome(spy.callback)).toBe(true);
  });

  it("returns false if no elements match the callback", () => {
    const callback = x => x === 4;
    expect(a.mySome(callback)).toBe(false);
  });

  it("calls the Array.prototype.myEach method", () => {
    spyOn(a, "myEach");
    a.mySome(spy.callback);
    expect(a.myEach).toHaveBeenCalled();
  });
});

describe('Array.prototype.myReject', () => {
  let a;
  const spy = {
    callback: x => x > 1
  }

  beforeEach(() => {
    a = [1, 2, 3];
    spyOn(Array.prototype, 'forEach').and.callThrough();
    spyOn(Array.prototype, 'filter').and.callThrough();
  });

  afterEach(() => {
    expect(Array.prototype.forEach).not.toHaveBeenCalled();
    expect(Array.prototype.filter).not.toHaveBeenCalled();
  });

  it('returns elements that do not match the passed in block', () => {
    expect(a.myReject(spy.callback)).toEqual([1]);
  });

  it('returns all elements if no elements match the block', () => {
    const callback = x => x === 4;
    expect(a.myReject(callback)).toEqual([1, 2, 3]);
  });

  it('returns an empty array if all elements match the block', () => {
    const callback = x => x < 4;
    expect(a.myReject(callback)).toEqual([]);
  });

  it("calls the Array.prototype.myEach method", () => {
    spyOn(a, "myEach");
    a.myReject(spy.callback);
    expect(a.myEach).toHaveBeenCalled();
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


describe("binarySearch", () => {
  let searchArr;

  beforeEach(() => {
    searchArr = [1, 2, 3, 4, 5, 6, 7];
    spyOn(Array.prototype, 'indexOf').and.callThrough();
    spyOn(Array.prototype, 'includes').and.callThrough();
  });

  afterEach(() => {
    expect(Array.prototype.indexOf).not.toHaveBeenCalled();
    expect(Array.prototype.includes).not.toHaveBeenCalled();
  });

  it("should find an element in the right side of the array", () => {
    expect(binarySearch(searchArr, 7)).toEqual(6);
  });

  it("should find an element in the left side of the array", () => {
    expect(binarySearch(searchArr, 1)).toEqual(0);
  });

  it("should return -1 when an element is not present", () => {
    expect(binarySearch(searchArr, 8)).toEqual(-1);
  });

  it("should recursively search the correct half of the array", () => {
    spyOn(window, "binarySearch").and.callThrough();
    expect(binarySearch(searchArr, 6)).toEqual(5);
    expect(binarySearch).toHaveBeenCalledWith([5, 6, 7], 6);
  });
});

describe("Array.prototype.bubbleSort", () => {
  let array;

  // it does not call sort (setup)
  beforeEach(() => {
    array = [3, 1, 2, 5, 4];
    spyOn(Array.prototype, 'sort').and.callThrough();
  });

  // it does not call sort (verification)
  afterEach(() => {
    expect(Array.prototype.sort).not.toHaveBeenCalled();
  });

  it("works with an empty array", () => {
    expect([].bubbleSort()).toEqual([]);
  });

  it("works with an array of one item", () => {
    expect([1].bubbleSort()).toEqual([1]);
  });

  it("sorts numbers", () => {
    const sortedArray = [1, 2, 3, 4, 5];
    expect(array.bubbleSort()).toEqual(sortedArray);
  });

  it("will use callback if given", () => {
    const reversedArray = [5, 4, 3, 2, 1];
    const sorted = array.bubbleSort((num1, num2) => {
      // order numbers based on descending sort of their squares
      const square1 = Math.pow(num1, 2);
      const square2 = Math.pow(num2, 2);
      if (square2 < square1) {
        return -1;
      } else if (square2 === square1) {
        return 0;
      } else {
        return 1;
      }
    });

    expect(sorted).toEqual(reversedArray);
  });

  it("does not modify the original array", () => {
    const dupedArray = array.slice();
    dupedArray.bubbleSort();
    expect(dupedArray).toEqual(array);
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

describe("Array.prototype.quickSort", () => {
  beforeEach(() => {
    spyOn(Array.prototype, 'sort').and.callThrough();
  });

  afterEach(() => {
    expect(Array.prototype.sort).not.toHaveBeenCalled();
  });
  
  it("works with an empty array", () => {
    expect([].quickSort()).toEqual([]);
  });

  it("works with an array of 1 number", () => {
    expect([5].quickSort()).toEqual([5]);
  });
  
  it("sorts an array of numbers with no duplicates", () => {
    const a = [ 2, 1, 3, 5, 0, 8, 4, 7, 6];
    const sorted = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    expect(a.quickSort()).toEqual(sorted);
  });

  it("sorts an array of numbers with duplicates", () => {
    const a = [3, 1, 2, 3, 9, 17, 10, 432, 10];
    const sorted = [1, 2, 3, 3, 9, 10, 10, 17, 432];
    expect(a.quickSort()).toEqual(sorted);
  });

  it("sorts according to the callback passed in", () => {
    const a = [ 2, 1, 3, 5, 0, 8, 4, 7, 6];
    const sorted = [8, 7, 6, 5, 4, 3, 2, 1, 0];
    const callback = (x, y) => {
      if (y < x) return - 1;
      return 1;
    };

    expect(a.quickSort(callback)).toEqual(sorted);
  });
});


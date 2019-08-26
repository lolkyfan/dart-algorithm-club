/// Returns the index of [key] inside the given **sorted** [list] performing binary search. [lowerRange]
/// and [upperRange] define the portion of the list to be searched - usually 0 and [list].count.
/// 
/// Returns `null` if the key is not present inside the list.
/// 
/// Performance is **O(log n)**.
int binarySearch<T extends num>(List<T> list, { T key, int lowerRange, int upperRange }) {
  if (lowerRange >= upperRange) {
    // This means that the search key is not present in the list.
    return null;
  } else {
    // Calculate where to split the array.
    final midIndex = (lowerRange + (upperRange - lowerRange) / 2).toInt();

    if (list[midIndex] > key) {
      // If the search key is in the left half
      return binarySearch(list, key: key, lowerRange: lowerRange, upperRange: midIndex);
    } else if (list[midIndex] < key) {
      // If the search key is in the right half
      return binarySearch(list, key: key, lowerRange: midIndex + 1, upperRange: upperRange);
    } else {
      // We've found the search key
      return midIndex;
    }

  }
  
}

  void main() {
    print('Binary search using recursive function. See tests for example usage.');
  }
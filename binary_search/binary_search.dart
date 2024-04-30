/// Returns the index of the key, or `null` if the key is not found.
/// If [bounds] is `null`, zero is used for lower bound
/// and length of [array] for upper bound.
int? recursiveBinarySearch<T extends num>({
  required List<T> array,
  required T key,
  ({int lower, int upper})? bounds,
}) {
  final lowerBound = bounds?.lower ?? 0;
  final upperBound = bounds?.upper ?? array.length;

  if (lowerBound >= upperBound) {
    return null;
  }

  final midIndex = (lowerBound + (upperBound - lowerBound) / 2).floor();

  if (array[midIndex] > key) {
    return recursiveBinarySearch(
      array: array,
      key: key,
      bounds: (lower: lowerBound, upper: midIndex),
    );
  } else if (array[midIndex] < key) {
    return recursiveBinarySearch(
      array: array,
      key: key,
      bounds: (lower: midIndex + 1, upper: upperBound),
    );
  } else {
    return midIndex;
  }
}

/// Returns the index of the key, or `null` if the key is not found.
int? iterativeBinarySearch<T extends num>({
  required List<T> array,
  required T key,
}) {
  var lowerBound = 0;
  var upperBound = array.length;

  while (lowerBound < upperBound) {
    final midIndex = (lowerBound + (upperBound - lowerBound) / 2).floor();
    final value = array[midIndex];

    if (value > key) {
      upperBound = midIndex;
    } else if (value < key) {
      lowerBound = midIndex + 1;
    } else {
      return midIndex;
    }
  }

  return null;
}

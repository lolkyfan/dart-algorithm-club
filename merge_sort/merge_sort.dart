///Complexity: **O(n log n)**
List<T> mergeSort<T extends num>(List<T> array) {
  if (array.length <= 1) {
    return array;
  }

  final middleIndex = (array.length / 2).floor();

  final left = mergeSort(array.sublist(0, middleIndex));
  final right = mergeSort(array.sublist(middleIndex));

  return merge(leftPile: left, rightPile: right);
}

List<T> merge<T extends num>({
  required List<T> leftPile,
  required List<T> rightPile,
}) {
  int leftIndex = 0;
  int rightIndex = 0;

  final orderedPile = <T>[];

  while (leftIndex < leftPile.length && rightIndex < rightPile.length) {
    final left = leftPile[leftIndex];
    final right = rightPile[rightIndex];

    if (left < right) {
      orderedPile.add(left);
      leftIndex++;
    } else if (left > right) {
      orderedPile.add(right);
      rightIndex++;
    } else {
      orderedPile.add(left);
      leftIndex++;
      orderedPile.add(right);
      rightIndex++;
    }
  }

  while (leftIndex < leftPile.length) {
    orderedPile.add(leftPile[leftIndex]);
    leftIndex++;
  }

  while (rightIndex < rightPile.length) {
    orderedPile.add(rightPile[rightIndex]);
    rightIndex++;
  }

  return orderedPile;
}

/// Heap is a **binary tree** inside an array.
/// It doesn't use parent/child pointers.
/// A heap is sorted based on the "heap property"
/// that determines the order of the nodes in the tree.
abstract interface class Heap<T extends num> {
  /// Adds new element into the heap. O(log n).
  void insert(T);

  /// Removes and returns maximum value. O(log n).
  T remove();

  /// Removes and returns a value at given index. O(log n).
  T removeAtIndex(int index);

  /// Replaces a value at given index O(log n).
  void replace(int index, T value);

  /// Returns index for the given value. O(n).
  int search(T value);

  /// Converts an unsorted list into a heap
  void buildHeap(List<T> values);

  Heap.fromList(List<T> values);
}

/// A heap where parent's value is greater than each of it's children
class MaxHeap<T extends num> implements Heap<T> {
  final _array = <T>[];

  @override
  void buildHeap(List<num> values) {
    // TODO: implement buildHeap
  }

  @override
  void insert(T) {
    // TODO: implement insert
  }

  @override
  T remove() {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  T removeAtIndex(int index) {
    // TODO: implement removeAtIndex
    throw UnimplementedError();
  }

  @override
  void replace(int index, T value) {
    // TODO: implement replace
  }

  @override
  int search(T value) {
    // TODO: implement search
    throw UnimplementedError();
  }
}

/// A heap where parent's value is smaller than each of it's children
class MinHeap {}

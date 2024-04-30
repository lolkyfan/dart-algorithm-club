/// A tree where each node has 0,1, or 2 children.
sealed class BinaryTree<T> {
  int get count;

  void traverseInOrder({required Function(T) process});
  void traversePreOrder({required Function(T) process});
  void traversePostOrder({required Function(T) process});
}

class Node<T> extends BinaryTree<T> {
  final BinaryTree<T> left;
  final T value;
  final BinaryTree<T> right;

  Node(this.left, this.value, this.right);

  @override
  String toString() {
    return 'value: $value, left = [$left], right = [$right]';
  }

  @override
  int get count => left.count + 1 + right.count;

  @override
  void traverseInOrder({required Function(T) process}) {
    left.traverseInOrder(process: process);
    process(value);
    right.traverseInOrder(process: process);
  }

  @override
  void traversePreOrder({required Function(T p1) process}) {
    process(value);
    left.traversePreOrder(process: process);
    right.traversePreOrder(process: process);
  }

  @override
  void traversePostOrder({required Function(T p1) process}) {
    left.traversePostOrder(process: process);
    right.traversePostOrder(process: process);
    process(value);
  }
}

class Empty<T> extends BinaryTree<T> {
  @override
  String toString() {
    return '';
  }

  @override
  int get count => 0;

  @override
  void traverseInOrder({required Function(T) process}) {
    // Do nothing
  }

  @override
  void traversePreOrder({required Function(T) process}) {
    // Do nothing
  }

  @override
  void traversePostOrder({required Function(T p1) process}) {
    // Do nothing.
  }
}

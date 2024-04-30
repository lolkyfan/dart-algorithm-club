/// A tree where each node has 0,1, or 2 children.
/// ** The tree is built from bottom up, starting with the leaf nodes. **
sealed class BinaryTree<T> {
  /// Returns the number of node's children.
  int get count;

  /// Visits all child nodes and performs [process] function.
  /// Left first, then `this`, then right.
  ///
  /// Complexity: **O(n)**
  void traverseInOrder({required Function(T) process});

  /// Visits all child nodes and performs [process] function.
  /// `this` first, then left, then right.
  ///
  /// Complexity: **O(n)**
  void traversePreOrder({required Function(T) process});

  /// Visits all child nodes and performs [process] function.
  /// Left first, then right, then `this`.
  ///
  /// Complexity: **O(n)**
  void traversePostOrder({required Function(T) process});
}

/// Node of a binary tree.
/// If the node is at the top of the tree it's called a root node.
class Node<T> extends BinaryTree<T> {
  /// One of node's children.
  final BinaryTree<T> left;

  /// Value the node carries.
  final T value;

  /// One of node's children.
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

/// Empty node of a binary tree. Also called a leaf node.
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

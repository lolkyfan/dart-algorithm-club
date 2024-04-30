/// Linked lists are good for the queues where they can outperform arrays.
/// This is due fact that inserting/removing from the ends of a linked list is
/// cheap - O(1).
/// The downside of a linked list is a lookup which is O(n).
class SinglyLinkedList<T> {
  Node<T>? _head;

  bool get isEmpty => _head == null;

  Node<T>? get first => _head;

  Node<T>? get last {
    Node<T>? node = _head;

    while (node != null && node.next != null) {
      node = node.next;
    }

    return node;
  }

  void add(T value) {
    final last = this.last;
    final node = Node(value: value);

    if (last != null) {
      node.previous = last;
      last.next = node;
    } else {
      _head = node;
    }
  }

  int count() {
    int count = 0;
    Node<T>? node = _head;

    while (node != null) {
      count += 1;
      node = node.next;
    }

    return count;
  }

  Node<T> nodeAt({required int index}) {
    int count = 0;
    Node<T>? node = _head;

    while (node != null) {
      if (count == index) {
        return node;
      }

      node = node.next;
      count += 1;
    }

    throw Exception('Invalid index');
  }

  operator [](int index) {
    return nodeAt(index: index);
  }

  void insert(Node<T> node, {required int index}) {
    if (index == 0) {
      node.next = _head;
      _head?.previous = node;
      _head = node;
    } else {
      final previous = nodeAt(index: index - 1);
      final next = previous.next;

      node.previous = previous;
      node.next = next;
      previous.next = node;
      next?.previous = node;
    }
  }

  void removeAll() {
    _head = null;
  }

  void remove(Node<T> node) {
    final previous = node.previous;
    final next = node.next;

    if (previous == null) {
      _head = next;
    } else {
      previous.next = next;
      next?.previous = previous;
    }

    node.previous = null;
    node.next = null;
  }

  void removeAt(int index) {
    final node = nodeAt(index: index);
    remove(node);
  }
}

class DoublyLinkedList {}

/// A node to be used in a linked list.
class Node<T> {
  Node({
    required this.value,
    this.next,
    this.previous,
  });

  final T value;
  Node<T>? next;
  Node<T>? previous;
}

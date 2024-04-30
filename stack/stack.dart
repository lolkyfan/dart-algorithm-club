class Stack<T> {
  final _array = <T>[];

  List<T> get all => _array;

  /// Pushes the value on to the top of the stack.
  void push(T value) {
    _array.add(value);
  }

  /// Pops the element from the top of the stack.
  /// Or `null` is empty.
  T? pop() {
    if (_array.isEmpty) {
      return null;
    }

    return _array.removeLast();
  }

  /// Shows the element at the top of the stack.
  /// Or `null` if empty.
  T? peek() {
    if (_array.isEmpty) {
      return null;
    }

    return _array.last;
  }
}

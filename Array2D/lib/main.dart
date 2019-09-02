/// Fixed-length two dimensional array with a [columns] x [rows] size.
class Array2D<T> {
  /// Number of columns in the array
  final int columns;
  /// Number of rows in the array
  final int rows;
  List<T> _array;

  /// Returns a 2D array filled with [initialValue] of [columns] x [rows] size.
  Array2D(this.columns, this.rows, T initialValue) {
    assert(columns > 0, 'Columns must be a positive number.');
    assert(rows > 0, 'Rows must be a positive number.');

    _array = List.generate(columns*rows, (_) => initialValue);
  }

  /// Returns an item at a given position. Throws [RangeError] if at least
  /// one of indexes is out of range.
  T item(int column, int row) {
    RangeError.checkValueInInterval(column, 0, columns);
    RangeError.checkValueInInterval(row, 0, rows);

    return _array[row*columns + column];
  }

  /// Sets an item at a given position. Throws [RangeError] if at least
  /// one of indexes is out of range.
  void set(int column, int row, T value) {
    RangeError.checkValueInInterval(column, 0, columns);
    RangeError.checkValueInInterval(row, 0, rows);

    _array[row*columns + column] = value;
  }
}

void main() {
    print('Array 2D implementation in Dart. See tests for example usage.');
}
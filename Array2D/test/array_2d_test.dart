import 'package:test/test.dart';

import '../lib/main.dart';

void main() {
  test('Creating 2D array and getting items', () {
    // Creating pre-filled array of zeros
    final array2d = Array2D(2, 3, 0);
    expect(array2d.item(0,0), equals(0));
    expect(array2d.item(1,1), equals(0));
    expect(array2d.item(1,2), equals(0));
  });

  test('Setting item in a 2D array', () {
    // Creating pre-filled array of zeros
    final array2d = Array2D(2, 3, 0);
    array2d.set(1, 1, 3);

    expect(array2d.item(1,1), equals(3));
  });

  test('Out of range throws an error', () {
    // Creating pre-filled array of zeros
    final array2d = Array2D(2, 3, 0);

    expect(() => array2d.item(3, 4), throwsRangeError);
    expect(() => array2d.set(3, 4, 12), throwsRangeError);
  });
}
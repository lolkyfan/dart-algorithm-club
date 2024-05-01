import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../merge_sort.dart';

void main() {
  group('mergeSort()', () {
    test('sorts an array', () {
      final unsorted = [2, 1, 5, 4, 9];

      final sorted = mergeSort(unsorted);

      expect(sorted, [1, 2, 4, 5, 9]);
    });

    test('returns empty array for empty array', () {
      final unsorted = <int>[];

      final sorted = mergeSort(unsorted);

      expect(sorted, []);
    });

    test('returns single item array for single item array', () {
      final unsorted = [3];

      final sorted = mergeSort(unsorted);

      expect(sorted, [3]);
    });
  });
}

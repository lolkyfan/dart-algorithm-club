import 'package:test/test.dart';

import '../binary_search.dart';

void main() {
  group('recursiveBinarySearch()', () {
    group('return index for existing key', () {
      test('when array contains only the key', () {
        final array = [1];

        final index = recursiveBinarySearch(array: array, key: 1);

        expect(index, 0);
      });

      test('when key is the first half of the array', () {
        final array = [1, 2, 3, 4, 5];

        final index = recursiveBinarySearch(
          array: array,
          key: 1,
        );

        expect(index, 0);
      });

      test('when key is the second half of the array', () {
        final array = [1, 2, 3, 4, 5];

        final index = recursiveBinarySearch(array: array, key: 4);

        expect(index, 3);
      });

      test('when key is exactly in the middle', () {
        final array = [1, 2, 3, 4, 5];

        final index = recursiveBinarySearch(array: array, key: 3);

        expect(index, 2);
      });
    });

    test('returns null if key is not present in the array', () {
      final array = [1, 2, 3, 4, 5];

      final index = recursiveBinarySearch(array: array, key: 0);

      expect(index, isNull);
    });
  });

////////

  group('iterativeBinarySearch()', () {
    group('return index for existing key', () {
      test('when array contains only the key', () {
        final array = [1];

        final index = iterativeBinarySearch(array: array, key: 1);

        expect(index, 0);
      });

      test('when key is the first half of the array', () {
        final array = [1, 2, 3, 4, 5];

        final index = iterativeBinarySearch(
          array: array,
          key: 1,
        );

        expect(index, 0);
      });

      test('when key is the second half of the array', () {
        final array = [1, 2, 3, 4, 5];

        final index = iterativeBinarySearch(array: array, key: 4);

        expect(index, 3);
      });

      test('when key is exactly in the middle', () {
        final array = [1, 2, 3, 4, 5];

        final index = iterativeBinarySearch(array: array, key: 3);

        expect(index, 2);
      });
    });

    test('returns null if key is not present in the array', () {
      final array = [1, 2, 3, 4, 5];

      final index = iterativeBinarySearch(array: array, key: 0);

      expect(index, isNull);
    });
  });
}

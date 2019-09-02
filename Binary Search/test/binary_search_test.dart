import 'package:test/test.dart';

import '../lib/main.dart';

void main() {

  final intNumbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67];

  group('Integer values', () {
    test('Searching for value included in the list', () {
      final positionInTheList = binarySearch(intNumbers, key: 43, lowerRange: 0, upperRange: intNumbers.length);

      expect(positionInTheList, equals(13));
    });

    test('Searching for value not included in the list', () {
      final index = binarySearch(intNumbers, key: 10, lowerRange: 0, upperRange: intNumbers.length);

      expect(index, isNull);
    });

    test('Searching for value in one-item list', () {
      final numbers = [1];

      final index = binarySearch(numbers, key: 1, lowerRange: 0, upperRange: numbers.length);

      expect(index, equals(0));
    });

    test('Searching for value in an empty list', () {
      final numbers = <int>[];

      final index = binarySearch(numbers, key: 1, lowerRange: 0, upperRange: numbers.length);

      expect(index, isNull);
    });
  });

  group('Double values', () {
    test('Searching for value included in the list', () {
      final numbers = [2.0, 3.0, 5.0, 7.0, 11.0, 13.0, 17.0, 19.0, 23.0, 29.0, 31.0, 37.0, 41.0, 43.75, 47.0, 53.0, 59.0, 61.0, 67.0];

      final index = binarySearch(numbers, key: 43.75, lowerRange: 0, upperRange: numbers.length);

      expect(index, equals(13));
    });
  });

}

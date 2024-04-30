import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../stack.dart';

void main() {
  test('Can be created', () {
    expect(() => Stack(), returnsNormally);
  });

  test('can return all items on the stack', () {
    final stack = Stack<int>()
      ..push(1)
      ..push(2)
      ..push(3);

    final items = stack.all;

    expect(items, equals([1, 2, 3]));
  });

  group('Can push item', () {
    test('on an empty stack', () {
      final stack = Stack<int>();

      stack.push(1);

      expect(stack.all.first, equals(1));
    });

    test('on a stack including items', () {
      final stack = Stack<int>()
        ..push(1)
        ..push(2);

      stack.push(3);

      expect(stack.all.last, equals(3));
    });

    test('in the correct order', () {
      final stack = Stack<int>()
        ..push(1)
        ..push(2)
        ..push(3);

      expect(stack.all[0], 1);
      expect(stack.all[1], 2);
      expect(stack.all[2], 3);
    });
  });

  test('Can peek item without removing it', () {
    final stack = Stack<int>()
      ..push(1)
      ..push(2)
      ..push(3);

    stack.peek();

    expect(stack.all.length, equals(3));
  });

  group('peek()', () {
    test('returns correct value', () {
      final stack = Stack<int>()
        ..push(1)
        ..push(2)
        ..push(3);

      final top = stack.peek();

      expect(top, equals(3));
    });

    test('returns null when the stack is empty', () {
      final stack = Stack<int>();

      final top = stack.peek();

      expect(top, isNull);
    });
  });

  group('pop()', () {
    test('returns correct value', () {
      final stack = Stack<int>()
        ..push(1)
        ..push(2)
        ..push(3);

      final top = stack.pop();

      expect(top, equals(3));
    });

    test('removes top item when stack is not empty', () {
      final stack = Stack<int>()
        ..push(1)
        ..push(2)
        ..push(3);

      stack.pop();

      expect(stack.all.last, equals(2));
    });

    test('returns null when stack is empty', () {
      final stack = Stack();

      final top = stack.pop();

      expect(top, isNull);
    });
  });
}

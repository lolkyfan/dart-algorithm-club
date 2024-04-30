import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../linked_list.dart';

void main() {
  test('can append', () {
    final linkedList = SinglyLinkedList<String>();

    expect(linkedList.first, isNull);
    expect(linkedList.last, isNull);
    expect(linkedList.count(), 0);

    linkedList.add('HEAD');

    expect(linkedList.first?.value, 'HEAD');
    expect(linkedList.last?.value, 'HEAD');
    expect(linkedList.count(), 1);

    linkedList.add('TAIL');

    expect(linkedList.first?.value, 'HEAD');
    expect(linkedList.last?.value, 'TAIL');
    expect(linkedList.count(), 2);
  });

  test('can return a node for valid index', () {
    final linkedList = SinglyLinkedList<String>();

    linkedList.add('HEAD');
    linkedList.add('TAIL');

    expect(linkedList.nodeAt(index: 0).value, 'HEAD');
    expect(linkedList.nodeAt(index: 1).value, 'TAIL');

    expect(linkedList[0].value, 'HEAD');
    expect(linkedList[1].value, 'TAIL');
  });
}

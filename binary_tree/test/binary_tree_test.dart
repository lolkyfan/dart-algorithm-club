import 'package:test/test.dart';

import '../binary_tree.dart';

void main() {
  test('creating binary tree', () {
    // Need to build up tree in reverse

    // leaf nodes
    final node5 = Node<String>(Empty(), '5', Empty());
    final nodeA = Node<String>(Empty(), 'a', Empty());
    final node10 = Node<String>(Empty(), '10', Empty());
    final node4 = Node<String>(Empty(), '4', Empty());
    final node3 = Node<String>(Empty(), '3', Empty());
    final nodeB = Node<String>(Empty(), 'B', Empty());

    // intermediate nodes
    final aMinus10 = Node<String>(nodeA, '-', node10);
    final timesLeft = Node<String>(node5, '*', aMinus10);

    final minus4 = Node<String>(Empty(), '-', node4);
    final divide3andB = Node<String>(node3, '/', nodeB);
    final timesRight = Node<String>(minus4, '*', divide3andB);

    // root node
    final tree = Node<String>(timesLeft, "+", timesRight);

    // print(tree);
    expect(tree.count, equals(12));
  });
}

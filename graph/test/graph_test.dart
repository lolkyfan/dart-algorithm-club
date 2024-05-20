import 'package:test/scaffolding.dart';

import '../graph.dart';

void main() {
  group('$AdjacencyListGraph', () {
    late AdjacencyListGraph graph;

    setUp(() {
      graph = AdjacencyListGraph<int>();
    });

    test('can compose graph', () {
      final v1 = graph.createVertex(1);
      final v2 = graph.createVertex(2);
      final v3 = graph.createVertex(3);
      final v4 = graph.createVertex(4);
      final v5 = graph.createVertex(5);

      graph.addDirectedEdge(from: v1, to: v2, weight: 1.0);
      graph.addDirectedEdge(from: v2, to: v3, weight: 1.0);
      graph.addDirectedEdge(from: v3, to: v4, weight: 4.5);
      graph.addDirectedEdge(from: v4, to: v1, weight: 2.8);
      graph.addDirectedEdge(from: v2, to: v5, weight: 3.2);
    });
  });

  group('$AdjacencyMatrixGraph', () {});
}

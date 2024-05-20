/// Used in an adjacent list to describe a graph.
///
/// [Edge] is directional. If an undirected edge is required
/// add two edges pointing to same vertices but in opposite direction.
class Edge<T> {
  final Vertex<T> from;
  final Vertex<T> to;

  final double? weight;

  Edge({
    required this.from,
    required this.to,
    required this.weight,
  });
}

class Vertex<T> {
  T data;
  final int index;

  Vertex({required this.data, required this.index});
}

abstract class Graph<T> {
  Vertex<T> createVertex(T data);

  void addDirectedEdge({
    required Vertex<T> from,
    required Vertex<T> to,
    double? weight,
  });
}

class EdgeList<T> {
  final Vertex<T> vertex;
  final List<Edge<T>> edges = [];

  EdgeList({required this.vertex});

  void addEdge(Edge<T> edge) {
    edges.add(edge);
  }
}

/// For sparse graphs, where vertex is connected only to handful of other vertices.
///
/// Adding vertex: **O(1)**
///
/// Adding edge: **O(1)**
///
/// Check Adjacency: **O(V)**
class AdjacencyListGraph<T> implements Graph<T> {
  List<Vertex<T>> get vertices {
    final List<Vertex<T>> vertices = [];
    for (final edgeList in adjacentList) {
      vertices.add(edgeList.vertex);
    }
    return vertices;
  }

  List<Edge<T>> get edges {
    final allEdges = Set<Edge<T>>();
    for (final edgeList in adjacentList) {
      final edges = edgeList.edges;
      if (edges.isEmpty) {
        continue;
      }

      for (final edge in edges) {
        allEdges.add(edge);
      }
    }

    return allEdges.toList();
  }

  final List<EdgeList<T>> adjacentList = [];

  @override
  void addDirectedEdge({
    required Vertex<T> from,
    required Vertex<T> to,
    double? weight,
  }) {
    final edge = Edge(from: from, to: to, weight: weight);
    final edgeList = adjacentList[from.index];

    edgeList.edges.add(edge);
  }

  @override
  Vertex<T> createVertex(T data) {
    // Check if vertex already exists
    final matching = vertices.where((vertex) => vertex.data == data);

    if (matching.length > 0) {
      return matching.last;
    }

    final vertex = Vertex<T>(data: data, index: vertices.length);
    adjacentList.add(EdgeList<T>(vertex: vertex));
    return vertex;
  }
}

/// For dense graphs, where each vertex is connected to most of the other vertices.
///
/// Adding vertex: **O(V^2)**
///
/// Adding edge: **O(1)**
///
/// Check Adjacency: **O(1)**
class AdjacencyMatrixGraph<T> implements Graph<T> {
  final List<List<double?>> _adjacencyMatrix = [[]];
  final List<Vertex<T>> _vertices = [];

  List<Vertex<T>> get vertices => _vertices;

  List<Edge<T>> get edges {
    final List<Edge<T>> edges = [];

    for (var row = 0; row < _adjacencyMatrix.length; row++) {
      for (var column = 0; column < _adjacencyMatrix.length; column++) {
        final weight = _adjacencyMatrix[row][column];

        if (weight != null) {
          edges.add(
            Edge(from: vertices[row], to: vertices[column], weight: weight),
          );
        }
      }
    }

    return edges;
  }

  @override
  void addDirectedEdge({
    required Vertex<T> from,
    required Vertex<T> to,
    double? weight,
  }) {
    _adjacencyMatrix[from.index][to.index] = weight;
  }

  void addUndirectedEdge({
    required (Vertex<T>, Vertex<T>) vertices,
    double? weight,
  }) {
    addDirectedEdge(from: vertices.$1, to: vertices.$2, weight: weight);
    addDirectedEdge(from: vertices.$2, to: vertices.$1, weight: weight);
  }

  double? weight({
    required Vertex<T> from,
    required Vertex<T> to,
  }) {
    return _adjacencyMatrix[from.index][to.index];
  }

  @override
  Vertex<T> createVertex(T data) {
    final matchingVertices = _vertices.where((vertex) => vertex.data == data);

    if (matchingVertices.length > 0) {
      return matchingVertices.last;
    }

    final vertex = Vertex(data: data, index: _adjacencyMatrix.length);

    for (var i = 0; i < _adjacencyMatrix.length; i++) {
      _adjacencyMatrix[i].add(null);
    }

    final newRow = List<double?>.generate(
      _adjacencyMatrix.length + 1,
      (_) => null,
    );
    _adjacencyMatrix.add(newRow);

    _vertices.add(vertex);

    return vertex;
  }

  List<Edge<T>> edgesFrom(Vertex<T> from) {
    final List<Edge<T>> outEdges = [];

    for (var column = 0; column < _adjacencyMatrix.length; column++) {
      final weight = _adjacencyMatrix[from.index][column];

      if (weight != null) {
        outEdges.add(Edge(from: from, to: _vertices[column], weight: weight));
      }
    }

    return outEdges;
  }
}

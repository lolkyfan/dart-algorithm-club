/// Entity to hold key value pairs.
/// This class is needed to avoid collisions in the hash table
/// using chaining.
class _Entity<K, V> {
  _Entity({required this.key, required this.value});

  K key;

  /// Mutable `value` to provide ability to replace it in case
  /// the element with a given `key` already exists in the chain.
  V value;
}

/// Bucket to hold a chain of elements to avoid collisions.
typedef Bucket = List<_Entity>;

class HashMap<K, V> {
  final _buckets = List<Bucket?>.filled(10, null);

  operator [](K key) {
    final index = _indexOf(key: key);
    final bucket = _buckets[index];

    return bucket?.firstWhere((entity) => entity.key == key).value;
  }

  operator []=(K key, V value) {
    final index = _indexOf(key: key);

    final bucket = _buckets[index];

    if (bucket == null) {
      _buckets[index] = [_Entity(key: key, value: value)];
    } else {
      for (final existing in bucket) {
        if (existing.key == key) {
          existing.value = value;
        } else {
          bucket.add(_Entity(key: key, value: value));
        }
      }
    }
  }

  int _indexOf({required K key}) => key.hashCode % _buckets.length;
}

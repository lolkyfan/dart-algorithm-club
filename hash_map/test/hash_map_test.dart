import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../hash_map.dart';

void main() {
  test('Can create $HashMap', () {
    expect(() => HashMap(), returnsNormally);
  });

  test('Can add and retrieve a value for specific key', () {
    final map = HashMap<int, String>();

    expect(() => map[1] = 'foo', returnsNormally);
    expect(map[1], 'foo');
  });

  test('Can add multiple values using $int keys', () {
    final map = HashMap<int, String>();

    map[1] = 'foo';
    map[2] = 'bar';
    map[3] = 'zar';
    map[4] = 'baz';

    expect(map[1], 'foo');
    expect(map[2], 'bar');
    expect(map[3], 'zar');
    expect(map[4], 'baz');
  });

  test('Can add multiple values using $String key', () {
    final map = HashMap<String, String>();

    map['1'] = 'foo';
    map['2'] = 'bar';
    map['3'] = 'zar';
    map['4'] = 'baz';

    expect(map['1'], 'foo');
    expect(map['2'], 'bar');
    expect(map['3'], 'zar');
    expect(map['4'], 'baz');
  });

  test('Can replace a value', () {
    final map = HashMap<int, String>();

    map[1] = 'foo';
    map[2] = 'bar';
    map[3] = 'zar';
    map[4] = 'baz';
    // Replace
    map[3] = 'lol';

    expect(map[1], 'foo');
    expect(map[2], 'bar');
    expect(map[3], 'lol');
    expect(map[4], 'baz');
  });
}

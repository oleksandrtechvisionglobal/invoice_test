import 'package:flutter_test/flutter_test.dart';
import 'package:invoice/common/utils/id_generator.dart';

void main() {
  group('IdGenerator tests', () {
    test('IdGenerator should generate a unique id', () async {
      final id1 = IdGenerator.getRandomString(5);
      final id2 = IdGenerator.getRandomString(5);
      expect(id1, isNot(equals(id2)));
    });

    test('IdGenerator should generate a unique id with a specific length',
        () async {
      final id = IdGenerator.getRandomString(5);
      expect(id.length, equals(5));
    });
  });
}

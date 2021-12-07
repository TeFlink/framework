import 'dart:io';

import 'package:teflink_dot_env/dot_env.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    DotEnv? dotEnv;
    setUp(() {
      dotEnv = DotEnv();
    });

    test('Initializing data', () async {
      expect(dotEnv?.debugKey, 'APP_DEBUG');
      expect(dotEnv?.envKey, 'APP_ENV');
    });

    test('Charge file .env', () async {
      final route = '/tmp/.env';
      File(route).writeAsStringSync('''
FIRST_VAR=123123
SECOND_CONNECTION=3423432
''');

      final envs = await dotEnv?.bootEnv(route);
      expect(envs?.first.name, 'FIRST_VAR');
      expect(envs?.first.value, '123123');
    });

    test('Charge file .env', () async {
      final route = '/tmp/.env.not.exists';

      expect(
          () async => await dotEnv?.bootEnv(route),
          throwsA(predicate((e) =>
              e is Exception &&
              e.toString() == 'Exception: The file not exists in $route')));
    });
  });
}

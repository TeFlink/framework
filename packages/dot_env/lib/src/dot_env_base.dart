import 'dart:convert';
import 'dart:io';

class Env {
  String? name;
  dynamic value;
}

class DotEnv {
  DotEnv({this.envKey = 'APP_ENV', this.debugKey = 'APP_DEBUG'}) {
    // print('Construct DotEnv');
  }

  String envKey;
  String debugKey;
  List<Env> envVars = [];

  Future<List<Env>> bootEnv(String filePath,
      {String defaultEnv = 'dev',
      List<String> testEnvs = const ['test']}) async {
    try {
      await File(filePath)
          .openRead()
          .transform(utf8.decoder)
          .transform(LineSplitter())
          .forEach((l) {
        final data = l.split('=');
        envVars.add(Env()
          ..name = data[0].toString()
          ..value = data[1]);
      });
    } catch (e) {
      throw Exception('The file not exists in $filePath');
    }

    return envVars;
  }

  String get(String name) => envVars.where((e) => e.name == name).first.value;

  void setEnvironment(String envInfo) async {
    final data = await Process.run('./vars.sh', [], runInShell: false);
    print(data.stdout);
    final envVars = Platform.environment;
    print(envVars['UNAVAR']);
  }
}

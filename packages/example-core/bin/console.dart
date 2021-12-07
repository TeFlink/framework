#! /usr/bin/env dart

import 'package:teflink_console/console.dart' as console;
import 'package:teflink_core/core.dart';
import 'package:teflink_dot_env/dot_env.dart';
import 'package:teflink_acore/acore.dart';

import 'dart:io';

Future main(List<String> args) async {
  // final hostname = 'localhost';
  // final database = 'on_watch_auth';
  // final username = 'postgres';
  // final password = 'postgres';

  // mappingExistingDb(
  //     hostname: hostname,
  //     database: database,
  //     username: username,
  //     password: password,
  //     destinyDir: './lib/src/models');
  await console.showTitle();
  final currentDirectory = Directory.current.path;
  final dotEnv = DotEnv();
  await dotEnv.bootEnv('$currentDirectory/.env');
  final app = console.Application(dotEnv: dotEnv);
  print(app.getVersion());
  final port = int.parse(app.dotEnv.get('PORT'));
  final server = ServerApp(port: port, application: app);
  server.entryPoint();
  app.runServer(args);
}

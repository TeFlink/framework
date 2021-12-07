import 'package:teflink_orm/teflink_orm.dart';

void main() {
  final hostname = 'localhost';
  final port = 5432;
  final database = 'on_watch_auth';
  final username = 'postgres';
  final password = 'postgres';
  mappingExistingDb(
      hostname: hostname,
      port: port,
      database: database,
      username: username,
      password: password,
      destinyDir: './example/models');
  // print('Hello world: ${tool.calculate()}!');
}

import 'package:teflink_orm/teflink_orm.dart' as tool;

void main(List<String> arguments) {
  final hostname = 'localhost';
  final port = 5432;
  final database = 'on_watch_auth';
  final username = 'postgres';
  final password = 'postgres';
  tool.mappingExistingDb(
    hostname: hostname,
    port: port,
    database: database,
    username: username,
    password: password,
  );
  // print('Hello world: ${tool.calculate()}!');
}

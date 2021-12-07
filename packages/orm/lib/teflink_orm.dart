import 'package:postgres/postgres.dart';
import 'package:teflink_orm/file.dart';
import 'package:teflink_orm/query.dart';
import 'package:teflink_orm/utils.dart';

void mappingExistingDb({
  required String database,
  String hostname = 'localhost',
  int port = 5432,
  String username = 'postgres',
  String password = 'postgres',
  String destinyDir = './example/models',
}) async {
  var connection = PostgreSQLConnection(hostname, port, database,
      username: username, password: password);
  await connection.open();

  List<List<dynamic>> allTables =
      await connection.query(getAllTablesQuery(), substitutionValues: {});

  print('-------');
  print('Tables');
  print('-------');
  var listFiles = '';

  for (var table in allTables) {
    final tableName = table[0];
    print('-------');
    print('public.$tableName');
    print('-------');
    List<List<dynamic>> results = await connection
        .query(getStructureQuery(tableName: table[0]), substitutionValues: {});

    final tableNameClass = toCamelCase(tableName);

    var content = '''
import 'package:teflink_orm/orm/index.dart';

// ignore: unused_import
import 'index.dart';

class $tableNameClass extends _$tableNameClass {}

@Table(name: '$tableName', schema: 'public')\nclass _$tableNameClass {''';
    for (final row in results) {
      var number = row[0];
      var name = row[1];
      // var atnum = row[2];
      var notnull = row[3];
      var type = row[4];
      var classType = getClassType(type);
      var primaryKey = row[5].toString() == 't' ? true : false;
      var uniqueKey = row[6].toString() == 't' ? true : false;
      var foreignKey = row[7];

      if (foreignKey != null) {
        var foreignKeyClass = toCamelCase(foreignKey);
        print('ForeignKey: $foreignKeyClass');
        // content += '';
        classType = '$foreignKeyClass';
      }

      content = '''$content
  @Column(
    name: '$name',
    notNull: $notnull,
    type: '$type'${primaryKey ? ', isPrimaryKey: true' : ''}, ${uniqueKey ? 'isUnique: true' : ''}
  )
  $classType? $name;
''';

      print('$number $name $type is not null? $notnull $primaryKey');
    }
    content = '$content\n}';
    listFiles += '''export '${removeFirstUnderscore(tableName)}.dart';\n''';
    await createFile('$destinyDir/${removeFirstUnderscore(tableName)}.dart',
        content: content);
  }
  await createFile('$destinyDir/index.dart', content: listFiles);
  print('End extraction tool...');
  await connection.close();
}

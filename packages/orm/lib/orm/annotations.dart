class Column {
  final String name;

  final bool notNull;

  final String type;

  final bool isPrimaryKey;

  final bool isUnique;

  const Column({
    required this.name,
    this.notNull = false,
    this.type = 'String',
    this.isPrimaryKey = false,
    this.isUnique = false,
  });
}

class Table {
  final String name;
  final String schema;
  const Table({required this.name, this.schema = 'public'});
}

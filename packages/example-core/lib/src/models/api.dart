import 'package:teflink_orm/orm/index.dart';

// ignore: unused_import
import 'index.dart';

class Api extends _Api {}

@Table(name: '_api', schema: 'public')
class _Api {
  @Column(
    name: 'id',
    notNull: true,
    type: 'bigint',
    isPrimaryKey: true,
  )
  int? id;

  @Column(
    name: 'client',
    notNull: true,
    type: 'text',
  )
  String? client;

  @Column(
    name: 'name',
    notNull: true,
    type: 'text',
  )
  String? name;

  @Column(
    name: 'identifier',
    notNull: true,
    type: 'text',
  )
  String? identifier;
}

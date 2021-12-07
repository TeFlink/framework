import 'package:teflink_orm/orm/index.dart';

// ignore: unused_import
import 'index.dart';

class Apipermission extends _Apipermission {}

@Table(name: '_apipermission', schema: 'public')
class _Apipermission {
  @Column(
    name: 'id',
    notNull: true,
    type: 'bigint', isPrimaryKey: true, 
  )
  int? id;

  @Column(
    name: 'description',
    notNull: true,
    type: 'text', 
  )
  String? description;

  @Column(
    name: 'name',
    notNull: true,
    type: 'text', 
  )
  String? name;

  @Column(
    name: 'api_id',
    notNull: false,
    type: 'bigint', 
  )
  Api? api_id;

}
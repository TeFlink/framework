import 'package:teflink_orm/orm/index.dart';

// ignore: unused_import
import 'index.dart';

class Rolepermission extends _Rolepermission {}

@Table(name: '_rolepermission', schema: 'public')
class _Rolepermission {
  @Column(
    name: 'id',
    notNull: true,
    type: 'bigint', isPrimaryKey: true, 
  )
  int? id;

  @Column(
    name: 'role_id',
    notNull: false,
    type: 'bigint', 
  )
  Role? role_id;

  @Column(
    name: 'permission_id',
    notNull: false,
    type: 'bigint', 
  )
  Apipermission? permission_id;

}
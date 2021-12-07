import 'package:teflink_orm/orm/index.dart';

// ignore: unused_import
import 'index.dart';

class Userrole extends _Userrole {}

@Table(name: '_userrole', schema: 'public')
class _Userrole {
  @Column(
    name: 'id',
    notNull: true,
    type: 'bigint', isPrimaryKey: true, 
  )
  int? id;

  @Column(
    name: 'user_id',
    notNull: false,
    type: 'bigint', 
  )
  User? user_id;

  @Column(
    name: 'role_id',
    notNull: false,
    type: 'bigint', 
  )
  Role? role_id;

  @Column(
    name: 'api_id',
    notNull: false,
    type: 'bigint', 
  )
  Api? api_id;

}
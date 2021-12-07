import 'package:teflink_orm/orm/index.dart';

// ignore: unused_import
import 'index.dart';

class Userclient extends _Userclient {}

@Table(name: '_userclient', schema: 'public')
class _Userclient {
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
    name: 'client_id',
    notNull: false,
    type: 'bigint', 
  )
  Client? client_id;

}
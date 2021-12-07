import 'package:teflink_orm/orm/index.dart';

// ignore: unused_import
import 'index.dart';

class Companyapiuser extends _Companyapiuser {}

@Table(name: '_companyapiuser', schema: 'public')
class _Companyapiuser {
  @Column(
    name: 'id',
    notNull: true,
    type: 'bigint', isPrimaryKey: true, 
  )
  int? id;

  @Column(
    name: 'isactive',
    notNull: true,
    type: 'boolean', 
  )
  bool? isactive;

  @Column(
    name: 'companyapi_id',
    notNull: false,
    type: 'bigint', 
  )
  Companyapi? companyapi_id;

  @Column(
    name: 'user_id',
    notNull: false,
    type: 'bigint', 
  )
  User? user_id;

}
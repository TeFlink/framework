import 'package:teflink_orm/orm/index.dart';

// ignore: unused_import
import 'index.dart';

class Companyapi extends _Companyapi {}

@Table(name: '_companyapi', schema: 'public')
class _Companyapi {
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
    name: 'api_id',
    notNull: false,
    type: 'bigint', 
  )
  Api? api_id;

  @Column(
    name: 'company_id',
    notNull: false,
    type: 'bigint', 
  )
  Company? company_id;

}
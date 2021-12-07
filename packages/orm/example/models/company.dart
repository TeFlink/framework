import 'package:teflink_orm/orm/index.dart';

// ignore: unused_import
import 'index.dart';

class Company extends _Company {}

@Table(name: '_company', schema: 'public')
class _Company {
  @Column(
    name: 'id',
    notNull: true,
    type: 'bigint', isPrimaryKey: true, 
  )
  int? id;

  @Column(
    name: 'name',
    notNull: true,
    type: 'text', 
  )
  String? name;

}
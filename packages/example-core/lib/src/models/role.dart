import 'package:teflink_orm/orm/index.dart';

// ignore: unused_import
import 'index.dart';

class Role extends _Role {}

@Table(name: '_role', schema: 'public')
class _Role {
  @Column(
    name: 'id',
    notNull: true,
    type: 'bigint', isPrimaryKey: true, 
  )
  int? id;

  @Column(
    name: 'client',
    notNull: true,
    type: 'text', 
  )
  String? client;

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

}
import 'package:teflink_orm/orm/index.dart';

// ignore: unused_import
import 'index.dart';

class Client extends _Client {}

@Table(name: '_client', schema: 'public')
class _Client {
  @Column(
    name: 'id',
    notNull: true,
    type: 'bigint', isPrimaryKey: true, 
  )
  int? id;

  @Column(
    name: 'clientid',
    notNull: true,
    type: 'text', isUnique: true
  )
  String? clientid;

  @Column(
    name: 'redirecturl',
    notNull: true,
    type: 'text', 
  )
  String? redirecturl;

  @Column(
    name: 'description',
    notNull: true,
    type: 'text', 
  )
  String? description;

  @Column(
    name: 'user_id',
    notNull: false,
    type: 'bigint', 
  )
  User? user_id;

  @Column(
    name: 'secret',
    notNull: false,
    type: 'text', 
  )
  String? secret;

  @Column(
    name: 'api_id',
    notNull: false,
    type: 'bigint', 
  )
  Api? api_id;

}
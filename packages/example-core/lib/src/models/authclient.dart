import 'package:teflink_orm/orm/index.dart';

// ignore: unused_import
import 'index.dart';

class Authclient extends _Authclient {}

@Table(name: '_authclient', schema: 'public')
class _Authclient {
  @Column(
    name: 'id',
    notNull: true,
    type: 'text', isPrimaryKey: true, 
  )
  String? id;

  @Column(
    name: 'hashedsecret',
    notNull: false,
    type: 'text', 
  )
  String? hashedsecret;

  @Column(
    name: 'salt',
    notNull: false,
    type: 'text', 
  )
  String? salt;

  @Column(
    name: 'redirecturi',
    notNull: false,
    type: 'text', 
  )
  String? redirecturi;

  @Column(
    name: 'allowedscope',
    notNull: false,
    type: 'text', 
  )
  String? allowedscope;

}
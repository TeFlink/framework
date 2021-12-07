import 'package:teflink_orm/orm/index.dart';

// ignore: unused_import
import 'index.dart';

class User extends _User {}

@Table(name: '_user', schema: 'public')
class _User {
  @Column(
    name: 'id',
    notNull: true,
    type: 'bigint', isPrimaryKey: true, 
  )
  int? id;

  @Column(
    name: 'username',
    notNull: true,
    type: 'text', isUnique: true
  )
  String? username;

  @Column(
    name: 'hashedpassword',
    notNull: true,
    type: 'text', 
  )
  String? hashedpassword;

  @Column(
    name: 'salt',
    notNull: true,
    type: 'text', 
  )
  String? salt;

  @Column(
    name: 'company',
    notNull: false,
    type: 'text', 
  )
  String? company;

  @Column(
    name: 'firstname',
    notNull: false,
    type: 'text', 
  )
  String? firstname;

  @Column(
    name: 'lastname',
    notNull: false,
    type: 'text', 
  )
  String? lastname;

}
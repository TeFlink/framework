import 'package:teflink_orm/orm/index.dart';

// ignore: unused_import
import 'index.dart';

class Authtoken extends _Authtoken {}

@Table(name: '_authtoken', schema: 'public')
class _Authtoken {
  @Column(
    name: 'id',
    notNull: true,
    type: 'bigint', isPrimaryKey: true, 
  )
  int? id;

  @Column(
    name: 'code',
    notNull: false,
    type: 'text', isUnique: true
  )
  String? code;

  @Column(
    name: 'accesstoken',
    notNull: false,
    type: 'text', isUnique: true
  )
  String? accesstoken;

  @Column(
    name: 'refreshtoken',
    notNull: false,
    type: 'text', isUnique: true
  )
  String? refreshtoken;

  @Column(
    name: 'scope',
    notNull: false,
    type: 'text', 
  )
  String? scope;

  @Column(
    name: 'issuedate',
    notNull: true,
    type: 'timestamp without time zone', 
  )
  DateTime? issuedate;

  @Column(
    name: 'expirationdate',
    notNull: true,
    type: 'timestamp without time zone', 
  )
  DateTime? expirationdate;

  @Column(
    name: 'type',
    notNull: false,
    type: 'text', 
  )
  String? type;

  @Column(
    name: 'resourceowner_id',
    notNull: true,
    type: 'bigint', 
  )
  User? resourceowner_id;

  @Column(
    name: 'client_id',
    notNull: true,
    type: 'text', 
  )
  Authclient? client_id;

}
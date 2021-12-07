import 'package:teflink_orm/orm/index.dart';

// ignore: unused_import
import 'index.dart';

class AqueductVersionPgsql extends _AqueductVersionPgsql {}

@Table(name: '_aqueduct_version_pgsql', schema: 'public')
class _AqueductVersionPgsql {
  @Column(
    name: 'versionnumber',
    notNull: true,
    type: 'integer', isUnique: true
  )
  String? versionnumber;

  @Column(
    name: 'dateofupgrade',
    notNull: true,
    type: 'timestamp without time zone', 
  )
  DateTime? dateofupgrade;

}
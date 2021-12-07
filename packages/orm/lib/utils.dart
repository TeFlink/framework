String getClassType(type) {
  if (type.contains('character varying')) {
    return 'String';
  }
  if (type.contains('timestamp')) {
    return 'DateTime';
  }
  switch (type) {
    case 'int4':
      return 'int';
    case 'bigint':
      return 'int';
    case 'int8':
      return 'int';
    case 'float4':
      return 'double';
    case 'float8':
      return 'double';
    case 'boolean':
      return 'bool';
    default:
      return 'String';
  }
}

String toCamelCase(tableName) {
  var parts = tableName.split('_');
  var camelCase = '';
  for (String part in parts) {
    if (part.isNotEmpty) {
      camelCase = '$camelCase${part[0].toUpperCase()}${part.substring(1)}';
    }
  }
  return camelCase;
}

String removeFirstUnderscore(String str) {
  if (str.startsWith('_')) {
    return str.substring(1);
  }
  return str;
}

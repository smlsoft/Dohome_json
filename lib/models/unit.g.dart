// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit(
      code: json['code'] as String,
      lineNumber: json['line_number'] as int,
      standValue: json['stand_value'] as int,
      divideValue: json['divide_value'] as int,
      rowOrder: json['row_order'] as int,
    );

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
      'code': instance.code,
      'line_number': instance.lineNumber,
      'stand_value': instance.standValue,
      'divide_value': instance.divideValue,
      'row_order': instance.rowOrder,
    };

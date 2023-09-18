import 'package:json_annotation/json_annotation.dart';

part 'unit.g.dart';

@JsonSerializable()
class Unit {
  final String code;

  @JsonKey(name: 'line_number')
  final int lineNumber;

  @JsonKey(name: 'stand_value')
  final int standValue;

  @JsonKey(name: 'divide_value')
  final int divideValue;

  @JsonKey(name: 'row_order')
  final int rowOrder;

  Unit({
    required this.code,
    required this.lineNumber,
    required this.standValue,
    required this.divideValue,
    required this.rowOrder,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

  Map<String, dynamic> toJson() => _$UnitToJson(this);
}

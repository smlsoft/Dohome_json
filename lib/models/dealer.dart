import 'package:json_annotation/json_annotation.dart';

part 'dealer.g.dart';

@JsonSerializable()
class Dealer {
  @JsonKey(name: 'dealercode')
  final String dealerCode;

  @JsonKey(name: 'issync')
  final bool isSync;

  Dealer({required this.dealerCode, required this.isSync});

  factory Dealer.fromJson(Map<String, dynamic> json) => _$DealerFromJson(json);

  Map<String, dynamic> toJson() => _$DealerToJson(this);
}

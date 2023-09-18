// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dealer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dealer _$DealerFromJson(Map<String, dynamic> json) => Dealer(
      dealerCode: json['dealercode'] as String,
      isSync: json['issync'] as bool,
    );

Map<String, dynamic> _$DealerToJson(Dealer instance) => <String, dynamic>{
      'dealercode': instance.dealerCode,
      'issync': instance.isSync,
    };

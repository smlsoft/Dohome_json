// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      code: json['code'] as String,
      name1: json['name_1'] as String,
      unitCost: json['unit_cost'] as String,
      priceRecommended: json['price_recommended'] as int,
      taxType: json['tax_type'] as int,
      productImage: json['product_image'] as String,
      units: (json['units'] as List<dynamic>)
          .map((e) => Unit.fromJson(e as Map<String, dynamic>))
          .toList(),
      dealers: (json['dealers'] as List<dynamic>)
          .map((e) => Dealer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'code': instance.code,
      'name_1': instance.name1,
      'unit_cost': instance.unitCost,
      'price_recommended': instance.priceRecommended,
      'tax_type': instance.taxType,
      'units': instance.units,
      'dealers': instance.dealers,
      'product_image': instance.productImage,
    };

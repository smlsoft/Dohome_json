import 'package:json_annotation/json_annotation.dart';
import 'package:jsonflutter/models/dealer.dart';
import 'package:jsonflutter/models/unit.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String code;

  @JsonKey(name: 'name_1')
  final String name1;

  @JsonKey(name: 'unit_cost')
  final String unitCost;

  @JsonKey(name: 'price_recommended')
  final int priceRecommended;

  @JsonKey(name: 'tax_type')
  final int taxType;
  final List<Unit> units;
  final List<Dealer> dealers;

  @JsonKey(name: 'product_image')
  final String productImage;

  Product(
      {required this.code,
      required this.name1,
      required this.unitCost,
      required this.priceRecommended,
      required this.taxType,
      required this.productImage,
      required this.units,
      required this.dealers});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    _loadProductData();
  }

  Future<void> _loadProductData() async {
    final String response =
        await rootBundle.loadString('assets/template_.json');
    final data = await json.decode(response);
    setState(() {
      for (Map<String, dynamic> item in data) {
        products.add(Product.fromJson(item));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Code')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Unit Cost')),
                  DataColumn(label: Text('Recommended Price')),
                  DataColumn(label: Text('Tax Type')),
                  DataColumn(label: Text('Units')),
                  DataColumn(label: Text('Dealers')),
                  DataColumn(label: Text('Product Image')),
                ],
                rows: products
                    .map(
                      (product) => DataRow(cells: [
                        DataCell(Text(product.code)),
                        DataCell(Text(product.name1)),
                        DataCell(Text(product.unitCost)),
                        DataCell(Text(product.priceRecommended.toString())),
                        DataCell(Text(product.taxType.toString())),
                        DataCell(
                            Text(product.units[0].code)), // adjust as needed
                        DataCell(Text(product.dealers
                            .map((e) => e.dealerCode)
                            .join(', '))), // adjust as needed
                        DataCell(Image.network(product.productImage,
                            width: 100, height: 100)), // adjust as needed
                      ]),
                    )
                    .toList(),
              ),
            ),
    );
  }
}

class Product {
  final String code;
  final String name1;
  final String unitCost;
  final int priceRecommended;
  final int taxType;
  final List<Unit> units;
  final List<Dealer> dealers;
  final String productImage;

  Product({
    required this.code,
    required this.name1,
    required this.unitCost,
    required this.priceRecommended,
    required this.taxType,
    required this.units,
    required this.dealers,
    required this.productImage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    var unitList = json['units'] as List;
    List<Unit> unitTempList = unitList.map((i) => Unit.fromJson(i)).toList();

    var dealerList = json['dealers'] as List;
    List<Dealer> dealerTempList =
        dealerList.map((i) => Dealer.fromJson(i)).toList();

    return Product(
      code: json['code'],
      name1: json['name_1'],
      unitCost: json['unit_cost'],
      priceRecommended: json['price_recommended'],
      taxType: json['tax_type'],
      units: unitTempList,
      dealers: dealerTempList,
      productImage: json['product_image'],
    );
  }
}

class Unit {
  final String code;
  final int lineNumber;
  final int standValue;
  final int divideValue;
  final int rowOrder;

  Unit({
    required this.code,
    required this.lineNumber,
    required this.standValue,
    required this.divideValue,
    required this.rowOrder,
  });

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      code: json['code'],
      lineNumber: json['line_number'],
      standValue: json['stand_value'],
      divideValue: json['divide_value'],
      rowOrder: json['row_order'],
    );
  }
}

class Dealer {
  final String dealerCode;
  final bool isSync;

  Dealer({required this.dealerCode, required this.isSync});

  factory Dealer.fromJson(Map<String, dynamic> json) {
    return Dealer(
      dealerCode: json['dealercode'],
      isSync: json['issync'],
    );
  }
}

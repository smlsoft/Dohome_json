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
        body: products == null
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: SingleChildScrollView(
                    child: Column(children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Image')),
                        DataColumn(label: Text('Code')),
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Unit Cost')),
                        DataColumn(label: Text('Price Recommended')),
                        DataColumn(label: Text('Tax Type')),
                        DataColumn(label: Text('Unit Code')),
                        DataColumn(label: Text('Dealer Codes')),
                        DataColumn(label: Text('ส่งข้อมูล')),
                        DataColumn(label: Text('หยุดขาย')),
                        DataColumn(label: Text('ขายต่อ')),
                        DataColumn(label: Text('แก้ไข')),
                        DataColumn(
                          label: IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: () {},
                          ),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                        products.length,
                        (int index) => DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Image.network(
                                products[index].productImage,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            DataCell(Text(products[index].code)),
                            DataCell(Text(products[index].name1)),
                            DataCell(Text(products[index].unitCost)),
                            DataCell(Text(
                                products[index].priceRecommended.toString())),
                            DataCell(Text(products[index].taxType.toString())),
                            DataCell(
                                Text(products[index].units[0].code.toString())),
                            DataCell(Text(products[index]
                                .dealers
                                .map((e) => e.dealerCode)
                                .join(', '))),
                            DataCell(
                              IconButton(
                                icon: Icon(Icons.send),
                                color: Colors.blue,
                                onPressed: () {
                                  showAboutDialog(
                                    context: context,
                                    applicationName: "My Flutter App",
                                    applicationVersion: "1.0.0",
                                    applicationIcon: Icon(Icons.ad_units_sharp),
                                    children: [
                                      Text("รหัส: " + products[index].code),
                                      Text("ชื่อ: " + products[index].name1),
                                      Text(
                                          "หน่วย: " + products[index].unitCost),
                                      Text("ราคา: " +
                                          products[index]
                                              .priceRecommended
                                              .toString()),
                                      Text("รหัสภาษี: " +
                                          products[index].taxType.toString()),
                                      Text("รหัสยูนิต: " +
                                          products[index]
                                              .units[0]
                                              .code
                                              .toString()),
                                      Text("รหัสตัวแทนจำหน่าย: " +
                                          products[index]
                                              .dealers
                                              .map((e) => e.dealerCode)
                                              .join(', ')),
                                    ],
                                  );
                                },
                              ),
                            ),
                            DataCell(
                              IconButton(
                                icon: Icon(Icons.stop),
                                color: Colors.red,
                                onPressed: () {},
                              ),
                            ),
                            DataCell(
                              IconButton(
                                icon: Icon(Icons.play_arrow),
                                color: Colors.green,
                                onPressed: () {},
                              ),
                            ),
                            DataCell(
                              IconButton(
                                icon: Icon(Icons.edit),
                                color: Colors.orange,
                                onPressed: () {},
                              ),
                            ),
                            DataCell(Container()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Custom',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 500.0, right: 500.0),
                  child: Row(children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        child: SizedBox(
                          width: 2000,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Please search here ',
                            ),
                            style: TextStyle(
                              fontSize: 12,
                              height: 2.0,
                            ),
                            maxLines: 100,
                            minLines: 20,
                          ),
                        ),
                      ),
                    ),
                    // Adds space between the text field and buttons
                    Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  // Handle button 1 press
                                },
                                icon: Icon(Icons
                                    .send), // Choose appropriate icon from Icons class
                                label: Text('ส่งข้อมูล'),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors
                                      .blue), // Setting the background color of the button
                                ), // Your button label
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Handle button 1 press
                            },
                            icon: Icon(Icons
                                .stop), // Choose appropriate icon from Icons class
                            label: Text('หยุดขาย'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors
                                  .red), // Setting the background color of the button
                            ), // Your button label
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Handle button 1 press
                            },
                            icon: Icon(
                              Icons.play_arrow,
                            ), // Choose appropriate icon from Icons class
                            label: Text('ขายต่อ'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors
                                  .green), // Setting the background color of the button
                            ), // Your button label
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Handle button 1 press
                            },
                            icon: Icon(Icons
                                .edit), // Choose appropriate icon from Icons class
                            label: Text('แก้ไข'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors
                                  .orange), // Setting the background color of the button
                            ), // Your button label
                          ),
                        ),
                      ],
                    ),
                  ]),
                )
              ]))));
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

import 'package:flutter_test/flutter_test.dart';
import 'package:jsonflutter/environment.dart';
import 'package:jsonflutter/models/models.dart';
import 'package:jsonflutter/services/product_dealer_api.dart';

void main() {
  setUpAll(() {
    Environment().initConfig(Environment.TEST);
  });

  test('test-create-product', () async {
    ProductDealerApi api = ProductDealerApi();
    ApiResponse response = await api.SendProductSync(Product(
      code: "IC0001",
      name1: "Product 1",
      unitCost: "PCS",
      taxType: 1,
      priceRecommended: 230,
      productImage: "",
      units: [
        Unit(
          code: "PCS",
          lineNumber: 1,
          standValue: 1,
          divideValue: 1,
          rowOrder: 1,
        ),
      ],
      dealers: [
        Dealer(dealerCode: "", isSync: true),
        Dealer(dealerCode: "", isSync: true),
      ],
    ));

    expect(response.success, true);
  });
}

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:jsonflutter/environment.dart';

main() {
  test('test environment', () {
    Environment().initConfig(Environment.TEST);

    expect(Environment().config.serviceApi, "http://localhost:8888");
  });
}

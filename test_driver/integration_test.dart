// init interation driver

import 'dart:convert';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:integration_test/integration_test_driver.dart';
import 'package:path/path.dart' as path;

Future<void> main() async {
  integrationDriver(
    responseDataCallback: (Map<String, dynamic>? data) async {
      print('Response data: $data');

      await fs.directory(_destinationDirectory).create(recursive: true);

      final file = fs.file(
        path.join(
          _destinationDirectory,
          _testOutputFileName,
        ),
      );

      final resultString = _encodeJson(data);

      await file.writeAsString(resultString);
    },
  );
}

String _encodeJson(Map<String, dynamic>? data) {
  return _prettyEncoder.convert(data);
}

const _prettyEncoder = JsonEncoder.withIndent('  ');
const _destinationDirectory = 'integration_test';
const _testOutputFileName = 'integration_test_results.json';

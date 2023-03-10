import 'dart:convert';

import 'package:flutter_testreports/features/testreport/data/models/test_report_model.dart';
import 'package:flutter_testreports/features/testreport/domain/entities/test_report.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tTestReportModel = TestReportModel(
      trNo: 333, client: 'abc', customer: 'def', project: 'ghi');

  test(
    'should be a subclass of TestReports entity',
    () async {
      // assert
      expect(tTestReportModel, isA<TestReports>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON number is an integer',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('testreport.json'));
        // act
        final result = TestReportModel.fromJson(jsonMap);
        // assert
        expect(result, tTestReportModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tTestReportModel.toJson();
        // assert
        final expectedJsonMap = {
          "client": "abc",
          "customer": "def",
          "project": "ghi",
          "trNo": 333,
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}

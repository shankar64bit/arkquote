import 'dart:convert';

import 'package:flutter_testreports/core/error/exceptions.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_remote_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/models/test_report_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  TestReportRemoteDatasourceImpl datasource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    datasource = TestReportRemoteDatasourceImpl(client: mockHttpClient);
  });

  group('getTestReport', () {
    final ttrNo = 333;
    final tTestReportModel =
        TestReportModel.fromJson(json.decode(fixture('testreport.json')));

    test(
      'should perform a GET request on a URL with correct endpoint and application/json as header',
      () {
        //arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('testreport.json'), 200),
        );

        //act
        datasource.getTestReport(ttrNo);

        //assert
        verify(mockHttpClient.get(
          Uri.parse('http://localhost:8000/$ttrNo'),
          headers: {'Content-Type': 'application/json'},
        ));
      },
    );

    test(
      'should return TestReport when the response code is 200',
      () async {
        //arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('testreport.json'), 200),
        );

        //act
        final result = await datasource.getTestReport(ttrNo);

        //assert
        expect(result, tTestReportModel);
      },
    );

    test('should throw a ServerException when response is 404 or other',
        () async {
      //arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response('Something went wrong', 404),
      );
      //act
      final call = datasource.getTestReport;
      //assert
      expect(() => call(ttrNo), throwsA(TypeMatcher<ServerException>()));
    });
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testreports/core/error/exceptions.dart';
import 'package:flutter_testreports/core/error/failures.dart';
import 'package:flutter_testreports/core/platform/network_info.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_remote_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/models/test_report_model.dart';
import 'package:flutter_testreports/features/testreport/data/repositories/test_report_repository_impl.dart';
import 'package:flutter_testreports/features/testreport/domain/entities/test_report.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDatasource extends Mock implements TestReportRemoteDatasource {}

class MockLocalDatasource extends Mock implements TestReportLocalDatasource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  TestReportRepositoryImpl repository;
  MockRemoteDatasource mockRemoteDatasource;
  MockLocalDatasource mockLocalDatasource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDatasource = MockRemoteDatasource();
    mockLocalDatasource = MockLocalDatasource();
    mockNetworkInfo = MockNetworkInfo();
    repository = TestReportRepositoryImpl(
      remoteDatasource: mockRemoteDatasource,
      localDatasource: mockLocalDatasource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getTestReport', () {
    final trNo = 333;
    final trNoTestReportModel = TestReportModel(
        client: 'abc', customer: 'def', project: 'ghi', trNo: 333);
    final TestReports trNoTestReport = trNoTestReportModel;
    test(
      'should check if the device is online',
      () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        //act
        repository.getTestReport(trNo);
        //assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return remote data when remote datasource is called',
          () async {
        //arrange
        when(mockRemoteDatasource.getTestReport(any))
            .thenAnswer((_) async => trNoTestReportModel);
        //act
        final result = await repository.getTestReport(trNo);
        //assert
        verify(mockRemoteDatasource.getTestReport(trNo));
        expect(result, equals(Right(trNoTestReport)));
      });

      test('should save data locally when remote datasource is called',
          () async {
        //arrange
        when(mockRemoteDatasource.getTestReport(any))
            .thenAnswer((_) async => trNoTestReportModel);
        //act
        await repository.getTestReport(trNo);
        //assert
        verify(mockRemoteDatasource.getTestReport(trNo));
        verify(mockLocalDatasource.localTestReport(trNoTestReportModel));
      });
      test(
          'should return server failure when remote datasource is unsuccesfuly called',
          () async {
        //arrange
        when(mockRemoteDatasource.getTestReport(any))
            .thenThrow(ServerException());
        //act
        final result = await repository.getTestReport(trNo);
        //assert
        verify(mockRemoteDatasource.getTestReport(trNo));
        verifyZeroInteractions(mockLocalDatasource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return local data when local data is present', () async {
        //arrange
        when(mockLocalDatasource.getTestReport(trNo))
            .thenAnswer((_) async => trNoTestReportModel);
        //act
        final result = await repository.getTestReport(trNo);
        //assert
        verifyZeroInteractions(mockRemoteDatasource);
        verify(mockLocalDatasource.getTestReport(trNo));
        expect(result, equals(Right(trNoTestReport)));
      });

      test('should return cache failure when local datasource is not present',
          () async {
        //arrange
        when(mockLocalDatasource.getTestReport(any))
            .thenThrow(CacheException());
        //act
        final result = await repository.getTestReport(trNo);
        //assert
        verify(mockLocalDatasource.getTestReport(trNo));
        verifyZeroInteractions(mockRemoteDatasource);
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });
}

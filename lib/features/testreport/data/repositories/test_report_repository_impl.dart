import 'package:flutter_testreports/core/error/exceptions.dart';
import 'package:flutter_testreports/core/platform/network_info.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_remote_datasource.dart';
import 'package:flutter_testreports/features/testreport/domain/entities/test_report.dart';
import 'package:flutter_testreports/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:flutter_testreports/features/testreport/domain/repositories/test_report_repository.dart';

class TestReportRepositoryImpl implements TestReportRepository {
  final TestReportRemoteDatasource remoteDatasource;
  final TestReportLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  TestReportRepositoryImpl({
    @required this.remoteDatasource,
    @required this.localDatasource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, TestReports>> getTestReport(int trNo) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTestReport = await remoteDatasource.getTestReport(trNo);
        localDatasource.localTestReport(remoteTestReport);
        return Right(remoteTestReport);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTestReport = await localDatasource.getTestReport(trNo);
        return Right(localTestReport);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}

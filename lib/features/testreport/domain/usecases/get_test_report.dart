import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/test_report.dart';
import '../repositories/test_report_repository.dart';

class GetTestReport {
  final TestReportRepository repository;

  GetTestReport(this.repository);

  Future<Either<Failure, TestReports>> call({
    @required int trNo,
  }) async {
    return await repository.getTestReport(trNo);
  }
}

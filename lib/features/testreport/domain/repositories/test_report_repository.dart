import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/test_report.dart';

abstract class TestReportRepository {
  Future<Either<Failure, TestReports>> getTestReport(int trNo);
}

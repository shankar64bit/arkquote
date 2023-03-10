import 'package:dartz/dartz.dart';
import 'package:flutter_testreports/features/testreport/domain/entities/test_report.dart';
import 'package:flutter_testreports/features/testreport/domain/repositories/test_report_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testreports/features/testreport/domain/usecases/get_test_report.dart';
import 'package:mockito/mockito.dart';

class MockTestReportRepository extends Mock implements TestReportRepository {}

void main() {
  GetTestReport usecase;
  MockTestReportRepository mockTestReportRepository;

  setUp(() {
    mockTestReportRepository = MockTestReportRepository();
    usecase = GetTestReport(mockTestReportRepository);
  });

  final trNo = 145321;
  final tTestReport = TestReports(
      client: 'Testing1', customer: 'Testing 2', project: 'T3', trNo: 1231242);

  test(
    'Should get Test report from repo',
    () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getTestReport is called with any argument, always answer with
      // the Right "side" of Either containing a test TesttReport object.
      when(mockTestReportRepository.getTestReport(any))
          .thenAnswer((_) async => Right(tTestReport));
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase(trNo: trNo);
      expect(result, Right(tTestReport));
      verify(mockTestReportRepository.getTestReport(trNo));
      verifyNoMoreInteractions(mockTestReportRepository);
    },
  );
}

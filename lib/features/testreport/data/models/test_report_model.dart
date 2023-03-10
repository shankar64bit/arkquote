import 'package:meta/meta.dart';

import '../../domain/entities/test_report.dart';

class TestReportModel extends TestReports {
  const TestReportModel({
    @required final int id,
    @required final int databaseID,
    @required final String client,
    @required final String customer,
    @required final String project,
    @required final int trNo,
    @required DateTime testDate,
    @required DateTime lastUpdated,
  }) : super(
          id: id,
          databaseID: databaseID,
          client: client,
          customer: customer,
          project: project,
          trNo: trNo,
          testDate: testDate,
          lastUpdated: lastUpdated,
        );

  @override
  List<Object> get props =>
      [id, databaseID, client, customer, project, trNo, testDate, lastUpdated];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'databaseID': databaseID,
      'client': client,
      'customer': customer,
      'project': project,
      'trNo': trNo,
      'timeStamp': testDate,
      'updateDate': lastUpdated,
    };
  }

  factory TestReportModel.fromJson(Map<String, dynamic> json) {
    return TestReportModel(
      id: json['id'],
      databaseID: json['databaseID'],
      client: json['client'],
      customer: json['customer'],
      project: json['project'],
      trNo: json['trNo'],
      testDate: json['timeStamp'],
      lastUpdated: json['updateDate'],
    );
  }
}

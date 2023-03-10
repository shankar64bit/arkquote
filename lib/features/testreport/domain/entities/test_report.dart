import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TestReports extends Equatable {
  final int id;
  final int databaseID;
  final String client;
  final String customer;
  final String project;
  final int trNo;
  final DateTime testDate;
  final DateTime lastUpdated;

  const TestReports({
    this.id,
    @required this.databaseID,
    @required this.client,
    @required this.customer,
    @required this.project,
    @required this.trNo,
    @required this.testDate,
    @required this.lastUpdated,
  });

  @override
  List<Object> get props =>
      [id, databaseID, client, customer, project, trNo, testDate, lastUpdated];
}

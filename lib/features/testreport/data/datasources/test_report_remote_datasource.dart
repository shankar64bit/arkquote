// ignore: library_prefixes
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_testreports/core/error/exceptions.dart';
import 'package:flutter_testreports/features/testreport/data/models/test_report_model.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

abstract class TestReportRemoteDatasource {
  ///Calls the Backend api endpoint
  ///Throws a [ServerException] otherwise
  Future<TestReportModel> getTestReport(int trNo);
  Future<List<TestReportModel>> getNewReports();
}

class TestReportRemoteDatasourceImpl implements TestReportRemoteDatasource {
  final http.Client client;

  TestReportRemoteDatasourceImpl({@required this.client});

  @override
  Future<List<TestReportModel>> getNewReports() {
    // TODO: implement getNewReports
    throw UnimplementedError();
  }

  @override
  Future<TestReportModel> getTestReport(int trNo) async {
    final response = await client.get(
      Uri.parse('http://localhost:8000/$trNo'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return TestReportModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  void sockets() {
    print('got inside first');
    String msg = 'some text';
    final channel = IOWebSocketChannel.connect(
        'wss://demo.piesocket.com/v3/channel_1?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self');
    channel.stream.listen((message) {
      channel.sink.add(msg);
      print(msg + '\n');
      channel.sink.close();
      print('Server closed');
    });
  }
}

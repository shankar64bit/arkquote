import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:dartz/dartz.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_remote_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:web_socket_channel/io.dart';
import '../../../../../../../env.sample.dart';
import '../../../../../../../injection_container.dart';
import '../../../../../data/datasources/inventory_remote_database.dart';
import '../../../../../data/datasources/user_remote_database.dart';
import '../../../../../data/models/test_report_model.dart';
import '../../../../providers/equipment_acb_provider/inventory_provider.dart';
import '../../../../providers/equipment_acb_provider/test_report_provider.dart';
import '../../../../providers/user_table_provider.dart';

class GoogleSignInController with ChangeNotifier {
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount googleAccount;
  //String _accessToken;
  //String get accessToken => _accessToken;
  String CLIENT_ID = "xGpgnME0hEoPG11tLE8Ue902BhZLFkDlbxKRv7uh";
  String CLIENT_SECRET =
      "CzJVkLRss1oX25bnFRlnCJwl7hzaHrpQ0DaHpKc3aLUf1elAeK0Z4Fc4EB3QcraujcNjH406mg9Zxh0sbiK8Ve2LSewtXYrRphAwxNZ4W2dVo9jFSBuc5D3SHPepNhHZ";
  String ACCESS_TOKEN;
  String REFRESH_TOKEN;
  String AUTH_CODE;
  int responseStatus;
  String wss_checker;

  void login() async {
    this.googleAccount = await _googleSignIn.signIn();
    print('Triggerd in login function');
    await exchangeToken();

    // ---------------------------------------------------
    var url_auth = Uri.parse('${Env.URL_PREFIX}/api/login');
    final res_auth = await http.post(url_auth, headers: {
      // 'Content-Type ': 'application/json',
      'Authorization': 'Bearer $ACCESS_TOKEN',
    });
    print('Response status: ${res_auth.statusCode}');
    print('Response body: ${res_auth.body}');
    AUTH_CODE = json.decode(res_auth.body)['token'];
    print('AuthCode => ' + AUTH_CODE);
    // wss_connect();
    loadFromRemote();
    notifyListeners();
  }

  loadFromRemote() async {
    await sl<UserRemoteDatasourceImpl>().getNewUsers();
    sl<UserProvider>().FutureGetUserLocalDataList();
    await sl<InventoryRemoteDatasourceImpl>().getNewEquipments();
    sl<InventoryProvider>().FutureGetEquipmentLocalDataList();
  }

  // --------------testReport-table-wss-crud-operation----------------------
  void wss_connect() {
    IOWebSocketChannel channel_socket = IOWebSocketChannel.connect(
        Uri.parse('wss://dev.arkpower.co.in/wss/subscribe/'),
        headers: {'Authorization': 'Bearer $AUTH_CODE'});

    channel_socket.stream.listen(
      (value) async {
        String actionType = jsonDecode(value)['action'];
        var serverRes = jsonDecode(value)['instance'];
        print('action : ' + actionType);
        print('wss response : ' + value);
        print(serverRes);

        if (actionType == 'UPDATED') {
          TestReportModel serverToLocalupdate = TestReportModel(
            // id: serverRes['id'],
            databaseID: serverRes['id'],
            trNo: int.tryParse(serverRes['trNo']),
            client: serverRes['client'],
            customer: serverRes['customer'],
            project: serverRes['project'],
            testDate: DateTime.tryParse(serverRes['timeStamp']),
            lastUpdated: DateTime.tryParse(serverRes['updateDate']),
          );
          var trAppdb = sl<TestReportsProvider>().reportListFuture;
          print(trAppdb);

          for (var i in trAppdb) {
            var gotID = i.id;
            var gotDBID = i.databaseID;
            if (serverRes['id'] == gotDBID) {
              print(serverToLocalupdate);
              sl<TestReportsProvider>()
                  .updateReport(serverToLocalupdate, gotID);
              print('updated occured');
            } else {
              print('databaseID not matched with localDatabaseID');
            }
          }

          //----------------------------------------------
        } else if (actionType == 'CREATED') {
          TestReportModel serverToLocalcreate = TestReportModel(
            // id: serverRes['id'],
            databaseID: serverRes['id'],
            trNo: int.tryParse(serverRes['trNo']),
            client: serverRes['client'],
            customer: serverRes['customer'],
            project: serverRes['project'],
            testDate: DateTime.tryParse(serverRes['timeStamp']),
            lastUpdated: DateTime.tryParse(serverRes['updateDate']),
          );
          print(serverToLocalcreate);
          sl<TestReportsProvider>().addReport(serverToLocalcreate);
          print('create occured');

          //----------------------------------------------
        } else if (actionType == 'DELETED') {
          var trAppdb = sl<TestReportsProvider>().reportListFuture;
          print(trAppdb);

          for (var j in trAppdb) {
            var localID = j.id;
            var databaseID = j.databaseID;
            if (serverRes['id'] == databaseID) {
              //sl<TestReportsProvider>().deleteReportbyDatabaseID(databaseID);
              sl<TestReportsProvider>().deleteReportbyDatabaseID(databaseID);
              print('delete occured');
            }
          }
        }
      },
      onError: (error) {
        wss_checker = 'ERROR';
        debugPrint('error $error');
      },
      onDone: () {
        wss_checker = 'ERROR';
        debugPrint('websocket connection lost');
      },
    );
    //-------------------------------------------------
    channel_socket.sink.add(jsonEncode({
      "id": 1338,
      "type": "subscribe",
      "model": "testreport.testReport",
      "action": "list"
    }));

    @override
    void dispose() {
      channel_socket.sink.close();
      print('Socket closed');
      super.dispose();
    }

    notifyListeners();
  }
  // --------------testReport-table-wss-crud-operation----------------------

  void logout() async {
    this.googleAccount = await _googleSignIn.signOut();
    print('Triggerd in logout function');
    exchangeToken();
    notifyListeners();
  }

  bool isLoggedIn() {
    if (googleAccount == null) {
      notifyListeners();
      return false;
    } else {
      notifyListeners();
      return true;
    }
  }

  Future<Null> exchangeToken() async {
    String google_access_token;

    await googleAccount.authentication.then((value) {
      google_access_token = value.accessToken;
    });
    print("exchangeToken function");
    print(google_access_token);
    var url = Uri.parse("${Env.URL_PREFIX}/auth/convert-token");
    await http.post(url, body: {
      "grant_type": "convert_token",
      "client_id": this.CLIENT_ID,
      "client_secret": this.CLIENT_SECRET,
      "backend": "google-oauth2",
      "token": google_access_token,
    }).then((response) {
      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");
      print('access token is -> ${json.decode(response.body)['access_token']}');
      final Map<String, dynamic> data =
          json.decode(response.body).cast<String, dynamic>();
      this.ACCESS_TOKEN = data['access_token'];
      this.REFRESH_TOKEN = data['refresh_token'];
      this.responseStatus = response.statusCode;
    });
  }
}

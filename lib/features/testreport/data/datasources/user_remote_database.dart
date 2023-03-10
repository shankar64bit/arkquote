// ignore: library_prefixes
// import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/status.dart' as status;
// ignore: depend_on_referenced_packages
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:drift/drift.dart';
import 'package:flutter_testreports/core/error/exceptions.dart';
import 'package:flutter_testreports/features/testreport/data/models/user_table_model.dart';
import 'package:http/http.dart' as http;
import '../../../../env.sample.dart';
import '../../../../injection_container.dart';
import '../../presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import '../../presentation/providers/user_table_provider.dart';

abstract class UserRemoteDatasource {
  ///Calls the Backend api endpoint
  ///Throws a [ServerException] otherwise
  Future<UserModel> getNewUsers();
  //Future<UserModel> getSingleRemoteUserId(int databaseID);
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final http.Client client;

  UserRemoteDatasourceImpl({@required this.client});

  @override
  Future<UserModel> getNewUsers() async {
    var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;

    final response =
        await client.get(Uri.parse('${Env.URL_PREFIX}/userDetails/'),
            //headers: {'Content-Type': 'application/json'},
            headers: {'Authorization': 'Bearer $acc_token'});

    List<dynamic> users = json.decode(response.body);

    for (var elem in users) {
      var isUserLocalId = sl<UserProvider>().getUserById(elem['id']);

      if (isUserLocalId == null) {
        print('User Existed');
      } else {
        sl<UserProvider>().AddUsers(UserModel(
          // id: elem['id'],
          databaseID: elem['id'],
          empNo: elem["employeeNo"],
          name: elem['employeeName'],
          empGender: elem['gender'],
          designation: elem['designation'],
          contact: elem['mobileNo'],
          empEmail: elem['email'],
          empMangerName: elem['managerName'],
          empMangerEmpNo: elem['managerEmpNO'],
          empPfNo: elem['PF_UAN_Number'],
          empEsic: elem['ESIC_Number'],
          empGIP: elem['Group_Insurance_Policy_Number'],
          empDOJ: elem['DateOfJoining'],
          empDOB: elem['DateOfBirth'],
          // lastUpdated: elem['updateDate'],
        ));

        // print(
        //     'User > Fetched successfully from remote DB and added to AddUser localDB\n');
      }
    }
  }
}

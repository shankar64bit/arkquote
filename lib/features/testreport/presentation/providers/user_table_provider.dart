// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:flutter/widgets.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/users_table_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/acb/acb_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/user_table_model.dart';
import '../../../../injection_container.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> _userIdList = [];
  List<UserModel> get userIdList => _userIdList;

  List<UserModel> _userLocalDataList = [];
  List<UserModel> get userLocaldataList => _userLocalDataList;

  UserModel _usersModel;
  UserModel get usersModel => _usersModel;

  var testedTO;

  String _error = 'ErroR';
  String get error => _error;

  getTestVerDetails(AcbModel ntr1) async {
    var test = int.parse(ntr1.TestedBy);
    testedTO = await sl<UserProvider>()
        .FuturegetUserByDatabaseID(test)
        .then((value) => value.name);
    notifyListeners();
  }

  // ignore: missing_return
  Future<UserModel> getUserById(int empNo) async {
    _usersModel = await sl<UserLocalDatasourceImpl>().getUserById(empNo)
        // ignore: missing_return
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  // ignore: missing_return
  Future<UserModel> FuturegetUserByDatabaseID(int databaseID) async {
    _usersModel =
        await sl<UserLocalDatasourceImpl>().getUserByDatabaseID(databaseID);

    // ignore: missing_return

    notifyListeners();
  }

  void FutureGetUserLocalDataList() async {
    _userLocalDataList =
        await sl<UserLocalDatasourceImpl>().getUserLocalDataList()
            // ignore: missing_return
            .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void AddUsers(UserModel usermodel) async {
    await sl<UserLocalDatasourceImpl>().localUser(usermodel)
        // ignore: missing_return
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

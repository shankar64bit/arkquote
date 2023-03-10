// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/Auxiliary_transformer/at_local_datasource.dart';
import '../../../data/models/equipment/AT/AT_model.dart';

class ATProvider extends ChangeNotifier {
  List<ATModel> _atTrnoList = [];
  List<ATModel> get atTrnoList => _atTrnoList;
  List<ATModel> _atlocaldataList = [];
  List<ATModel> get atlocaldataList => _atlocaldataList;
  List<ATModel> _atSerialNoList = [];
  List<ATModel> get atSerialNoList => _atSerialNoList;
  ATModel _atModel;
  ATModel get atModel => _atModel;

  String _error = 'ErroR';
  String get error => _error;

  void getATByTrNo(int trNo) async {
    _atTrnoList = await sl<ATLocalDatasourceImpl>()
        .getATByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getATBySerialNo(String sn) async {
    _atSerialNoList = await sl<ATLocalDatasourceImpl>()
        .getATBySerialNo(sn)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getATByID(int id) async {
    _atModel = await sl<ATLocalDatasourceImpl>()
        .getATById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addAT(ATModel attolocal, DateTime dateOfTesting) async {
    await sl<ATLocalDatasourceImpl>()
        .localAT(attolocal, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteAT(int id) async {
    await sl<ATLocalDatasourceImpl>()
        .deleteATById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateAT(ATModel attoupdate, int id) async {
    await sl<ATLocalDatasourceImpl>()
        .updateAT(attoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getATLocalData() async {
    _atlocaldataList = await sl<ATLocalDatasourceImpl>()
        .getATLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/Auxiliary_transformer/at_wrLv_local_datasource.dart';
import '../../../data/models/equipment/AT/AT_wrLv_model.dart';

class ATwrLv_Provider extends ChangeNotifier {
  List<ATwrLv_Model> _atwrLv_loacaldataList = [];
  List<ATwrLv_Model> get atwrLv_loacaldataList => _atwrLv_loacaldataList;

  List<ATwrLv_Model> _atwrLv_trNoIDList = [];
  List<ATwrLv_Model> get atwrLv_trNoIDList => _atwrLv_trNoIDList;

  List<ATwrLv_Model> _atwrLv_serialNoList = [];
  List<ATwrLv_Model> get atwrLv_serialNoList => _atwrLv_serialNoList;

  ATwrLv_Model _atwrLv_Model;
  ATwrLv_Model get atwrLv_Model => _atwrLv_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getATwrLvBytrNoID(int trNo) async {
    _atwrLv_trNoIDList = await sl<ATwrLv_LocalDatasourceImpl>()
        .getATwrLvTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getATwrLvserialNo(String sNo) async {
    _atwrLv_serialNoList = await sl<ATwrLv_LocalDatasourceImpl>()
        .getATwrLvSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getATwrLvById(int id) async {
    _atwrLv_Model = await sl<ATwrLv_LocalDatasourceImpl>()
        .getATwrLv_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addATwrLv(ATwrLv_Model atwrLvtolocal) async {
    await sl<ATwrLv_LocalDatasourceImpl>()
        .localATwrLv(atwrLvtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteATwrLv(int id) async {
    await sl<ATwrLv_LocalDatasourceImpl>()
        .deleteATwrLvById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateATwrLv(ATwrLv_Model atwrLvtoupdate, int id) async {
    await sl<ATwrLv_LocalDatasourceImpl>()
        .updateATwrLv(atwrLvtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getATwrLvEquipmentList() async {
    _atwrLv_loacaldataList = await sl<ATwrLv_LocalDatasourceImpl>()
        .getATwrLvEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

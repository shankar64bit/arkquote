// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/AT/AT_wrHv_model.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/Auxiliary_transformer/at_wrHv_local_datasource.dart';

class ATwrHv_Provider extends ChangeNotifier {
  List<ATwrHv_Model> _atwrHv_loacaldataList = [];
  List<ATwrHv_Model> get atwrHv_loacaldataList => _atwrHv_loacaldataList;

  List<ATwrHv_Model> _atwrHv_trNoIDList = [];
  List<ATwrHv_Model> get atwrHv_trNoIDList => _atwrHv_trNoIDList;

  List<ATwrHv_Model> _atwrHv_serialNoList = [];
  List<ATwrHv_Model> get atwrHv_serialNoList => _atwrHv_serialNoList;

  ATwrHv_Model _atwrHv_Model;
  ATwrHv_Model get atwrHv_Model => _atwrHv_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getATwrHvBytrNoID(int trNo) async {
    _atwrHv_trNoIDList = await sl<ATwrHv_LocalDatasourceImpl>()
        .getATwrHvTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getATwrHvserialNo(String serialNo) async {
    _atwrHv_serialNoList = await sl<ATwrHv_LocalDatasourceImpl>()
        .getATwrHvSerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getATwrHvById(int id) async {
    _atwrHv_Model = await sl<ATwrHv_LocalDatasourceImpl>()
        .getATwrHv_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addATwrHv(ATwrHv_Model atwrHvtolocal) async {
    await sl<ATwrHv_LocalDatasourceImpl>()
        .localATwrHv(atwrHvtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteATwrHv(int id) async {
    await sl<ATwrHv_LocalDatasourceImpl>()
        .deleteATwrHvById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateATwrHv(ATwrHv_Model atwrHvtoupdate, int id) async {
    await sl<ATwrHv_LocalDatasourceImpl>()
        .updateATwrHv(atwrHvtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getATwrHvLocalDataEquipmentList() async {
    _atwrHv_loacaldataList = await sl<ATwrHv_LocalDatasourceImpl>()
        .getATwrHvEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

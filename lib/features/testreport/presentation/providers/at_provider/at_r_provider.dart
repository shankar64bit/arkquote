// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/Auxiliary_transformer/at_r_local_datasource.dart';
import '../../../data/models/equipment/AT/AT_r_model.dart';

class AT_R_Provider extends ChangeNotifier {
  List<AT_R_Model> _at_R_loacaldataList = [];
  List<AT_R_Model> get at_R_loacaldataList => _at_R_loacaldataList;

  List<AT_R_Model> _at_R_trNoIDList = [];
  List<AT_R_Model> get at_R_trNoIDList => _at_R_trNoIDList;

  List<AT_R_Model> _at_R_serialNoList = [];
  List<AT_R_Model> get at_R_serialNoList => _at_R_serialNoList;

  AT_R_Model _at_R_Model;
  AT_R_Model get at_R_Model => _at_R_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getATrBytrNoID(int trNo) async {
    _at_R_trNoIDList = await sl<AT_R_LocalDatasourceImpl>()
        .getAT_RTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getATrserialNo(String sNo) async {
    _at_R_serialNoList = await sl<AT_R_LocalDatasourceImpl>()
        .getAT_RSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getATrById(int id) async {
    _at_R_Model = await sl<AT_R_LocalDatasourceImpl>()
        .getAT_R_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addATr(AT_R_Model atrtolocal) async {
    await sl<AT_R_LocalDatasourceImpl>()
        .localAT_R(atrtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteATr(int id) async {
    await sl<AT_R_LocalDatasourceImpl>()
        .deleteAT_RById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateATr(AT_R_Model atrtoupdate, int id) async {
    await sl<AT_R_LocalDatasourceImpl>()
        .updateAT_R(atrtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getATrEquipmentList() async {
    _at_R_loacaldataList = await sl<AT_R_LocalDatasourceImpl>()
        .getATrEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

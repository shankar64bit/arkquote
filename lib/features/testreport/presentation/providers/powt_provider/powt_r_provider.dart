// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/Power_transformer/powt_r_local_datasource.dart';
import '../../../data/models/equipment/powt/powt_r_model.dart';

class Powt_R_Provider extends ChangeNotifier {
  List<Powt_R_Model> _powt_R_loacaldataList = [];
  List<Powt_R_Model> get powt_R_loacaldataList => _powt_R_loacaldataList;

  List<Powt_R_Model> _powt_R_trNoIDList = [];
  List<Powt_R_Model> get powt_R_trNoIDList => _powt_R_trNoIDList;

  List<Powt_R_Model> _powt_R_serialNoList = [];
  List<Powt_R_Model> get powt_R_serialNoList => _powt_R_serialNoList;

  Powt_R_Model _powt_R_Model;
  Powt_R_Model get powt_R_Model => _powt_R_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowtrBytrNoID(int trNo) async {
    _powt_R_trNoIDList = await sl<Powt_R_LocalDatasourceImpl>()
        .getPowt_RTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowtrserialNo(String sNo) async {
    _powt_R_serialNoList = await sl<Powt_R_LocalDatasourceImpl>()
        .getPowt_RSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowtrById(int id) async {
    _powt_R_Model = await sl<Powt_R_LocalDatasourceImpl>()
        .getPowt_R_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowtr(Powt_R_Model powtrtolocal) async {
    await sl<Powt_R_LocalDatasourceImpl>()
        .localPowt_R(powtrtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowtr(int id) async {
    await sl<Powt_R_LocalDatasourceImpl>()
        .deletePowt_RById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowtr(Powt_R_Model powtrtoupdate, int id) async {
    await sl<Powt_R_LocalDatasourceImpl>()
        .updatePowt_R(powtrtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowtREquipmentList() async {
    _powt_R_loacaldataList = await sl<Powt_R_LocalDatasourceImpl>()
        .getPowtREquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

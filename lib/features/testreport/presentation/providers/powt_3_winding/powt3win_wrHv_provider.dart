// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/powt_3_winding/powt3win_wrHv_local_datasource.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_wrHv_model.dart';

class Powt3winwrHvProvider extends ChangeNotifier {
  List<Powt3winwrHvModel> _powt3winwrHv_loacaldataList = [];
  List<Powt3winwrHvModel> get powt3winwrHv_loacaldataList =>
      _powt3winwrHv_loacaldataList;

  List<Powt3winwrHvModel> _powt3winwrHv_trNoIDList = [];
  List<Powt3winwrHvModel> get powt3winwrHv_trNoIDList =>
      _powt3winwrHv_trNoIDList;

  List<Powt3winwrHvModel> _powt3winwrHv_serialNoList = [];
  List<Powt3winwrHvModel> get powt3winwrHv_serialNoList =>
      _powt3winwrHv_serialNoList;

  Powt3winwrHvModel _powt3winwrHv_Model;
  Powt3winwrHvModel get powt3winwrHv_Model => _powt3winwrHv_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowt3winwrHvBytrNoID(int trNo) async {
    _powt3winwrHv_trNoIDList = await sl<Powt3winwrHvLocalDatasourceImpl>()
        .getPowt3winwrHvTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winwrHvserialNo(String serialNo) async {
    _powt3winwrHv_serialNoList = await sl<Powt3winwrHvLocalDatasourceImpl>()
        .getPowt3winwrHvSerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winwrHvById(int id) async {
    _powt3winwrHv_Model = await sl<Powt3winwrHvLocalDatasourceImpl>()
        .getPowt3winwrHv_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowt3winwrHv(Powt3winwrHvModel Powt3winwrHvtoLocal) async {
    await sl<Powt3winwrHvLocalDatasourceImpl>()
        .localPowt3winwrHv(Powt3winwrHvtoLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowt3winwrHv(int id) async {
    await sl<Powt3winwrHvLocalDatasourceImpl>()
        .deletePowt3winwrHvById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowt3winwrHv(Powt3winwrHvModel powt3winwrHvupdate, int id) async {
    await sl<Powt3winwrHvLocalDatasourceImpl>()
        .updatePowt3winwrHv(powt3winwrHvupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winwrHvEquipmentList() async {
    _powt3winwrHv_loacaldataList = await sl<Powt3winwrHvLocalDatasourceImpl>()
        .getpowt3winwrHvEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

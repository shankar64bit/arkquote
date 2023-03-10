// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/powt_3_winding/powt3win_wrLv_local_datasource.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_wrLv_model.dart';

class Powt3winwrLvProvider extends ChangeNotifier {
  List<Powt3winwrLvModel> _powt3winwrLv_loacaldataList = [];
  List<Powt3winwrLvModel> get powt3winwrLv_loacaldataList =>
      _powt3winwrLv_loacaldataList;

  List<Powt3winwrLvModel> _powt3winwrLv_trNoIDList = [];
  List<Powt3winwrLvModel> get powt3winwrLv_trNoIDList =>
      _powt3winwrLv_trNoIDList;

  List<Powt3winwrLvModel> _powt3winwrLv_serialNoList = [];
  List<Powt3winwrLvModel> get powt3winwrLv_serialNoList =>
      _powt3winwrLv_serialNoList;

  Powt3winwrLvModel _powt3winwrLv_Model;
  Powt3winwrLvModel get powt3winwrLv_Model => _powt3winwrLv_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowtwrLvBytrNoID(int trNo) async {
    _powt3winwrLv_trNoIDList = await sl<Powt3winwrLvLocalDatasourceImpl>()
        .getPowt3winwrLvTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winwrLvserialNo(String sNo) async {
    _powt3winwrLv_serialNoList = await sl<Powt3winwrLvLocalDatasourceImpl>()
        .getPowt3winwrLvSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winwrLvById(int id) async {
    _powt3winwrLv_Model = await sl<Powt3winwrLvLocalDatasourceImpl>()
        .getPowt3winwrLv_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowt3winwrLv(Powt3winwrLvModel p3wwrlvtolocal) async {
    await sl<Powt3winwrLvLocalDatasourceImpl>()
        .localPowt3winwrLv(p3wwrlvtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowt3winwrLv(int id) async {
    await sl<Powt3winwrLvLocalDatasourceImpl>()
        .deletePowt3winwrLvById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowt3winwrLv(Powt3winwrLvModel p3wwrlvtoupdate, int id) async {
    await sl<Powt3winwrLvLocalDatasourceImpl>()
        .updatePowt3winwrLv(p3wwrlvtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winwrlvEquipmentList() async {
    _powt3winwrLv_loacaldataList = await sl<Powt3winwrLvLocalDatasourceImpl>()
        .getPowt3winwrLvEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

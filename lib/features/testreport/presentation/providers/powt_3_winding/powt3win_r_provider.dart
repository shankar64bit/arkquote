// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/powt_3_winding/powt3win_r_local_datasource.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_r_model.dart';

class Powt3win_R_Provider extends ChangeNotifier {
  List<Powt3win_R_Model> _powt3win_R_loacaldataList = [];
  List<Powt3win_R_Model> get powt3win_R_loacaldataList =>
      _powt3win_R_loacaldataList;

  List<Powt3win_R_Model> _powt3win_R_trNoIDList = [];
  List<Powt3win_R_Model> get powt3win_R_trNoIDList => _powt3win_R_trNoIDList;

  List<Powt3win_R_Model> _powt3win_R_serialNoList = [];
  List<Powt3win_R_Model> get powt3win_R_serialNoList =>
      _powt3win_R_serialNoList;

  Powt3win_R_Model _powt3win_R_Model;
  Powt3win_R_Model get powt3win_R_Model => _powt3win_R_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowt3winrBytrNoID(int trNo) async {
    _powt3win_R_trNoIDList = await sl<Powt3win_R_LocalDatasourceImpl>()
        .getPowt3win_RTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winrserialNo(String sNo) async {
    _powt3win_R_serialNoList = await sl<Powt3win_R_LocalDatasourceImpl>()
        .getPowt3win_RSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winrById(int id) async {
    _powt3win_R_Model = await sl<Powt3win_R_LocalDatasourceImpl>()
        .getPowt3win_R_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowt3winr(Powt3win_R_Model p3wRtolocal) async {
    await sl<Powt3win_R_LocalDatasourceImpl>()
        .localPowt3win_R(p3wRtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowt3winr(int id) async {
    await sl<Powt3win_R_LocalDatasourceImpl>()
        .deletePowt3win_RById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowt3winr(Powt3win_R_Model p3wRtoupdate, int id) async {
    await sl<Powt3win_R_LocalDatasourceImpl>()
        .updatePowt3win_R(p3wRtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getpowt3winREquipmentList() async {
    _powt3win_R_loacaldataList = await sl<Powt3win_R_LocalDatasourceImpl>()
        .getpowt3winEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

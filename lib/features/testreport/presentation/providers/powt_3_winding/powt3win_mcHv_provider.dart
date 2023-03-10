// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/powt_3_winding/powt3win_mcHv_local_datasource.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_mcHv_model.dart';

class Powt3win_mcHv_Provider extends ChangeNotifier {
  List<Powt3win_mcHv_Model> _powt3win_mcHv_loacaldataList = [];
  List<Powt3win_mcHv_Model> get powt3win_mcHv_loacaldataList =>
      _powt3win_mcHv_loacaldataList;

  List<Powt3win_mcHv_Model> _powt3win_mcHv_trNoIDList = [];
  List<Powt3win_mcHv_Model> get powt3win_mcHv_trNoIDList =>
      _powt3win_mcHv_trNoIDList;

  List<Powt3win_mcHv_Model> _powt3win_mcHv_serialNoList = [];
  List<Powt3win_mcHv_Model> get powt3win_mcHv_serialNoList =>
      _powt3win_mcHv_serialNoList;

  Powt3win_mcHv_Model _powt3win_mcHv_Model;
  Powt3win_mcHv_Model get powt3win_mcHv_Model => _powt3win_mcHv_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowt3win_mcHvBytrNoID(int trNo) async {
    _powt3win_mcHv_trNoIDList = await sl<Powt3win_mcHv_LocalDatasourceImpl>()
        .getPowt3win_mcHvTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3win_mcHvserialNo(String sNo) async {
    _powt3win_mcHv_serialNoList = await sl<Powt3win_mcHv_LocalDatasourceImpl>()
        .getPowt3win_mcHvSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3win_mcHvById(int id) async {
    _powt3win_mcHv_Model = await sl<Powt3win_mcHv_LocalDatasourceImpl>()
        .getPowt3win_mcHv_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowt3win_mcHv(Powt3win_mcHv_Model p3wmchvtolocal) async {
    await sl<Powt3win_mcHv_LocalDatasourceImpl>()
        .localPowt3win_mcHv(p3wmchvtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowt3win_mcHv(int id) async {
    await sl<Powt3win_mcHv_LocalDatasourceImpl>()
        .deletePowt3win_mcHvById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowt3win_mcHv(Powt3win_mcHv_Model p3wmchvtoupdate, int id) async {
    await sl<Powt3win_mcHv_LocalDatasourceImpl>()
        .updatePowt3win_mcHv(p3wmchvtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getpowt3winmchvEquipmentList() async {
    _powt3win_mcHv_loacaldataList =
        await sl<Powt3win_mcHv_LocalDatasourceImpl>()
            .getpowt3winmchvEquipmentLists()
            .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

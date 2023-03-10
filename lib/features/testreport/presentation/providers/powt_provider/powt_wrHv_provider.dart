// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/Power_transformer/powt_wrHv_local_datasource.dart';
import '../../../data/models/equipment/powt/powt_wrHv_model.dart';

class PowtwrHvProvider extends ChangeNotifier {
  List<PowtwrHvModel> _powtwrHv_loacaldataList = [];
  List<PowtwrHvModel> get powtwrHv_loacaldataList => _powtwrHv_loacaldataList;

  List<PowtwrHvModel> _powtwrHv_trNoIDList = [];
  List<PowtwrHvModel> get powtwrHv_trNoIDList => _powtwrHv_trNoIDList;

  List<PowtwrHvModel> _powtwrHv_serialNoList = [];
  List<PowtwrHvModel> get powtwrHv_serialNoList => _powtwrHv_serialNoList;

  PowtwrHvModel _powtwrHv_Model;
  PowtwrHvModel get powtwrHv_Model => _powtwrHv_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowtwrHvBytrNoID(int trNo) async {
    _powtwrHv_trNoIDList = await sl<PowtwrHvLocalDatasourceImpl>()
        .getPowtwrHvTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowtwrHvserialNo(String serialNo) async {
    _powtwrHv_serialNoList = await sl<PowtwrHvLocalDatasourceImpl>()
        .getPowtwrHvSerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowtwrHvById(int id) async {
    _powtwrHv_Model = await sl<PowtwrHvLocalDatasourceImpl>()
        .getPowtwrHv_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowtwrHv(PowtwrHvModel powtwrhvtolocal) async {
    await sl<PowtwrHvLocalDatasourceImpl>()
        .localPowtwrHv(powtwrhvtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowtwrHv(int id) async {
    await sl<PowtwrHvLocalDatasourceImpl>()
        .deletePowtwrHvById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowtwrHv(PowtwrHvModel powtwrhvtoupdate, int id) async {
    await sl<PowtwrHvLocalDatasourceImpl>()
        .updatePowtwrHv(powtwrhvtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowtwrHvEquipmentList() async {
    _powtwrHv_loacaldataList = await sl<PowtwrHvLocalDatasourceImpl>()
        .getPowtwrHvEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/Power_transformer/powt_wrLv_local_datasource.dart';
import '../../../data/models/equipment/powt/powt_wrLv_model.dart';

class PowtwrLvProvider extends ChangeNotifier {
  List<PowtwrLvModel> _powtwrLv_loacaldataList = [];
  List<PowtwrLvModel> get powtwrLv_loacaldataList => _powtwrLv_loacaldataList;

  List<PowtwrLvModel> _powtwrLv_trNoIDList = [];
  List<PowtwrLvModel> get powtwrLv_trNoIDList => _powtwrLv_trNoIDList;

  List<PowtwrLvModel> _powtwrLv_serialNoList = [];
  List<PowtwrLvModel> get powtwrLv_serialNoList => _powtwrLv_serialNoList;

  PowtwrLvModel _powtwrLv_Model;
  PowtwrLvModel get powtwrLv_Model => _powtwrLv_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowtwrLvBytrNoID(int trNo) async {
    _powtwrLv_trNoIDList = await sl<PowtwrLvLocalDatasourceImpl>()
        .getPowtwrLvTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowtwrLvserialNo(String sNo) async {
    _powtwrLv_serialNoList = await sl<PowtwrLvLocalDatasourceImpl>()
        .getPowtwrLvSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowtwrLvById(int id) async {
    _powtwrLv_Model = await sl<PowtwrLvLocalDatasourceImpl>()
        .getPowtwrLv_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowtwrLv(PowtwrLvModel powtwrlvtolocal) async {
    await sl<PowtwrLvLocalDatasourceImpl>()
        .localPowtwrLv(powtwrlvtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowtwrLv(int id) async {
    await sl<PowtwrLvLocalDatasourceImpl>()
        .deletePowtwrLvById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowtwrLv(PowtwrLvModel powtwrlvtoupdate, int id) async {
    await sl<PowtwrLvLocalDatasourceImpl>()
        .updatePowtwrLv(powtwrlvtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowtwrlvEquipmentList() async {
    _powtwrLv_loacaldataList = await sl<PowtwrLvLocalDatasourceImpl>()
        .getPowtWRLVEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

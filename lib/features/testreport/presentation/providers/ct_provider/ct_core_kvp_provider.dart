// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/CT/ct_core_kvp_local_datasource.dart';
import '../../../data/models/equipment/CT/ct_core_kvp_model.dart';

class CTcoreKVPProvider extends ChangeNotifier {
  List<CTcoreKVPModel> _ctcoreKVP_serialNoList = [];
  List<CTcoreKVPModel> get ctcoreKVP_serialNoList => _ctcoreKVP_serialNoList;

  List<CTcoreKVPModel> _ctcoreKVP_localdataList = [];
  List<CTcoreKVPModel> get ctcoreKVP_localdataList => _ctcoreKVP_localdataList;

  CTcoreKVPModel _ctcoreKVP_Model;
  CTcoreKVPModel get ctcoreKVP_Model => _ctcoreKVP_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getCTcoreKVP_ById(int id) async {
    _ctcoreKVP_Model = await sl<CTcoreKVPLocalDatasourceImpl>()
        .getCTcoreKVP_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getCTcoreKVP_BySerialNo(String serialNo) async {
    _ctcoreKVP_serialNoList = await sl<CTcoreKVPLocalDatasourceImpl>()
        .getCTcoreKVP_SerialNo(serialNo)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addCTcoreKVP(CTcoreKVPModel ctkvptolocal) async {
    await sl<CTcoreKVPLocalDatasourceImpl>()
        .localCTcoreKVP(ctkvptolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteCTcoreKVP(int id) async {
    await sl<CTcoreKVPLocalDatasourceImpl>()
        .deleteCTcoreKVPById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateCTcoreKVP(CTcoreKVPModel ctkvptoupdate, int id) async {
    await sl<CTcoreKVPLocalDatasourceImpl>()
        .updateCTcoreKVP(ctkvptoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getCTkvpEquipmentList() async {
    _ctcoreKVP_localdataList = await sl<CTcoreKVPLocalDatasourceImpl>()
        .getCTkvpEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

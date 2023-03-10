// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/CT/ct_core_p_local_datasource.dart';
import '../../../data/models/equipment/CT/ct_core_p_model.dart';

class CTcorePProvider extends ChangeNotifier {
  List<CTcorePModel> _ctcoreP_serialNoList = [];
  List<CTcorePModel> get ctcoreP_serialNoList => _ctcoreP_serialNoList;
  List<CTcorePModel> _ctcoreP_localdataList = [];
  List<CTcorePModel> get ctcoreP_localdataList => _ctcoreP_localdataList;

  CTcorePModel _ctcoreP_Model;
  CTcorePModel get ctcoreP_Model => _ctcoreP_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getCTcoreP_ById(int id) async {
    _ctcoreP_Model = await sl<CTcorePLocalDatasourceImpl>()
        .getCTcoreP_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getCTcoreP_BySerialNo(String serialNo) async {
    _ctcoreP_serialNoList = await sl<CTcorePLocalDatasourceImpl>()
        .getCTcoreP_SerialNo(serialNo)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addCTcoreP(CTcorePModel ctcoreptolocal) async {
    await sl<CTcorePLocalDatasourceImpl>()
        .localCTcoreP(ctcoreptolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteCTcoreP(int id) async {
    await sl<CTcorePLocalDatasourceImpl>()
        .deleteCTcorePById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateCTcoreP(CTcorePModel ctcoreptoupdate, int id) async {
    await sl<CTcorePLocalDatasourceImpl>()
        .updateCTcoreP(ctcoreptoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getCTpEquipmentList() async {
    _ctcoreP_localdataList = await sl<CTcorePLocalDatasourceImpl>()
        .getCTpEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

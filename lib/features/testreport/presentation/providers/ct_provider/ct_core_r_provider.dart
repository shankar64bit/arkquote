// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/CT/ct_core_r_local_datasource.dart';
import '../../../data/models/equipment/CT/ct_core_r_model.dart';

class CTcoreRProvider extends ChangeNotifier {
  List<CTcoreRModel> _ctcoreR_serialNoList = [];
  List<CTcoreRModel> get ctcoreR_serialNoList => _ctcoreR_serialNoList;
  List<CTcoreRModel> _ctcoreR_localdataList = [];
  List<CTcoreRModel> get ctcoreR_localdataList => _ctcoreR_localdataList;

  CTcoreRModel _ctcoreR_Model;
  CTcoreRModel get ctcoreR_Model => _ctcoreR_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getCTcoreR_ById(int id) async {
    _ctcoreR_Model = await sl<CTcoreRLocalDatasourceImpl>()
        .getCTcoreR_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getCTcoreR_BySerialNo(String serialNo) async {
    _ctcoreR_serialNoList = await sl<CTcoreRLocalDatasourceImpl>()
        .getCTcoreR_SerialNo(serialNo)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addCTcoreR(CTcoreRModel ctcorertolocal) async {
    await sl<CTcoreRLocalDatasourceImpl>()
        .localCTcoreR(ctcorertolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteCTcoreR(int id) async {
    await sl<CTcoreRLocalDatasourceImpl>()
        .deleteCTcoreRById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateCTcoreR(CTcoreRModel ctcorertoupdate, int id) async {
    await sl<CTcoreRLocalDatasourceImpl>()
        .updateCTcoreR(ctcorertoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getCTcoreREquipmentList() async {
    _ctcoreR_localdataList = await sl<CTcoreRLocalDatasourceImpl>()
        .getCTcoreREquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/CT/ct_core_wr_local_datasource.dart';
import '../../../data/models/equipment/CT/ct_core_wr_model.dart';

class CTcoreWRProvider extends ChangeNotifier {
  List<CTcoreWRModel> _ctcoreWR_serialNoList = [];
  List<CTcoreWRModel> get ctcoreWR_serialNoList => _ctcoreWR_serialNoList;
  List<CTcoreWRModel> _ctcoreWR_localdataList = [];
  List<CTcoreWRModel> get ctcoreWR_localdataList => _ctcoreWR_localdataList;

  CTcoreWRModel _ctcoreWR_Model;
  CTcoreWRModel get ctcoreWR_Model => _ctcoreWR_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getCTcoreWR_ById(int id) async {
    _ctcoreWR_Model = await sl<CTcoreWRLocalDatasourceImpl>()
        .getCTcoreWR_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getCTcoreWR_BySerialNo(String serialNo) async {
    _ctcoreWR_serialNoList = await sl<CTcoreWRLocalDatasourceImpl>()
        .getCTcoreWR_SerialNo(serialNo)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addCTcoreWR(CTcoreWRModel ctwrtolocal) async {
    await sl<CTcoreWRLocalDatasourceImpl>()
        .localCTcoreWR(ctwrtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteCTcoreWR(int id) async {
    await sl<CTcoreWRLocalDatasourceImpl>()
        .deleteCTcoreWRById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateCTcoreWR(CTcoreWRModel ctwrtoupdate, int id) async {
    await sl<CTcoreWRLocalDatasourceImpl>()
        .updateCTcoreWR(ctwrtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getCTlocaldataEquipmentList() async {
    _ctcoreWR_localdataList = await sl<CTcoreWRLocalDatasourceImpl>()
        .getCTwrlocaldataEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/CT/ct_core_ir_local_datasource.dart';
import '../../../data/models/equipment/CT/ct_core_ir_model.dart';

class CTcoreIRProvider extends ChangeNotifier {
  List<CTcoreIRModel> _ctcoreIR_serialNoList = [];
  List<CTcoreIRModel> get ctcoreIR_serialNoList => _ctcoreIR_serialNoList;
  List<CTcoreIRModel> _ctcoreIR_localdataList = [];
  List<CTcoreIRModel> get ctcoreIR_localdataList => _ctcoreIR_localdataList;

  CTcoreIRModel _ctcoreIR_Model;
  CTcoreIRModel get ctcoreIR_Model => _ctcoreIR_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getCTcoreIR_ById(int id) async {
    _ctcoreIR_Model = await sl<CTcoreIRLocalDatasourceImpl>()
        .getCTcoreIR_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getCTcoreIR_BySerialNo(String serialNo) async {
    _ctcoreIR_serialNoList = await sl<CTcoreIRLocalDatasourceImpl>()
        .getCTcoreIR_SerialNo(serialNo)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addCTcoreIR(CTcoreIRModel ctirtolocal) async {
    await sl<CTcoreIRLocalDatasourceImpl>()
        .localCTcoreIR(ctirtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteCTcoreIR(int id) async {
    await sl<CTcoreIRLocalDatasourceImpl>()
        .deleteCTcoreIRById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateCTcoreIR(CTcoreIRModel ctirtoupdate, int id) async {
    await sl<CTcoreIRLocalDatasourceImpl>()
        .updateCTcoreIR(ctirtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getCTirEquipmentList() async {
    _ctcoreIR_localdataList = await sl<CTcoreIRLocalDatasourceImpl>()
        .getCTirEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

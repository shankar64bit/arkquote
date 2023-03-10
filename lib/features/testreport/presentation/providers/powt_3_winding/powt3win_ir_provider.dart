// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import '../../../data/datasources/equipment/powt_3_winding/powt3win_ir_local_datasource.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_ir_model.dart';
import '../../../../../injection_container.dart';

class Powt3winIRProvider extends ChangeNotifier {
  List<Powt3winIRModel> _powt3winIR_serialNoList = [];
  List<Powt3winIRModel> get powt3winIR_serialNoList => _powt3winIR_serialNoList;

  List<Powt3winIRModel> _powt3winIR_localdataList = [];
  List<Powt3winIRModel> get powt3winIR_localdataList =>
      _powt3winIR_localdataList;

  Powt3winIRModel _powt3winIR_Model;
  Powt3winIRModel get powt3winIR_Model => _powt3winIR_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowt3winIRById(int id) async {
    _powt3winIR_Model = await sl<Powt3winIRLocalDatasourceImpl>()
        .getPowt3winIR_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winIRBySerialNo(String serialNo) async {
    _powt3winIR_serialNoList = await sl<Powt3winIRLocalDatasourceImpl>()
        .getPowt3winIR_SerialNo(serialNo)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowt3winIR(Powt3winIRModel Powt3winIR_toLocal) async {
    await sl<Powt3winIRLocalDatasourceImpl>()
        .localPowt3winIR(Powt3winIR_toLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowt3winIR(int id) async {
    await sl<Powt3winIRLocalDatasourceImpl>()
        .deletePowt3winIRById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowt3winIR(Powt3winIRModel powt3winIR_Model_update, int id) async {
    await sl<Powt3winIRLocalDatasourceImpl>()
        .updatePowt3winIR(powt3winIR_Model_update, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winEquipmentList() async {
    _powt3winIR_localdataList = await sl<Powt3winIRLocalDatasourceImpl>()
        .getPowt3winEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

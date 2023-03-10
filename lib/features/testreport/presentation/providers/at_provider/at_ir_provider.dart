// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';

import '../../../../../injection_container.dart';
import '../../../data/datasources/equipment/Auxiliary_transformer/at_ir_local_datasource.dart';
import '../../../data/models/equipment/AT/AT_ir_model.dart';

class ATcoreIRProvider extends ChangeNotifier {
  List<ATcoreIRModel> _atcoreIR_serialNoList = [];
  List<ATcoreIRModel> get atcoreIR_serialNoList => _atcoreIR_serialNoList;

  List<ATcoreIRModel> _atcoreIR_localdataList = [];
  List<ATcoreIRModel> get atcoreIR_localdataList => _atcoreIR_localdataList;

  ATcoreIRModel _atcoreIR_Model;
  ATcoreIRModel get atcoreIR_Model => _atcoreIR_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getATcoreIR_ById(int id) async {
    _atcoreIR_Model = await sl<ATcoreIRLocalDatasourceImpl>()
        .getATcoreIR_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getATcoreIR_BySerialNo(String serialNo) async {
    _atcoreIR_serialNoList = await sl<ATcoreIRLocalDatasourceImpl>()
        .getATcoreIR_SerialNo(serialNo)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addATcoreIR(ATcoreIRModel atirtolocal) async {
    await sl<ATcoreIRLocalDatasourceImpl>()
        .localATcoreIR(atirtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteATcoreIR(int id) async {
    await sl<ATcoreIRLocalDatasourceImpl>()
        .deleteATcoreIRById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateATcoreIR(ATcoreIRModel atirtoupdate, int id) async {
    await sl<ATcoreIRLocalDatasourceImpl>()
        .updateATcoreIR(atirtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getATLocalDataEquipmentList() async {
    _atcoreIR_localdataList = await sl<ATcoreIRLocalDatasourceImpl>()
        .getATirlocalDataEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import '../../../../../injection_container.dart';
import '../../../data/datasources/equipment/Auxiliary_transformer/at_ir_local_datasource.dart';
import '../../../data/datasources/equipment/Power_transformer/powt_ir_local_datasource.dart';
import '../../../data/models/equipment/powt/powt_ir_model.dart';

class PowtcoreIRProvider extends ChangeNotifier {
  List<PowtcoreIRModel> _powtcoreIR_serialNoList = [];
  List<PowtcoreIRModel> get powtcoreIR_serialNoList => _powtcoreIR_serialNoList;

  List<PowtcoreIRModel> _powtcoreIR_localdataList = [];
  List<PowtcoreIRModel> get powtcoreIR_localdataList =>
      _powtcoreIR_localdataList;

  PowtcoreIRModel _powtcoreIR_Model;
  PowtcoreIRModel get powtcoreIR_Model => _powtcoreIR_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowtcoreIRById(int id) async {
    _powtcoreIR_Model = await sl<PowtcoreIRLocalDatasourceImpl>()
        .getPowtcoreIR_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowtcoreIRBySerialNo(String serialNo) async {
    _powtcoreIR_serialNoList = await sl<PowtcoreIRLocalDatasourceImpl>()
        .getPowtcoreIR_SerialNo(serialNo)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowtcoreIR(PowtcoreIRModel powtirtolocal) async {
    await sl<PowtcoreIRLocalDatasourceImpl>()
        .localPowtcoreIR(powtirtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowtcoreIR(int id) async {
    await sl<PowtcoreIRLocalDatasourceImpl>()
        .deletePowtcoreIRById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowtcoreIR(PowtcoreIRModel powtirtoupdate, int id) async {
    await sl<PowtcoreIRLocalDatasourceImpl>()
        .updatePowtcoreIR(powtirtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowtIREquipmentList() async {
    _powtcoreIR_localdataList = await sl<PowtcoreIRLocalDatasourceImpl>()
        .getPowtIREquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/Potential_Tranformer/pt_ir_local_datasource.dart';
import '../../../data/models/equipment/PT/pt_ir_model.dart';

class PTcoreIRProvider extends ChangeNotifier {
  List<PTcoreIRModel> _ptcoreIR_serialNoList = [];
  List<PTcoreIRModel> get ptcoreIR_serialNoList => _ptcoreIR_serialNoList;
  List<PTcoreIRModel> _ptcoreIR_localdataList = [];
  List<PTcoreIRModel> get ptcoreIR_localdataList => _ptcoreIR_localdataList;
  PTcoreIRModel _ptcoreIR_Model;
  PTcoreIRModel get ptcoreIR_Model => _ptcoreIR_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPTcoreIR_ById(int id) async {
    _ptcoreIR_Model = await sl<PTcoreIRLocalDatasourceImpl>()
        .getPTcoreIR_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPTcoreIR_BySerialNo(String serialNo) async {
    _ptcoreIR_serialNoList = await sl<PTcoreIRLocalDatasourceImpl>()
        .getPTcoreIR_SerialNo(serialNo)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPTcoreIR(PTcoreIRModel ptirtolocal) async {
    await sl<PTcoreIRLocalDatasourceImpl>()
        .localPTcoreIR(ptirtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePTcoreIR(int id) async {
    await sl<PTcoreIRLocalDatasourceImpl>()
        .deletePTcoreIRById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePTcoreIR(PTcoreIRModel ptirtoupdate, int id) async {
    await sl<PTcoreIRLocalDatasourceImpl>()
        .updatePTcoreIR(ptirtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPTirEquipmentList() async {
    _ptcoreIR_localdataList = await sl<PTcoreIRLocalDatasourceImpl>()
        .getptirEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

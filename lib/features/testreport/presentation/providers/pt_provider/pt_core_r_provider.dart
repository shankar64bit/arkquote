// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/Potential_Tranformer/pt_core_r_local_datasource.dart';
import '../../../data/models/equipment/PT/pt_core_r_model.dart';

class PTcoreRProvider extends ChangeNotifier {
  List<PTcoreRModel> _ptcoreR_serialNoList = [];
  List<PTcoreRModel> get ptcoreR_serialNoList => _ptcoreR_serialNoList;

  List<PTcoreRModel> _ptcoreR_localdataList = [];
  List<PTcoreRModel> get ptcoreR_localdataList => _ptcoreR_localdataList;

  PTcoreRModel _ptcoreR_Model;
  PTcoreRModel get ptcoreR_Model => _ptcoreR_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPTcoreR_ById(int id) async {
    _ptcoreR_Model = await sl<PTcoreRLocalDatasourceImpl>()
        .getPTcoreR_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPTcoreR_BySerialNo(String serialNo) async {
    _ptcoreR_serialNoList = await sl<PTcoreRLocalDatasourceImpl>()
        .getPTcoreR_SerialNo(serialNo)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPTcoreR(PTcoreRModel ptcorertolocal) async {
    await sl<PTcoreRLocalDatasourceImpl>()
        .localPTcoreR(ptcorertolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePTcoreR(int id) async {
    await sl<PTcoreRLocalDatasourceImpl>()
        .deletePTcoreRById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePTcoreR(PTcoreRModel ptcorertoupdate, int id) async {
    await sl<PTcoreRLocalDatasourceImpl>()
        .updatePTcoreR(ptcorertoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPTcoreREquipmentList() async {
    _ptcoreR_localdataList = await sl<PTcoreRLocalDatasourceImpl>()
        .getPTcoreREquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

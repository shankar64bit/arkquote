// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/Potential_Tranformer/pt_core_local_datasource.dart';
import '../../../data/models/equipment/PT/pt_core_model.dart';

class PT_core_Provider extends ChangeNotifier {
  List<PT_core_Model> _pt_core_loacaldataList = [];
  List<PT_core_Model> get pt_core_loacaldataList => _pt_core_loacaldataList;

  List<PT_core_Model> _pt_core_ptNoIDList = [];
  List<PT_core_Model> get pt_core_ptNoIDList => _pt_core_ptNoIDList;

  PT_core_Model _pt_core_Model;
  PT_core_Model get pt_core_Model => _pt_core_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPTcoreByptNoID(int ptNo) async {
    _pt_core_ptNoIDList = await sl<PT_core_LocalDatasourceImpl>()
        .getPTcoreptNoID(ptNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPT_core_ById(int id) async {
    _pt_core_Model = await sl<PT_core_LocalDatasourceImpl>()
        .getPT_core_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPT_core(PT_core_Model ptcoretolocal) async {
    await sl<PT_core_LocalDatasourceImpl>()
        .localPT_core(ptcoretolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePT_core(int id) async {
    await sl<PT_core_LocalDatasourceImpl>()
        .deletePT_coreById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePT_core(PT_core_Model ptcoretoupdate, int id) async {
    await sl<PT_core_LocalDatasourceImpl>()
        .updatePT_core(ptcoretoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPTcoreEquipmentList() async {
    _pt_core_loacaldataList = await sl<PT_core_LocalDatasourceImpl>()
        .getPTcoreEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

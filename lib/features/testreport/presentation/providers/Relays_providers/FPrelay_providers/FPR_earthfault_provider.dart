// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../../data/datasources/equipment/Relays/FPrelay/FPR_earthfault_local_datasource.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_earthfault_model.dart';

class FPRearthfaultProvider extends ChangeNotifier {
  List<FPRearthfaultModel> _fprearthfault_loacaldataList = [];
  List<FPRearthfaultModel> get fprearthfault_loacaldataList =>
      _fprearthfault_loacaldataList;

  List<FPRearthfaultModel> _fprearthfault_trNoIDList = [];
  List<FPRearthfaultModel> get fprearthfault_trNoIDList =>
      _fprearthfault_trNoIDList;

  List<FPRearthfaultModel> _fprearthfault_serialNoList = [];
  List<FPRearthfaultModel> get fprearthfault_serialNoList =>
      _fprearthfault_serialNoList;

  FPRearthfaultModel _fprearthfault_Model;
  FPRearthfaultModel get fprearthfault_Model => _fprearthfault_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getFPRearthfaulttrNoID(int trNo) async {
    _fprearthfault_trNoIDList = await sl<FPRearthfaultLocalDatasourceImpl>()
        .getFPRearthfaultTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getFPRearthfaultserialNo(String sNo) async {
    _fprearthfault_serialNoList = await sl<FPRearthfaultLocalDatasourceImpl>()
        .getFPRearthfaultSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getFPRearthfaultById(int id) async {
    _fprearthfault_Model = await sl<FPRearthfaultLocalDatasourceImpl>()
        .getFPRearthfaultById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addFPRearthfault(FPRearthfaultModel fprearthfaulttoLocal) async {
    await sl<FPRearthfaultLocalDatasourceImpl>()
        .localFPRearthfault(fprearthfaulttoLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteFPRearthfault(int id) async {
    await sl<FPRearthfaultLocalDatasourceImpl>()
        .deleteFPRearthfaultById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateFPRearthfault(
      FPRearthfaultModel fprearthfaultUpdate, int id) async {
    await sl<FPRearthfaultLocalDatasourceImpl>()
        .updateFPRearthfault(fprearthfaultUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getFPRearthfaultEquipmentList() async {
    _fprearthfault_loacaldataList = await sl<FPRearthfaultLocalDatasourceImpl>()
        .getFPRearthfaultEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

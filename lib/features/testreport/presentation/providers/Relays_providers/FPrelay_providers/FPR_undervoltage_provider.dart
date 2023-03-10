// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../../data/datasources/equipment/Relays/FPrelay/FPR_undervoltage_local_datasource.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_undervoltage_model.dart';

class FPRundervoltageProvider extends ChangeNotifier {
  List<FPRundervoltageModel> _fprundervoltage_loacaldataList = [];
  List<FPRundervoltageModel> get fprundervoltage_loacaldataList =>
      _fprundervoltage_loacaldataList;

  List<FPRundervoltageModel> _fprundervoltage_trNoIDList = [];
  List<FPRundervoltageModel> get fprundervoltage_trNoIDList =>
      _fprundervoltage_trNoIDList;

  List<FPRundervoltageModel> _fprundervoltage_serialNoList = [];
  List<FPRundervoltageModel> get fprundervoltage_serialNoList =>
      _fprundervoltage_serialNoList;

  FPRundervoltageModel _fprundervoltage_Model;
  FPRundervoltageModel get fprundervoltage_Model => _fprundervoltage_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getFPRundervoltagetrNoID(int trNo) async {
    _fprundervoltage_trNoIDList = await sl<FPRundervoltageLocalDatasourceImpl>()
        .getFPRundervoltageTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getFPRundervoltageserialNo(String sNo) async {
    _fprundervoltage_serialNoList =
        await sl<FPRundervoltageLocalDatasourceImpl>()
            .getFPRundervoltageSerialNo(sNo)
            .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getFPRundervoltageById(int id) async {
    _fprundervoltage_Model = await sl<FPRundervoltageLocalDatasourceImpl>()
        .getFPRundervoltageById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addFPRundervoltage(FPRundervoltageModel fprundervoltagetoLocal) async {
    await sl<FPRundervoltageLocalDatasourceImpl>()
        .localFPRundervoltage(fprundervoltagetoLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteFPRundervoltage(int id) async {
    await sl<FPRundervoltageLocalDatasourceImpl>()
        .deleteFPRundervoltageById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateFPRundervoltage(
      FPRundervoltageModel fprundervoltageUpdate, int id) async {
    await sl<FPRundervoltageLocalDatasourceImpl>()
        .updateFPRundervoltage(fprundervoltageUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getFPRundervoltEquipmentList() async {
    _fprundervoltage_loacaldataList =
        await sl<FPRundervoltageLocalDatasourceImpl>()
            .getFPRundervoltEquipmentLists()
            .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

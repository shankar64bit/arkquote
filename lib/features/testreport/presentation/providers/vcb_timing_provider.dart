// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../data/datasources/equipment/acb/vcb_timing_local_datasource.dart';
import '../../data/models/equipment/acb/vcb_timing_test_model.dart';

class VcbTimingProvider extends ChangeNotifier {
  List<VcbTimingTestModel> _vcbTimingTrNoList = [];
  List<VcbTimingTestModel> get vcbTimingTrNoList => _vcbTimingTrNoList;
  List<VcbTimingTestModel> _vcbTiminglocaldataList = [];
  List<VcbTimingTestModel> get vcbTiminglocaldataList =>
      _vcbTiminglocaldataList;
  List<VcbTimingTestModel> _vcbTimingSerialNoList = [];
  List<VcbTimingTestModel> get vcbTimingSerialNoList => _vcbTimingSerialNoList;
  VcbTimingTestModel _vcbTimingModel;
  VcbTimingTestModel get vcbTimingModel => _vcbTimingModel;

  String _error = 'ErroR';
  String get error => _error;

  void getVcbTimingByTrNo(int trNo) async {
    _vcbTimingTrNoList = await sl<VcbTimingLocalDatasourceImpl>()
        .getVcbTimingByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getVcbTimingBySerialNo(String serialNo) async {
    _vcbTimingSerialNoList = await sl<VcbTimingLocalDatasourceImpl>()
        .getVcbTimingSerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getVcbTimingByID(int id) async {
    _vcbTimingModel = await sl<VcbTimingLocalDatasourceImpl>()
        .getVcbTimigById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void AddVcbTiming(VcbTimingTestModel vcbTimingToLocal) async {
    await sl<VcbTimingLocalDatasourceImpl>()
        .localVcbTiming(vcbTimingToLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteVCBTiming(int id) async {
    await sl<VcbTimingLocalDatasourceImpl>()
        .deleteVcbTimingById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateVCBTiming(VcbTimingTestModel vcbTimingToUpdate, int id) async {
    await sl<VcbTimingLocalDatasourceImpl>()
        .updateVcbTiming(vcbTimingToUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getVcbtimeEquipmentList() async {
    _vcbTiminglocaldataList = await sl<VcbTimingLocalDatasourceImpl>()
        .getVcbtimeEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

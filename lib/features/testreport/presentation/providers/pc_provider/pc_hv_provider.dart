// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/power_cable/pc_hv_local_datasource.dart';
import '../../../data/models/equipment/power_cable/pc_hv_test_model.dart';

class PcHvProvider extends ChangeNotifier {
  List<PcHvTestModel> _pcHvTrNoList = [];
  List<PcHvTestModel> get pcHvTrNoList => _pcHvTrNoList;
  List<PcHvTestModel> _pcHvPcRefIdList = [];
  List<PcHvTestModel> get pcHvPcRefIdList => _pcHvPcRefIdList;
  List<PcHvTestModel> _pcHvEquipmentList = [];
  List<PcHvTestModel> get pcHvEquipmentList => _pcHvEquipmentList;
  PcHvTestModel _pcHvModel;
  PcHvTestModel get pcHvModel => _pcHvModel;

  String _error = 'ErroR';
  String get error => _error;

  void getPcHvByTrNo(int trNo) async {
    _pcHvTrNoList = await sl<PcHvLocalDatasourceImpl>()
        .getPcHvByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPcHvBypcRefId(int pcRefId) async {
    _pcHvPcRefIdList = await sl<PcHvLocalDatasourceImpl>()
        .getPcHvByPcRefId(pcRefId)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPcHvByID(int id) async {
    _pcHvModel = await sl<PcHvLocalDatasourceImpl>()
        .getPcHvById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPcHv(PcHvTestModel pchvtolocal) async {
    await sl<PcHvLocalDatasourceImpl>()
        .localPcHv(pchvtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePcHv(int id) async {
    await sl<PcHvLocalDatasourceImpl>()
        .deletePcHvById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePcHv(PcHvTestModel pchvtoupdate, int id) async {
    await sl<PcHvLocalDatasourceImpl>()
        .updatePcHv(pchvtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  // void getPcHvEquipmentList() async {
  //   await sl<AppDatabase>().getPcHvEquipmentList().onError((error, stackTrace) {
  //     error = error.toString();
  //   });
  //   notifyListeners();
  // }

  void getPcHvEquipmentList() async {
    _pcHvEquipmentList = await sl<PcHvLocalDatasourceImpl>()
        .getPcHvEquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

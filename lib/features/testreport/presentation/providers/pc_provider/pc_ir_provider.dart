// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/power_cable/pc_ir_local_datasource.dart';
import '../../../data/models/equipment/power_cable/pc_ir_test_model.dart';

class PcIrProvider extends ChangeNotifier {
  List<PcIrTestModel> _pcIrTrNoList = [];
  List<PcIrTestModel> get pcIrTrNoList => _pcIrTrNoList;
  List<PcIrTestModel> _pcIrpcRefIdList = [];
  List<PcIrTestModel> get pcIrpcRefIdList => _pcIrpcRefIdList;
  List<PcIrTestModel> _pcIrEquipmentList = [];
  List<PcIrTestModel> get pcIrEquipmentList => _pcIrEquipmentList;
  PcIrTestModel _pcIrModel;
  PcIrTestModel get pcIrModel => _pcIrModel;

  String _error = 'ErroR';
  String get error => _error;

  void getPcIrByTrNo(int trNo) async {
    _pcIrTrNoList = await sl<PcIrLocalDatasourceImpl>()
        .getPcIrByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPcIrBypcRefID(int pcRefId) async {
    _pcIrpcRefIdList = await sl<PcIrLocalDatasourceImpl>()
        .getPcIrByPcRefId(pcRefId)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPcIrByID(int id) async {
    _pcIrModel = await sl<PcIrLocalDatasourceImpl>()
        .getPcIrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPcIr(PcIrTestModel pcirtolocal) async {
    await sl<PcIrLocalDatasourceImpl>()
        .localPcIr(pcirtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePcIr(int id) async {
    await sl<PcIrLocalDatasourceImpl>()
        .deletePcIrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePcIr(PcIrTestModel pcirtoupdate, int id) async {
    await sl<PcIrLocalDatasourceImpl>()
        .updatePcIr(pcirtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  // void getPcIrEquipmentList() async {
  //   await sl<AppDatabase>().getPcIrEquipmentList().onError((error, stackTrace) {
  //     error = error.toString();
  //   });
  //   notifyListeners();
  // }

  void getPcIrEquipmentList() async {
    _pcIrEquipmentList = await sl<PcIrLocalDatasourceImpl>()
        .getPcIrEquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

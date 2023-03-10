// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/acb/acb_ir_test_model.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/acb/acb_ir_local_datasource.dart';

class AcbIrProvider extends ChangeNotifier {
  List<AcbIrTestModel> _acbIrTrNoList = [];
  List<AcbIrTestModel> get acbIrTrNoList => _acbIrTrNoList;
  List<AcbIrTestModel> _acbIrSerialNoList = [];
  List<AcbIrTestModel> get acbIrSerialNoList => _acbIrSerialNoList;
  List<AcbIrTestModel> _acbIrEquipmentList = [];
  List<AcbIrTestModel> get acbIrEquipmentList => _acbIrEquipmentList;
  AcbIrTestModel _acbIrModel;
  AcbIrTestModel get acbIrModel => _acbIrModel;

  String _error = 'ErroR';
  String get error => _error;

  void getAcbIrByTrNo(int trNo) async {
    _acbIrTrNoList = await sl<AcbIrLocalDatasourceImpl>()
        .getAcbIrByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getAcbIrBySerialNo(String serialNo) async {
    _acbIrSerialNoList = await sl<AcbIrLocalDatasourceImpl>()
        .getAcbIrBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getAcbIrByID(int id) async {
    _acbIrModel = await sl<AcbIrLocalDatasourceImpl>()
        .getAcbIrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addACBIr(AcbIrTestModel acbIrModel) async {
    await sl<AcbIrLocalDatasourceImpl>()
        .localAcbIr(acbIrModel)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteACBIr(int id) async {
    await sl<AcbIrLocalDatasourceImpl>()
        .deleteAcbIrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateACBIr(AcbIrTestModel acbIrToUpdate, int id) async {
    await sl<AcbIrLocalDatasourceImpl>()
        .updateAcbIr(acbIrToUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getAcbIrEquipmentList() async {
    _acbIrEquipmentList = await sl<AcbIrLocalDatasourceImpl>()
        .getAcbIrEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

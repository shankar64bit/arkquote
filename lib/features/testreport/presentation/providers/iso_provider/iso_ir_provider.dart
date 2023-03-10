// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/isolator/iso_ir_local_datasource.dart';
import '../../../data/models/equipment/isolator/iso_ir_test_model.dart';

class IsoIrProvider extends ChangeNotifier {
  List<IsoIrTestModel> _isoIrTrNoList = [];
  List<IsoIrTestModel> get isoIrTrNoList => _isoIrTrNoList;
  List<IsoIrTestModel> _isoIrSerialNoList = [];
  List<IsoIrTestModel> get isoIrSerialNoList => _isoIrSerialNoList;
  List<IsoIrTestModel> _isoIrEquipmentList = [];
  List<IsoIrTestModel> get isoIrEquipmentList => _isoIrEquipmentList;
  IsoIrTestModel _isoIrModel;
  IsoIrTestModel get isoIrModel => _isoIrModel;

  String _error = 'ErroR';
  String get error => _error;

  void getIsoIrByTrNo(int trNo) async {
    _isoIrTrNoList = await sl<IsoIrLocalDatasourceImpl>()
        .getIsoIrByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getIsoIrBySerialNo(String serialNo) async {
    _isoIrSerialNoList = await sl<IsoIrLocalDatasourceImpl>()
        .getIsoIrBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getIsoIrByID(int id) async {
    _isoIrModel = await sl<IsoIrLocalDatasourceImpl>()
        .getIsoIrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addIsoIr(IsoIrTestModel isoirtolocal) async {
    await sl<IsoIrLocalDatasourceImpl>()
        .localIsoIr(isoirtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteIsoIr(int id) async {
    await sl<IsoIrLocalDatasourceImpl>()
        .deleteIsoIrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateIsoIr(IsoIrTestModel isoirtoupdate, int id) async {
    await sl<IsoIrLocalDatasourceImpl>()
        .updateIsoIr(isoirtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getIsoIrEquipmentList() async {
    _isoIrEquipmentList = await sl<IsoIrLocalDatasourceImpl>()
        .getIsoIrEquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

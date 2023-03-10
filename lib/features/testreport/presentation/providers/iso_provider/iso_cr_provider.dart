// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/isolator/iso_cr_local_datasource.dart';
import '../../../data/models/equipment/isolator/iso_cr_test_model.dart';

class IsoCrProvider extends ChangeNotifier {
  List<IsoCrTestModel> _isoCrTrNoList = [];
  List<IsoCrTestModel> get isoCrTrNoList => _isoCrTrNoList;
  List<IsoCrTestModel> _isoCrSerialNoList = [];
  List<IsoCrTestModel> get isoCrSerialNoList => _isoCrSerialNoList;
  List<IsoCrTestModel> _isoCrEquipmentList = [];
  List<IsoCrTestModel> get isoCrEquipmentList => _isoCrEquipmentList;
  IsoCrTestModel _isoCrModel;
  IsoCrTestModel get isoCrModel => _isoCrModel;

  String _error = 'ErroR';
  String get error => _error;

  void getIsoCrByTrNo(int trNo) async {
    _isoCrTrNoList = await sl<IsoCrLocalDatasourceImpl>()
        .getIsoCrByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getIsoCrBySerialNo(String serialNo) async {
    _isoCrSerialNoList = await sl<IsoCrLocalDatasourceImpl>()
        .getIsoCrBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getIsoCrByID(int id) async {
    _isoCrModel = await sl<IsoCrLocalDatasourceImpl>()
        .getIsoCrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addIsoCr(IsoCrTestModel isocrtolocal) async {
    await sl<IsoCrLocalDatasourceImpl>()
        .localIsoCr(isocrtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteIsoCr(int id) async {
    await sl<IsoCrLocalDatasourceImpl>()
        .deleteIsoCrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateIsoCr(IsoCrTestModel isocrtoupdate, int id) async {
    await sl<IsoCrLocalDatasourceImpl>()
        .updateIsoCr(isocrtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getIsoCrEquipmentList() async {
    _isoCrEquipmentList = await sl<IsoCrLocalDatasourceImpl>()
        .getIsoCrEquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

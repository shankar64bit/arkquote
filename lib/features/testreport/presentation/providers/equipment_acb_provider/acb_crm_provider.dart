// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/acb/acb_crm_test_model.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/acb/acb_crm_local_datasource.dart';

class AcbCrmProvider extends ChangeNotifier {
  List<AcbCrmTestModel> _acbCrmTrNoList = [];
  List<AcbCrmTestModel> get acbCrmTrNoList => _acbCrmTrNoList;
  List<AcbCrmTestModel> _acbCrmSerialNoList = [];
  List<AcbCrmTestModel> get acbCrmSerialNoList => _acbCrmSerialNoList;
  List<AcbCrmTestModel> _acbCrmEquipmentList = [];
  List<AcbCrmTestModel> get acbCrmEquipmentList => _acbCrmEquipmentList;
  AcbCrmTestModel _acbCrmModel;
  AcbCrmTestModel get acbCrmModel => _acbCrmModel;

  String _error = 'ErroR';
  String get error => _error;

  void getAcbCrmByTrNo(int trNo) async {
    _acbCrmTrNoList = await sl<AcbCrmLocalDatasourceImpl>()
        .getAcbCrmByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getAcbCrmBySerialNo(String serialNo) async {
    _acbCrmSerialNoList = await sl<AcbCrmLocalDatasourceImpl>()
        .getAcbCrmBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getAcbCrmByID(int id) async {
    _acbCrmModel = await sl<AcbCrmLocalDatasourceImpl>()
        .getAcbCrmById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addACBCrm(AcbCrmTestModel acbCrmToLocal) async {
    await sl<AcbCrmLocalDatasourceImpl>()
        .localAcbCrm(acbCrmToLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteACBCrm(int id) async {
    await sl<AcbCrmLocalDatasourceImpl>()
        .deleteAcbCrmById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateACBCrm(AcbCrmTestModel acbCrmToUpdate, int id) async {
    await sl<AcbCrmLocalDatasourceImpl>()
        .updateAcbCrm(acbCrmToUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getAcbCrmEquipmentList() async {
    _acbCrmEquipmentList = await sl<AcbCrmLocalDatasourceImpl>()
        .getAcbCrmEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

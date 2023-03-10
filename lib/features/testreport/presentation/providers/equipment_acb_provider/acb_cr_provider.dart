// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/acb/acb_cr_local_datasource.dart';
import '../../../data/models/equipment/acb/acb_cr_test_model.dart';

class AcbCRProvider extends ChangeNotifier {
  List<AcbCRTestModel> _acbCRTrNoList = [];
  List<AcbCRTestModel> get acbCRTrNoList => _acbCRTrNoList;
  List<AcbCRTestModel> _acbCRlocaldataList = [];
  List<AcbCRTestModel> get acbCRlocaldataList => _acbCRlocaldataList;
  List<AcbCRTestModel> _acbCRSerialNoList = [];
  List<AcbCRTestModel> get acbCRSerialNoList => _acbCRSerialNoList;
  AcbCRTestModel _acbCRModel;
  AcbCRTestModel get acbCRModel => _acbCRModel;

  String _error = 'ErroR';
  String get error => _error;

  void getAcbCRByTrNo(int trNo) async {
    _acbCRTrNoList = await sl<AcbCRLocalDatasourceImpl>()
        .getAcbCRByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getAcbCRBySerialNo(String serialNo) async {
    _acbCRSerialNoList = await sl<AcbCRLocalDatasourceImpl>()
        .getAcbCRBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getAcbCRByID(int id) async {
    _acbCRModel = await sl<AcbCRLocalDatasourceImpl>()
        .getAcbCRById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addACBCR(AcbCRTestModel acbCRtoLocal) async {
    await sl<AcbCRLocalDatasourceImpl>()
        .localAcbCR(acbCRtoLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteACBCR(int id) async {
    await sl<AcbCRLocalDatasourceImpl>()
        .deleteAcbCRById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateACBCR(AcbCRTestModel acbCRToUpdate, int id) async {
    await sl<AcbCRLocalDatasourceImpl>()
        .updateAcbCR(acbCRToUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getAcbCrEquipmentList() async {
    _acbCRlocaldataList = await sl<AcbCRLocalDatasourceImpl>()
        .getAcbCrEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

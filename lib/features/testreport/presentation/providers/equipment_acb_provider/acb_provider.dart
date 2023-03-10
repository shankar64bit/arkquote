// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/acb/acb_model.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/acb/acb_local_datasource.dart';

class AcbProvider extends ChangeNotifier {
  List<AcbModel> _acbTrnoList = [];
  List<AcbModel> get acbTrnoList => _acbTrnoList;

  // ignore: prefer_final_fields
  List<AcbModel> _acbloacaldataList = [];
  List<AcbModel> get acblocaldataList => _acbloacaldataList;

  AcbModel _acbModel;
  AcbModel get acbModel => _acbModel;

  String _error = 'ErroR';
  String get error => _error;

  void getAcbByTrNo(int trNo) async {
    _acbTrnoList = await sl<AcbLocalDatasourceImpl>()
        .getAcbByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getAcbByID(int id) async {
    _acbModel = await sl<AcbLocalDatasourceImpl>()
        .getAcbById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getAcbLocalData() async {
    _acbloacaldataList = await sl<AcbLocalDatasourceImpl>()
        .getAcbLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addACB(AcbModel acbModel, DateTime dateOfTesting,
      DateTime dueDateOfTesting) async {
    await sl<AcbLocalDatasourceImpl>()
        .localAcb(acbModel, dateOfTesting, dueDateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteACB(int id) async {
    await sl<AcbLocalDatasourceImpl>()
        .deleteAcbById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateACB(AcbModel acbToUpdate, int id) async {
    await sl<AcbLocalDatasourceImpl>()
        .updateAcb(acbToUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

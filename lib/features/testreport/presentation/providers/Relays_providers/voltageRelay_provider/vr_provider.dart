// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../../data/datasources/equipment/Relays/VoltageRelay/vr_local_datasource.dart';
import '../../../../data/models/equipment/Relays/VoltageRelay/vr_model.dart';

class VrProvider extends ChangeNotifier {
  List<VrModel> _vrTrnoList = [];
  List<VrModel> get vrTrnoList => _vrTrnoList;
  List<VrModel> _vrlocaldataList = [];
  List<VrModel> get vrlocaldataList => _vrlocaldataList;
  List<VrModel> _vrSerialNoList = [];
  List<VrModel> get vrSerialNoList => _vrSerialNoList;
  VrModel _vrModel;
  VrModel get vrModel => _vrModel;

  String _error = 'ErroR';
  String get error => _error;

  void getVrByTrNo(int trNo) async {
    _vrTrnoList = await sl<VrLocalDatasourceImpl>()
        .getVrByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getVrBySerialNo(String sn) async {
    _vrSerialNoList = await sl<VrLocalDatasourceImpl>()
        .getVrBySerialNo(sn)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getVrByID(int id) async {
    _vrModel = await sl<VrLocalDatasourceImpl>()
        .getVrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addVr(VrModel vrModel, DateTime dateOfTesting) async {
    await sl<VrLocalDatasourceImpl>()
        .localVr(vrModel, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteVr(int id) async {
    await sl<VrLocalDatasourceImpl>()
        .deleteVrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateVr(VrModel vrUpdate, int id) async {
    await sl<VrLocalDatasourceImpl>()
        .updateVr(vrUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getVrLocalData() async {
    _vrlocaldataList = await sl<VrLocalDatasourceImpl>()
        .getVrLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

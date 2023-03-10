// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../../data/datasources/equipment/Relays/FPrelay/FPrelay_local_datasource.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPrelay_model.dart';

class FPrelayProvider extends ChangeNotifier {
  List<FPrelayModel> _fprelayTrnoList = [];
  List<FPrelayModel> get fprelayTrnoList => _fprelayTrnoList;
  List<FPrelayModel> _fprelaylocaldataList = [];
  List<FPrelayModel> get fprelaylocaldataList => _fprelaylocaldataList;
  List<FPrelayModel> _fprelaySerialNoList = [];
  List<FPrelayModel> get fprelaySerialNoList => _fprelaySerialNoList;
  FPrelayModel _fprelayModel;
  FPrelayModel get fprelayModel => _fprelayModel;

  String _error = 'ErroR';
  String get error => _error;

  void getFPrelayByTrNo(int trNo) async {
    _fprelayTrnoList = await sl<FPrelayLocalDatasourceImpl>()
        .getFPrelayByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getFPrelayBySerialNo(String sn) async {
    _fprelaySerialNoList = await sl<FPrelayLocalDatasourceImpl>()
        .getFPrelayBySerialNo(sn)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getFPrelayByID(int id) async {
    _fprelayModel = await sl<FPrelayLocalDatasourceImpl>()
        .getFPrelayById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addFPrelay(FPrelayModel fprtolocal, DateTime dateOfTesting) async {
    await sl<FPrelayLocalDatasourceImpl>()
        .localFPrelay(fprtolocal, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteFPrelay(int id) async {
    await sl<FPrelayLocalDatasourceImpl>()
        .deleteFPrelayById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateFPrelay(FPrelayModel fprtoupdate, int id) async {
    await sl<FPrelayLocalDatasourceImpl>()
        .updateFPrelay(fprtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getFPrelayLocalData() async {
    _fprelaylocaldataList = await sl<FPrelayLocalDatasourceImpl>()
        .getFPrelayLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

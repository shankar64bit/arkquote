// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/Potential_Tranformer/pt_local_datasource.dart';
import '../../../data/models/equipment/PT/pt_model.dart';

class PTProvider extends ChangeNotifier {
  List<PTModel> _ptTrnoList = [];
  List<PTModel> get ptTrnoList => _ptTrnoList;
  List<PTModel> _ptlocaldataList = [];
  List<PTModel> get ptlocaldataList => _ptlocaldataList;
  List<PTModel> _ptSerialNoList = [];
  List<PTModel> get ptSerialNoList => _ptSerialNoList;
  PTModel _ptModel;
  PTModel get ptModel => _ptModel;

  String _error = 'ErroR';
  String get error => _error;

  void getPTByTrNo(int trNo) async {
    _ptTrnoList = await sl<PTLocalDatasourceImpl>()
        .getPTByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPTBySerialNo(String sn) async {
    _ptSerialNoList = await sl<PTLocalDatasourceImpl>()
        .getPTBySerialNo(sn)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPTByID(int id) async {
    _ptModel = await sl<PTLocalDatasourceImpl>()
        .getPTById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPTLocalData() async {
    _ptlocaldataList = await sl<PTLocalDatasourceImpl>()
        .getPTLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPT(PTModel pttolocal, DateTime dateOfTesting) async {
    await sl<PTLocalDatasourceImpl>()
        .localPT(pttolocal, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePT(int id) async {
    await sl<PTLocalDatasourceImpl>()
        .deletePTById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePT(PTModel pttoupdate, int id) async {
    await sl<PTLocalDatasourceImpl>()
        .updatePT(pttoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

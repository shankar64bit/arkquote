// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/IT/it_local_datasource.dart';
import '../../../data/models/equipment/IT/it_model.dart';

class ItProvider extends ChangeNotifier {
  List<ItModel> _itTrnoList = [];
  List<ItModel> get itTrnoList => _itTrnoList;
  List<ItModel> _itSerialNoList = [];
  List<ItModel> get itSerialNoList => _itSerialNoList;
  List<ItModel> _itlocaldataList = [];
  List<ItModel> get itlocaldataList => _itlocaldataList;
  ItModel _itModel;
  ItModel get itModel => _itModel;

  String _error = 'ErroR';
  String get error => _error;

  void getItByTrNo(int trNo) async {
    _itTrnoList = await sl<ItLocalDatasourceImpl>()
        .getItByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getItBySerialNo(String sn) async {
    _itSerialNoList = await sl<ItLocalDatasourceImpl>()
        .getItBySerialNo(sn)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getItByID(int id) async {
    _itModel = await sl<ItLocalDatasourceImpl>()
        .getItById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addIt(ItModel itToLocal, DateTime dateOfTesting) async {
    await sl<ItLocalDatasourceImpl>()
        .localIt(itToLocal, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteIt(int id) async {
    await sl<ItLocalDatasourceImpl>()
        .deleteItById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateIt(ItModel ittoUpdate, int id) async {
    await sl<ItLocalDatasourceImpl>()
        .updateIt(ittoUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void FutureGetITLocalData() async {
    _itlocaldataList = await sl<ItLocalDatasourceImpl>()
        .getITLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

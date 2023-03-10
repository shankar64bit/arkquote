// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/isolator/iso_local_datasource.dart';
import '../../../data/models/equipment/isolator/iso_model.dart';

class IsoProvider extends ChangeNotifier {
  List<IsoModel> _isoTrnoList = [];
  List<IsoModel> get isoTrnoList => _isoTrnoList;
  List<IsoModel> _isolocaldataList = [];
  List<IsoModel> get isolocaldataList => _isolocaldataList;
  IsoModel _isoModel;
  IsoModel get isoModel => _isoModel;

  String _error = 'ErroR';
  String get error => _error;

  void getIsoByTrNo(int trNo) async {
    _isoTrnoList = await sl<IsoLocalDatasourceImpl>()
        .getIsoByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getIsoByID(int id) async {
    _isoModel = await sl<IsoLocalDatasourceImpl>()
        .getIsoById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addIso(IsoModel isoModel, DateTime dateOfTesting) async {
    await sl<IsoLocalDatasourceImpl>()
        .localIso(isoModel, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteIso(int id) async {
    await sl<IsoLocalDatasourceImpl>()
        .deleteIsoById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateIso(IsoModel isoModel, int id) async {
    await sl<IsoLocalDatasourceImpl>()
        .updateIso(isoModel, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getISOLocalData() async {
    _isolocaldataList = await sl<IsoLocalDatasourceImpl>()
        .getISOLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../../data/datasources/equipment/Relays/FPrelay/FPR_overfreq_local_datasource.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_overfreq_model.dart';

class FPRoverfreqProvider extends ChangeNotifier {
  List<FPRoverfreqModel> _fproverfreq_loacaldataList = [];
  List<FPRoverfreqModel> get fproverfreq_loacaldataList =>
      _fproverfreq_loacaldataList;

  List<FPRoverfreqModel> _fproverfreq_trNoIDList = [];
  List<FPRoverfreqModel> get fproverfreq_trNoIDList => _fproverfreq_trNoIDList;

  List<FPRoverfreqModel> _fproverfreq_serialNoList = [];
  List<FPRoverfreqModel> get fproverfreq_serialNoList =>
      _fproverfreq_serialNoList;

  FPRoverfreqModel _fproverfreq_Model;
  FPRoverfreqModel get fproverfreq_Model => _fproverfreq_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getFPRoverfreqtrNoID(int trNo) async {
    _fproverfreq_trNoIDList = await sl<FPRoverfreqLocalDatasourceImpl>()
        .getFPRoverfreqTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getFPRoverfreqserialNo(String sNo) async {
    _fproverfreq_serialNoList = await sl<FPRoverfreqLocalDatasourceImpl>()
        .getFPRoverfreqSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getFPRoverfreqById(int id) async {
    _fproverfreq_Model = await sl<FPRoverfreqLocalDatasourceImpl>()
        .getFPRoverfreqById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addFPRoverfreq(FPRoverfreqModel fproverfreqtoLocal) async {
    await sl<FPRoverfreqLocalDatasourceImpl>()
        .localFPRoverfreq(fproverfreqtoLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteFPRoverfreq(int id) async {
    await sl<FPRoverfreqLocalDatasourceImpl>()
        .deleteFPRoverfreqById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateFPRoverfreq(FPRoverfreqModel fproverfreqUpdate, int id) async {
    await sl<FPRoverfreqLocalDatasourceImpl>()
        .updateFPRoverfreq(fproverfreqUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getFPRoverfreqEquipmentList() async {
    _fproverfreq_loacaldataList = await sl<FPRoverfreqLocalDatasourceImpl>()
        .getFPRoverffreqEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../../data/datasources/equipment/Relays/FPrelay/FPR_overvoltage_local_datasource.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_overvoltage_model.dart';

class FPRovervoltageProvider extends ChangeNotifier {
  List<FPRovervoltageModel> _fprovervoltage_loacaldataList = [];
  List<FPRovervoltageModel> get fprovervoltage_loacaldataList =>
      _fprovervoltage_loacaldataList;

  List<FPRovervoltageModel> _fprovervoltage_trNoIDList = [];
  List<FPRovervoltageModel> get fprovervoltage_trNoIDList =>
      _fprovervoltage_trNoIDList;

  List<FPRovervoltageModel> _fprovervoltage_serialNoList = [];
  List<FPRovervoltageModel> get fprovervoltage_serialNoList =>
      _fprovervoltage_serialNoList;

  FPRovervoltageModel _fprovervoltage_Model;
  FPRovervoltageModel get fprovervoltage_Model => _fprovervoltage_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getFPRovervoltagetrNoID(int trNo) async {
    _fprovervoltage_trNoIDList = await sl<FPRovervoltageLocalDatasourceImpl>()
        .getFPRovervoltageTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getFPRovervoltageserialNo(String sNo) async {
    _fprovervoltage_serialNoList = await sl<FPRovervoltageLocalDatasourceImpl>()
        .getFPRovervoltageSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getFPRovervoltageById(int id) async {
    _fprovervoltage_Model = await sl<FPRovervoltageLocalDatasourceImpl>()
        .getFPRovervoltageById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addFPRovervoltage(FPRovervoltageModel fprovervoltagetoLocal) async {
    await sl<FPRovervoltageLocalDatasourceImpl>()
        .localFPRovervoltage(fprovervoltagetoLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteFPRovervoltage(int id) async {
    await sl<FPRovervoltageLocalDatasourceImpl>()
        .deleteFPRovervoltageById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateFPRovervoltage(
      FPRovervoltageModel fprovervoltageUpdate, int id) async {
    await sl<FPRovervoltageLocalDatasourceImpl>()
        .updateFPRovervoltage(fprovervoltageUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getFPRovervoltEquipmentList() async {
    _fprovervoltage_loacaldataList =
        await sl<FPRovervoltageLocalDatasourceImpl>()
            .getfprovervoltEquipmentLists()
            .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

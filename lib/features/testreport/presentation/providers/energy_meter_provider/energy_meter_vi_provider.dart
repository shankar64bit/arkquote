import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/energy_meter/energy_meter_vi_local_datasource.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_vi_test_model.dart';

class EnergyMeterViProvider extends ChangeNotifier {
  List<EnergyMeterViTestModel> _energymeterViTrNoList = [];
  List<EnergyMeterViTestModel> get energymeterViTrNoList =>
      _energymeterViTrNoList;
  List<EnergyMeterViTestModel> _energymeterViSerialNoList = [];
  List<EnergyMeterViTestModel> get energymeterViSerialNoList =>
      _energymeterViSerialNoList;
  List<EnergyMeterViTestModel> _energymeterViEquipmentList = [];
  List<EnergyMeterViTestModel> get energymeterViEquipmentList =>
      _energymeterViEquipmentList;
  EnergyMeterViTestModel _energymeterViModel;
  EnergyMeterViTestModel get energymeterViModel => _energymeterViModel;

  String _error = 'ErroR';
  String get error => _error;

  void getEnergyMeterViByTrNo(int trNo) async {
    _energymeterViTrNoList = await sl<EnergyMeterViLocalDatasourceImpl>()
        .getEnergyMeterViByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterViBySerialNo(String serialNo) async {
    _energymeterViSerialNoList = await sl<EnergyMeterViLocalDatasourceImpl>()
        .getEnergyMeterViBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterViByID(int id) async {
    _energymeterViModel = await sl<EnergyMeterViLocalDatasourceImpl>()
        .getEnergyMeterViById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addEnergyMeterVi(EnergyMeterViTestModel emvitolocal) async {
    await sl<EnergyMeterViLocalDatasourceImpl>()
        .localEnergyMeterVi(emvitolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteEnergyMeterVi(int id) async {
    await sl<EnergyMeterViLocalDatasourceImpl>()
        .deleteEnergyMeterViById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateEnergyMeterVi(EnergyMeterViTestModel emvitoupdate, int id) async {
    await sl<EnergyMeterViLocalDatasourceImpl>()
        .updateEnergyMeterVi(emvitoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMetereEquipmentList() async {
    _energymeterViEquipmentList = await sl<EnergyMeterViLocalDatasourceImpl>()
        .getEnergyMeterEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/energy_meter/energy_meter_fi_local_datasource.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_Fi_test.dart';

class EnergyMeterFiProvider extends ChangeNotifier {
  List<EnergyMeterFiTestModel> _energymeterFiTrNoList = [];
  List<EnergyMeterFiTestModel> get energymeterFiTrNoList =>
      _energymeterFiTrNoList;
  List<EnergyMeterFiTestModel> _energymeterFiSerialNoList = [];
  List<EnergyMeterFiTestModel> get energymeterFiSerialNoList =>
      _energymeterFiSerialNoList;
  List<EnergyMeterFiTestModel> _energymeterFiEquipmentList = [];
  List<EnergyMeterFiTestModel> get energymeterFiEquipmentList =>
      _energymeterFiEquipmentList;
  EnergyMeterFiTestModel _energymeterFiModel;
  EnergyMeterFiTestModel get energymeterFiModel => _energymeterFiModel;

  String _error = 'ErroR';
  String get error => _error;

  void getEnergyMeterFiByTrNo(int trNo) async {
    _energymeterFiTrNoList = await sl<EnergyMeterFiLocalDatasourceImpl>()
        .getEnergyMeterFiByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterFiBySerialNo(String serialNo) async {
    _energymeterFiSerialNoList = await sl<EnergyMeterFiLocalDatasourceImpl>()
        .getEnergyMeterFiBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterFiByID(int id) async {
    _energymeterFiModel = await sl<EnergyMeterFiLocalDatasourceImpl>()
        .getEnergyMeterFiById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addEnergyMeterFi(EnergyMeterFiTestModel energymeterFiModel) async {
    await sl<EnergyMeterFiLocalDatasourceImpl>()
        .localEnergyMeterFi(energymeterFiModel)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteEnergyMeterFi(int id) async {
    await sl<EnergyMeterFiLocalDatasourceImpl>()
        .deleteEnergyMeterFiById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateEnergyMeterFi(
      EnergyMeterFiTestModel energymeterFiModel, int id) async {
    await sl<EnergyMeterFiLocalDatasourceImpl>()
        .updateEnergyMeterFi(energymeterFiModel, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterfiEquipmentList() async {
    _energymeterFiEquipmentList = await sl<EnergyMeterFiLocalDatasourceImpl>()
        .getEMfiEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

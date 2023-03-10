import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/energy_meter/energy_meter_rp_local_datasource.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_rp_test.dart';

class EnergyMeterRpProvider extends ChangeNotifier {
  List<EnergyMeterRpTestModel> _energymeterRpTrNoList = [];
  List<EnergyMeterRpTestModel> get energymeterRpTrNoList =>
      _energymeterRpTrNoList;
  List<EnergyMeterRpTestModel> _energymeterRpSerialNoList = [];
  List<EnergyMeterRpTestModel> get energymeterRpSerialNoList =>
      _energymeterRpSerialNoList;
  List<EnergyMeterRpTestModel> _energymeterRpEquipmentList = [];
  List<EnergyMeterRpTestModel> get energymeterRpEquipmentList =>
      _energymeterRpEquipmentList;
  EnergyMeterRpTestModel _energymeterRpModel;
  EnergyMeterRpTestModel get energymeterRpModel => _energymeterRpModel;

  String _error = 'ErroR';
  String get error => _error;

  void getEnergyMeterRpByTrNo(int trNo) async {
    _energymeterRpTrNoList = await sl<EnergyMeterRpLocalDatasourceImpl>()
        .getEnergyMeterRpByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterRpBySerialNo(String serialNo) async {
    _energymeterRpSerialNoList = await sl<EnergyMeterRpLocalDatasourceImpl>()
        .getEnergyMeterRpBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterRpByID(int id) async {
    _energymeterRpModel = await sl<EnergyMeterRpLocalDatasourceImpl>()
        .getEnergyMeterRpById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addEnergyMeterRp(EnergyMeterRpTestModel emrptolocal) async {
    await sl<EnergyMeterRpLocalDatasourceImpl>()
        .localEnergyMeterRp(emrptolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteEnergyMeterRp(int id) async {
    await sl<EnergyMeterRpLocalDatasourceImpl>()
        .deleteEnergyMeterRpById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateEnergyMeterRp(
      EnergyMeterRpTestModel emrptoupdate, int id) async {
    await sl<EnergyMeterRpLocalDatasourceImpl>()
        .updateEnergyMeterRp(emrptoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterRPEquipmentList() async {
    _energymeterRpEquipmentList = await sl<EnergyMeterRpLocalDatasourceImpl>()
        .getEMRPEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

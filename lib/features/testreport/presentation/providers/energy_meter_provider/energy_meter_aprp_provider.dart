import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/energy_meter/energy_meter_aprp_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/models/equipment/energy_meter/energu_meter_aprp_test.dart';

class EnergyMeterAprpProvider extends ChangeNotifier {
  List<EnergyMeterAprpTestModel> _energymeterAprpTrNoList = [];
  List<EnergyMeterAprpTestModel> get energymeterAprpTrNoList =>
      _energymeterAprpTrNoList;
  List<EnergyMeterAprpTestModel> _energymeterAprpSerialNoList = [];
  List<EnergyMeterAprpTestModel> get energymeterAprpSerialNoList =>
      _energymeterAprpSerialNoList;
  List<EnergyMeterAprpTestModel> _energymeterAprpEquipmentList = [];
  List<EnergyMeterAprpTestModel> get energymeterAprpEquipmentList =>
      _energymeterAprpEquipmentList;
  EnergyMeterAprpTestModel _energymeterAprpModel;
  EnergyMeterAprpTestModel get energymeterAprpModel => _energymeterAprpModel;

  String _error = 'ErroR';
  String get error => _error;

  void getEnergyMeterAprpByTrNo(int trNo) async {
    _energymeterAprpTrNoList = await sl<EnergyMeterAprpLocalDatasourceImpl>()
        .getEnergyMeterAprpByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterAprpBySerialNo(String serialNo) async {
    _energymeterAprpSerialNoList =
        await sl<EnergyMeterAprpLocalDatasourceImpl>()
            .getEnergyMeterAprpBySerialNo(serialNo)
            .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterAprpByID(int id) async {
    _energymeterAprpModel = await sl<EnergyMeterAprpLocalDatasourceImpl>()
        .getEnergyMeterAprpById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addEnergyMeterAprp(EnergyMeterAprpTestModel emaprptolocal) async {
    await sl<EnergyMeterAprpLocalDatasourceImpl>()
        .localEnergyMeterAprp(emaprptolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteEnergyMeterAprp(int id) async {
    await sl<EnergyMeterAprpLocalDatasourceImpl>()
        .deleteEnergyMeterAprpById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateEnergyMeterAprp(
      EnergyMeterAprpTestModel emaprptoupdate, int id) async {
    await sl<EnergyMeterAprpLocalDatasourceImpl>()
        .updateEnergyMeterAprp(emaprptoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterAPRPEquipmentList() async {
    _energymeterAprpEquipmentList =
        await sl<EnergyMeterAprpLocalDatasourceImpl>()
            .getEMAPRPEquipmentLists()
            .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}

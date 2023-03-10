import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/energy_meter/energy_meter_rp_test.dart';

abstract class EnergyMeterRpLocalDatasource {
  Future<List<EnergyMeterRpTestModel>> getEnergyMeterRpByTrNo(int trNo);
  Future<List<EnergyMeterRpTestModel>> getEMRPEquipmentLists();
  Future<List<EnergyMeterRpTestModel>> getEnergyMeterRpBySerialNo(
      String serilNo);
  Future<EnergyMeterRpTestModel> getEnergyMeterRpById(int id);
  Future<void> localEnergyMeterRp(EnergyMeterRpTestModel emrptolocal);
  Future<void> updateEnergyMeterRp(EnergyMeterRpTestModel emrptoupdate, int id);
  Future<int> deleteEnergyMeterRpById(int id);
}

@DataClassName('EnergyMeterRpLocalData')
class EnergyMeterRpLocalDatasourceImpl extends Table
    implements EnergyMeterRpLocalDatasource {
  @required
  DateTimeColumn get lastUpdated =>
      dateTime().withDefault(Constant(DateTime.now()))();
  @required
  TextColumn get EquipmentType => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();

  @required
  RealColumn get initialTestMeterReading => real()();
  @required
  RealColumn get afterTestMeterReading => real()();
  @required
  RealColumn get testMeterReading_R => real()();
  @required
  RealColumn get initialStandardMeterReading => real()();
  @required
  RealColumn get afterStandardMeterReading => real()();
  @required
  RealColumn get standardMeterReading_A => real()();

  @override
  Future<int> deleteEnergyMeterRpById(int id) {
    return (sl<AppDatabase>().deleteEnergyMeterRpById(id));
  }

  @override
  Future<EnergyMeterRpTestModel> getEnergyMeterRpById(int id) async {
    EnergyMeterRpLocalData tEnergyMeterRpData =
        await sl<AppDatabase>().getEnergyMeterRpLocalDataWithId(id);

    EnergyMeterRpTestModel tEnergyMeterRpTestModel = EnergyMeterRpTestModel(
        id: tEnergyMeterRpData.id,
        databaseID: tEnergyMeterRpData.databaseID,
        initialTestMeterReading: tEnergyMeterRpData.initialTestMeterReading,
        afterTestMeterReading: tEnergyMeterRpData.afterTestMeterReading,
        testMeterReading_R: tEnergyMeterRpData.testMeterReading_R,
        initialStandardMeterReading:
            tEnergyMeterRpData.initialStandardMeterReading,
        afterStandardMeterReading: tEnergyMeterRpData.afterStandardMeterReading,
        standardMeterReading_A: tEnergyMeterRpData.standardMeterReading_A,
        trNo: tEnergyMeterRpData.trNo,
        serialNo: tEnergyMeterRpData.serialNo,
        EquipmentType: tEnergyMeterRpData.EquipmentType,
        updateDate: tEnergyMeterRpData.lastUpdated);

    return tEnergyMeterRpTestModel;
  }

  @override
  Future<List<EnergyMeterRpTestModel>> getEnergyMeterRpByTrNo(int trNo) async {
    final tEnergyMeterRpData =
        await sl<AppDatabase>().getEnergyMeterRpLocalDataWithTrNo(trNo);
    List<EnergyMeterRpTestModel> tEnergyMeterRpTestModel =
        List<EnergyMeterRpTestModel>.empty(growable: true);
    for (var element in tEnergyMeterRpData) {
      tEnergyMeterRpTestModel.add(EnergyMeterRpTestModel(
        id: element.id,
        databaseID: element.databaseID,
        initialTestMeterReading: element.initialTestMeterReading,
        afterTestMeterReading: element.afterTestMeterReading,
        testMeterReading_R: element.testMeterReading_R,
        initialStandardMeterReading: element.initialStandardMeterReading,
        afterStandardMeterReading: element.afterStandardMeterReading,
        standardMeterReading_A: element.standardMeterReading_A,
        trNo: element.trNo,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        updateDate: element.lastUpdated,
      ));
    }
    return tEnergyMeterRpTestModel;
  }

  @override
  Future<int> localEnergyMeterRp(EnergyMeterRpTestModel emrptolocal) {
    return (sl<AppDatabase>().createEnergyMeterRp(emrptolocal));
  }

  @override
  Future<void> updateEnergyMeterRp(
      EnergyMeterRpTestModel emrptoupdate, int id) async {
    sl<AppDatabase>().updateEnergyMeterRp(emrptoupdate, id);
  }

  @override
  Future<List<EnergyMeterRpTestModel>> getEnergyMeterRpBySerialNo(
      String serialNO) async {
    final tEnergyMeterRpData =
        await sl<AppDatabase>().getEnergyMeterRpLocalDataWithSerialNo(serialNO);
    List<EnergyMeterRpTestModel> tEnergyMeterRpTestModel =
        List<EnergyMeterRpTestModel>.empty(growable: true);
    for (var element in tEnergyMeterRpData) {
      tEnergyMeterRpTestModel.add(EnergyMeterRpTestModel(
        id: element.id,
        databaseID: element.databaseID,
        initialTestMeterReading: element.initialTestMeterReading,
        afterTestMeterReading: element.afterTestMeterReading,
        testMeterReading_R: element.testMeterReading_R,
        initialStandardMeterReading: element.initialStandardMeterReading,
        afterStandardMeterReading: element.afterStandardMeterReading,
        standardMeterReading_A: element.standardMeterReading_A,
        trNo: element.trNo,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
      ));
    }
    return tEnergyMeterRpTestModel;
  }

  @override
  Future<List<EnergyMeterRpTestModel>> getEMRPEquipmentLists() async {
    final tEMrpData = await sl<AppDatabase>().getEMRPEquipmentListwithAll();
    List<EnergyMeterRpTestModel> tEMrpTestModel =
        List<EnergyMeterRpTestModel>.empty(growable: true);
    for (var element in tEMrpData) {
      tEMrpTestModel.add(EnergyMeterRpTestModel(
        id: element.id,
        databaseID: element.databaseID,
        initialTestMeterReading: element.initialTestMeterReading,
        afterTestMeterReading: element.afterTestMeterReading,
        testMeterReading_R: element.testMeterReading_R,
        initialStandardMeterReading: element.initialStandardMeterReading,
        afterStandardMeterReading: element.afterStandardMeterReading,
        standardMeterReading_A: element.standardMeterReading_A,
        trNo: element.trNo,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        updateDate: element.lastUpdated,
      ));
    }
    return tEMrpTestModel;
  }
}

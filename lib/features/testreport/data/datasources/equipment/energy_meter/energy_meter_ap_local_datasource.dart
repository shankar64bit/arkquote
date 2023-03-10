import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/energy_meter/energy_meter_Pfi_test.dart';
import '../../../models/equipment/energy_meter/energy_meter_ap_test.dart';

abstract class EnergyMeterApLocalDatasource {
  Future<List<EnergyMeterApTestModel>> getEnergyMeterApByTrNo(int trNo);
  Future<List<EnergyMeterApTestModel>> getEMAPEquipmentLists();
  Future<List<EnergyMeterApTestModel>> getEnergyMeterApBySerialNo(
      String serilNo);
  Future<EnergyMeterApTestModel> getEnergyMeterApById(int id);
  Future<void> localEnergyMeterAp(EnergyMeterApTestModel emaptolocal);
  Future<void> updateEnergyMeterAp(
      EnergyMeterApTestModel emaptoupdate, int id);
  Future<int> deleteEnergyMeterApById(int id);
}

@DataClassName('EnergyMeterApLocalData')
class EnergyMeterApLocalDatasourceImpl extends Table
    implements EnergyMeterApLocalDatasource {
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
  Future<int> deleteEnergyMeterApById(int id) {
    return (sl<AppDatabase>().deleteEnergyMeterApById(id));
  }

  @override
  Future<EnergyMeterApTestModel> getEnergyMeterApById(int id) async {
    EnergyMeterApLocalData tEnergyMeterApData =
        await sl<AppDatabase>().getEnergyMeterApLocalDataWithId(id);

    EnergyMeterApTestModel tEnergyMeterApTestModel = EnergyMeterApTestModel(
      id: tEnergyMeterApData.id,
      databaseID: tEnergyMeterApData.databaseID,
      initialTestMeterReading: tEnergyMeterApData.initialTestMeterReading,
      afterTestMeterReading: tEnergyMeterApData.afterTestMeterReading,
      testMeterReading_R: tEnergyMeterApData.testMeterReading_R,
      initialStandardMeterReading:
          tEnergyMeterApData.initialStandardMeterReading,
      afterStandardMeterReading: tEnergyMeterApData.afterStandardMeterReading,
      standardMeterReading_A: tEnergyMeterApData.standardMeterReading_A,
      trNo: tEnergyMeterApData.trNo,
      serialNo: tEnergyMeterApData.serialNo,
      EquipmentType: tEnergyMeterApData.EquipmentType,
      updateDate: tEnergyMeterApData.lastUpdated,
    );

    return tEnergyMeterApTestModel;
  }

  @override
  Future<List<EnergyMeterApTestModel>> getEnergyMeterApByTrNo(int trNo) async {
    final tEnergyMeterApData =
        await sl<AppDatabase>().getEnergyMeterApLocalDataWithTrNo(trNo);
    List<EnergyMeterApTestModel> tEnergyMeterApTestModel =
        List<EnergyMeterApTestModel>.empty(growable: true);
    for (var element in tEnergyMeterApData) {
      tEnergyMeterApTestModel.add(EnergyMeterApTestModel(
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
    return tEnergyMeterApTestModel;
  }

  @override
  Future<int> localEnergyMeterAp(EnergyMeterApTestModel emaptolocal) {
    return (sl<AppDatabase>().createEnergyMeterAp(emaptolocal));
  }

  @override
  Future<void> updateEnergyMeterAp(
      EnergyMeterApTestModel emaptoupdate, int id) async {
    sl<AppDatabase>().updateEnergyMeterAp(emaptoupdate, id);
  }

  @override
  Future<List<EnergyMeterApTestModel>> getEnergyMeterApBySerialNo(
      String serialNO) async {
    final tEnergyMeterApData =
        await sl<AppDatabase>().getEnergyMeterApLocalDataWithSerialNo(serialNO);
    List<EnergyMeterApTestModel> tEnergyMeterApTestModel =
        List<EnergyMeterApTestModel>.empty(growable: true);
    for (var element in tEnergyMeterApData) {
      tEnergyMeterApTestModel.add(EnergyMeterApTestModel(
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
    return tEnergyMeterApTestModel;
  }

  @override
  Future<List<EnergyMeterApTestModel>> getEMAPEquipmentLists() async {
    final temapData = await sl<AppDatabase>().getEMAPEquipmentListwithAll();
    List<EnergyMeterApTestModel> temapTestModel =
        List<EnergyMeterApTestModel>.empty(growable: true);
    for (var element in temapData) {
      temapTestModel.add(EnergyMeterApTestModel(
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
    return temapTestModel;
  }
}

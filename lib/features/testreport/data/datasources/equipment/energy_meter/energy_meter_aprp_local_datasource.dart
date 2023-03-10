import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/energy_meter/energu_meter_aprp_test.dart';

abstract class EnergyMeterAprpLocalDatasource {
  Future<List<EnergyMeterAprpTestModel>> getEnergyMeterAprpByTrNo(int trNo);
  Future<List<EnergyMeterAprpTestModel>> getEMAPRPEquipmentLists();
  Future<List<EnergyMeterAprpTestModel>> getEnergyMeterAprpBySerialNo(
      String serilNo);
  Future<EnergyMeterAprpTestModel> getEnergyMeterAprpById(int id);
  Future<void> localEnergyMeterAprp(
      EnergyMeterAprpTestModel emaprptolocal);
  Future<void> updateEnergyMeterAprp(
      EnergyMeterAprpTestModel emaprptoupdate, int id);
  Future<int> deleteEnergyMeterAprpById(int id);
}

@DataClassName('EnergyMeterAprpLocalData')
class EnergyMeterAprpLocalDatasourceImpl extends Table
    implements EnergyMeterAprpLocalDatasource {
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
  Future<int> deleteEnergyMeterAprpById(int id) {
    return (sl<AppDatabase>().deleteEnergyMeterAprpById(id));
  }

  @override
  Future<EnergyMeterAprpTestModel> getEnergyMeterAprpById(int id) async {
    EnergyMeterAprpLocalData tEnergyMeterAprpData =
        await sl<AppDatabase>().getEnergyMeterAprpLocalDataWithId(id);

    EnergyMeterAprpTestModel tEnergyMeterAprpTestModel =
        EnergyMeterAprpTestModel(
            id: tEnergyMeterAprpData.id,
            databaseID: tEnergyMeterAprpData.databaseID,
            initialTestMeterReading:
                tEnergyMeterAprpData.initialTestMeterReading,
            afterTestMeterReading: tEnergyMeterAprpData.afterTestMeterReading,
            testMeterReading_R: tEnergyMeterAprpData.testMeterReading_R,
            initialStandardMeterReading:
                tEnergyMeterAprpData.initialStandardMeterReading,
            afterStandardMeterReading:
                tEnergyMeterAprpData.afterStandardMeterReading,
            standardMeterReading_A: tEnergyMeterAprpData.standardMeterReading_A,
            trNo: tEnergyMeterAprpData.trNo,
            serialNo: tEnergyMeterAprpData.serialNo,
            EquipmentType: tEnergyMeterAprpData.EquipmentType,
            updateDate: tEnergyMeterAprpData.lastUpdated);

    return tEnergyMeterAprpTestModel;
  }

  @override
  Future<List<EnergyMeterAprpTestModel>> getEnergyMeterAprpByTrNo(
      int trNo) async {
    final tEnergyMeterAprpData =
        await sl<AppDatabase>().getEnergyMeterAprpLocalDataWithTrNo(trNo);
    List<EnergyMeterAprpTestModel> tEnergyMeterAprpTestModel =
        List<EnergyMeterAprpTestModel>.empty(growable: true);
    for (var element in tEnergyMeterAprpData) {
      tEnergyMeterAprpTestModel.add(EnergyMeterAprpTestModel(
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
          updateDate: element.lastUpdated));
    }
    return tEnergyMeterAprpTestModel;
  }

  @override
  Future<int> localEnergyMeterAprp(
      EnergyMeterAprpTestModel emaprptolocal) {
    return (sl<AppDatabase>().createEnergyMeterAprp(emaprptolocal));
  }

  @override
  Future<void> updateEnergyMeterAprp(
      EnergyMeterAprpTestModel emaprptoupdate, int id) async {
    sl<AppDatabase>().updateEnergyMeterAprp(emaprptoupdate, id);
  }

  @override
  Future<List<EnergyMeterAprpTestModel>> getEnergyMeterAprpBySerialNo(
      String serialNO) async {
    final tEnergyMeterAprpData = await sl<AppDatabase>()
        .getEnergyMeterAprpLocalDataWithSerialNo(serialNO);
    List<EnergyMeterAprpTestModel> tEnergyMeterAprpTestModel =
        List<EnergyMeterAprpTestModel>.empty(growable: true);
    for (var element in tEnergyMeterAprpData) {
      tEnergyMeterAprpTestModel.add(EnergyMeterAprpTestModel(
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
    return tEnergyMeterAprpTestModel;
  }

  @override
  Future<List<EnergyMeterAprpTestModel>> getEMAPRPEquipmentLists() async {
    final tEMaprpData = await sl<AppDatabase>().getEMAPRPEquipmentListwithAll();
    List<EnergyMeterAprpTestModel> tEMaprpTestModel =
        List<EnergyMeterAprpTestModel>.empty(growable: true);
    for (var element in tEMaprpData) {
      tEMaprpTestModel.add(EnergyMeterAprpTestModel(
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
    return tEMaprpTestModel;
  }
}

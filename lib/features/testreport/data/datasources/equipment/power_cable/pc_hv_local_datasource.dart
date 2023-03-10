import 'dart:math';
import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/power_cable/pc_hv_test_model.dart';
import '../../test_report_local_datasource.dart';

abstract class PcHvLocalDatasource {
  Future<List<PcHvTestModel>> getPcHvByTrNo(int trNo);
  Future<PcHvTestModel> getPcHvById(int id);
  Future<void> localPcHv(PcHvTestModel pchvtolocal);
  Future<void> updatePcHv(PcHvTestModel pchvtoupdate, int id);
  Future<int> deletePcHvById(int id);
  Future<List<PcHvTestModel>> getPcHvByPcRefId(int pcRefId);
  Future<List<PcHvTestModel>> getPcHvEquipmentList();
  // Future<List<PcHvTestModel>> getTestedById(int id);
}

@DataClassName('PcHvLocalData')
class PcHvLocalDatasourceImpl extends Table implements PcHvLocalDatasource {
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
  IntColumn get pcRefId => integer()();
  @required
  RealColumn get rVoltage => real()();
  @required
  RealColumn get yVoltage => real()();
  @required
  RealColumn get bVoltage => real()();
  @required
  RealColumn get rCurrent => real()();
  @required
  RealColumn get yCurrent => real()();
  @required
  RealColumn get bCurrent => real()();

  @override
  Future<PcHvTestModel> getPcHvById(int id) async {
    PcHvLocalData tPcHvData =
        await sl<AppDatabase>().getPcHvLocalDataWithId(id);

    PcHvTestModel tPcHvTestModel = PcHvTestModel(
      databaseID: tPcHvData.databaseID,
      id: tPcHvData.id,
      rVoltage: tPcHvData.rVoltage,
      rCurrent: tPcHvData.rCurrent,
      yVoltage: tPcHvData.yVoltage,
      yCurrent: tPcHvData.yCurrent,
      bVoltage: tPcHvData.bVoltage,
      bCurrent: tPcHvData.bCurrent,
      trNo: tPcHvData.trNo,
      pcRefId: tPcHvData.pcRefId,
      EquipmentType: tPcHvData.EquipmentType,
      lastUpdated: tPcHvData.lastUpdated,
    );

    return tPcHvTestModel;
  }

  @override
  Future<List<PcHvTestModel>> getPcHvByTrNo(int trNo) async {
    final tPcHvData = await sl<AppDatabase>().getPcHvLocalDataWithTrNo(trNo);
    List<PcHvTestModel> tPcHvTestModel =
        List<PcHvTestModel>.empty(growable: true);

    for (var element in tPcHvData) {
      tPcHvTestModel.add(PcHvTestModel(
        id: element.id,
        databaseID: element.databaseID,
        rVoltage: element.rVoltage,
        rCurrent: element.rCurrent,
        yVoltage: element.yVoltage,
        yCurrent: element.yCurrent,
        bVoltage: element.bVoltage,
        bCurrent: element.bCurrent,
        trNo: element.trNo,
        pcRefId: element.pcRefId,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tPcHvTestModel;
  }

  @override
  Future<List<PcHvTestModel>> getPcHvEquipmentList() async {
    final tPcHvData = await sl<AppDatabase>().getPcHvEquipmentList();
    List<PcHvTestModel> tPcHvTestModel =
        List<PcHvTestModel>.empty(growable: true);
    for (var element in tPcHvData) {
      tPcHvTestModel.add(PcHvTestModel(
        id: element.id,
        rVoltage: element.rVoltage,
        rCurrent: element.rCurrent,
        yVoltage: element.yVoltage,
        yCurrent: element.yCurrent,
        bVoltage: element.bVoltage,
        bCurrent: element.bCurrent,
        EquipmentType: element.EquipmentType,
        databaseID: element.databaseID,
        pcRefId: element.pcRefId,
        trNo: element.trNo,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tPcHvTestModel;
  }

  @override
  Future<List<PcHvTestModel>> getPcHvByPcRefId(int pcRefId) async {
    final tPcHvData =
        await sl<AppDatabase>().getPcHvLocalDataWithPcRefId(pcRefId);
    List<PcHvTestModel> tPcHvTestModel =
        List<PcHvTestModel>.empty(growable: true);
    for (var element in tPcHvData) {
      tPcHvTestModel.add(PcHvTestModel(
        id: element.id,
        rVoltage: element.rVoltage,
        rCurrent: element.rCurrent,
        yVoltage: element.yVoltage,
        yCurrent: element.yCurrent,
        bVoltage: element.bVoltage,
        bCurrent: element.bCurrent,
        trNo: element.trNo,
        databaseID: element.databaseID,
        pcRefId: element.pcRefId,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tPcHvTestModel;
  }

  @override
  Future<int> localPcHv(PcHvTestModel pchvtolocal) {
    return (sl<AppDatabase>().createPcHv(pchvtolocal));
  }

  @override
  Future<void> updatePcHv(PcHvTestModel pchvtoupdate, int id) async {
    sl<AppDatabase>().updatePcHv(pchvtoupdate, id);
  }

  @override
  Future<int> deletePcHvById(int id) {
    return (sl<AppDatabase>().deletePcHvById(id));
  }
}

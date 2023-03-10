import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/LA/la_ir_test_model.dart';
import '../../test_report_local_datasource.dart';

abstract class LaIrLocalDatasource {
  Future<List<LaIrTestModel>> getLaIrByTrNo(int trNo);
  Future<LaIrTestModel> getLaIrById(int id);
  Future<void> localLaIr(LaIrTestModel lairtolocal);
  Future<void> updateLaIr(LaIrTestModel lairtoupdate, int id);
  Future<int> deleteLaIrById(int id);
  Future<List<LaIrTestModel>> getLaIrBySerialNo(String serialNo);
  Future<List<LaIrTestModel>> getLaIrEquipmentList();
  // Future<List<LaIrTestModel>> getTestedById(int id);
}

@DataClassName('LaIrLocalData')
class LaIrLocalDatasourceImpl extends Table implements LaIrLocalDatasource {
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
  RealColumn get seR => real()();
  @required
  RealColumn get seY => real()();
  @required
  RealColumn get seB => real()();
  @required
  RealColumn get ssR => real()();
  @required
  RealColumn get ssY => real()();
  @required
  RealColumn get ssB => real()();

  @override
  Future<LaIrTestModel> getLaIrById(int id) async {
    LaIrLocalData tLaIrData =
        await sl<AppDatabase>().getLaIrLocalDataWithId(id);

    LaIrTestModel tLaIrTestModel = LaIrTestModel(
      databaseID: tLaIrData.databaseID,
      id: tLaIrData.id,
      seR: tLaIrData.seR,
      seY: tLaIrData.seY,
      seB: tLaIrData.seB,
      ssR: tLaIrData.ssR,
      ssY: tLaIrData.ssY,
      ssB: tLaIrData.ssB,
      trNo: tLaIrData.trNo,
      serialNo: tLaIrData.serialNo,
      EquipmentType: tLaIrData.EquipmentType,
      lastUpdated: tLaIrData.lastUpdated,
    );

    return tLaIrTestModel;
  }

  @override
  Future<List<LaIrTestModel>> getLaIrByTrNo(int trNo) async {
    final tLaIrData = await sl<AppDatabase>().getLaIrLocalDataWithTrNo(trNo);
    List<LaIrTestModel> tLaIrTestModel =
        List<LaIrTestModel>.empty(growable: true);

    for (var element in tLaIrData) {
      tLaIrTestModel.add(LaIrTestModel(
        id: element.id,
        databaseID: element.databaseID,
        seR: element.seR,
        seY: element.seY,
        seB: element.seB,
        ssR: element.ssR,
        ssY: element.ssY,
        ssB: element.ssB,
        trNo: element.trNo,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tLaIrTestModel;
  }

  @override
  Future<List<LaIrTestModel>> getLaIrEquipmentList() async {
    final tLaIrData = await sl<AppDatabase>().getLaIrEquipmentList();
    List<LaIrTestModel> tLaIrTestModel =
        List<LaIrTestModel>.empty(growable: true);
    for (var element in tLaIrData) {
      tLaIrTestModel.add(LaIrTestModel(
        id: element.id,
        seR: element.seR,
        seY: element.seY,
        seB: element.seB,
        ssR: element.ssR,
        ssY: element.ssY,
        ssB: element.ssB,
        EquipmentType: element.EquipmentType,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        trNo: element.trNo,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tLaIrTestModel;
  }

  @override
  Future<List<LaIrTestModel>> getLaIrBySerialNo(String serialNo) async {
    final tLaIrData =
        await sl<AppDatabase>().getLaIrLocalDataWithSerialNo(serialNo);
    List<LaIrTestModel> tLaIrTestModel =
        List<LaIrTestModel>.empty(growable: true);
    for (var element in tLaIrData) {
      tLaIrTestModel.add(LaIrTestModel(
        id: element.id,
        seR: element.seR,
        seY: element.seY,
        seB: element.seB,
        ssR: element.ssR,
        ssY: element.ssY,
        ssB: element.ssB,
        trNo: element.trNo,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tLaIrTestModel;
  }

  @override
  Future<int> localLaIr(LaIrTestModel lairtolocal) {
    return (sl<AppDatabase>().createLaIr(lairtolocal));
  }

  @override
  Future<void> updateLaIr(LaIrTestModel lairtoupdate, int id) async {
    sl<AppDatabase>().updateLaIr(lairtoupdate, id);
  }

  @override
  Future<int> deleteLaIrById(int id) {
    return (sl<AppDatabase>().deleteLaIrById(id));
  }
}

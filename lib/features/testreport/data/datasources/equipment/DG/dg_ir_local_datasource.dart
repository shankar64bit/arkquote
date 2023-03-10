import 'dart:math';

import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/DG/dg_ir_test_model.dart';
import '../../test_report_local_datasource.dart';

abstract class DgIrLocalDatasource {
  Future<List<DgIrTestModel>> getDgIrByTrNo(int trNo);
  Future<DgIrTestModel> getDgIrById(int id);
  Future<void> localDgIr(DgIrTestModel dgIrTestModel);
  Future<void> updateDgIr(DgIrTestModel dgIrToUpdate, int id);
  Future<int> deleteDgIrById(int id);
  Future<List<DgIrTestModel>> getDgIrBySerialNo(String serialNo);
  Future<List<DgIrTestModel>> getDgIrEquipmentList();
  // Future<List<DgIrTestModel>> getTestedById(int id);
}

@DataClassName('DgIrLocalData')
class DgIrLocalDatasourceImpl extends Table implements DgIrLocalDatasource {
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
  RealColumn get re_mResistance => real()();
  @required
  RealColumn get ye_mResistance => real()();
  @required
  RealColumn get be_mResistance => real()();

  // @override
  Future<DgIrTestModel> getDgIrById(int id) async {
    DgIrLocalData tDgIrData =
        await sl<AppDatabase>().getDgIrLocalDataWithId(id);

    DgIrTestModel tDgIrTestModel = DgIrTestModel(
      databaseID: tDgIrData.databaseID,
      id: tDgIrData.id,
      re_mResistance: tDgIrData.re_mResistance,
      ye_mResistance: tDgIrData.ye_mResistance,
      be_mResistance: tDgIrData.be_mResistance,
      trNo: tDgIrData.trNo,
      serialNo: tDgIrData.serialNo,
      EquipmentType: tDgIrData.EquipmentType,
      lastUpdated: tDgIrData.lastUpdated,
    );

    return tDgIrTestModel;
  }

  @override
  Future<List<DgIrTestModel>> getDgIrByTrNo(int trNo) async {
    final tDgIrData = await sl<AppDatabase>().getDgIrLocalDataWithTrNo(trNo);
    List<DgIrTestModel> tDgIrTestModel =
        List<DgIrTestModel>.empty(growable: true);

    for (var element in tDgIrData) {
      tDgIrTestModel.add(DgIrTestModel(
        id: element.id,
        databaseID: element.databaseID,
        re_mResistance: element.re_mResistance,
        ye_mResistance: element.ye_mResistance,
        be_mResistance: element.be_mResistance,
        trNo: element.trNo,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tDgIrTestModel;
  }

  @override
  Future<List<DgIrTestModel>> getDgIrEquipmentList() async {
    final tDgIrData = await sl<AppDatabase>().getDgIrEquipmentList();
    List<DgIrTestModel> tDgIrTestModel =
        List<DgIrTestModel>.empty(growable: true);
    for (var element in tDgIrData) {
      tDgIrTestModel.add(DgIrTestModel(
        id: element.id,
        re_mResistance: element.re_mResistance,
        ye_mResistance: element.ye_mResistance,
        be_mResistance: element.be_mResistance,
        EquipmentType: element.EquipmentType,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        trNo: element.trNo,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tDgIrTestModel;
  }

  @override
  Future<List<DgIrTestModel>> getDgIrBySerialNo(String serialNo) async {
    final tDgIrData =
        await sl<AppDatabase>().getDgIrLocalDataWithSerialNo(serialNo);
    List<DgIrTestModel> tDgIrTestModel =
        List<DgIrTestModel>.empty(growable: true);
    for (var element in tDgIrData) {
      tDgIrTestModel.add(DgIrTestModel(
        id: element.id,
        re_mResistance: element.re_mResistance,
        ye_mResistance: element.ye_mResistance,
        be_mResistance: element.be_mResistance,
        trNo: element.trNo,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tDgIrTestModel;
  }

  @override
  Future<int> localDgIr(DgIrTestModel dgIrTestModel) {
    return (sl<AppDatabase>().createDgIr(dgIrTestModel));
  }

  @override
  Future<void> updateDgIr(DgIrTestModel dgIrToUpdate, int id) async {
    sl<AppDatabase>().updateDgIr(dgIrToUpdate, id);
  }

  @override
  Future<int> deleteDgIrById(int id) {
    return (sl<AppDatabase>().deleteDgIrById(id));
  }
}

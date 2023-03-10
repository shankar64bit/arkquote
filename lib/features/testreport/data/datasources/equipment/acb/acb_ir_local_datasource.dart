import 'dart:math';

import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/acb/acb_ir_test_model.dart';
import '../../test_report_local_datasource.dart';

abstract class AcbIrLocalDatasource {
  Future<List<AcbIrTestModel>> getAcbIrByTrNo(int trNo);
  Future<AcbIrTestModel> getAcbIrById(int id);
  Future<void> localAcbIr(AcbIrTestModel acbIrModel);
  Future<void> updateAcbIr(AcbIrTestModel acbIrToUpdate, int id);
  Future<int> deleteAcbIrById(int id);
  Future<List<AcbIrTestModel>> getAcbIrBySerialNo(String serialNo);
  Future<List<AcbIrTestModel>> getAcbIrEquipmentLists();
  // Future<List<AcbIrTestModel>> getTestedById(int id);
}

@DataClassName('AcbIrLocalData')
class AcbIrLocalDatasourceImpl extends Table implements AcbIrLocalDatasource {
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
  RealColumn get ry => real()();
  @required
  RealColumn get yb => real()();
  @required
  RealColumn get br => real()();
  @required
  RealColumn get rn => real()();
  @required
  RealColumn get yn => real()();
  @required
  RealColumn get bn => real()();
  @required
  RealColumn get re => real()();
  @required
  RealColumn get ye => real()();
  @required
  RealColumn get be => real()();
  @required
  RealColumn get ne => real()();
  @required
  RealColumn get rR => real()();
  @required
  RealColumn get yY => real()();
  @required
  RealColumn get bB => real()();
  @required
  RealColumn get nN => real()();
  @required
  RealColumn get cb => real()();
  @required
  RealColumn get cr => real()();
  @required
  RealColumn get cy => real()();

  @override
  Future<AcbIrTestModel> getAcbIrById(int id) async {
    AcbIrLocalData tAcbIrData =
        await sl<AppDatabase>().getAcbIrLocalDataWithId(id);

    AcbIrTestModel tAcbIrTestModel = AcbIrTestModel(
      databaseID: tAcbIrData.databaseID,
      id: tAcbIrData.id,
      ry: tAcbIrData.ry,
      yb: tAcbIrData.yb,
      br: tAcbIrData.br,
      rn: tAcbIrData.rn,
      yn: tAcbIrData.yn,
      bn: tAcbIrData.bn,
      re: tAcbIrData.re,
      ye: tAcbIrData.ye,
      be: tAcbIrData.be,
      ne: tAcbIrData.ne,
      rR: tAcbIrData.rR,
      yY: tAcbIrData.yY,
      bB: tAcbIrData.bB,
      nN: tAcbIrData.nN,
      cb: tAcbIrData.cb,
      cr: tAcbIrData.cr,
      cy: tAcbIrData.cy,
      trNo: tAcbIrData.trNo,
      serialNo: tAcbIrData.serialNo,
      EquipmentType: tAcbIrData.EquipmentType,
      lastUpdated: tAcbIrData.lastUpdated,
    );

    return tAcbIrTestModel;
  }

  @override
  Future<List<AcbIrTestModel>> getAcbIrByTrNo(int trNo) async {
    final tAcbIrData = await sl<AppDatabase>().getAcbIrLocalDataWithTrNo(trNo);
    List<AcbIrTestModel> tAcbIrTestModel =
        List<AcbIrTestModel>.empty(growable: true);

    for (var element in tAcbIrData) {
      tAcbIrTestModel.add(AcbIrTestModel(
        id: element.id,
        databaseID: element.databaseID,
        ry: element.ry,
        yb: element.yb,
        br: element.br,
        rn: element.rn,
        yn: element.yn,
        bn: element.bn,
        re: element.re,
        ye: element.ye,
        be: element.be,
        ne: element.ne,
        rR: element.rR,
        yY: element.yY,
        bB: element.bB,
        nN: element.nN,
        cb: element.cb,
        cr: element.cr,
        cy: element.cy,
        trNo: element.trNo,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tAcbIrTestModel;
  }

  @override
  Future<List<AcbIrTestModel>> getAcbIrEquipmentLists() async {
    final tAcbIrData = await sl<AppDatabase>().getAcbIrEquipmentListwithAll();
    List<AcbIrTestModel> tAcbIrTestModel =
        List<AcbIrTestModel>.empty(growable: true);
    for (var element in tAcbIrData) {
      tAcbIrTestModel.add(AcbIrTestModel(
        bB: element.bB,
        be: element.be,
        bn: element.bn,
        br: element.br,
        id: element.id,
        nN: element.nN,
        ne: element.ne,
        rR: element.rR,
        re: element.re,
        rn: element.rn,
        ry: element.ry,
        yY: element.yY,
        yb: element.yb,
        ye: element.ye,
        yn: element.yn,
        cb: element.cb,
        cr: element.cr,
        cy: element.cy,
        EquipmentType: element.EquipmentType,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        trNo: element.trNo,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tAcbIrTestModel;
  }

  @override
  Future<List<AcbIrTestModel>> getAcbIrBySerialNo(String serialNo) async {
    final tAcbIrData =
        await sl<AppDatabase>().getAcbIrLocalDataWithSerialNo(serialNo);
    List<AcbIrTestModel> tAcbIrTestModel =
        List<AcbIrTestModel>.empty(growable: true);
    for (var element in tAcbIrData) {
      tAcbIrTestModel.add(AcbIrTestModel(
        id: element.id,
        ry: element.ry,
        yb: element.yb,
        br: element.br,
        rn: element.rn,
        yn: element.yn,
        bn: element.bn,
        re: element.re,
        ye: element.ye,
        be: element.be,
        ne: element.ne,
        rR: element.rR,
        yY: element.yY,
        bB: element.bB,
        nN: element.nN,
        cb: element.cb,
        cr: element.cr,
        cy: element.cy,
        trNo: element.trNo,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tAcbIrTestModel;
  }

  @override
  Future<int> localAcbIr(AcbIrTestModel acbIrModel) {
    return (sl<AppDatabase>().createAcbIr(acbIrModel));
  }

  @override
  Future<void> updateAcbIr(AcbIrTestModel acbIrToUpdate, int id) async {
    sl<AppDatabase>().updateAcbIr(acbIrToUpdate, id);
  }

  @override
  Future<int> deleteAcbIrById(int id) {
    return (sl<AppDatabase>().deleteAcbIrById(id));
  }
}

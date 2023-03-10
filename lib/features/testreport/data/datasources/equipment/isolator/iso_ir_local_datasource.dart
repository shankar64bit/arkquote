import 'dart:math';

import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/isolator/iso_ir_test_model.dart';
import '../../test_report_local_datasource.dart';

abstract class IsoIrLocalDatasource {
  Future<List<IsoIrTestModel>> getIsoIrByTrNo(int trNo);
  Future<IsoIrTestModel> getIsoIrById(int id);
  Future<void> localIsoIr(IsoIrTestModel isoirtolocal);
  Future<void> updateIsoIr(IsoIrTestModel isoirtoupdate, int id);
  Future<int> deleteIsoIrById(int id);
  Future<List<IsoIrTestModel>> getIsoIrBySerialNo(String serialNo);
  Future<List<IsoIrTestModel>> getIsoIrEquipmentList();
  // Future<List<IsoIrTestModel>> getTestedById(int id);
}

@DataClassName('IsoIrLocalData')
class IsoIrLocalDatasourceImpl extends Table implements IsoIrLocalDatasource {
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
  RealColumn get rr => real()();
  @required
  RealColumn get yy => real()();
  @required
  RealColumn get bb => real()();
  @required
  RealColumn get re => real()();
  @required
  RealColumn get ye => real()();
  @required
  RealColumn get be => real()();
  @required
  RealColumn get ry => real()();
  @required
  RealColumn get yb => real()();
  @required
  RealColumn get br => real()();

  @override
  Future<IsoIrTestModel> getIsoIrById(int id) async {
    IsoIrLocalData tIsoIrData =
        await sl<AppDatabase>().getIsoIrLocalDataWithId(id);

    IsoIrTestModel tIsoIrTestModel = IsoIrTestModel(
      databaseID: tIsoIrData.databaseID,
      id: tIsoIrData.id,
      ry: tIsoIrData.ry,
      yb: tIsoIrData.yb,
      br: tIsoIrData.br,
      re: tIsoIrData.re,
      ye: tIsoIrData.ye,
      be: tIsoIrData.be,
      rr: tIsoIrData.rr,
      yy: tIsoIrData.yy,
      bb: tIsoIrData.bb,
      trNo: tIsoIrData.trNo,
      serialNo: tIsoIrData.serialNo,
      EquipmentType: tIsoIrData.EquipmentType,
      lastUpdated: tIsoIrData.lastUpdated,
    );

    return tIsoIrTestModel;
  }

  @override
  Future<List<IsoIrTestModel>> getIsoIrByTrNo(int trNo) async {
    final tIsoIrData = await sl<AppDatabase>().getIsoIrLocalDataWithTrNo(trNo);
    List<IsoIrTestModel> tIsoIrTestModel =
        List<IsoIrTestModel>.empty(growable: true);

    for (var element in tIsoIrData) {
      tIsoIrTestModel.add(IsoIrTestModel(
        id: element.id,
        databaseID: element.databaseID,
        ry: element.ry,
        yb: element.yb,
        br: element.br,
        re: element.re,
        ye: element.ye,
        be: element.be,
        rr: element.rr,
        yy: element.yy,
        bb: element.bb,
        trNo: element.trNo,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tIsoIrTestModel;
  }

  @override
  Future<List<IsoIrTestModel>> getIsoIrEquipmentList() async {
    final tIsoIrData = await sl<AppDatabase>().getIsoIrEquipmentList();
    List<IsoIrTestModel> tIsoIrTestModel =
        List<IsoIrTestModel>.empty(growable: true);
    for (var element in tIsoIrData) {
      tIsoIrTestModel.add(IsoIrTestModel(
        id: element.id,
        re: element.re,
        be: element.be,
        ye: element.ye,
        ry: element.ry,
        yb: element.yb,
        br: element.br,
        yy: element.yy,
        rr: element.rr,
        bb: element.bb,
        EquipmentType: element.EquipmentType,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        trNo: element.trNo,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tIsoIrTestModel;
  }

  @override
  Future<List<IsoIrTestModel>> getIsoIrBySerialNo(String serialNo) async {
    final tIsoIrData =
        await sl<AppDatabase>().getIsoIrLocalDataWithSerialNo(serialNo);
    List<IsoIrTestModel> tIsoIrTestModel =
        List<IsoIrTestModel>.empty(growable: true);
    for (var element in tIsoIrData) {
      tIsoIrTestModel.add(IsoIrTestModel(
        id: element.id,
        re: element.re,
        be: element.be,
        ye: element.ye,
        ry: element.ry,
        yb: element.yb,
        br: element.br,
        yy: element.yy,
        rr: element.rr,
        bb: element.bb,
        trNo: element.trNo,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tIsoIrTestModel;
  }

  @override
  Future<int> localIsoIr(IsoIrTestModel isoirtolocal) {
    return (sl<AppDatabase>().createIsoIr(isoirtolocal));
  }

  @override
  Future<void> updateIsoIr(IsoIrTestModel isoirtoupdate, int id) async {
    sl<AppDatabase>().updateIsoIr(isoirtoupdate, id);
  }

  @override
  Future<int> deleteIsoIrById(int id) {
    return (sl<AppDatabase>().deleteIsoIrById(id));
  }
}

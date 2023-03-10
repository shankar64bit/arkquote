import 'dart:math';
import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/busbar/bb_ir_test_model.dart';
import '../../test_report_local_datasource.dart';

abstract class BbIrLocalDatasource {
  Future<List<BbIrTestModel>> getBbIrByTrNo(int trNo);
  Future<BbIrTestModel> getBbIrById(int id);
  Future<void> localBbIr(BbIrTestModel bbirtolocal);
  Future<void> updateBbIr(BbIrTestModel bbirtoupdate, int id);
  Future<int> deleteBbIrById(int id);
  Future<List<BbIrTestModel>> getBbIrByBbRefId(int bbRefId);
  Future<List<BbIrTestModel>> getBbIrEquipmentList();
  // Future<List<BbIrTestModel>> getTestedById(int id);
}

@DataClassName('BbIrLocalData')
class BbIrLocalDatasourceImpl extends Table implements BbIrLocalDatasource {
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
  IntColumn get bbRefId => integer()();

  @required
  RealColumn get rA => real()();
  @required
  RealColumn get yA => real()();
  @required
  RealColumn get bA => real()();
  @required
  RealColumn get rB => real()();
  @required
  RealColumn get yB => real()();
  @required
  RealColumn get bB => real()();
  @required
  RealColumn get nA => real()();
  @required
  RealColumn get nB => real()();
  @required
  RealColumn get ryA => real()();
  @required
  RealColumn get ybA => real()();
  @required
  RealColumn get brA => real()();
  @required
  RealColumn get ryB => real()();
  @required
  RealColumn get ybB => real()();
  @required
  RealColumn get brB => real()();
  @required
  RealColumn get rnA => real()();
  @required
  RealColumn get rnB => real()();
  @required
  RealColumn get ynA => real()();
  @required
  RealColumn get ynB => real()();
  @required
  RealColumn get bnA => real()();
  @required
  RealColumn get bnB => real()();
  @override
  Future<BbIrTestModel> getBbIrById(int id) async {
    BbIrLocalData tBbIrData =
        await sl<AppDatabase>().getBbIrLocalDataWithId(id);

    BbIrTestModel tBbIrTestModel = BbIrTestModel(
      databaseID: tBbIrData.databaseID,
      id: tBbIrData.id,
      rA: tBbIrData.rA,
      rB: tBbIrData.rB,
      yA: tBbIrData.yA,
      yB: tBbIrData.yB,
      bA: tBbIrData.bA,
      bB: tBbIrData.bB,
      nA: tBbIrData.nA,
      nB: tBbIrData.nB,
      ryA: tBbIrData.ryA,
      ryB: tBbIrData.ryB,
      ybA: tBbIrData.ybA,
      ybB: tBbIrData.ybB,
      brA: tBbIrData.brA,
      brB: tBbIrData.brB,
      rnA: tBbIrData.rnA,
      rnB: tBbIrData.rnB,
      ynA: tBbIrData.ynA,
      ynB: tBbIrData.ynB,
      bnA: tBbIrData.bnA,
      bnB: tBbIrData.bnB,
      trNo: tBbIrData.trNo,
      bbRefId: tBbIrData.bbRefId,
      EquipmentType: tBbIrData.EquipmentType,
      lastUpdated: tBbIrData.lastUpdated,
    );

    return tBbIrTestModel;
  }

  @override
  Future<List<BbIrTestModel>> getBbIrByTrNo(int trNo) async {
    final tBbIrData = await sl<AppDatabase>().getBbIrLocalDataWithTrNo(trNo);
    List<BbIrTestModel> tBbIrTestModel =
        List<BbIrTestModel>.empty(growable: true);

    for (var element in tBbIrData) {
      tBbIrTestModel.add(BbIrTestModel(
        id: element.id,
        databaseID: element.databaseID,
        rA: element.rA,
        rB: element.rB,
        yA: element.yA,
        yB: element.yB,
        bA: element.bA,
        bB: element.bB,
        nA: element.nA,
        nB: element.nB,
        ryA: element.ryA,
        ryB: element.ryB,
        ybA: element.ybA,
        ybB: element.ybB,
        brA: element.brA,
        brB: element.brB,
        rnA: element.rnA,
        rnB: element.rnB,
        ynA: element.ynA,
        ynB: element.ynB,
        bnA: element.bnA,
        bnB: element.bnB,
        trNo: element.trNo,
        bbRefId: element.bbRefId,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tBbIrTestModel;
  }

  @override
  Future<List<BbIrTestModel>> getBbIrEquipmentList() async {
    final tBbIrData = await sl<AppDatabase>().getBbIrEquipmentList();
    List<BbIrTestModel> tBbIrTestModel =
        List<BbIrTestModel>.empty(growable: true);
    for (var element in tBbIrData) {
      tBbIrTestModel.add(BbIrTestModel(
        id: element.id,
        rA: element.rA,
        rB: element.rB,
        yA: element.yA,
        yB: element.yB,
        bA: element.bA,
        bB: element.bB,
        nA: element.nA,
        nB: element.nB,
        ryA: element.ryA,
        ryB: element.ryB,
        ybA: element.ybA,
        ybB: element.ybB,
        brA: element.brA,
        brB: element.brB,
        rnA: element.rnA,
        rnB: element.rnB,
        ynA: element.ynA,
        ynB: element.ynB,
        bnA: element.bnA,
        bnB: element.bnB,
        EquipmentType: element.EquipmentType,
        databaseID: element.databaseID,
        bbRefId: element.bbRefId,
        trNo: element.trNo,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tBbIrTestModel;
  }

  @override
  Future<List<BbIrTestModel>> getBbIrByBbRefId(int bbRefId) async {
    final tBbIrData =
        await sl<AppDatabase>().getBbIrLocalDataWithBbRefId(bbRefId);
    List<BbIrTestModel> tBbIrTestModel =
        List<BbIrTestModel>.empty(growable: true);
    for (var element in tBbIrData) {
      tBbIrTestModel.add(BbIrTestModel(
        id: element.id,
        rA: element.rA,
        rB: element.rB,
        yA: element.yA,
        yB: element.yB,
        bA: element.bA,
        bB: element.bB,
        nA: element.nA,
        nB: element.nB,
        ryA: element.ryA,
        ryB: element.ryB,
        ybA: element.ybA,
        ybB: element.ybB,
        brA: element.brA,
        brB: element.brB,
        rnA: element.rnA,
        rnB: element.rnB,
        ynA: element.ynA,
        ynB: element.ynB,
        bnA: element.bnA,
        bnB: element.bnB,
        trNo: element.trNo,
        databaseID: element.databaseID,
        bbRefId: element.bbRefId,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tBbIrTestModel;
  }

  @override
  Future<int> localBbIr(BbIrTestModel bbirtolocal) {
    return (sl<AppDatabase>().createBbIr(bbirtolocal));
  }

  @override
  Future<void> updateBbIr(BbIrTestModel bbirtoupdate, int id) async {
    sl<AppDatabase>().updateBbIr(bbirtoupdate, id);
  }

  @override
  Future<int> deleteBbIrById(int id) {
    return (sl<AppDatabase>().deleteBbIrById(id));
  }
}

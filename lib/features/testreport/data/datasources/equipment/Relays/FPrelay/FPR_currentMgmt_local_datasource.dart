// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../../../../injection_container.dart';
import '../../../../models/equipment/Relays/FPrelay/FPR_currentMgmt_model.dart';
import '../../../test_report_local_datasource.dart';

abstract class FPRcurrentMgmtLocalDatasource {
  Future<FPRcurrentMgmtModel> getFPRcurrentMgmtById(int id);
  Future<int> localFPRcurrentMgmt(FPRcurrentMgmtModel fprcurrentMgmttoLocal);
  Future<void> updateFPRcurrentMgmt(
      FPRcurrentMgmtModel fprcurrentMgmtUpdate, int id);
  Future<int> deleteFPRcurrentMgmtById(int id);
  Future<List<FPRcurrentMgmtModel>> getFPRcurrentMgmtTrNoID(int trNo);
  Future<List<FPRcurrentMgmtModel>> getFPRcurrentMgmtSerialNo(String sNo);
  Future<List<FPRcurrentMgmtModel>> getFPRcurrentmgmtEquipmentLists();
}

@DataClassName('FPRcurrentMgmtLocalData')
class FPRcurrentMgmtLocalDatasourceImpl extends Table
    implements FPRcurrentMgmtLocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  RealColumn get rn_measurePrimCurrent => real()();
  @required
  RealColumn get yn_measurePrimCurrent => real()();
  @required
  RealColumn get bn_measurePrimCurrent => real()();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<FPRcurrentMgmtModel> getFPRcurrentMgmtById(int id) async {
    FPRcurrentMgmtLocalData tFPRcurrentMgmtData =
        await sl<AppDatabase>().getFPRcurrentMgmtLocalDataWithId(id);
    FPRcurrentMgmtModel tFPRcurrentMgmtModel = FPRcurrentMgmtModel(
      id: tFPRcurrentMgmtData.id,
      databaseID: tFPRcurrentMgmtData.databaseID,
      trNo: tFPRcurrentMgmtData.trNo,
      serialNo: tFPRcurrentMgmtData.serialNo,
      rn_measurePrimCurrent: tFPRcurrentMgmtData.rn_measurePrimCurrent,
      yn_measurePrimCurrent: tFPRcurrentMgmtData.yn_measurePrimCurrent,
      bn_measurePrimCurrent: tFPRcurrentMgmtData.bn_measurePrimCurrent,
      equipmentUsed: tFPRcurrentMgmtData.equipmentUsed,
      updateDate: tFPRcurrentMgmtData.updateDate,
    );
    return tFPRcurrentMgmtModel;
  }

  @override
  Future<int> localFPRcurrentMgmt(FPRcurrentMgmtModel fprcurrentMgmttoLocal) {
    return (sl<AppDatabase>().createFPRcurrentMgmt(fprcurrentMgmttoLocal));
  }

  @override
  Future<void> updateFPRcurrentMgmt(
      FPRcurrentMgmtModel fprcurrentMgmtUpdate, int id) async {
    sl<AppDatabase>().updateFPRcurrentMgmt(fprcurrentMgmtUpdate, id);
  }

  @override
  Future<int> deleteFPRcurrentMgmtById(int id) {
    return (sl<AppDatabase>().deleteFPRcurrentMgmtById(id));
  }

  @override
  Future<List<FPRcurrentMgmtModel>> getFPRcurrentMgmtTrNoID(int trNo) async {
    final tfprcurrentMgmt_data =
        await sl<AppDatabase>().getFPRcurrentMgmtLocalDataWithtrNoID(trNo);

    List<FPRcurrentMgmtModel> tFPRcurrentMgmt_Model =
        List<FPRcurrentMgmtModel>.empty(growable: true);
    for (var listEle in tfprcurrentMgmt_data) {
      tFPRcurrentMgmt_Model.add(FPRcurrentMgmtModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        rn_measurePrimCurrent: listEle.rn_measurePrimCurrent,
        yn_measurePrimCurrent: listEle.yn_measurePrimCurrent,
        bn_measurePrimCurrent: listEle.bn_measurePrimCurrent,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tFPRcurrentMgmt_Model;
  }

  @override
  Future<List<FPRcurrentMgmtModel>> getFPRcurrentMgmtSerialNo(
      String sNo) async {
    final tFPRcurrentMgmt_data =
        await sl<AppDatabase>().getFPRcurrentMgmtLocalDataWithSerialNo(sNo);

    List<FPRcurrentMgmtModel> tFPRcurrentMgmt_Model =
        List<FPRcurrentMgmtModel>.empty(growable: true);
    for (var listEle in tFPRcurrentMgmt_data) {
      tFPRcurrentMgmt_Model.add(FPRcurrentMgmtModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        rn_measurePrimCurrent: listEle.rn_measurePrimCurrent,
        yn_measurePrimCurrent: listEle.yn_measurePrimCurrent,
        bn_measurePrimCurrent: listEle.bn_measurePrimCurrent,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tFPRcurrentMgmt_Model;
  }

  @override
  Future<List<FPRcurrentMgmtModel>> getFPRcurrentmgmtEquipmentLists() async {
    final tFPRcurrmgmtData =
        await sl<AppDatabase>().getFPRcurrentmgmtEquipmentListwithAll();
    List<FPRcurrentMgmtModel> tFPRcurrmgmtTestModel =
        List<FPRcurrentMgmtModel>.empty(growable: true);
    for (var listEle in tFPRcurrmgmtData) {
      tFPRcurrmgmtTestModel.add(FPRcurrentMgmtModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        rn_measurePrimCurrent: listEle.rn_measurePrimCurrent,
        yn_measurePrimCurrent: listEle.yn_measurePrimCurrent,
        bn_measurePrimCurrent: listEle.bn_measurePrimCurrent,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tFPRcurrmgmtTestModel;
  }
}

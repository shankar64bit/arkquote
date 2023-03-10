// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';

import '../../../../models/equipment/Relays/FPrelay/FPR_voltageMgmt_model.dart';
import '../../../test_report_local_datasource.dart';
import '../../../../../../../injection_container.dart';
// import '../../../../models/equipment/Relays/FPrelay/FPR_currentMgmt_model.dart';
// import '../../../test_report_local_datasource.dart';

abstract class FPRvoltageMgmtLocalDatasource {
  Future<FPRvoltageMgmtModel> getFPRvoltageMgmtById(int id);
  Future<int> localFPRvoltageMgmt(FPRvoltageMgmtModel fprvoltageMgmttoLocal);
  Future<void> updateFPRvoltageMgmt(
      FPRvoltageMgmtModel fprvoltageMgmtUpdate, int id);
  Future<int> deleteFPRvoltageMgmtById(int id);
  Future<List<FPRvoltageMgmtModel>> getFPRvoltageMgmtTrNoID(int trNo);
  Future<List<FPRvoltageMgmtModel>> getFPRvoltageMgmtSerialNo(String sNo);
  Future<List<FPRvoltageMgmtModel>> getFPRvoltEquipmentLists();
}

@DataClassName('FPRvoltageMgmtLocalData')
class FPRvoltageMgmtLocalDatasourceImpl extends Table
    implements FPRvoltageMgmtLocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  RealColumn get rn_applSecVoltage => real()();
  @required
  RealColumn get rn_measurePrimVoltage => real()();
  @required
  RealColumn get yn_applSecVoltage => real()();
  @required
  RealColumn get yn_measurePrimVoltage => real()();
  @required
  RealColumn get bn_applSecVoltage => real()();
  @required
  RealColumn get bn_measurePrimVoltage => real()();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<FPRvoltageMgmtModel> getFPRvoltageMgmtById(int id) async {
    FPRvoltageMgmtLocalData tFPRvoltageMgmtData =
        await sl<AppDatabase>().getFPRvoltageMgmtLocalDataWithId(id);
    FPRvoltageMgmtModel tFPRvoltageMgmtModel = FPRvoltageMgmtModel(
      id: tFPRvoltageMgmtData.id,
      databaseID: tFPRvoltageMgmtData.databaseID,
      trNo: tFPRvoltageMgmtData.trNo,
      serialNo: tFPRvoltageMgmtData.serialNo,
      rn_applSecVoltage: tFPRvoltageMgmtData.rn_applSecVoltage,
      rn_measurePrimVoltage: tFPRvoltageMgmtData.rn_measurePrimVoltage,
      yn_applSecVoltage: tFPRvoltageMgmtData.yn_applSecVoltage,
      yn_measurePrimVoltage: tFPRvoltageMgmtData.yn_measurePrimVoltage,
      bn_applSecVoltage: tFPRvoltageMgmtData.bn_applSecVoltage,
      bn_measurePrimVoltage: tFPRvoltageMgmtData.bn_measurePrimVoltage,
      equipmentUsed: tFPRvoltageMgmtData.equipmentUsed,
      updateDate: tFPRvoltageMgmtData.updateDate,
    );
    return tFPRvoltageMgmtModel;
  }

  @override
  Future<int> localFPRvoltageMgmt(FPRvoltageMgmtModel fprvoltageMgmttoLocal) {
    return (sl<AppDatabase>().createFPRvoltageMgmt(fprvoltageMgmttoLocal));
  }

  @override
  Future<void> updateFPRvoltageMgmt(
      FPRvoltageMgmtModel fprvoltageMgmtUpdate, int id) async {
    sl<AppDatabase>().updateFPRvoltageMgmt(fprvoltageMgmtUpdate, id);
  }

  @override
  Future<int> deleteFPRvoltageMgmtById(int id) {
    return (sl<AppDatabase>().deleteFPRvoltageMgmtById(id));
  }

  @override
  Future<List<FPRvoltageMgmtModel>> getFPRvoltageMgmtTrNoID(int trNo) async {
    final tfprcurrentMgmt_data =
        await sl<AppDatabase>().getFPRvoltageMgmtLocalDataWithtrNoID(trNo);

    List<FPRvoltageMgmtModel> tFPRvoltageMgmt_Model =
        List<FPRvoltageMgmtModel>.empty(growable: true);
    for (var listEle in tfprcurrentMgmt_data) {
      tFPRvoltageMgmt_Model.add(FPRvoltageMgmtModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        rn_applSecVoltage: listEle.rn_applSecVoltage,
        rn_measurePrimVoltage: listEle.rn_measurePrimVoltage,
        yn_applSecVoltage: listEle.yn_applSecVoltage,
        yn_measurePrimVoltage: listEle.yn_measurePrimVoltage,
        bn_applSecVoltage: listEle.bn_applSecVoltage,
        bn_measurePrimVoltage: listEle.bn_measurePrimVoltage,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tFPRvoltageMgmt_Model;
  }

  @override
  Future<List<FPRvoltageMgmtModel>> getFPRvoltageMgmtSerialNo(
      String sNo) async {
    final tFPRvoltageMgmt_data =
        await sl<AppDatabase>().getFPRvoltageMgmtLocalDataWithSerialNo(sNo);

    List<FPRvoltageMgmtModel> tFPRvoltageMgmt_Model =
        List<FPRvoltageMgmtModel>.empty(growable: true);
    for (var listEle in tFPRvoltageMgmt_data) {
      tFPRvoltageMgmt_Model.add(FPRvoltageMgmtModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        rn_applSecVoltage: listEle.rn_applSecVoltage,
        rn_measurePrimVoltage: listEle.rn_measurePrimVoltage,
        yn_applSecVoltage: listEle.yn_applSecVoltage,
        yn_measurePrimVoltage: listEle.yn_measurePrimVoltage,
        bn_applSecVoltage: listEle.bn_applSecVoltage,
        bn_measurePrimVoltage: listEle.bn_measurePrimVoltage,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tFPRvoltageMgmt_Model;
  }

  @override
  Future<List<FPRvoltageMgmtModel>> getFPRvoltEquipmentLists() async {
    final tfprvoltmgmtData =
        await sl<AppDatabase>().getFPRvoltmgmtEquipmentListwithAll();
    List<FPRvoltageMgmtModel> tfprvoltmgmtTestModel =
        List<FPRvoltageMgmtModel>.empty(growable: true);
    for (var listEle in tfprvoltmgmtData) {
      tfprvoltmgmtTestModel.add(FPRvoltageMgmtModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        rn_applSecVoltage: listEle.rn_applSecVoltage,
        rn_measurePrimVoltage: listEle.rn_measurePrimVoltage,
        yn_applSecVoltage: listEle.yn_applSecVoltage,
        yn_measurePrimVoltage: listEle.yn_measurePrimVoltage,
        bn_applSecVoltage: listEle.bn_applSecVoltage,
        bn_measurePrimVoltage: listEle.bn_measurePrimVoltage,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tfprvoltmgmtTestModel;
  }
}

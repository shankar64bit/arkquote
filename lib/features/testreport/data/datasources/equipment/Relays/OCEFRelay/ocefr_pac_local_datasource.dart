// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../../../../injection_container.dart';
import '../../../../models/equipment/Relays/OCEFRelay/ocefr_pac_model.dart';
import '../../../test_report_local_datasource.dart';

abstract class OcEfrPacLocalDatasource {
  Future<OcEfrPacModel> getOcEfrPacById(int id);
  Future<int> localOcEfrPac(OcEfrPacModel ocefrPactoLocal);
  Future<void> updateOcEfrPac(OcEfrPacModel ocefrPacToUpdate, int id);
  Future<int> deleteOcEfrPacById(int id);
  Future<List<OcEfrPacModel>> getOcEfrPacTrNoID(int trNo);
  Future<List<OcEfrPacModel>> getOcEfrPacSerialNo(String sNo);
  Future<List<OcEfrPacModel>> getOcEfrPacEquipmentLists();
}

@DataClassName('OcEfrPacLocalData')
class OcEfrPacLocalDatasourceImpl extends Table
    implements OcEfrPacLocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  RealColumn get r_plugSetting => real()();
  @required
  RealColumn get r_TMS => real()();
  @required
  RealColumn get r_plugSetting_Hi => real()();
  @required
  RealColumn get r_time => real()();
  @required
  RealColumn get y_plugSetting => real()();
  @required
  RealColumn get y_TMS => real()();
  @required
  RealColumn get y_plugSetting_Hi => real()();
  @required
  RealColumn get y_time => real()();
  @required
  RealColumn get b_plugSetting => real()();
  @required
  RealColumn get b_TMS => real()();
  @required
  RealColumn get b_plugSetting_Hi => real()();
  @required
  RealColumn get b_time => real()();
  @required
  RealColumn get plugSettingMul_2x => real()();
  @required
  RealColumn get plugSettingMul_5x => real()();
  @required
  RealColumn get r_coilResistanace => real()();
  @required
  RealColumn get y_coilResistanace => real()();
  @required
  RealColumn get b_coilResistanace => real()();
  @required
  RealColumn get r_pickupCurrent => real()();
  @required
  RealColumn get y_pickupCurrent => real()();
  @required
  RealColumn get b_pickupCurrent => real()();
  @required
  RealColumn get r_relayOprTime_2x => real()();
  @required
  RealColumn get r_relayOprTime_5x => real()();
  @required
  RealColumn get r_relayOprTime_Hi => real()();
  @required
  RealColumn get y_relayOprTime_2x => real()();
  @required
  RealColumn get y_relayOprTime_5x => real()();
  @required
  RealColumn get y_relayOprTime_Hi => real()();
  @required
  RealColumn get b_relayOprTime_2x => real()();
  @required
  RealColumn get b_relayOprTime_5x => real()();
  @required
  RealColumn get b_relayOprTime_Hi => real()();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<OcEfrPacModel> getOcEfrPacById(int id) async {
    OcEfrPacLocalData tOcEfrPacData =
        await sl<AppDatabase>().getOcEfrPacLocalDataWithId(id);
    OcEfrPacModel tOcEfrPacModel = OcEfrPacModel(
      id: tOcEfrPacData.id,
      databaseID: tOcEfrPacData.databaseID,
      trNo: tOcEfrPacData.trNo,
      serialNo: tOcEfrPacData.serialNo,
      r_plugSetting: tOcEfrPacData.r_plugSetting,
      r_TMS: tOcEfrPacData.r_TMS,
      r_plugSetting_Hi: tOcEfrPacData.r_plugSetting_Hi,
      r_time: tOcEfrPacData.r_time,
      y_plugSetting: tOcEfrPacData.y_plugSetting,
      y_TMS: tOcEfrPacData.y_TMS,
      y_plugSetting_Hi: tOcEfrPacData.y_plugSetting_Hi,
      y_time: tOcEfrPacData.y_time,
      b_plugSetting: tOcEfrPacData.b_plugSetting,
      b_TMS: tOcEfrPacData.b_TMS,
      b_plugSetting_Hi: tOcEfrPacData.b_plugSetting_Hi,
      b_time: tOcEfrPacData.b_time,
      plugSettingMul_2x: tOcEfrPacData.plugSettingMul_2x,
      plugSettingMul_5x: tOcEfrPacData.plugSettingMul_5x,
      r_coilResistanace: tOcEfrPacData.r_coilResistanace,
      y_coilResistanace: tOcEfrPacData.y_coilResistanace,
      b_coilResistanace: tOcEfrPacData.b_coilResistanace,
      r_pickupCurrent: tOcEfrPacData.r_pickupCurrent,
      y_pickupCurrent: tOcEfrPacData.y_pickupCurrent,
      b_pickupCurrent: tOcEfrPacData.b_pickupCurrent,
      r_relayOprTime_2x: tOcEfrPacData.r_relayOprTime_2x,
      r_relayOprTime_5x: tOcEfrPacData.r_relayOprTime_5x,
      r_relayOprTime_Hi: tOcEfrPacData.r_relayOprTime_Hi,
      y_relayOprTime_2x: tOcEfrPacData.y_relayOprTime_2x,
      y_relayOprTime_5x: tOcEfrPacData.y_relayOprTime_5x,
      y_relayOprTime_Hi: tOcEfrPacData.y_relayOprTime_Hi,
      b_relayOprTime_2x: tOcEfrPacData.b_relayOprTime_2x,
      b_relayOprTime_5x: tOcEfrPacData.b_relayOprTime_5x,
      b_relayOprTime_Hi: tOcEfrPacData.b_relayOprTime_Hi,
      equipmentUsed: tOcEfrPacData.equipmentUsed,
      updateDate: tOcEfrPacData.updateDate,
    );
    return tOcEfrPacModel;
  }

  @override
  Future<int> localOcEfrPac(OcEfrPacModel ocefrPactoLocal) {
    return (sl<AppDatabase>().createOcEfrPac(ocefrPactoLocal));
  }

  @override
  Future<void> updateOcEfrPac(OcEfrPacModel ocefrPacToUpdate, int id) async {
    sl<AppDatabase>().updateOcEfrPac(ocefrPacToUpdate, id);
  }

  @override
  Future<int> deleteOcEfrPacById(int id) {
    return (sl<AppDatabase>().deleteOcEfrPacById(id));
  }

  @override
  Future<List<OcEfrPacModel>> getOcEfrPacTrNoID(int trNo) async {
    final tarpudo_data =
        await sl<AppDatabase>().getOcEfrPacLocalDataWithtrNoID(trNo);

    List<OcEfrPacModel> tFPRcurrentMgmt_Model =
        List<OcEfrPacModel>.empty(growable: true);
    for (var listEle in tarpudo_data) {
      tFPRcurrentMgmt_Model.add(OcEfrPacModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        r_plugSetting: listEle.r_plugSetting,
        r_TMS: listEle.r_TMS,
        r_plugSetting_Hi: listEle.r_plugSetting_Hi,
        r_time: listEle.r_time,
        y_plugSetting: listEle.y_plugSetting,
        y_TMS: listEle.y_TMS,
        y_plugSetting_Hi: listEle.y_plugSetting_Hi,
        y_time: listEle.y_time,
        b_plugSetting: listEle.b_plugSetting,
        b_TMS: listEle.b_TMS,
        b_plugSetting_Hi: listEle.b_plugSetting_Hi,
        b_time: listEle.b_time,
        plugSettingMul_2x: listEle.plugSettingMul_2x,
        plugSettingMul_5x: listEle.plugSettingMul_5x,
        r_coilResistanace: listEle.r_coilResistanace,
        y_coilResistanace: listEle.y_coilResistanace,
        b_coilResistanace: listEle.b_coilResistanace,
        r_pickupCurrent: listEle.r_pickupCurrent,
        y_pickupCurrent: listEle.y_pickupCurrent,
        b_pickupCurrent: listEle.b_pickupCurrent,
        r_relayOprTime_2x: listEle.r_relayOprTime_2x,
        r_relayOprTime_5x: listEle.r_relayOprTime_5x,
        r_relayOprTime_Hi: listEle.r_relayOprTime_Hi,
        y_relayOprTime_2x: listEle.y_relayOprTime_2x,
        y_relayOprTime_5x: listEle.y_relayOprTime_5x,
        y_relayOprTime_Hi: listEle.y_relayOprTime_Hi,
        b_relayOprTime_2x: listEle.b_relayOprTime_2x,
        b_relayOprTime_5x: listEle.b_relayOprTime_5x,
        b_relayOprTime_Hi: listEle.b_relayOprTime_Hi,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tFPRcurrentMgmt_Model;
  }

  @override
  Future<List<OcEfrPacModel>> getOcEfrPacSerialNo(String sNo) async {
    final tOcEfrPac_data =
        await sl<AppDatabase>().getOcEfrPacLocalDataWithSerialNo(sNo);

    List<OcEfrPacModel> tOcEfrPac_Model =
        List<OcEfrPacModel>.empty(growable: true);
    for (var listEle in tOcEfrPac_data) {
      tOcEfrPac_Model.add(OcEfrPacModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        r_plugSetting: listEle.r_plugSetting,
        r_TMS: listEle.r_TMS,
        r_plugSetting_Hi: listEle.r_plugSetting_Hi,
        r_time: listEle.r_time,
        y_plugSetting: listEle.y_plugSetting,
        y_TMS: listEle.y_TMS,
        y_plugSetting_Hi: listEle.y_plugSetting_Hi,
        y_time: listEle.y_time,
        b_plugSetting: listEle.b_plugSetting,
        b_TMS: listEle.b_TMS,
        b_plugSetting_Hi: listEle.b_plugSetting_Hi,
        b_time: listEle.b_time,
        plugSettingMul_2x: listEle.plugSettingMul_2x,
        plugSettingMul_5x: listEle.plugSettingMul_5x,
        r_coilResistanace: listEle.r_coilResistanace,
        y_coilResistanace: listEle.y_coilResistanace,
        b_coilResistanace: listEle.b_coilResistanace,
        r_pickupCurrent: listEle.r_pickupCurrent,
        y_pickupCurrent: listEle.y_pickupCurrent,
        b_pickupCurrent: listEle.b_pickupCurrent,
        r_relayOprTime_2x: listEle.r_relayOprTime_2x,
        r_relayOprTime_5x: listEle.r_relayOprTime_5x,
        r_relayOprTime_Hi: listEle.r_relayOprTime_Hi,
        y_relayOprTime_2x: listEle.y_relayOprTime_2x,
        y_relayOprTime_5x: listEle.y_relayOprTime_5x,
        y_relayOprTime_Hi: listEle.y_relayOprTime_Hi,
        b_relayOprTime_2x: listEle.b_relayOprTime_2x,
        b_relayOprTime_5x: listEle.b_relayOprTime_5x,
        b_relayOprTime_Hi: listEle.b_relayOprTime_Hi,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tOcEfrPac_Model;
  }

  //getOcEfrPacEquipmentLists

  @override
  Future<List<OcEfrPacModel>> getOcEfrPacEquipmentLists() async {
    final tOcEfrPacData =
        await sl<AppDatabase>().getOcEfrPacEquipmentListwithAll();
    List<OcEfrPacModel> tOcEfrPacTestModel =
        List<OcEfrPacModel>.empty(growable: true);
    for (var tOcEfrPacData in tOcEfrPacData) {
      tOcEfrPacTestModel.add(OcEfrPacModel(
        id: tOcEfrPacData.id,
        databaseID: tOcEfrPacData.databaseID,
        trNo: tOcEfrPacData.trNo,
        serialNo: tOcEfrPacData.serialNo,
        r_plugSetting: tOcEfrPacData.r_plugSetting,
        r_TMS: tOcEfrPacData.r_TMS,
        r_plugSetting_Hi: tOcEfrPacData.r_plugSetting_Hi,
        r_time: tOcEfrPacData.r_time,
        y_plugSetting: tOcEfrPacData.y_plugSetting,
        y_TMS: tOcEfrPacData.y_TMS,
        y_plugSetting_Hi: tOcEfrPacData.y_plugSetting_Hi,
        y_time: tOcEfrPacData.y_time,
        b_plugSetting: tOcEfrPacData.b_plugSetting,
        b_TMS: tOcEfrPacData.b_TMS,
        b_plugSetting_Hi: tOcEfrPacData.b_plugSetting_Hi,
        b_time: tOcEfrPacData.b_time,
        plugSettingMul_2x: tOcEfrPacData.plugSettingMul_2x,
        plugSettingMul_5x: tOcEfrPacData.plugSettingMul_5x,
        r_coilResistanace: tOcEfrPacData.r_coilResistanace,
        y_coilResistanace: tOcEfrPacData.y_coilResistanace,
        b_coilResistanace: tOcEfrPacData.b_coilResistanace,
        r_pickupCurrent: tOcEfrPacData.r_pickupCurrent,
        y_pickupCurrent: tOcEfrPacData.y_pickupCurrent,
        b_pickupCurrent: tOcEfrPacData.b_pickupCurrent,
        r_relayOprTime_2x: tOcEfrPacData.r_relayOprTime_2x,
        r_relayOprTime_5x: tOcEfrPacData.r_relayOprTime_5x,
        r_relayOprTime_Hi: tOcEfrPacData.r_relayOprTime_Hi,
        y_relayOprTime_2x: tOcEfrPacData.y_relayOprTime_2x,
        y_relayOprTime_5x: tOcEfrPacData.y_relayOprTime_5x,
        y_relayOprTime_Hi: tOcEfrPacData.y_relayOprTime_Hi,
        b_relayOprTime_2x: tOcEfrPacData.b_relayOprTime_2x,
        b_relayOprTime_5x: tOcEfrPacData.b_relayOprTime_5x,
        b_relayOprTime_Hi: tOcEfrPacData.b_relayOprTime_Hi,
        equipmentUsed: tOcEfrPacData.equipmentUsed,
        updateDate: tOcEfrPacData.updateDate,
      ));
    }
    return tOcEfrPacTestModel;
  }
}

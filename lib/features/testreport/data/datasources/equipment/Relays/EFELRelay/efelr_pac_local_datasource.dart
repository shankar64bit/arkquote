// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../../../../injection_container.dart';
import '../../../../models/equipment/Relays/EFELRelay/efelr_pac_model.dart';
import '../../../test_report_local_datasource.dart';

abstract class EfElrPacLocalDatasource {
  Future<EfElrPacModel> getEfElrPacById(int id);
  Future<int> localEfElrPac(EfElrPacModel efelrPactoLocal);
  Future<List<EfElrPacModel>> getEfElrPacEquipmentLists();
  Future<void> updateEfElrPac(EfElrPacModel efelrPacUpdate, int id);
  Future<int> deleteEfElrPacById(int id);
  Future<List<EfElrPacModel>> getEfElrPacTrNoID(int trNo);
  Future<List<EfElrPacModel>> getEfElrPacSerialNo(String sNo);
}

@DataClassName('EfElrPacLocalData')
class EfElrPacLocalDatasourceImpl extends Table
    implements EfElrPacLocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  RealColumn get plugSetting => real()();
  @required
  RealColumn get TMS => real()();
  @required
  RealColumn get plugSetting_Hi => real()();
  @required
  RealColumn get time => real()();
  @required
  RealColumn get plugSettingMul_2x => real()();
  @required
  RealColumn get plugSettingMul_5x => real()();
  @required
  RealColumn get coilResistanace => real()();
  @required
  RealColumn get pickupCurrent => real()();
  @required
  RealColumn get relayOprTime_2x => real()();
  @required
  RealColumn get relayOprTime_5x => real()();
  @required
  RealColumn get relayOprTime_Hi => real()();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<EfElrPacModel> getEfElrPacById(int id) async {
    EfElrPacLocalData tEfElrPacData =
        await sl<AppDatabase>().getEfElrPacLocalDataWithId(id);
    EfElrPacModel tEfElrPacModel = EfElrPacModel(
      id: tEfElrPacData.id,
      databaseID: tEfElrPacData.databaseID,
      trNo: tEfElrPacData.trNo,
      serialNo: tEfElrPacData.serialNo,
      plugSetting: tEfElrPacData.plugSetting,
      TMS: tEfElrPacData.TMS,
      plugSetting_Hi: tEfElrPacData.plugSetting_Hi,
      time: tEfElrPacData.time,
      plugSettingMul_2x: tEfElrPacData.plugSettingMul_2x,
      plugSettingMul_5x: tEfElrPacData.plugSettingMul_5x,
      coilResistanace: tEfElrPacData.coilResistanace,
      pickupCurrent: tEfElrPacData.pickupCurrent,
      relayOprTime_2x: tEfElrPacData.relayOprTime_2x,
      relayOprTime_5x: tEfElrPacData.relayOprTime_5x,
      relayOprTime_Hi: tEfElrPacData.relayOprTime_Hi,
      equipmentUsed: tEfElrPacData.equipmentUsed,
      updateDate: tEfElrPacData.updateDate,
    );
    return tEfElrPacModel;
  }

  @override
  Future<int> localEfElrPac(EfElrPacModel efelrPactoLocal) {
    return (sl<AppDatabase>().createEfElrPac(efelrPactoLocal));
  }

  @override
  Future<void> updateEfElrPac(EfElrPacModel efelrPacUpdate, int id) async {
    sl<AppDatabase>().updateEfElrPac(efelrPacUpdate, id);
  }

  @override
  Future<int> deleteEfElrPacById(int id) {
    return (sl<AppDatabase>().deleteEfElrPacById(id));
  }

  @override
  Future<List<EfElrPacModel>> getEfElrPacTrNoID(int trNo) async {
    final tarpudo_data =
        await sl<AppDatabase>().getEfElrPacLocalDataWithtrNoID(trNo);

    List<EfElrPacModel> tFPRcurrentMgmt_Model =
        List<EfElrPacModel>.empty(growable: true);
    for (var listEle in tarpudo_data) {
      tFPRcurrentMgmt_Model.add(EfElrPacModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        plugSetting: listEle.plugSetting,
        TMS: listEle.TMS,
        plugSetting_Hi: listEle.plugSetting_Hi,
        time: listEle.time,
        plugSettingMul_2x: listEle.plugSettingMul_2x,
        plugSettingMul_5x: listEle.plugSettingMul_5x,
        coilResistanace: listEle.coilResistanace,
        pickupCurrent: listEle.pickupCurrent,
        relayOprTime_2x: listEle.relayOprTime_2x,
        relayOprTime_5x: listEle.relayOprTime_5x,
        relayOprTime_Hi: listEle.relayOprTime_Hi,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tFPRcurrentMgmt_Model;
  }

  @override
  Future<List<EfElrPacModel>> getEfElrPacSerialNo(String sNo) async {
    final tEfElrPac_data =
        await sl<AppDatabase>().getEfElrPacLocalDataWithSerialNo(sNo);

    List<EfElrPacModel> tEfElrPac_Model =
        List<EfElrPacModel>.empty(growable: true);
    for (var listEle in tEfElrPac_data) {
      tEfElrPac_Model.add(EfElrPacModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        plugSetting: listEle.plugSetting,
        TMS: listEle.TMS,
        plugSetting_Hi: listEle.plugSetting_Hi,
        time: listEle.time,
        plugSettingMul_2x: listEle.plugSettingMul_2x,
        plugSettingMul_5x: listEle.plugSettingMul_5x,
        coilResistanace: listEle.coilResistanace,
        pickupCurrent: listEle.pickupCurrent,
        relayOprTime_2x: listEle.relayOprTime_2x,
        relayOprTime_5x: listEle.relayOprTime_5x,
        relayOprTime_Hi: listEle.relayOprTime_Hi,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tEfElrPac_Model;
  }

  @override
  Future<List<EfElrPacModel>> getEfElrPacEquipmentLists() async {
    final tefelrpacData =
        await sl<AppDatabase>().getEfElrPacEquipmentListwithAll();
    List<EfElrPacModel> tefelrpacTestModel =
        List<EfElrPacModel>.empty(growable: true);
    for (var listEle in tefelrpacData) {
      tefelrpacTestModel.add(EfElrPacModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        plugSetting: listEle.plugSetting,
        TMS: listEle.TMS,
        plugSetting_Hi: listEle.plugSetting_Hi,
        time: listEle.time,
        plugSettingMul_2x: listEle.plugSettingMul_2x,
        plugSettingMul_5x: listEle.plugSettingMul_5x,
        coilResistanace: listEle.coilResistanace,
        pickupCurrent: listEle.pickupCurrent,
        relayOprTime_2x: listEle.relayOprTime_2x,
        relayOprTime_5x: listEle.relayOprTime_5x,
        relayOprTime_Hi: listEle.relayOprTime_Hi,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tefelrpacTestModel;
  }
}

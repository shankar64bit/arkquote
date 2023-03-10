// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../../../../injection_container.dart';
import '../../../../models/equipment/Relays/VoltageRelay/vr_pac_model.dart';
import '../../../test_report_local_datasource.dart';

abstract class VrPacLocalDatasource {
  Future<VrPacModel> getVrPacById(int id);
  Future<int> localVrPac(VrPacModel efelrModel);
  Future<void> updateVrPac(VrPacModel efelrUpdate, int id);
  Future<int> deleteVrPacById(int id);
  Future<List<VrPacModel>> getVrPacTrNoID(int trNo);
  Future<List<VrPacModel>> getVrPacSerialNo(String sNo);
  Future<List<VrPacModel>> getVrPacEquipmentLists();
}

@DataClassName('VrPacLocalData')
class VrPacLocalDatasourceImpl extends Table implements VrPacLocalDatasource {
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
  RealColumn get plugSettingMul1 => real()();
  @required
  RealColumn get plugSettingMul2 => real()();
  @required
  RealColumn get coilResistanace => real()();
  @required
  RealColumn get relayOprTime_1x => real()();
  @required
  RealColumn get relayOprTime_3x => real()();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<VrPacModel> getVrPacById(int id) async {
    VrPacLocalData tVrPacData =
        await sl<AppDatabase>().getVrPacLocalDataWithId(id);
    VrPacModel tVrPacModel = VrPacModel(
      id: tVrPacData.id,
      databaseID: tVrPacData.databaseID,
      trNo: tVrPacData.trNo,
      serialNo: tVrPacData.serialNo,
      plugSetting: tVrPacData.plugSetting,
      TMS: tVrPacData.TMS,
      plugSettingMul1: tVrPacData.plugSettingMul1,
      plugSettingMul2: tVrPacData.plugSettingMul2,
      coilResistanace: tVrPacData.coilResistanace,
      relayOprTime_1x: tVrPacData.relayOprTime_1x,
      relayOprTime_3x: tVrPacData.relayOprTime_3x,
      equipmentUsed: tVrPacData.equipmentUsed,
      updateDate: tVrPacData.updateDate,
    );
    return tVrPacModel;
  }

  @override
  Future<int> localVrPac(VrPacModel efelrModel) {
    return (sl<AppDatabase>().createVrPac(efelrModel));
  }

  @override
  Future<void> updateVrPac(VrPacModel efelrUpdate, int id) async {
    sl<AppDatabase>().updateVrPac(efelrUpdate, id);
  }

  @override
  Future<int> deleteVrPacById(int id) {
    return (sl<AppDatabase>().deleteVrPacById(id));
  }

  @override
  Future<List<VrPacModel>> getVrPacTrNoID(int trNo) async {
    final tarpudo_data =
        await sl<AppDatabase>().getVrPacLocalDataWithtrNoID(trNo);

    List<VrPacModel> tFPRcurrentMgmt_Model =
        List<VrPacModel>.empty(growable: true);
    for (var listEle in tarpudo_data) {
      tFPRcurrentMgmt_Model.add(VrPacModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        plugSetting: listEle.plugSetting,
        TMS: listEle.TMS,
        plugSettingMul1: listEle.plugSettingMul1,
        plugSettingMul2: listEle.plugSettingMul2,
        coilResistanace: listEle.coilResistanace,
        relayOprTime_1x: listEle.relayOprTime_1x,
        relayOprTime_3x: listEle.relayOprTime_3x,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tFPRcurrentMgmt_Model;
  }

  @override
  Future<List<VrPacModel>> getVrPacSerialNo(String sNo) async {
    final tVrPac_data =
        await sl<AppDatabase>().getVrPacLocalDataWithSerialNo(sNo);

    List<VrPacModel> tVrPac_Model = List<VrPacModel>.empty(growable: true);
    for (var listEle in tVrPac_data) {
      tVrPac_Model.add(VrPacModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        plugSetting: listEle.plugSetting,
        TMS: listEle.TMS,
        plugSettingMul1: listEle.plugSettingMul1,
        plugSettingMul2: listEle.plugSettingMul2,
        coilResistanace: listEle.coilResistanace,
        relayOprTime_1x: listEle.relayOprTime_1x,
        relayOprTime_3x: listEle.relayOprTime_3x,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tVrPac_Model;
  }

  //getVrPacEquipmentLists
  @override
  Future<List<VrPacModel>> getVrPacEquipmentLists() async {
    final tvrpacData = await sl<AppDatabase>().getVrPacEquipmentListwithAll();
    List<VrPacModel> tvrpacTestModel = List<VrPacModel>.empty(growable: true);
    for (var tVrPacData in tvrpacData) {
      tvrpacTestModel.add(VrPacModel(
        id: tVrPacData.id,
        databaseID: tVrPacData.databaseID,
        trNo: tVrPacData.trNo,
        serialNo: tVrPacData.serialNo,
        plugSetting: tVrPacData.plugSetting,
        TMS: tVrPacData.TMS,
        plugSettingMul1: tVrPacData.plugSettingMul1,
        plugSettingMul2: tVrPacData.plugSettingMul2,
        coilResistanace: tVrPacData.coilResistanace,
        relayOprTime_1x: tVrPacData.relayOprTime_1x,
        relayOprTime_3x: tVrPacData.relayOprTime_3x,
        equipmentUsed: tVrPacData.equipmentUsed,
        updateDate: tVrPacData.updateDate,
      ));
    }
    return tvrpacTestModel;
  }
}

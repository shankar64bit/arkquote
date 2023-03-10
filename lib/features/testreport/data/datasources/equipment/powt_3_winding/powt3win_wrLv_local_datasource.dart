// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';

import '../../../models/equipment/powt_3_winding/powt3win_wrLv_model.dart';
import '../../test_report_local_datasource.dart';
import '../../../../../../injection_container.dart';
// import '../../../models/equipment/powt/powt_wrLv_model.dart';
// import '../../test_report_local_datasource.dart';

abstract class Powt3winwrLvLocalDatasource {
  Future<Powt3winwrLvModel> getPowt3winwrLv_ById(int id);
  Future<int> localPowt3winwrLv(Powt3winwrLvModel p3wwrlvtolocal);
  Future<void> updatePowt3winwrLv(Powt3winwrLvModel p3wwrlvtoupdate, int id);
  Future<int> deletePowt3winwrLvById(int id);
  Future<List<Powt3winwrLvModel>> getPowt3winwrLvTrNoID(int trNo);
  Future<List<Powt3winwrLvModel>> getPowt3winwrLvSerialNo(String sNo);
  Future<List<Powt3winwrLvModel>> getPowt3winwrLvEquipmentLists();
}

@DataClassName('Powt3winwrLvLocalData')
class Powt3winwrLvLocalDatasourceImpl extends Table
    implements Powt3winwrLvLocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get tapPosition => integer()();
  @required
  RealColumn get lv_r_uv => real()();
  @required
  RealColumn get lv_r_vw => real()();
  @required
  RealColumn get lv_r_wu => real()();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<Powt3winwrLvModel> getPowt3winwrLv_ById(int id) async {
    Powt3winwrLvLocalData tPowt3winwrLVData =
        await sl<AppDatabase>().getPowt3winwrLvLocalDataWithId(id);
    Powt3winwrLvModel tPowt3winwrLvModel = Powt3winwrLvModel(
      id: tPowt3winwrLVData.id,
      databaseID: tPowt3winwrLVData.databaseID,
      trNo: tPowt3winwrLVData.trNo,
      serialNo: tPowt3winwrLVData.serialNo,
      lv_r_uv: tPowt3winwrLVData.lv_r_uv,
      lv_r_vw: tPowt3winwrLVData.lv_r_vw,
      lv_r_wu: tPowt3winwrLVData.lv_r_wu,
      equipmentUsed: tPowt3winwrLVData.equipmentUsed,
      tapPosition: tPowt3winwrLVData.tapPosition,
      updateDate: tPowt3winwrLVData.updateDate,
    );
    return tPowt3winwrLvModel;
  }

  @override
  Future<int> localPowt3winwrLv(Powt3winwrLvModel p3wwrlvtolocal) {
    return (sl<AppDatabase>().createPowt3winwrLv(p3wwrlvtolocal));
  }

  @override
  Future<void> updatePowt3winwrLv(
      Powt3winwrLvModel p3wwrlvtoupdate, int id) async {
    sl<AppDatabase>().updatePowt3winwrLv(p3wwrlvtoupdate, id);
  }

  @override
  Future<int> deletePowt3winwrLvById(int id) {
    return (sl<AppDatabase>().deletePowt3winwrLvById(id));
  }

  @override
  Future<List<Powt3winwrLvModel>> getPowt3winwrLvTrNoID(int trNo) async {
    final tPowt3winwrLv_data =
        await sl<AppDatabase>().getPowt3winwrLvLocalDataWithtrNoID(trNo);

    List<Powt3winwrLvModel> tPowt3winwrLv_Model =
        List<Powt3winwrLvModel>.empty(growable: true);
    for (var listEle in tPowt3winwrLv_data) {
      tPowt3winwrLv_Model.add(Powt3winwrLvModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        lv_r_uv: listEle.lv_r_uv,
        lv_r_vw: listEle.lv_r_vw,
        lv_r_wu: listEle.lv_r_wu,
        equipmentUsed: listEle.equipmentUsed,
        tapPosition: listEle.tapPosition,
        updateDate: listEle.updateDate,
      ));
    }
    return tPowt3winwrLv_Model;
  }

  @override
  Future<List<Powt3winwrLvModel>> getPowt3winwrLvSerialNo(String sNo) async {
    final tPowt3winwrLv_data =
        await sl<AppDatabase>().getPowt3winwrLvLocalDataWithSerialNo(sNo);

    List<Powt3winwrLvModel> tPowt3winwrLv_Model =
        List<Powt3winwrLvModel>.empty(growable: true);
    for (var listEle in tPowt3winwrLv_data) {
      tPowt3winwrLv_Model.add(Powt3winwrLvModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        lv_r_uv: listEle.lv_r_uv,
        lv_r_vw: listEle.lv_r_vw,
        lv_r_wu: listEle.lv_r_wu,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tPowt3winwrLv_Model;
  }

  @override
  Future<List<Powt3winwrLvModel>> getPowt3winwrLvEquipmentLists() async {
    final tpowt3winwrlvData =
        await sl<AppDatabase>().getpowt3winwrLvEquipmentListwithAll();
    List<Powt3winwrLvModel> tpowt3winwrlvTestModel =
        List<Powt3winwrLvModel>.empty(growable: true);
    for (var listEle in tpowt3winwrlvData) {
      tpowt3winwrlvTestModel.add(Powt3winwrLvModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        lv_r_uv: listEle.lv_r_uv,
        lv_r_vw: listEle.lv_r_vw,
        lv_r_wu: listEle.lv_r_wu,
        equipmentUsed: listEle.equipmentUsed,
        tapPosition: listEle.tapPosition,
        updateDate: listEle.updateDate,
      ));
    }
    return tpowt3winwrlvTestModel;
  }
}

// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../models/equipment/powt_3_winding/powt3win_mcLv_model.dart';
import '../../test_report_local_datasource.dart';
// import '../../../models/equipment/powt_3_winding/powt3win_mcHv_model.dart';
// import '../../test_report_local_datasource.dart';
import '../../../../../../injection_container.dart';

abstract class Powt3win_mcLv_LocalDatasource {
  Future<Powt3win_mcLv_Model> getPowt3win_mcLv_ById(int id);
  Future<int> localPowt3win_mcLv(Powt3win_mcLv_Model p3wmclvtolocal);
  Future<void> updatePowt3win_mcLv(Powt3win_mcLv_Model p3wmclvtoupdate, int id);
  Future<int> deletePowt3win_mcLvById(int id);
  Future<List<Powt3win_mcLv_Model>> getPowt3win_mcLvTrNoID(int trNo);
  Future<List<Powt3win_mcLv_Model>> getPowt3win_mcLvSerialNo(String sNo);
  Future<List<Powt3win_mcLv_Model>> getpowt3winmclvEquipmentLists();
}

@DataClassName('Powt3winmcLvLocalData')
class Powt3win_mcLv_LocalDatasourceImpl extends Table
    implements Powt3win_mcLv_LocalDatasource {
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
  RealColumn get lv_u_vn => real()();
  @required
  RealColumn get lv_v_wn => real()();
  @required
  RealColumn get lv_w_un => real()();
  @required
  RealColumn get lv_u => real()();
  @required
  RealColumn get lv_v => real()();
  @required
  RealColumn get lv_w => real()();
  @required
  RealColumn get lv_n => real()();

  @override
  Future<Powt3win_mcLv_Model> getPowt3win_mcLv_ById(int id) async {
    Powt3winmcLvLocalData tPowt3win_mcLvData =
        await sl<AppDatabase>().getPowt3win_mcLvLocalDataWithId(id);
    Powt3win_mcLv_Model tPowt3win_mcLvModel = Powt3win_mcLv_Model(
      id: tPowt3win_mcLvData.id,
      databaseID: tPowt3win_mcLvData.databaseID,
      trNo: tPowt3win_mcLvData.trNo,
      serialNo: tPowt3win_mcLvData.serialNo,
      lv_u_vn: tPowt3win_mcLvData.lv_u_vn,
      lv_v_wn: tPowt3win_mcLvData.lv_v_wn,
      lv_w_un: tPowt3win_mcLvData.lv_w_un,
      lv_u: tPowt3win_mcLvData.lv_u,
      lv_v: tPowt3win_mcLvData.lv_v,
      lv_w: tPowt3win_mcLvData.lv_w,
      lv_n: tPowt3win_mcLvData.lv_n,
      tapPosition: tPowt3win_mcLvData.tapPosition,
    );
    return tPowt3win_mcLvModel;
  }

  @override
  Future<int> localPowt3win_mcLv(Powt3win_mcLv_Model p3wmclvtolocal) {
    return (sl<AppDatabase>().createPowt3win_mcLv(p3wmclvtolocal));
  }

  @override
  Future<void> updatePowt3win_mcLv(
      Powt3win_mcLv_Model p3wmclvtoupdate, int id) async {
    sl<AppDatabase>().updatePowt3win_mcLv(p3wmclvtoupdate, id);
  }

  @override
  Future<int> deletePowt3win_mcLvById(int id) {
    return (sl<AppDatabase>().deletePowt3win_mcLvById(id));
  }

  @override
  Future<List<Powt3win_mcLv_Model>> getPowt3win_mcLvTrNoID(int trNo) async {
    final tPowt3win_mcLv_data =
        await sl<AppDatabase>().getPowt3win_mcLvLocalDataWithtrNoID(trNo);

    List<Powt3win_mcLv_Model> tPowt3win_mcLv_Model =
        List<Powt3win_mcLv_Model>.empty(growable: true);
    for (var listEle in tPowt3win_mcLv_data) {
      tPowt3win_mcLv_Model.add(Powt3win_mcLv_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        lv_u_vn: listEle.lv_u_vn,
        lv_v_wn: listEle.lv_v_wn,
        lv_w_un: listEle.lv_w_un,
        lv_u: listEle.lv_u,
        lv_v: listEle.lv_v,
        lv_w: listEle.lv_w,
        lv_n: listEle.lv_n,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tPowt3win_mcLv_Model;
  }

  @override
  Future<List<Powt3win_mcLv_Model>> getPowt3win_mcLvSerialNo(String sNo) async {
    final tPowt3win_mcLv_data =
        await sl<AppDatabase>().getPowt3win_mcLvLocalDataWithSerialNo(sNo);

    List<Powt3win_mcLv_Model> tPowt3win_mcLv_Model =
        List<Powt3win_mcLv_Model>.empty(growable: true);
    for (var listEle in tPowt3win_mcLv_data) {
      tPowt3win_mcLv_Model.add(Powt3win_mcLv_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        lv_u_vn: listEle.lv_u_vn,
        lv_v_wn: listEle.lv_v_wn,
        lv_w_un: listEle.lv_w_un,
        lv_u: listEle.lv_u,
        lv_v: listEle.lv_v,
        lv_w: listEle.lv_w,
        lv_n: listEle.lv_n,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tPowt3win_mcLv_Model;
  }

  @override
  Future<List<Powt3win_mcLv_Model>> getpowt3winmclvEquipmentLists() async {
    final tp3wmclvData =
        await sl<AppDatabase>().getpowt3winmclvEquipmentListwithAll();
    List<Powt3win_mcLv_Model> tp3wmclvTestModel =
        List<Powt3win_mcLv_Model>.empty(growable: true);
    for (var listEle in tp3wmclvData) {
      tp3wmclvTestModel.add(Powt3win_mcLv_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        lv_u_vn: listEle.lv_u_vn,
        lv_v_wn: listEle.lv_v_wn,
        lv_w_un: listEle.lv_w_un,
        lv_u: listEle.lv_u,
        lv_v: listEle.lv_v,
        lv_w: listEle.lv_w,
        lv_n: listEle.lv_n,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tp3wmclvTestModel;
  }
}

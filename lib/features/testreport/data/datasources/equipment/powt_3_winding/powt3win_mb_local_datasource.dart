// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../models/equipment/powt_3_winding/powt3win_mb_model.dart';
import '../../../../../../injection_container.dart';
import '../../test_report_local_datasource.dart';

abstract class Powt3win_mb_LocalDatasource {
  Future<Powt3win_mb_Model> getPowt3win_mb_ById(int id);
  Future<int> localPowt3win_mb(Powt3win_mb_Model Powt3win_mbtoLocal);
  Future<void> updatePowt3win_mb(Powt3win_mb_Model powt3win_mbupdate, int id);
  Future<int> deletePowt3win_mbById(int id);
  Future<List<Powt3win_mb_Model>> getPowt3win_mbTrNoID(int trNo);
  Future<List<Powt3win_mb_Model>> getPowt3win_mbSerialNo(String sNo);
  Future<List<Powt3win_mb_Model>> getPowt3winMBEquipmentLists();
}

@DataClassName('Powt3winmbLocalData')
class Powt3win_mb_LocalDatasourceImpl extends Table
    implements Powt3win_mb_LocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();

  @required
  RealColumn get r_hv_un => real()();
  @required
  RealColumn get r_hv_vn => real()();
  @required
  RealColumn get r_hv_wn => real()();
  @required
  RealColumn get y_hv_un => real()();
  @required
  RealColumn get y_hv_vn => real()();
  @required
  RealColumn get y_hv_wn => real()();
  @required
  RealColumn get b_hv_un => real()();
  @required
  RealColumn get b_hv_vn => real()();
  @required
  RealColumn get b_hv_wn => real()();
  @required
  RealColumn get r_lv_un => real()();
  @required
  RealColumn get r_lv_vn => real()();
  @required
  RealColumn get r_lv_wn => real()();
  @required
  RealColumn get y_lv_un => real()();
  @required
  RealColumn get y_lv_vn => real()();
  @required
  RealColumn get y_lv_wn => real()();
  @required
  RealColumn get b_lv_un => real()();
  @required
  RealColumn get b_lv_vn => real()();
  @required
  RealColumn get b_lv_wn => real()();
  @required
  RealColumn get r_ivt_un => real()();
  @required
  RealColumn get r_ivt_vn => real()();
  @required
  RealColumn get r_ivt_wn => real()();
  @required
  RealColumn get y_ivt_un => real()();
  @required
  RealColumn get y_ivt_vn => real()();
  @required
  RealColumn get y_ivt_wn => real()();
  @required
  RealColumn get b_ivt_un => real()();
  @required
  RealColumn get b_ivt_vn => real()();
  @required
  RealColumn get b_ivt_wn => real()();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<Powt3win_mb_Model> getPowt3win_mb_ById(int id) async {
    Powt3winmbLocalData tPowt3win_mbData =
        await sl<AppDatabase>().getPowt3win_mbLocalDataWithId(id);
    Powt3win_mb_Model tPowt3win_mbModel = Powt3win_mb_Model(
      id: tPowt3win_mbData.id,
      databaseID: tPowt3win_mbData.databaseID,
      trNo: tPowt3win_mbData.trNo,
      serialNo: tPowt3win_mbData.serialNo,
      r_hv_un: tPowt3win_mbData.r_hv_un,
      r_hv_vn: tPowt3win_mbData.r_hv_vn,
      r_hv_wn: tPowt3win_mbData.r_hv_wn,
      y_hv_un: tPowt3win_mbData.y_hv_un,
      y_hv_vn: tPowt3win_mbData.y_hv_vn,
      y_hv_wn: tPowt3win_mbData.y_hv_wn,
      b_hv_un: tPowt3win_mbData.b_hv_un,
      b_hv_vn: tPowt3win_mbData.b_hv_vn,
      b_hv_wn: tPowt3win_mbData.b_hv_wn,
      r_lv_un: tPowt3win_mbData.r_lv_un,
      r_lv_vn: tPowt3win_mbData.r_lv_vn,
      r_lv_wn: tPowt3win_mbData.r_lv_wn,
      y_lv_un: tPowt3win_mbData.y_lv_un,
      y_lv_vn: tPowt3win_mbData.y_lv_vn,
      y_lv_wn: tPowt3win_mbData.y_lv_wn,
      b_lv_un: tPowt3win_mbData.b_lv_un,
      b_lv_vn: tPowt3win_mbData.b_lv_vn,
      b_lv_wn: tPowt3win_mbData.b_lv_wn,
      r_ivt_un: tPowt3win_mbData.r_ivt_un,
      r_ivt_vn: tPowt3win_mbData.r_ivt_vn,
      r_ivt_wn: tPowt3win_mbData.r_ivt_wn,
      y_ivt_un: tPowt3win_mbData.y_ivt_un,
      y_ivt_vn: tPowt3win_mbData.y_ivt_vn,
      y_ivt_wn: tPowt3win_mbData.y_ivt_wn,
      b_ivt_un: tPowt3win_mbData.b_ivt_un,
      b_ivt_vn: tPowt3win_mbData.b_ivt_vn,
      b_ivt_wn: tPowt3win_mbData.b_ivt_wn,
      equipmentUsed: tPowt3win_mbData.equipmentUsed,
      updateDate: tPowt3win_mbData.updateDate,
    );
    return tPowt3win_mbModel;
  }

  @override
  Future<int> localPowt3win_mb(Powt3win_mb_Model Powt3win_mbtoLocal) {
    return (sl<AppDatabase>().createPowt3win_mb(Powt3win_mbtoLocal));
  }

  @override
  Future<void> updatePowt3win_mb(
      Powt3win_mb_Model Powt3win_mbtoUpdate, int id) async {
    sl<AppDatabase>().updatePowt3win_mb(Powt3win_mbtoUpdate, id);
  }

  @override
  Future<int> deletePowt3win_mbById(int id) {
    return (sl<AppDatabase>().deletePowt3win_mbById(id));
  }

  @override
  Future<List<Powt3win_mb_Model>> getPowt3win_mbTrNoID(int trNo) async {
    final tPowt3win_mb_data =
        await sl<AppDatabase>().getPowt3win_mbLocalDataWithtrNoID(trNo);

    List<Powt3win_mb_Model> tPowt3win_mb_Model =
        List<Powt3win_mb_Model>.empty(growable: true);
    for (var listEle in tPowt3win_mb_data) {
      tPowt3win_mb_Model.add(Powt3win_mb_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        r_hv_un: listEle.r_hv_un,
        r_hv_vn: listEle.r_hv_vn,
        r_hv_wn: listEle.r_hv_wn,
        y_hv_un: listEle.y_hv_un,
        y_hv_vn: listEle.y_hv_vn,
        y_hv_wn: listEle.y_hv_wn,
        b_hv_un: listEle.b_hv_un,
        b_hv_vn: listEle.b_hv_vn,
        b_hv_wn: listEle.b_hv_wn,
        r_lv_un: listEle.r_lv_un,
        r_lv_vn: listEle.r_lv_vn,
        r_lv_wn: listEle.r_lv_wn,
        y_lv_un: listEle.y_lv_un,
        y_lv_vn: listEle.y_lv_vn,
        y_lv_wn: listEle.y_lv_wn,
        b_lv_un: listEle.b_lv_un,
        b_lv_vn: listEle.b_lv_vn,
        b_lv_wn: listEle.b_lv_wn,
        r_ivt_un: listEle.r_ivt_un,
        r_ivt_vn: listEle.r_ivt_vn,
        r_ivt_wn: listEle.r_ivt_wn,
        y_ivt_un: listEle.y_ivt_un,
        y_ivt_vn: listEle.y_ivt_vn,
        y_ivt_wn: listEle.y_ivt_wn,
        b_ivt_un: listEle.b_ivt_un,
        b_ivt_vn: listEle.b_ivt_vn,
        b_ivt_wn: listEle.b_ivt_wn,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tPowt3win_mb_Model;
  }

  @override
  Future<List<Powt3win_mb_Model>> getPowt3win_mbSerialNo(String sNo) async {
    final tPowt3win_mb_data =
        await sl<AppDatabase>().getPowt3win_mbLocalDataWithSerialNo(sNo);

    List<Powt3win_mb_Model> tPowt3win_mbaHv_Model =
        List<Powt3win_mb_Model>.empty(growable: true);
    for (var listEle in tPowt3win_mb_data) {
      tPowt3win_mbaHv_Model.add(Powt3win_mb_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        r_hv_un: listEle.r_hv_un,
        r_hv_vn: listEle.r_hv_vn,
        r_hv_wn: listEle.r_hv_wn,
        y_hv_un: listEle.y_hv_un,
        y_hv_vn: listEle.y_hv_vn,
        y_hv_wn: listEle.y_hv_wn,
        b_hv_un: listEle.b_hv_un,
        b_hv_vn: listEle.b_hv_vn,
        b_hv_wn: listEle.b_hv_wn,
        r_lv_un: listEle.r_lv_un,
        r_lv_vn: listEle.r_lv_vn,
        r_lv_wn: listEle.r_lv_wn,
        y_lv_un: listEle.y_lv_un,
        y_lv_vn: listEle.y_lv_vn,
        y_lv_wn: listEle.y_lv_wn,
        b_lv_un: listEle.b_lv_un,
        b_lv_vn: listEle.b_lv_vn,
        b_lv_wn: listEle.b_lv_wn,
        r_ivt_un: listEle.r_ivt_un,
        r_ivt_vn: listEle.r_ivt_vn,
        r_ivt_wn: listEle.r_ivt_wn,
        y_ivt_un: listEle.y_ivt_un,
        y_ivt_vn: listEle.y_ivt_vn,
        y_ivt_wn: listEle.y_ivt_wn,
        b_ivt_un: listEle.b_ivt_un,
        b_ivt_vn: listEle.b_ivt_vn,
        b_ivt_wn: listEle.b_ivt_wn,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tPowt3win_mbaHv_Model;
  }
  //getPowt3winMBEquipmentLists

  @override
  Future<List<Powt3win_mb_Model>> getPowt3winMBEquipmentLists() async {
    final tp3wMBData =
        await sl<AppDatabase>().getPowt3winMBEquipmentListwithAll();
    List<Powt3win_mb_Model> tp3wMBTestModel =
        List<Powt3win_mb_Model>.empty(growable: true);
    for (var tPowt3win_mbData in tp3wMBData) {
      tp3wMBTestModel.add(Powt3win_mb_Model(
        id: tPowt3win_mbData.id,
        databaseID: tPowt3win_mbData.databaseID,
        trNo: tPowt3win_mbData.trNo,
        serialNo: tPowt3win_mbData.serialNo,
        r_hv_un: tPowt3win_mbData.r_hv_un,
        r_hv_vn: tPowt3win_mbData.r_hv_vn,
        r_hv_wn: tPowt3win_mbData.r_hv_wn,
        y_hv_un: tPowt3win_mbData.y_hv_un,
        y_hv_vn: tPowt3win_mbData.y_hv_vn,
        y_hv_wn: tPowt3win_mbData.y_hv_wn,
        b_hv_un: tPowt3win_mbData.b_hv_un,
        b_hv_vn: tPowt3win_mbData.b_hv_vn,
        b_hv_wn: tPowt3win_mbData.b_hv_wn,
        r_lv_un: tPowt3win_mbData.r_lv_un,
        r_lv_vn: tPowt3win_mbData.r_lv_vn,
        r_lv_wn: tPowt3win_mbData.r_lv_wn,
        y_lv_un: tPowt3win_mbData.y_lv_un,
        y_lv_vn: tPowt3win_mbData.y_lv_vn,
        y_lv_wn: tPowt3win_mbData.y_lv_wn,
        b_lv_un: tPowt3win_mbData.b_lv_un,
        b_lv_vn: tPowt3win_mbData.b_lv_vn,
        b_lv_wn: tPowt3win_mbData.b_lv_wn,
        r_ivt_un: tPowt3win_mbData.r_ivt_un,
        r_ivt_vn: tPowt3win_mbData.r_ivt_vn,
        r_ivt_wn: tPowt3win_mbData.r_ivt_wn,
        y_ivt_un: tPowt3win_mbData.y_ivt_un,
        y_ivt_vn: tPowt3win_mbData.y_ivt_vn,
        y_ivt_wn: tPowt3win_mbData.y_ivt_wn,
        b_ivt_un: tPowt3win_mbData.b_ivt_un,
        b_ivt_vn: tPowt3win_mbData.b_ivt_vn,
        b_ivt_wn: tPowt3win_mbData.b_ivt_wn,
        equipmentUsed: tPowt3win_mbData.equipmentUsed,
        updateDate: tPowt3win_mbData.updateDate,
      ));
    }
    return tp3wMBTestModel;
  }
}

// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/AT/AT_mb_model.dart';
import '../../test_report_local_datasource.dart';

abstract class AT_mb_LocalDatasource {
  Future<AT_mb_Model> getAT_mb_ById(int id);
  Future<int> localAT_mb(AT_mb_Model atmbtolocal);
  Future<void> updateAT_mb(AT_mb_Model atmbtoupdate, int id);
  Future<int> deleteAT_mbById(int id);
  Future<List<AT_mb_Model>> getAT_mbTrNoID(int trNo);
  Future<List<AT_mb_Model>> getAT_mbSerialNo(String sNo);
  Future<List<AT_mb_Model>> getATmbEquipmentLists();
}

@DataClassName('ATmbLocalData')
class AT_mb_LocalDatasourceImpl extends Table implements AT_mb_LocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  RealColumn get ry_hv_1u_1v => real()();
  @required
  RealColumn get ry_hv_1v_1w => real()();
  @required
  RealColumn get ry_hv_1w_1u => real()();
  @required
  RealColumn get ry_hv_1u_1n => real()();
  @required
  RealColumn get ry_hv_1v_1n => real()();
  @required
  RealColumn get ry_hv_1w_1n => real()();
  @required
  RealColumn get ry_lv_2u_2v => real()();
  @required
  RealColumn get ry_lv_2v_2w => real()();
  @required
  RealColumn get ry_lv_2w_2u => real()();
  @required
  RealColumn get ry_lv_2u_2n => real()();
  @required
  RealColumn get ry_lv_2v_2n => real()();
  @required
  RealColumn get ry_lv_2w_2n => real()();
  @required
  RealColumn get yb_hv_1u_1v => real()();
  @required
  RealColumn get yb_hv_1v_1w => real()();
  @required
  RealColumn get yb_hv_1w_1u => real()();
  @required
  RealColumn get yb_hv_1u_1n => real()();
  @required
  RealColumn get yb_hv_1v_1n => real()();
  @required
  RealColumn get yb_hv_1w_1n => real()();
  @required
  RealColumn get yb_lv_2u_2v => real()();
  @required
  RealColumn get yb_lv_2v_2w => real()();
  @required
  RealColumn get yb_lv_2w_2u => real()();
  @required
  RealColumn get yb_lv_2u_2n => real()();
  @required
  RealColumn get yb_lv_2v_2n => real()();
  @required
  RealColumn get yb_lv_2w_2n => real()();
  @required
  RealColumn get br_hv_1u_1v => real()();
  @required
  RealColumn get br_hv_1v_1w => real()();
  @required
  RealColumn get br_hv_1w_1u => real()();
  @required
  RealColumn get br_hv_1u_1n => real()();
  @required
  RealColumn get br_hv_1v_1n => real()();
  @required
  RealColumn get br_hv_1w_1n => real()();
  @required
  RealColumn get br_lv_2u_2v => real()();
  @required
  RealColumn get br_lv_2v_2w => real()();
  @required
  RealColumn get br_lv_2w_2u => real()();
  @required
  RealColumn get br_lv_2u_2n => real()();
  @required
  RealColumn get br_lv_2v_2n => real()();
  @required
  RealColumn get br_lv_2w_2n => real()();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<AT_mb_Model> getAT_mb_ById(int id) async {
    ATmbLocalData tAT_mbData =
        await sl<AppDatabase>().getAT_mbLocalDataWithId(id);
    AT_mb_Model tAT_mbModel = AT_mb_Model(
      id: tAT_mbData.id,
      databaseID: tAT_mbData.databaseID,
      trNo: tAT_mbData.trNo,
      serialNo: tAT_mbData.serialNo,
      ry_hv_1u_1v: tAT_mbData.ry_hv_1u_1v,
      ry_hv_1v_1w: tAT_mbData.ry_hv_1v_1w,
      ry_hv_1w_1u: tAT_mbData.ry_hv_1w_1u,
      ry_hv_1u_1n: tAT_mbData.ry_hv_1u_1n,
      ry_hv_1v_1n: tAT_mbData.ry_hv_1v_1n,
      ry_hv_1w_1n: tAT_mbData.ry_hv_1w_1n,
      ry_lv_2u_2v: tAT_mbData.ry_lv_2u_2v,
      ry_lv_2v_2w: tAT_mbData.ry_lv_2v_2w,
      ry_lv_2w_2u: tAT_mbData.ry_lv_2w_2u,
      ry_lv_2u_2n: tAT_mbData.ry_lv_2u_2n,
      ry_lv_2v_2n: tAT_mbData.ry_lv_2v_2n,
      ry_lv_2w_2n: tAT_mbData.ry_lv_2w_2n,
      yb_hv_1u_1v: tAT_mbData.yb_hv_1u_1v,
      yb_hv_1v_1w: tAT_mbData.yb_hv_1v_1w,
      yb_hv_1w_1u: tAT_mbData.yb_hv_1w_1u,
      yb_hv_1u_1n: tAT_mbData.yb_hv_1u_1n,
      yb_hv_1v_1n: tAT_mbData.yb_hv_1v_1n,
      yb_hv_1w_1n: tAT_mbData.yb_hv_1w_1n,
      yb_lv_2u_2v: tAT_mbData.yb_lv_2u_2v,
      yb_lv_2v_2w: tAT_mbData.yb_lv_2v_2w,
      yb_lv_2w_2u: tAT_mbData.yb_lv_2w_2u,
      yb_lv_2u_2n: tAT_mbData.yb_lv_2u_2n,
      yb_lv_2v_2n: tAT_mbData.yb_lv_2v_2n,
      yb_lv_2w_2n: tAT_mbData.yb_lv_2w_2n,
      br_hv_1u_1v: tAT_mbData.br_hv_1u_1v,
      br_hv_1v_1w: tAT_mbData.br_hv_1v_1w,
      br_hv_1w_1u: tAT_mbData.br_hv_1w_1u,
      br_hv_1u_1n: tAT_mbData.br_hv_1u_1n,
      br_hv_1v_1n: tAT_mbData.br_hv_1v_1n,
      br_hv_1w_1n: tAT_mbData.br_hv_1w_1n,
      br_lv_2u_2v: tAT_mbData.br_lv_2u_2v,
      br_lv_2v_2w: tAT_mbData.br_lv_2v_2w,
      br_lv_2w_2u: tAT_mbData.br_lv_2w_2u,
      br_lv_2u_2n: tAT_mbData.br_lv_2u_2n,
      br_lv_2v_2n: tAT_mbData.br_lv_2v_2n,
      br_lv_2w_2n: tAT_mbData.br_lv_2w_2n,
      equipmentUsed: tAT_mbData.equipmentUsed,
      updateDate: tAT_mbData.updateDate,
    );
    return tAT_mbModel;
  }

  @override
  Future<int> localAT_mb(AT_mb_Model atmbtolocal) {
    return (sl<AppDatabase>().createAT_mb(atmbtolocal));
  }

  @override
  Future<void> updateAT_mb(AT_mb_Model atmbtoupdate, int id) async {
    sl<AppDatabase>().updateAT_mb(atmbtoupdate, id);
  }

  @override
  Future<int> deleteAT_mbById(int id) {
    return (sl<AppDatabase>().deleteAT_mbById(id));
  }

  @override
  Future<List<AT_mb_Model>> getAT_mbTrNoID(int trNo) async {
    final tAT_mb_data =
        await sl<AppDatabase>().getAT_mbLocalDataWithtrNoID(trNo);

    List<AT_mb_Model> tAT_mb_Model = List<AT_mb_Model>.empty(growable: true);
    for (var listEle in tAT_mb_data) {
      tAT_mb_Model.add(AT_mb_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        ry_hv_1u_1v: listEle.ry_hv_1u_1v,
        ry_hv_1v_1w: listEle.ry_hv_1v_1w,
        ry_hv_1w_1u: listEle.ry_hv_1w_1u,
        ry_hv_1u_1n: listEle.ry_hv_1u_1n,
        ry_hv_1v_1n: listEle.ry_hv_1v_1n,
        ry_hv_1w_1n: listEle.ry_hv_1w_1n,
        ry_lv_2u_2v: listEle.ry_lv_2u_2v,
        ry_lv_2v_2w: listEle.ry_lv_2v_2w,
        ry_lv_2w_2u: listEle.ry_lv_2w_2u,
        ry_lv_2u_2n: listEle.ry_lv_2u_2n,
        ry_lv_2v_2n: listEle.ry_lv_2v_2n,
        ry_lv_2w_2n: listEle.ry_lv_2w_2n,
        yb_hv_1u_1v: listEle.yb_hv_1u_1v,
        yb_hv_1v_1w: listEle.yb_hv_1v_1w,
        yb_hv_1w_1u: listEle.yb_hv_1w_1u,
        yb_hv_1u_1n: listEle.yb_hv_1u_1n,
        yb_hv_1v_1n: listEle.yb_hv_1v_1n,
        yb_hv_1w_1n: listEle.yb_hv_1w_1n,
        yb_lv_2u_2v: listEle.yb_lv_2u_2v,
        yb_lv_2v_2w: listEle.yb_lv_2v_2w,
        yb_lv_2w_2u: listEle.yb_lv_2w_2u,
        yb_lv_2u_2n: listEle.yb_lv_2u_2n,
        yb_lv_2v_2n: listEle.yb_lv_2v_2n,
        yb_lv_2w_2n: listEle.yb_lv_2w_2n,
        br_hv_1u_1v: listEle.br_hv_1u_1v,
        br_hv_1v_1w: listEle.br_hv_1v_1w,
        br_hv_1w_1u: listEle.br_hv_1w_1u,
        br_hv_1u_1n: listEle.br_hv_1u_1n,
        br_hv_1v_1n: listEle.br_hv_1v_1n,
        br_hv_1w_1n: listEle.br_hv_1w_1n,
        br_lv_2u_2v: listEle.br_lv_2u_2v,
        br_lv_2v_2w: listEle.br_lv_2v_2w,
        br_lv_2w_2u: listEle.br_lv_2w_2u,
        br_lv_2u_2n: listEle.br_lv_2u_2n,
        br_lv_2v_2n: listEle.br_lv_2v_2n,
        br_lv_2w_2n: listEle.br_lv_2w_2n,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tAT_mb_Model;
  }

  @override
  Future<List<AT_mb_Model>> getAT_mbSerialNo(String sNo) async {
    final tAT_mb_data =
        await sl<AppDatabase>().getAT_mbLocalDataWithSerialNo(sNo);

    List<AT_mb_Model> tAT_mb_Model = List<AT_mb_Model>.empty(growable: true);
    for (var listEle in tAT_mb_data) {
      tAT_mb_Model.add(AT_mb_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        ry_hv_1u_1v: listEle.ry_hv_1u_1v,
        ry_hv_1v_1w: listEle.ry_hv_1v_1w,
        ry_hv_1w_1u: listEle.ry_hv_1w_1u,
        ry_hv_1u_1n: listEle.ry_hv_1u_1n,
        ry_hv_1v_1n: listEle.ry_hv_1v_1n,
        ry_hv_1w_1n: listEle.ry_hv_1w_1n,
        ry_lv_2u_2v: listEle.ry_lv_2u_2v,
        ry_lv_2v_2w: listEle.ry_lv_2v_2w,
        ry_lv_2w_2u: listEle.ry_lv_2w_2u,
        ry_lv_2u_2n: listEle.ry_lv_2u_2n,
        ry_lv_2v_2n: listEle.ry_lv_2v_2n,
        ry_lv_2w_2n: listEle.ry_lv_2w_2n,
        yb_hv_1u_1v: listEle.yb_hv_1u_1v,
        yb_hv_1v_1w: listEle.yb_hv_1v_1w,
        yb_hv_1w_1u: listEle.yb_hv_1w_1u,
        yb_hv_1u_1n: listEle.yb_hv_1u_1n,
        yb_hv_1v_1n: listEle.yb_hv_1v_1n,
        yb_hv_1w_1n: listEle.yb_hv_1w_1n,
        yb_lv_2u_2v: listEle.yb_lv_2u_2v,
        yb_lv_2v_2w: listEle.yb_lv_2v_2w,
        yb_lv_2w_2u: listEle.yb_lv_2w_2u,
        yb_lv_2u_2n: listEle.yb_lv_2u_2n,
        yb_lv_2v_2n: listEle.yb_lv_2v_2n,
        yb_lv_2w_2n: listEle.yb_lv_2w_2n,
        br_hv_1u_1v: listEle.br_hv_1u_1v,
        br_hv_1v_1w: listEle.br_hv_1v_1w,
        br_hv_1w_1u: listEle.br_hv_1w_1u,
        br_hv_1u_1n: listEle.br_hv_1u_1n,
        br_hv_1v_1n: listEle.br_hv_1v_1n,
        br_hv_1w_1n: listEle.br_hv_1w_1n,
        br_lv_2u_2v: listEle.br_lv_2u_2v,
        br_lv_2v_2w: listEle.br_lv_2v_2w,
        br_lv_2w_2u: listEle.br_lv_2w_2u,
        br_lv_2u_2n: listEle.br_lv_2u_2n,
        br_lv_2v_2n: listEle.br_lv_2v_2n,
        br_lv_2w_2n: listEle.br_lv_2w_2n,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tAT_mb_Model;
  }

  @override
  Future<List<AT_mb_Model>> getATmbEquipmentLists() async {
    final tATmbData = await sl<AppDatabase>().getATmbEquipmentListwithAll();
    List<AT_mb_Model> tATmcTestModel = List<AT_mb_Model>.empty(growable: true);
    for (var element in tATmbData) {
      tATmcTestModel.add(AT_mb_Model(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        ry_hv_1u_1v: element.ry_hv_1u_1v,
        ry_hv_1v_1w: element.ry_hv_1v_1w,
        ry_hv_1w_1u: element.ry_hv_1w_1u,
        ry_hv_1u_1n: element.ry_hv_1u_1n,
        ry_hv_1v_1n: element.ry_hv_1v_1n,
        ry_hv_1w_1n: element.ry_hv_1w_1n,
        ry_lv_2u_2v: element.ry_lv_2u_2v,
        ry_lv_2v_2w: element.ry_lv_2v_2w,
        ry_lv_2w_2u: element.ry_lv_2w_2u,
        ry_lv_2u_2n: element.ry_lv_2u_2n,
        ry_lv_2v_2n: element.ry_lv_2v_2n,
        ry_lv_2w_2n: element.ry_lv_2w_2n,
        yb_hv_1u_1v: element.yb_hv_1u_1v,
        yb_hv_1v_1w: element.yb_hv_1v_1w,
        yb_hv_1w_1u: element.yb_hv_1w_1u,
        yb_hv_1u_1n: element.yb_hv_1u_1n,
        yb_hv_1v_1n: element.yb_hv_1v_1n,
        yb_hv_1w_1n: element.yb_hv_1w_1n,
        yb_lv_2u_2v: element.yb_lv_2u_2v,
        yb_lv_2v_2w: element.yb_lv_2v_2w,
        yb_lv_2w_2u: element.yb_lv_2w_2u,
        yb_lv_2u_2n: element.yb_lv_2u_2n,
        yb_lv_2v_2n: element.yb_lv_2v_2n,
        yb_lv_2w_2n: element.yb_lv_2w_2n,
        br_hv_1u_1v: element.br_hv_1u_1v,
        br_hv_1v_1w: element.br_hv_1v_1w,
        br_hv_1w_1u: element.br_hv_1w_1u,
        br_hv_1u_1n: element.br_hv_1u_1n,
        br_hv_1v_1n: element.br_hv_1v_1n,
        br_hv_1w_1n: element.br_hv_1w_1n,
        br_lv_2u_2v: element.br_lv_2u_2v,
        br_lv_2v_2w: element.br_lv_2v_2w,
        br_lv_2w_2u: element.br_lv_2w_2u,
        br_lv_2u_2n: element.br_lv_2u_2n,
        br_lv_2v_2n: element.br_lv_2v_2n,
        br_lv_2w_2n: element.br_lv_2w_2n,
        equipmentUsed: element.equipmentUsed,
        updateDate: element.updateDate,
      ));
    }
    return tATmcTestModel;
  }
}

// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/AT/AT_r_model.dart';
import '../../test_report_local_datasource.dart';
// import '../../../models/equipment/AT/AT_wrLv_model.dart';
// import '../../test_report_local_datasource.dart';

abstract class AT_R_LocalDatasource {
  Future<AT_R_Model> getAT_R_ById(int id);
  Future<int> localAT_R(AT_R_Model atrtolocal);
  Future<void> updateAT_R(AT_R_Model atrtoupdate, int id);
  Future<int> deleteAT_RById(int id);
  Future<List<AT_R_Model>> getAT_RTrNoID(int trNo);
  Future<List<AT_R_Model>> getAT_RSerialNo(String sNo);
  Future<List<AT_R_Model>> getATrEquipmentLists();
}

@DataClassName('ATrLocalData')
class AT_R_LocalDatasourceImpl extends Table implements AT_R_LocalDatasource {
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
  RealColumn get hv_1u_1v => real()();
  @required
  RealColumn get hv_1v_1w => real()();
  @required
  RealColumn get hv_1w_1u => real()();
  @required
  RealColumn get hv_1u_1n => real()();
  @required
  RealColumn get hv_1v_1n => real()();
  @required
  RealColumn get hv_1w_1n => real()();
  @required
  RealColumn get lv_2u_2v => real()();
  @required
  RealColumn get lv_2v_2w => real()();
  @required
  RealColumn get lv_2w_2u => real()();
  @required
  RealColumn get lv_2u_2n => real()();
  @required
  RealColumn get lv_2v_2n => real()();
  @required
  RealColumn get lv_2w_2n => real()();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<AT_R_Model> getAT_R_ById(int id) async {
    ATrLocalData tAT_RData = await sl<AppDatabase>().getAT_RLocalDataWithId(id);
    AT_R_Model tATwrLvModel = AT_R_Model(
      id: tAT_RData.id,
      databaseID: tAT_RData.databaseID,
      trNo: tAT_RData.trNo,
      serialNo: tAT_RData.serialNo,
      hv_1u_1v: tAT_RData.hv_1u_1v,
      hv_1v_1w: tAT_RData.hv_1v_1w,
      hv_1w_1u: tAT_RData.hv_1w_1u,
      hv_1u_1n: tAT_RData.hv_1u_1n,
      hv_1v_1n: tAT_RData.hv_1v_1n,
      hv_1w_1n: tAT_RData.hv_1w_1n,
      lv_2u_2v: tAT_RData.lv_2u_2v,
      lv_2v_2w: tAT_RData.lv_2v_2w,
      lv_2w_2u: tAT_RData.lv_2w_2u,
      lv_2u_2n: tAT_RData.lv_2u_2n,
      lv_2v_2n: tAT_RData.lv_2v_2n,
      lv_2w_2n: tAT_RData.lv_2w_2n,
      equipmentUsed: tAT_RData.equipmentUsed,
      tapPosition: tAT_RData.tapPosition,
      updateDate: tAT_RData.updateDate,
    );
    return tATwrLvModel;
  }

  @override
  Future<int> localAT_R(AT_R_Model atrtolocal) {
    return (sl<AppDatabase>().createAT_R(atrtolocal));
  }

  @override
  Future<void> updateAT_R(AT_R_Model atrtoupdate, int id) async {
    sl<AppDatabase>().updateAT_R(atrtoupdate, id);
  }

  @override
  Future<int> deleteAT_RById(int id) {
    return (sl<AppDatabase>().deleteAT_RById(id));
  }

  @override
  Future<List<AT_R_Model>> getAT_RTrNoID(int ctNo) async {
    final tAT_R_data = await sl<AppDatabase>().getAT_RLocalDataWithtrNoID(ctNo);

    List<AT_R_Model> tAT_R_Model = List<AT_R_Model>.empty(growable: true);
    for (var listEle in tAT_R_data) {
      tAT_R_Model.add(AT_R_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_1u_1v: listEle.hv_1u_1v,
        hv_1v_1w: listEle.hv_1v_1w,
        hv_1w_1u: listEle.hv_1w_1u,
        hv_1u_1n: listEle.hv_1u_1n,
        hv_1v_1n: listEle.hv_1v_1n,
        hv_1w_1n: listEle.hv_1w_1n,
        lv_2u_2v: listEle.lv_2u_2v,
        lv_2v_2w: listEle.lv_2v_2w,
        lv_2w_2u: listEle.lv_2w_2u,
        lv_2u_2n: listEle.lv_2u_2n,
        lv_2v_2n: listEle.lv_2v_2n,
        lv_2w_2n: listEle.lv_2w_2n,
        equipmentUsed: listEle.equipmentUsed,
        tapPosition: listEle.tapPosition,
        updateDate: listEle.updateDate,
      ));
    }
    return tAT_R_Model;
  }

  @override
  Future<List<AT_R_Model>> getAT_RSerialNo(String sNo) async {
    final tAT_R_data =
        await sl<AppDatabase>().getAT_RLocalDataWithSerialNo(sNo);

    List<AT_R_Model> tATwrLv_Model = List<AT_R_Model>.empty(growable: true);
    for (var listEle in tAT_R_data) {
      tATwrLv_Model.add(AT_R_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_1u_1v: listEle.hv_1u_1v,
        hv_1v_1w: listEle.hv_1v_1w,
        hv_1w_1u: listEle.hv_1w_1u,
        hv_1u_1n: listEle.hv_1u_1n,
        hv_1v_1n: listEle.hv_1v_1n,
        hv_1w_1n: listEle.hv_1w_1n,
        lv_2u_2v: listEle.lv_2u_2v,
        lv_2v_2w: listEle.lv_2v_2w,
        lv_2w_2u: listEle.lv_2w_2u,
        lv_2u_2n: listEle.lv_2u_2n,
        lv_2v_2n: listEle.lv_2v_2n,
        lv_2w_2n: listEle.lv_2w_2n,
        tapPosition: listEle.tapPosition,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tATwrLv_Model;
  }

  @override
  Future<List<AT_R_Model>> getATrEquipmentLists() async {
    final tATrData = await sl<AppDatabase>().getATrEquipmentListwithAll();
    List<AT_R_Model> tATrTestModel = List<AT_R_Model>.empty(growable: true);
    for (var element in tATrData) {
      tATrTestModel.add(AT_R_Model(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        hv_1u_1v: element.hv_1u_1v,
        hv_1v_1w: element.hv_1v_1w,
        hv_1w_1u: element.hv_1w_1u,
        hv_1u_1n: element.hv_1u_1n,
        hv_1v_1n: element.hv_1v_1n,
        hv_1w_1n: element.hv_1w_1n,
        lv_2u_2v: element.lv_2u_2v,
        lv_2v_2w: element.lv_2v_2w,
        lv_2w_2u: element.lv_2w_2u,
        lv_2u_2n: element.lv_2u_2n,
        lv_2v_2n: element.lv_2v_2n,
        lv_2w_2n: element.lv_2w_2n,
        tapPosition: element.tapPosition,
        equipmentUsed: element.equipmentUsed,
      ));
    }
    return tATrTestModel;
  }
}

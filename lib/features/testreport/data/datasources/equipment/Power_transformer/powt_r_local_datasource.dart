// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/powt/powt_r_model.dart';
import '../../test_report_local_datasource.dart';

abstract class Powt_R_LocalDatasource {
  Future<Powt_R_Model> getPowt_R_ById(int id);
  Future<int> localPowt_R(Powt_R_Model powtrtolocal);
  Future<void> updatePowt_R(Powt_R_Model powtrtoupdate, int id);
  Future<int> deletePowt_RById(int id);
  Future<List<Powt_R_Model>> getPowt_RTrNoID(int trNo);
  Future<List<Powt_R_Model>> getPowt_RSerialNo(String sNo);
  Future<List<Powt_R_Model>> getPowtREquipmentLists();
}

@DataClassName('PowtrLocalData')
class Powt_R_LocalDatasourceImpl extends Table
    implements Powt_R_LocalDatasource {
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
  Future<Powt_R_Model> getPowt_R_ById(int id) async {
    PowtrLocalData tPowt_RData =
        await sl<AppDatabase>().getPowt_RLocalDataWithId(id);
    Powt_R_Model tPowt_RModel = Powt_R_Model(
      id: tPowt_RData.id,
      databaseID: tPowt_RData.databaseID,
      trNo: tPowt_RData.trNo,
      serialNo: tPowt_RData.serialNo,
      hv_1u_1v: tPowt_RData.hv_1u_1v,
      hv_1v_1w: tPowt_RData.hv_1v_1w,
      hv_1w_1u: tPowt_RData.hv_1w_1u,
      hv_1u_1n: tPowt_RData.hv_1u_1n,
      hv_1v_1n: tPowt_RData.hv_1v_1n,
      hv_1w_1n: tPowt_RData.hv_1w_1n,
      lv_2u_2v: tPowt_RData.lv_2u_2v,
      lv_2v_2w: tPowt_RData.lv_2v_2w,
      lv_2w_2u: tPowt_RData.lv_2w_2u,
      lv_2u_2n: tPowt_RData.lv_2u_2n,
      lv_2v_2n: tPowt_RData.lv_2v_2n,
      lv_2w_2n: tPowt_RData.lv_2w_2n,
      equipmentUsed: tPowt_RData.equipmentUsed,
      tapPosition: tPowt_RData.tapPosition,
      updateDate: tPowt_RData.updateDate,
    );
    return tPowt_RModel;
  }

  @override
  Future<int> localPowt_R(Powt_R_Model powtrtolocal) {
    return (sl<AppDatabase>().createPowt_R(powtrtolocal));
  }

  @override
  Future<void> updatePowt_R(Powt_R_Model powtrtoupdate, int id) async {
    sl<AppDatabase>().updatePowt_R(powtrtoupdate, id);
  }

  @override
  Future<int> deletePowt_RById(int id) {
    return (sl<AppDatabase>().deletePowt_RById(id));
  }

  @override
  Future<List<Powt_R_Model>> getPowt_RTrNoID(int ctNo) async {
    final tPowt_R_data =
        await sl<AppDatabase>().getPowt_RLocalDataWithtrNoID(ctNo);

    List<Powt_R_Model> tPowt_R_Model = List<Powt_R_Model>.empty(growable: true);
    for (var listEle in tPowt_R_data) {
      tPowt_R_Model.add(Powt_R_Model(
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
    return tPowt_R_Model;
  }

  @override
  Future<List<Powt_R_Model>> getPowt_RSerialNo(String sNo) async {
    final tPowt_R_data =
        await sl<AppDatabase>().getPowt_RLocalDataWithSerialNo(sNo);

    List<Powt_R_Model> tPowt_R_Model = List<Powt_R_Model>.empty(growable: true);
    for (var listEle in tPowt_R_data) {
      tPowt_R_Model.add(Powt_R_Model(
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
    return tPowt_R_Model;
  }

  @override
  Future<List<Powt_R_Model>> getPowtREquipmentLists() async {
    final tPowtrData = await sl<AppDatabase>().getPowtREquipmentListwithAll();
    List<Powt_R_Model> tPowtRTestModel =
        List<Powt_R_Model>.empty(growable: true);
    for (var element in tPowtrData) {
      tPowtRTestModel.add(Powt_R_Model(
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
        updateDate: element.updateDate,
      ));
    }
    return tPowtRTestModel;
  }
}

// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/AT/AT_mc_model.dart';
import '../../test_report_local_datasource.dart';

abstract class AT_mc_LocalDatasource {
  Future<AT_mc_Model> getAT_mc_ById(int id);
  Future<int> localAT_mc(AT_mc_Model atmctolocal);
  Future<void> updateAT_mc(AT_mc_Model atmctoupdate, int id);
  Future<int> deleteAT_mcById(int id);
  Future<List<AT_mc_Model>> getAT_mcTrNoID(int trNo);
  Future<List<AT_mc_Model>> getAT_mcSerialNo(String sNo);
  Future<List<AT_mc_Model>> getATmcEquipmentLists();
}

@DataClassName('ATmcLocalData')
class AT_mc_LocalDatasourceImpl extends Table implements AT_mc_LocalDatasource {
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
  RealColumn get hv_1u_1n => real()();
  @required
  RealColumn get hv_1v_1n => real()();
  @required
  RealColumn get hv_1w_1n => real()();
  @required
  RealColumn get hv_1u => real()();
  @required
  RealColumn get hv_1v => real()();
  @required
  RealColumn get hv_1w => real()();
  @required
  RealColumn get hv_1n => real()();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<AT_mc_Model> getAT_mc_ById(int id) async {
    ATmcLocalData tAT_mcData =
        await sl<AppDatabase>().getAT_mcLocalDataWithId(id);
    AT_mc_Model tAT_mcModel = AT_mc_Model(
      id: tAT_mcData.id,
      databaseID: tAT_mcData.databaseID,
      trNo: tAT_mcData.trNo,
      serialNo: tAT_mcData.serialNo,
      hv_1u_1n: tAT_mcData.hv_1u_1n,
      hv_1v_1n: tAT_mcData.hv_1v_1n,
      hv_1w_1n: tAT_mcData.hv_1w_1n,
      hv_1u: tAT_mcData.hv_1u,
      hv_1v: tAT_mcData.hv_1v,
      hv_1w: tAT_mcData.hv_1w,
      hv_1n: tAT_mcData.hv_1n,
      equipmentUsed: tAT_mcData.equipmentUsed,
      tapPosition: tAT_mcData.tapPosition,
      updateDate: tAT_mcData.updateDate,
    );
    return tAT_mcModel;
  }

  @override
  Future<int> localAT_mc(AT_mc_Model atmctolocal) {
    return (sl<AppDatabase>().createAT_mc(atmctolocal));
  }

  @override
  Future<void> updateAT_mc(AT_mc_Model atmctoupdate, int id) async {
    sl<AppDatabase>().updateAT_mc(atmctoupdate, id);
  }

  @override
  Future<int> deleteAT_mcById(int id) {
    return (sl<AppDatabase>().deleteAT_mcById(id));
  }

  @override
  Future<List<AT_mc_Model>> getAT_mcTrNoID(int trNo) async {
    final tAT_mc_data =
        await sl<AppDatabase>().getAT_mcLocalDataWithtrNoID(trNo);

    List<AT_mc_Model> tATwrLv_Model = List<AT_mc_Model>.empty(growable: true);
    for (var listEle in tAT_mc_data) {
      tATwrLv_Model.add(AT_mc_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_1u_1n: listEle.hv_1u_1n,
        hv_1v_1n: listEle.hv_1v_1n,
        hv_1w_1n: listEle.hv_1w_1n,
        hv_1u: listEle.hv_1u,
        hv_1v: listEle.hv_1v,
        hv_1w: listEle.hv_1w,
        hv_1n: listEle.hv_1n,
        equipmentUsed: listEle.equipmentUsed,
        tapPosition: listEle.tapPosition,
        updateDate: listEle.updateDate,
      ));
    }
    return tATwrLv_Model;
  }

  @override
  Future<List<AT_mc_Model>> getAT_mcSerialNo(String sNo) async {
    final tAT_mc_data =
        await sl<AppDatabase>().getAT_mcLocalDataWithSerialNo(sNo);

    List<AT_mc_Model> tATwrLv_Model = List<AT_mc_Model>.empty(growable: true);
    for (var listEle in tAT_mc_data) {
      tATwrLv_Model.add(AT_mc_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_1u_1n: listEle.hv_1u_1n,
        hv_1v_1n: listEle.hv_1v_1n,
        hv_1w_1n: listEle.hv_1w_1n,
        hv_1u: listEle.hv_1u,
        hv_1v: listEle.hv_1v,
        hv_1w: listEle.hv_1w,
        hv_1n: listEle.hv_1n,
        tapPosition: listEle.tapPosition,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tATwrLv_Model;
  }

  @override
  Future<List<AT_mc_Model>> getATmcEquipmentLists() async {
    final tATmcData = await sl<AppDatabase>().getATmcEquipmentListwithAll();
    List<AT_mc_Model> tATmcTestModel = List<AT_mc_Model>.empty(growable: true);
    for (var element in tATmcData) {
      tATmcTestModel.add(AT_mc_Model(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        hv_1u_1n: element.hv_1u_1n,
        hv_1v_1n: element.hv_1v_1n,
        hv_1w_1n: element.hv_1w_1n,
        hv_1u: element.hv_1u,
        hv_1v: element.hv_1v,
        hv_1w: element.hv_1w,
        hv_1n: element.hv_1n,
        tapPosition: element.tapPosition,
        equipmentUsed: element.equipmentUsed,
      ));
    }
    return tATmcTestModel;
  }
}

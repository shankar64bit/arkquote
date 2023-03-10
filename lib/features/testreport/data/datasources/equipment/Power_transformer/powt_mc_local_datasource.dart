// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/powt/powt_mc_model.dart';
import '../../test_report_local_datasource.dart';

abstract class Powt_mc_LocalDatasource {
  Future<Powt_mc_Model> getPowt_mc_ById(int id);
  Future<int> localPowt_mc(Powt_mc_Model powtmctolocal);
  Future<void> updatePowt_mc(Powt_mc_Model powtmctoupdate, int id);
  Future<int> deletePowt_mcById(int id);
  Future<List<Powt_mc_Model>> getPowt_mcTrNoID(int trNo);
  Future<List<Powt_mc_Model>> getPowt_mcSerialNo(String sNo);
  Future<List<Powt_mc_Model>> getPowtmcEquipmentLists();
}

@DataClassName('PowtmcLocalData')
class Powt_mc_LocalDatasourceImpl extends Table
    implements Powt_mc_LocalDatasource {
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
  Future<Powt_mc_Model> getPowt_mc_ById(int id) async {
    PowtmcLocalData tPowt_mcData =
        await sl<AppDatabase>().getPowt_mcLocalDataWithId(id);
    Powt_mc_Model tPowt_mcModel = Powt_mc_Model(
      id: tPowt_mcData.id,
      databaseID: tPowt_mcData.databaseID,
      trNo: tPowt_mcData.trNo,
      serialNo: tPowt_mcData.serialNo,
      hv_1u_1n: tPowt_mcData.hv_1u_1n,
      hv_1v_1n: tPowt_mcData.hv_1v_1n,
      hv_1w_1n: tPowt_mcData.hv_1w_1n,
      hv_1u: tPowt_mcData.hv_1u,
      hv_1v: tPowt_mcData.hv_1v,
      hv_1w: tPowt_mcData.hv_1w,
      hv_1n: tPowt_mcData.hv_1n,
      equipmentUsed: tPowt_mcData.equipmentUsed,
      tapPosition: tPowt_mcData.tapPosition,
      updateDate: tPowt_mcData.updateDate,
    );
    return tPowt_mcModel;
  }

  @override
  Future<int> localPowt_mc(Powt_mc_Model powtmctolocal) {
    return (sl<AppDatabase>().createPowt_mc(powtmctolocal));
  }

  @override
  Future<void> updatePowt_mc(Powt_mc_Model powtmctoupdate, int id) async {
    sl<AppDatabase>().updatePowt_mc(powtmctoupdate, id);
  }

  @override
  Future<int> deletePowt_mcById(int id) {
    return (sl<AppDatabase>().deletePowt_mcById(id));
  }

  @override
  Future<List<Powt_mc_Model>> getPowt_mcTrNoID(int trNo) async {
    final tPowt_mc_data =
        await sl<AppDatabase>().getPowt_mcLocalDataWithtrNoID(trNo);

    List<Powt_mc_Model> tPowt_mc_Model =
        List<Powt_mc_Model>.empty(growable: true);
    for (var listEle in tPowt_mc_data) {
      tPowt_mc_Model.add(Powt_mc_Model(
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
    return tPowt_mc_Model;
  }

  @override
  Future<List<Powt_mc_Model>> getPowt_mcSerialNo(String sNo) async {
    final tPowt_mc_data =
        await sl<AppDatabase>().getPowt_mcLocalDataWithSerialNo(sNo);

    List<Powt_mc_Model> tPowt_mc_Model =
        List<Powt_mc_Model>.empty(growable: true);
    for (var listEle in tPowt_mc_data) {
      tPowt_mc_Model.add(Powt_mc_Model(
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
    return tPowt_mc_Model;
  }

  @override
  Future<List<Powt_mc_Model>> getPowtmcEquipmentLists() async {
    final tpowtmcData = await sl<AppDatabase>().getPowtmcEquipmentListwithAll();
    List<Powt_mc_Model> tpowtmcTestModel =
        List<Powt_mc_Model>.empty(growable: true);
    for (var element in tpowtmcData) {
      tpowtmcTestModel.add(Powt_mc_Model(
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
        equipmentUsed: element.equipmentUsed,
        tapPosition: element.tapPosition,
        updateDate: element.updateDate,
      ));
    }
    return tpowtmcTestModel;
  }
}

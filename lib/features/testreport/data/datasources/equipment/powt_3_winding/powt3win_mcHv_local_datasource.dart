// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../models/equipment/powt_3_winding/powt3win_mcHv_model.dart';
import '../../test_report_local_datasource.dart';
import '../../../../../../injection_container.dart';

abstract class Powt3win_mcHv_LocalDatasource {
  Future<Powt3win_mcHv_Model> getPowt3win_mcHv_ById(int id);
  Future<int> localPowt3win_mcHv(Powt3win_mcHv_Model p3wmchvtolocal);
  Future<void> updatePowt3win_mcHv(Powt3win_mcHv_Model p3wmchvtoupdate, int id);
  Future<int> deletePowt3win_mcHvById(int id);
  Future<List<Powt3win_mcHv_Model>> getPowt3win_mcHvTrNoID(int trNo);
  Future<List<Powt3win_mcHv_Model>> getPowt3win_mcHvSerialNo(String sNo);
  Future<List<Powt3win_mcHv_Model>> getpowt3winmchvEquipmentLists();
}

@DataClassName('Powt3winmcHvLocalData')
class Powt3win_mcHv_LocalDatasourceImpl extends Table
    implements Powt3win_mcHv_LocalDatasource {
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
  RealColumn get hv_1u_1vn => real()();
  @required
  RealColumn get hv_1v_1wn => real()();
  @required
  RealColumn get hv_1w_1un => real()();
  @required
  RealColumn get hv_1u => real()();
  @required
  RealColumn get hv_1v => real()();
  @required
  RealColumn get hv_1w => real()();
  @required
  RealColumn get hv_1n => real()();

  @override
  Future<Powt3win_mcHv_Model> getPowt3win_mcHv_ById(int id) async {
    Powt3winmcHvLocalData tPowt3win_mcHvData =
        await sl<AppDatabase>().getPowt3win_mcHvLocalDataWithId(id);
    Powt3win_mcHv_Model tPowt3win_mcHvModel = Powt3win_mcHv_Model(
      id: tPowt3win_mcHvData.id,
      databaseID: tPowt3win_mcHvData.databaseID,
      trNo: tPowt3win_mcHvData.trNo,
      serialNo: tPowt3win_mcHvData.serialNo,
      hv_1u_1vn: tPowt3win_mcHvData.hv_1u_1vn,
      hv_1v_1wn: tPowt3win_mcHvData.hv_1v_1wn,
      hv_1w_1un: tPowt3win_mcHvData.hv_1w_1un,
      hv_1u: tPowt3win_mcHvData.hv_1u,
      hv_1v: tPowt3win_mcHvData.hv_1v,
      hv_1w: tPowt3win_mcHvData.hv_1w,
      hv_1n: tPowt3win_mcHvData.hv_1n,
      tapPosition: tPowt3win_mcHvData.tapPosition,
    );
    return tPowt3win_mcHvModel;
  }

  @override
  Future<int> localPowt3win_mcHv(Powt3win_mcHv_Model p3wmchvtolocal) {
    return (sl<AppDatabase>().createPowt3win_mcHv(p3wmchvtolocal));
  }

  @override
  Future<void> updatePowt3win_mcHv(
      Powt3win_mcHv_Model p3wmchvtoupdate, int id) async {
    sl<AppDatabase>().updatePowt3win_mcHv(p3wmchvtoupdate, id);
  }

  @override
  Future<int> deletePowt3win_mcHvById(int id) {
    return (sl<AppDatabase>().deletePowt3win_mcHvById(id));
  }

  @override
  Future<List<Powt3win_mcHv_Model>> getPowt3win_mcHvTrNoID(int trNo) async {
    final tPowt3win_mcHv_data =
        await sl<AppDatabase>().getPowt3win_mcHvLocalDataWithtrNoID(trNo);

    List<Powt3win_mcHv_Model> tPowt3win_mcHv_Model =
        List<Powt3win_mcHv_Model>.empty(growable: true);
    for (var listEle in tPowt3win_mcHv_data) {
      tPowt3win_mcHv_Model.add(Powt3win_mcHv_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_1u_1vn: listEle.hv_1u_1vn,
        hv_1v_1wn: listEle.hv_1v_1wn,
        hv_1w_1un: listEle.hv_1w_1un,
        hv_1u: listEle.hv_1u,
        hv_1v: listEle.hv_1v,
        hv_1w: listEle.hv_1w,
        hv_1n: listEle.hv_1n,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tPowt3win_mcHv_Model;
  }

  @override
  Future<List<Powt3win_mcHv_Model>> getPowt3win_mcHvSerialNo(String sNo) async {
    final tPowt3win_mcHv_data =
        await sl<AppDatabase>().getPowt3win_mcHvLocalDataWithSerialNo(sNo);

    List<Powt3win_mcHv_Model> tPowt3win_mcHv_Model =
        List<Powt3win_mcHv_Model>.empty(growable: true);
    for (var listEle in tPowt3win_mcHv_data) {
      tPowt3win_mcHv_Model.add(Powt3win_mcHv_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_1u_1vn: listEle.hv_1u_1vn,
        hv_1v_1wn: listEle.hv_1v_1wn,
        hv_1w_1un: listEle.hv_1w_1un,
        hv_1u: listEle.hv_1u,
        hv_1v: listEle.hv_1v,
        hv_1w: listEle.hv_1w,
        hv_1n: listEle.hv_1n,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tPowt3win_mcHv_Model;
  }

  //getpowt3winmchvEquipmentLists
  @override
  Future<List<Powt3win_mcHv_Model>> getpowt3winmchvEquipmentLists() async {
    final tAcbCrData =
        await sl<AppDatabase>().getpowt3winmchvEquipmentListwithAll();
    List<Powt3win_mcHv_Model> tAcbCrTestModel =
        List<Powt3win_mcHv_Model>.empty(growable: true);
    for (var listEle in tAcbCrData) {
      tAcbCrTestModel.add(Powt3win_mcHv_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_1u_1vn: listEle.hv_1u_1vn,
        hv_1v_1wn: listEle.hv_1v_1wn,
        hv_1w_1un: listEle.hv_1w_1un,
        hv_1u: listEle.hv_1u,
        hv_1v: listEle.hv_1v,
        hv_1w: listEle.hv_1w,
        hv_1n: listEle.hv_1n,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tAcbCrTestModel;
  }
}

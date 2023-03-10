// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'package:drift/drift.dart';
import '../../../models/equipment/powt_3_winding/powt3win_schvlv_model.dart';
import '../../../../../../injection_container.dart';
import '../../test_report_local_datasource.dart';

abstract class Powt3winschvlvLocalDatasource {
  Future<Powt3winschvlvModel> getPowt3winschvlvById(int id);
  Future<int> localPowt3winschvlv(Powt3winschvlvModel p3wschvlvtolocal);
  Future<void> updatePowt3winschvlv(
      Powt3winschvlvModel p3wschvlvtoupdate, int id);
  Future<int> deletePowt3winschvlvById(int id);
  Future<List<Powt3winschvlvModel>> getPowt3winschvlvTrNoID(int trNo);
  Future<List<Powt3winschvlvModel>> getPowt3winschvlvSerialNo(String sNo);
  Future<List<Powt3winschvlvModel>> getpowt3winschvlvEquipmentLists();
}

@DataClassName('Powt3winschvlvLocalData')
class Powt3winschvlvLocalDatasourceImpl extends Table
    implements Powt3winschvlvLocalDatasource {
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
  RealColumn get hv_u => real()();
  @required
  RealColumn get hv_v => real()();
  @required
  RealColumn get hv_w => real()();
  @required
  RealColumn get hv_n => real()();
  @required
  RealColumn get lv_u => real()();
  @required
  RealColumn get lv_v => real()();
  @required
  RealColumn get lv_w => real()();
  @required
  RealColumn get lv_n => real()();

  @override
  Future<Powt3winschvlvModel> getPowt3winschvlvById(int id) async {
    Powt3winschvlvLocalData tPowt3winschvlvData =
        await sl<AppDatabase>().getPowt3winschvlvLocalDataWithId(id);
    Powt3winschvlvModel tPowt3winschvlvModel = Powt3winschvlvModel(
      id: tPowt3winschvlvData.id,
      databaseID: tPowt3winschvlvData.databaseID,
      trNo: tPowt3winschvlvData.trNo,
      serialNo: tPowt3winschvlvData.serialNo,
      tapPosition: tPowt3winschvlvData.tapPosition,
      hv_u: tPowt3winschvlvData.hv_u,
      hv_v: tPowt3winschvlvData.hv_v,
      hv_w: tPowt3winschvlvData.hv_w,
      hv_n: tPowt3winschvlvData.hv_n,
      lv_u: tPowt3winschvlvData.lv_u,
      lv_v: tPowt3winschvlvData.lv_v,
      lv_w: tPowt3winschvlvData.lv_w,
      lv_n: tPowt3winschvlvData.lv_n,
    );
    return tPowt3winschvlvModel;
  }

  @override
  Future<int> localPowt3winschvlv(Powt3winschvlvModel p3wschvlvtolocal) {
    return (sl<AppDatabase>().createPowt3winschvlv(p3wschvlvtolocal));
  }

  @override
  Future<void> updatePowt3winschvlv(
      Powt3winschvlvModel p3wschvlvtoupdate, int id) async {
    sl<AppDatabase>().updatePowt3winschvlv(p3wschvlvtoupdate, id);
  }

  @override
  Future<int> deletePowt3winschvlvById(int id) {
    return (sl<AppDatabase>().deletePowt3winschvlvById(id));
  }

  @override
  Future<List<Powt3winschvlvModel>> getPowt3winschvlvTrNoID(int ctNo) async {
    final tPowt3winschvlvdata =
        await sl<AppDatabase>().getPowt3winschvlvLocalDataWithtrNoID(ctNo);

    List<Powt3winschvlvModel> tPowt3winschvlvModel =
        List<Powt3winschvlvModel>.empty(growable: true);
    for (var listEle in tPowt3winschvlvdata) {
      tPowt3winschvlvModel.add(Powt3winschvlvModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        tapPosition: listEle.tapPosition,
        hv_u: listEle.hv_u,
        hv_v: listEle.hv_v,
        hv_w: listEle.hv_w,
        hv_n: listEle.hv_n,
        lv_u: listEle.lv_u,
        lv_v: listEle.lv_v,
        lv_w: listEle.lv_w,
        lv_n: listEle.lv_n,
      ));
    }
    return tPowt3winschvlvModel;
  }

  @override
  Future<List<Powt3winschvlvModel>> getPowt3winschvlvSerialNo(
      String sNo) async {
    final tPowt3winschvlvdata =
        await sl<AppDatabase>().getPowt3winschvlvLocalDataWithSerialNo(sNo);

    List<Powt3winschvlvModel> tPowt3winschvlvModel =
        List<Powt3winschvlvModel>.empty(growable: true);
    for (var listEle in tPowt3winschvlvdata) {
      tPowt3winschvlvModel.add(Powt3winschvlvModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        tapPosition: listEle.tapPosition,
        hv_u: listEle.hv_u,
        hv_v: listEle.hv_v,
        hv_w: listEle.hv_w,
        hv_n: listEle.hv_n,
        lv_u: listEle.lv_u,
        lv_v: listEle.lv_v,
        lv_w: listEle.lv_w,
        lv_n: listEle.lv_n,
      ));
    }
    return tPowt3winschvlvModel;
  }

  @override
  Future<List<Powt3winschvlvModel>> getpowt3winschvlvEquipmentLists() async {
    final tpowt3winschvlvData =
        await sl<AppDatabase>().getpowt3winschvlvEquipmentListwithAll();
    List<Powt3winschvlvModel> tpowt3winschvlvTestModel =
        List<Powt3winschvlvModel>.empty(growable: true);
    for (var listEle in tpowt3winschvlvData) {
      tpowt3winschvlvTestModel.add(Powt3winschvlvModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        tapPosition: listEle.tapPosition,
        hv_u: listEle.hv_u,
        hv_v: listEle.hv_v,
        hv_w: listEle.hv_w,
        hv_n: listEle.hv_n,
        lv_u: listEle.lv_u,
        lv_v: listEle.lv_v,
        lv_w: listEle.lv_w,
        lv_n: listEle.lv_n,
      ));
    }
    return tpowt3winschvlvTestModel;
  }
}

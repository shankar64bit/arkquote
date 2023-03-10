// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'package:drift/drift.dart';

import '../../../models/equipment/powt_3_winding/powt3win_mcIvT_model.dart';
import '../../test_report_local_datasource.dart';
// import '../../../models/equipment/powt_3_winding/powt3win_r_model.dart';
// import '../../test_report_local_datasource.dart';
import '../../../../../../injection_container.dart';

abstract class Powt3winmcIvTLocalDatasource {
  Future<Powt3winmcIvTModel> getPowt3winmcIvTById(int id);
  Future<int> localPowt3winmcIvT(Powt3winmcIvTModel p3wmcIvttolocal);
  Future<void> updatePowt3winmcIvT(Powt3winmcIvTModel p3wmcIvttoupdate, int id);
  Future<int> deletePowt3winmcIvTById(int id);
  Future<List<Powt3winmcIvTModel>> getPowt3winmcIvTTrNoID(int trNo);
  Future<List<Powt3winmcIvTModel>> getPowt3winmcIvTSerialNo(String sNo);
  // Future<List<Powt3winmcIvTModel>> getpowt3winmcIvtEquipmentLists();
}

@DataClassName('Powt3winmcIvTLocalData')
class Powt3winmcIvTLocalDatasourceImpl extends Table
    implements Powt3winmcIvTLocalDatasource {
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
  RealColumn get ivt_u_vn => real()();
  @required
  RealColumn get ivt_v_wn => real()();
  @required
  RealColumn get ivt_w_un => real()();
  @required
  RealColumn get ivt_u => real()();
  @required
  RealColumn get ivt_v => real()();
  @required
  RealColumn get ivt_w => real()();
  @required
  RealColumn get ivt_n => real()();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<Powt3winmcIvTModel> getPowt3winmcIvTById(int id) async {
    Powt3winmcIvTLocalData tPowt3winmcIvTData =
        await sl<AppDatabase>().getPowt3winmcIvTLocalDataWithId(id);
    Powt3winmcIvTModel tPowt3winmcIvTModel = Powt3winmcIvTModel(
      id: tPowt3winmcIvTData.id,
      databaseID: tPowt3winmcIvTData.databaseID,
      trNo: tPowt3winmcIvTData.trNo,
      serialNo: tPowt3winmcIvTData.serialNo,
      ivt_u_vn: tPowt3winmcIvTData.ivt_u_vn,
      ivt_v_wn: tPowt3winmcIvTData.ivt_v_wn,
      ivt_w_un: tPowt3winmcIvTData.ivt_w_un,
      ivt_u: tPowt3winmcIvTData.ivt_u,
      ivt_v: tPowt3winmcIvTData.ivt_v,
      ivt_w: tPowt3winmcIvTData.ivt_w,
      ivt_n: tPowt3winmcIvTData.ivt_n,
      equipmentUsed: tPowt3winmcIvTData.equipmentUsed,
      tapPosition: tPowt3winmcIvTData.tapPosition,
      updateDate: tPowt3winmcIvTData.updateDate,
    );
    return tPowt3winmcIvTModel;
  }

  @override
  Future<int> localPowt3winmcIvT(Powt3winmcIvTModel p3wmcIvttolocal) {
    return (sl<AppDatabase>().createPowt3winmcIvT(p3wmcIvttolocal));
  }

  @override
  Future<void> updatePowt3winmcIvT(
      Powt3winmcIvTModel p3wmcIvttoupdate, int id) async {
    sl<AppDatabase>().updatePowt3winmcIvT(p3wmcIvttoupdate, id);
  }

  @override
  Future<int> deletePowt3winmcIvTById(int id) {
    return (sl<AppDatabase>().deletePowt3winmcIvTById(id));
  }

  @override
  Future<List<Powt3winmcIvTModel>> getPowt3winmcIvTTrNoID(int ctNo) async {
    final tPowt3winmcIvTdata =
        await sl<AppDatabase>().getPowt3winmcIvTLocalDataWithtrNoID(ctNo);

    List<Powt3winmcIvTModel> tPowt3winmcIvTModel =
        List<Powt3winmcIvTModel>.empty(growable: true);
    for (var listEle in tPowt3winmcIvTdata) {
      tPowt3winmcIvTModel.add(Powt3winmcIvTModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        ivt_u_vn: listEle.ivt_u_vn,
        ivt_v_wn: listEle.ivt_v_wn,
        ivt_w_un: listEle.ivt_w_un,
        ivt_u: listEle.ivt_u,
        ivt_v: listEle.ivt_v,
        ivt_w: listEle.ivt_w,
        ivt_n: listEle.ivt_n,
        equipmentUsed: listEle.equipmentUsed,
        tapPosition: listEle.tapPosition,
        updateDate: listEle.updateDate,
      ));
    }
    return tPowt3winmcIvTModel;
  }

  @override
  Future<List<Powt3winmcIvTModel>> getPowt3winmcIvTSerialNo(String sNo) async {
    final tPowt3winmcIvTdata =
        await sl<AppDatabase>().getPowt3winmcIvTLocalDataWithSerialNo(sNo);

    List<Powt3winmcIvTModel> tPowt3winmcIvTModel =
        List<Powt3winmcIvTModel>.empty(growable: true);
    for (var listEle in tPowt3winmcIvTdata) {
      tPowt3winmcIvTModel.add(Powt3winmcIvTModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        ivt_u_vn: listEle.ivt_u_vn,
        ivt_v_wn: listEle.ivt_v_wn,
        ivt_w_un: listEle.ivt_w_un,
        ivt_u: listEle.ivt_u,
        ivt_v: listEle.ivt_v,
        ivt_w: listEle.ivt_w,
        ivt_n: listEle.ivt_n,
        tapPosition: listEle.tapPosition,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tPowt3winmcIvTModel;
  }

  @override
  Future<List<Powt3winmcIvTModel>> getpowt3winmcIvtEquipmentLists() async {
    final tp3wmcIvtData =
        await sl<AppDatabase>().getpowt3winmcIvtEquipmentListwithAll();
    List<Powt3winmcIvTModel> tp3wmcIvtTestModel =
        List<Powt3winmcIvTModel>.empty(growable: true);
    for (var listEle in tp3wmcIvtData) {
      tp3wmcIvtTestModel.add(Powt3winmcIvTModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        ivt_u_vn: listEle.ivt_u_vn,
        ivt_v_wn: listEle.ivt_v_wn,
        ivt_w_un: listEle.ivt_w_un,
        ivt_u: listEle.ivt_u,
        ivt_v: listEle.ivt_v,
        ivt_w: listEle.ivt_w,
        ivt_n: listEle.ivt_n,
        tapPosition: listEle.tapPosition,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tp3wmcIvtTestModel;
  }
}

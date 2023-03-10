// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'package:drift/drift.dart';
import '../../../models/equipment/powt_3_winding/powt3win_schvivt_model.dart';
import '../../../../../../injection_container.dart';
import '../../test_report_local_datasource.dart';

abstract class Powt3winschvivtLocalDatasource {
  Future<Powt3winschvivtModel> getPowt3winschvivtById(int id);
  Future<int> localPowt3winschvivt(Powt3winschvivtModel p3wschvivttolocal);
  Future<void> updatePowt3winschvivt(
      Powt3winschvivtModel p3wschvivttoupdate, int id);
  Future<int> deletePowt3winschvivtById(int id);
  Future<List<Powt3winschvivtModel>> getPowt3winschvivtTrNoID(int trNo);
  Future<List<Powt3winschvivtModel>> getPowt3winschvivtSerialNo(String sNo);
  Future<List<Powt3winschvivtModel>> getpowt3winschvivtEquipmentLists();
}

@DataClassName('Powt3winschvivtLocalData')
class Powt3winschvivtLocalDatasourceImpl extends Table
    implements Powt3winschvivtLocalDatasource {
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
  Future<Powt3winschvivtModel> getPowt3winschvivtById(int id) async {
    Powt3winschvivtLocalData tPowt3winschvivtData =
        await sl<AppDatabase>().getPowt3winschvivtLocalDataWithId(id);
    Powt3winschvivtModel tPowt3winschvivtModel = Powt3winschvivtModel(
      id: tPowt3winschvivtData.id,
      databaseID: tPowt3winschvivtData.databaseID,
      trNo: tPowt3winschvivtData.trNo,
      serialNo: tPowt3winschvivtData.serialNo,
      hv_u: tPowt3winschvivtData.hv_u,
      hv_v: tPowt3winschvivtData.hv_v,
      hv_w: tPowt3winschvivtData.hv_w,
      hv_n: tPowt3winschvivtData.hv_n,
      ivt_u: tPowt3winschvivtData.ivt_u,
      ivt_v: tPowt3winschvivtData.ivt_v,
      ivt_w: tPowt3winschvivtData.ivt_w,
      ivt_n: tPowt3winschvivtData.ivt_n,
      equipmentUsed: tPowt3winschvivtData.equipmentUsed,
      tapPosition: tPowt3winschvivtData.tapPosition,
      updateDate: tPowt3winschvivtData.updateDate,
    );
    return tPowt3winschvivtModel;
  }

  @override
  Future<int> localPowt3winschvivt(
      Powt3winschvivtModel p3wschvivttolocal) {
    return (sl<AppDatabase>().createPowt3winschvivt(p3wschvivttolocal));
  }

  @override
  Future<void> updatePowt3winschvivt(
      Powt3winschvivtModel p3wschvivttoupdate, int id) async {
    sl<AppDatabase>().updatePowt3winschvivt(p3wschvivttoupdate, id);
  }

  @override
  Future<int> deletePowt3winschvivtById(int id) {
    return (sl<AppDatabase>().deletePowt3winschvivtById(id));
  }

  @override
  Future<List<Powt3winschvivtModel>> getPowt3winschvivtTrNoID(int ctNo) async {
    final tPowt3winschvivtdata =
        await sl<AppDatabase>().getPowt3winschvivtLocalDataWithtrNoID(ctNo);

    List<Powt3winschvivtModel> tPowt3winschvivtModel =
        List<Powt3winschvivtModel>.empty(growable: true);
    for (var listEle in tPowt3winschvivtdata) {
      tPowt3winschvivtModel.add(Powt3winschvivtModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_u: listEle.hv_u,
        hv_v: listEle.hv_v,
        hv_w: listEle.hv_w,
        hv_n: listEle.hv_n,
        ivt_u: listEle.ivt_u,
        ivt_v: listEle.ivt_v,
        ivt_w: listEle.ivt_w,
        ivt_n: listEle.ivt_n,
        equipmentUsed: listEle.equipmentUsed,
        tapPosition: listEle.tapPosition,
        updateDate: listEle.updateDate,
      ));
    }
    return tPowt3winschvivtModel;
  }

  @override
  Future<List<Powt3winschvivtModel>> getPowt3winschvivtSerialNo(
      String sNo) async {
    final tPowt3winschvivtdata =
        await sl<AppDatabase>().getPowt3winschvivtLocalDataWithSerialNo(sNo);

    List<Powt3winschvivtModel> tPowt3winschvivtModel =
        List<Powt3winschvivtModel>.empty(growable: true);
    for (var listEle in tPowt3winschvivtdata) {
      tPowt3winschvivtModel.add(Powt3winschvivtModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_u: listEle.hv_u,
        hv_v: listEle.hv_v,
        hv_w: listEle.hv_w,
        hv_n: listEle.hv_n,
        ivt_u: listEle.ivt_u,
        ivt_v: listEle.ivt_v,
        ivt_w: listEle.ivt_w,
        ivt_n: listEle.ivt_n,
        tapPosition: listEle.tapPosition,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tPowt3winschvivtModel;
  }

  @override
  Future<List<Powt3winschvivtModel>> getpowt3winschvivtEquipmentLists() async {
    final tp3wschhvivtData =
        await sl<AppDatabase>().getpowt3winschvivtEquipmentListwithAll();
    List<Powt3winschvivtModel> tp3wschvivtTestModel =
        List<Powt3winschvivtModel>.empty(growable: true);
    for (var listEle in tp3wschhvivtData) {
      tp3wschvivtTestModel.add(Powt3winschvivtModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_u: listEle.hv_u,
        hv_v: listEle.hv_v,
        hv_w: listEle.hv_w,
        hv_n: listEle.hv_n,
        ivt_u: listEle.ivt_u,
        ivt_v: listEle.ivt_v,
        ivt_w: listEle.ivt_w,
        ivt_n: listEle.ivt_n,
        equipmentUsed: listEle.equipmentUsed,
        tapPosition: listEle.tapPosition,
        updateDate: listEle.updateDate,
      ));
    }
    return tp3wschvivtTestModel;
  }
}

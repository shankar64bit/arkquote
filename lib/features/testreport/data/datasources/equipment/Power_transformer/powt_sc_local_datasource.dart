// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../models/equipment/powt/powt_sc_model.dart';
import '../../test_report_local_datasource.dart';
import '../../../../../../injection_container.dart';

abstract class PowtscLocalDatasource {
  Future<PowtscModel> getPowtsc_ById(int id);
  Future<int> localPowtsc(PowtscModel powtsctolocal);
  Future<void> updatePowtsc(PowtscModel powtsctoupdate, int id);
  Future<int> deletePowtscById(int id);
  Future<List<PowtscModel>> getPowtscTrNoID(int trNo);
  Future<List<PowtscModel>> getPowtscSerialNo(String sNo);
  Future<List<PowtscModel>> getpowtscEquipmentLists();
}

@DataClassName('PowtscLocalData')
class PowtscLocalDatasourceImpl extends Table implements PowtscLocalDatasource {
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
  RealColumn get hv_1u => real()();
  @required
  RealColumn get hv_1v => real()();
  @required
  RealColumn get hv_1w => real()();
  @required
  RealColumn get hv_1n => real()();
  @required
  RealColumn get lv_2u => real()();
  @required
  RealColumn get lv_2v => real()();
  @required
  RealColumn get lv_2w => real()();
  @required
  RealColumn get lv_2n => real()();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<PowtscModel> getPowtsc_ById(int id) async {
    PowtscLocalData tPowtscData =
        await sl<AppDatabase>().getPowtscLocalDataWithId(id);
    PowtscModel tPowtscModel = PowtscModel(
      id: tPowtscData.id,
      databaseID: tPowtscData.databaseID,
      trNo: tPowtscData.trNo,
      serialNo: tPowtscData.serialNo,
      hv_1u: tPowtscData.hv_1u,
      hv_1v: tPowtscData.hv_1v,
      hv_1w: tPowtscData.hv_1w,
      hv_1n: tPowtscData.hv_1n,
      lv_2u: tPowtscData.lv_2u,
      lv_2v: tPowtscData.lv_2v,
      lv_2w: tPowtscData.lv_2w,
      lv_2n: tPowtscData.lv_2n,
      equipmentUsed: tPowtscData.equipmentUsed,
      tapPosition: tPowtscData.tapPosition,
      updateDate: tPowtscData.updateDate,
    );
    return tPowtscModel;
  }

  @override
  Future<int> localPowtsc(PowtscModel powtsctolocal) {
    return (sl<AppDatabase>().createPowtsc(powtsctolocal));
  }

  @override
  Future<void> updatePowtsc(PowtscModel powtsctoupdate, int id) async {
    sl<AppDatabase>().updatePowtsc(powtsctoupdate, id);
  }

  @override
  Future<int> deletePowtscById(int id) {
    return (sl<AppDatabase>().deletePowtscById(id));
  }

  @override
  Future<List<PowtscModel>> getPowtscTrNoID(int trNo) async {
    final tPowtsc_data =
        await sl<AppDatabase>().getPowtscLocalDataWithtrNoID(trNo);

    List<PowtscModel> tPowtsc_Model = List<PowtscModel>.empty(growable: true);
    for (var listEle in tPowtsc_data) {
      tPowtsc_Model.add(PowtscModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_1u: listEle.hv_1u,
        hv_1v: listEle.hv_1v,
        hv_1w: listEle.hv_1w,
        hv_1n: listEle.hv_1n,
        lv_2u: listEle.lv_2u,
        lv_2v: listEle.lv_2v,
        lv_2w: listEle.lv_2w,
        lv_2n: listEle.lv_2n,
        equipmentUsed: listEle.equipmentUsed,
        tapPosition: listEle.tapPosition,
        updateDate: listEle.updateDate,
      ));
    }
    return tPowtsc_Model;
  }

  @override
  Future<List<PowtscModel>> getPowtscSerialNo(String sNo) async {
    final tPowtsc_data =
        await sl<AppDatabase>().getPowtscLocalDataWithSerialNo(sNo);

    List<PowtscModel> tPowtsc_Model = List<PowtscModel>.empty(growable: true);
    for (var listEle in tPowtsc_data) {
      tPowtsc_Model.add(PowtscModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_1u: listEle.hv_1u,
        hv_1v: listEle.hv_1v,
        hv_1w: listEle.hv_1w,
        hv_1n: listEle.hv_1n,
        lv_2u: listEle.lv_2u,
        lv_2v: listEle.lv_2v,
        lv_2w: listEle.lv_2w,
        lv_2n: listEle.lv_2n,
        tapPosition: listEle.tapPosition,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tPowtsc_Model;
  }

  @override
  Future<List<PowtscModel>> getpowtscEquipmentLists() async {
    final tpowtscData = await sl<AppDatabase>().getPowtscEquipmentListwithAll();
    List<PowtscModel> tpowtscTestModel =
        List<PowtscModel>.empty(growable: true);
    for (var listEle in tpowtscData) {
      tpowtscTestModel.add(PowtscModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_1u: listEle.hv_1u,
        hv_1v: listEle.hv_1v,
        hv_1w: listEle.hv_1w,
        hv_1n: listEle.hv_1n,
        lv_2u: listEle.lv_2u,
        lv_2v: listEle.lv_2v,
        lv_2w: listEle.lv_2w,
        lv_2n: listEle.lv_2n,
        tapPosition: listEle.tapPosition,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tpowtscTestModel;
  }
}

// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/powt/powt_wrLv_model.dart';
import '../../test_report_local_datasource.dart';

abstract class PowtwrLvLocalDatasource {
  Future<PowtwrLvModel> getPowtwrLv_ById(int id);
  Future<int> localPowtwrLv(PowtwrLvModel powtwrlvtolocal);
  Future<void> updatePowtwrLv(PowtwrLvModel powtwrlvtoupdate, int id);
  Future<int> deletePowtwrLvById(int id);
  Future<List<PowtwrLvModel>> getPowtwrLvTrNoID(int trNo);
  Future<List<PowtwrLvModel>> getPowtwrLvSerialNo(String sNo);
  Future<List<PowtwrLvModel>> getPowtWRLVEquipmentLists();
}

@DataClassName('PowtwrLvLocalData')
class PowtwrLvLocalDatasourceImpl extends Table
    implements PowtwrLvLocalDatasource {
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
  RealColumn get lv_r_2u_2vn => real()();
  @required
  RealColumn get lv_r_2v_2wn => real()();
  @required
  RealColumn get lv_r_2w_2un => real()();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<PowtwrLvModel> getPowtwrLv_ById(int id) async {
    PowtwrLvLocalData tPowtwrLVData =
        await sl<AppDatabase>().getPowtwrLvLocalDataWithId(id);
    PowtwrLvModel tPowtwrLvModel = PowtwrLvModel(
      id: tPowtwrLVData.id,
      databaseID: tPowtwrLVData.databaseID,
      trNo: tPowtwrLVData.trNo,
      serialNo: tPowtwrLVData.serialNo,
      lv_r_2u_2vn: tPowtwrLVData.lv_r_2u_2vn,
      lv_r_2v_2wn: tPowtwrLVData.lv_r_2v_2wn,
      lv_r_2w_2un: tPowtwrLVData.lv_r_2w_2un,
      equipmentUsed: tPowtwrLVData.equipmentUsed,
      tapPosition: tPowtwrLVData.tapPosition,
      updateDate: tPowtwrLVData.updateDate,
    );
    return tPowtwrLvModel;
  }

  @override
  Future<int> localPowtwrLv(PowtwrLvModel powtwrlvtolocal) {
    return (sl<AppDatabase>().createPowtwrLv(powtwrlvtolocal));
  }

  @override
  Future<void> updatePowtwrLv(PowtwrLvModel powtwrlvtoupdate, int id) async {
    sl<AppDatabase>().updatePowtwrLv(powtwrlvtoupdate, id);
  }

  @override
  Future<int> deletePowtwrLvById(int id) {
    return (sl<AppDatabase>().deletePowtwrLvById(id));
  }

  @override
  Future<List<PowtwrLvModel>> getPowtwrLvTrNoID(int trNo) async {
    final tPowtwrLv_data =
        await sl<AppDatabase>().getPowtwrLvLocalDataWithtrNoID(trNo);

    List<PowtwrLvModel> tPowtwrLv_Model =
        List<PowtwrLvModel>.empty(growable: true);
    for (var listEle in tPowtwrLv_data) {
      tPowtwrLv_Model.add(PowtwrLvModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        lv_r_2u_2vn: listEle.lv_r_2u_2vn,
        lv_r_2v_2wn: listEle.lv_r_2v_2wn,
        lv_r_2w_2un: listEle.lv_r_2w_2un,
        equipmentUsed: listEle.equipmentUsed,
        tapPosition: listEle.tapPosition,
        updateDate: listEle.updateDate,
      ));
    }
    return tPowtwrLv_Model;
  }

  @override
  Future<List<PowtwrLvModel>> getPowtwrLvSerialNo(String sNo) async {
    final tPowtwrLv_data =
        await sl<AppDatabase>().getPowtwrLvLocalDataWithSerialNo(sNo);

    List<PowtwrLvModel> tPowtwrLv_Model =
        List<PowtwrLvModel>.empty(growable: true);
    for (var listEle in tPowtwrLv_data) {
      tPowtwrLv_Model.add(PowtwrLvModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        lv_r_2u_2vn: listEle.lv_r_2u_2vn,
        lv_r_2v_2wn: listEle.lv_r_2v_2wn,
        lv_r_2w_2un: listEle.lv_r_2w_2un,
        tapPosition: listEle.tapPosition,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tPowtwrLv_Model;
  }

  @override
  Future<List<PowtwrLvModel>> getPowtWRLVEquipmentLists() async {
    final tpowtwrlvData = await sl<AppDatabase>().getWrLvEquipmentListwithAll();
    List<PowtwrLvModel> tpowtwrlvTestModel =
        List<PowtwrLvModel>.empty(growable: true);
    for (var element in tpowtwrlvData) {
      tpowtwrlvTestModel.add(PowtwrLvModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        lv_r_2u_2vn: element.lv_r_2u_2vn,
        lv_r_2v_2wn: element.lv_r_2v_2wn,
        lv_r_2w_2un: element.lv_r_2w_2un,
        equipmentUsed: element.equipmentUsed,
        tapPosition: element.tapPosition,
        updateDate: element.updateDate,
      ));
    }
    return tpowtwrlvTestModel;
  }
}

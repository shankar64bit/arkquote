// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/AT/AT_wrLv_model.dart';
import '../../test_report_local_datasource.dart';

abstract class ATwrLv_LocalDatasource {
  Future<ATwrLv_Model> getATwrLv_ById(int id);
  Future<int> localATwrLv(ATwrLv_Model atwrLvtolocal);
  Future<void> updateATwrLv(ATwrLv_Model atwrLvtoupdate, int id);
  Future<int> deleteATwrLvById(int id);
  Future<List<ATwrLv_Model>> getATwrLvTrNoID(int trNo);
  Future<List<ATwrLv_Model>> getATwrLvSerialNo(String sNo);
  Future<List<ATwrLv_Model>> getATwrLvEquipmentLists();
}

@DataClassName('ATwrLvLocalData')
class ATwrLv_LocalDatasourceImpl extends Table
    implements ATwrLv_LocalDatasource {
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
  RealColumn get lv_2u_2v => real()();
  @required
  RealColumn get lv_2v_2w => real()();
  @required
  RealColumn get lv_2w_2u => real()();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<ATwrLv_Model> getATwrLv_ById(int id) async {
    ATwrLvLocalData tATwrLVData =
        await sl<AppDatabase>().getATwrLvLocalDataWithId(id);
    ATwrLv_Model tATwrLvModel = ATwrLv_Model(
      id: tATwrLVData.id,
      databaseID: tATwrLVData.databaseID,
      trNo: tATwrLVData.trNo,
      serialNo: tATwrLVData.serialNo,
      lv_2u_2v: tATwrLVData.lv_2u_2v,
      lv_2v_2w: tATwrLVData.lv_2v_2w,
      lv_2w_2u: tATwrLVData.lv_2w_2u,
      equipmentUsed: tATwrLVData.equipmentUsed,
      tapPosition: tATwrLVData.tapPosition,
      updateDate: tATwrLVData.updateDate,
    );
    return tATwrLvModel;
  }

  @override
  Future<int> localATwrLv(ATwrLv_Model atwrLvtolocal) {
    return (sl<AppDatabase>().createATwrLv(atwrLvtolocal));
  }

  @override
  Future<void> updateATwrLv(ATwrLv_Model atwrLvtoupdate, int id) async {
    sl<AppDatabase>().updateATwrLv(atwrLvtoupdate, id);
  }

  @override
  Future<int> deleteATwrLvById(int id) {
    return (sl<AppDatabase>().deleteATwrLvById(id));
  }

  @override
  Future<List<ATwrLv_Model>> getATwrLvTrNoID(int trNo) async {
    final tATwrLv_data =
        await sl<AppDatabase>().getATwrLvLocalDataWithtrNoID(trNo);

    List<ATwrLv_Model> tATwrLv_Model = List<ATwrLv_Model>.empty(growable: true);
    for (var listEle in tATwrLv_data) {
      tATwrLv_Model.add(ATwrLv_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        lv_2u_2v: listEle.lv_2u_2v,
        lv_2v_2w: listEle.lv_2v_2w,
        lv_2w_2u: listEle.lv_2w_2u,
        equipmentUsed: listEle.equipmentUsed,
        tapPosition: listEle.tapPosition,
        updateDate: listEle.updateDate,
      ));
    }
    return tATwrLv_Model;
  }

  @override
  Future<List<ATwrLv_Model>> getATwrLvSerialNo(String sNo) async {
    final tATwrLv_data =
        await sl<AppDatabase>().getATwrLvLocalDataWithSerialNo(sNo);

    List<ATwrLv_Model> tATwrLv_Model = List<ATwrLv_Model>.empty(growable: true);
    for (var listEle in tATwrLv_data) {
      tATwrLv_Model.add(ATwrLv_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        lv_2u_2v: listEle.lv_2u_2v,
        lv_2v_2w: listEle.lv_2v_2w,
        lv_2w_2u: listEle.lv_2w_2u,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tATwrLv_Model;
  }

  @override
  Future<List<ATwrLv_Model>> getATwrLvEquipmentLists() async {
    final tATwrLvData = await sl<AppDatabase>().getATwrLvEquipmentListwithAll();
    List<ATwrLv_Model> tATwrLvTestModel =
        List<ATwrLv_Model>.empty(growable: true);
    for (var element in tATwrLvData) {
      tATwrLvTestModel.add(ATwrLv_Model(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        lv_2u_2v: element.lv_2u_2v,
        lv_2v_2w: element.lv_2v_2w,
        lv_2w_2u: element.lv_2w_2u,
        tapPosition: element.tapPosition,
        equipmentUsed: element.equipmentUsed,
      ));
    }
    return tATwrLvTestModel;
  }
}

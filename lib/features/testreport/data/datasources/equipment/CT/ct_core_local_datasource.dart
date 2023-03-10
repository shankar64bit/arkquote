// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/CT/ct_core_model.dart';
import '../../test_report_local_datasource.dart';

abstract class CT_core_LocalDatasource {
  Future<CT_core_Model> getCT_core_ById(int id);
  Future<int> localCT_core(CT_core_Model ctcoretolocal);
  Future<void> updateCT_core(CT_core_Model ctcoretoupdate, int id);
  Future<int> deleteCT_coreById(int id);
  Future<List<CT_core_Model>> getCTcorectNoID(int ctNo);
  Future<List<CT_core_Model>> getctcoreEquipmentLists();
}

@DataClassName('CTcoreLocalData')
class CT_core_LocalDatasourceImpl extends Table
    implements CT_core_LocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get coreNo => integer()();
  @required
  TextColumn get coreClass => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get burden => integer()();
  @required
  IntColumn get ctNo => integer()();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<CT_core_Model> getCT_core_ById(int id) async {
    CTcoreLocalData tCT_coreData =
        await sl<AppDatabase>().getCT_coreLocalDataWithId(id);
    CT_core_Model tCT_coreModel = CT_core_Model(
      id: tCT_coreData.id,
      databaseID: tCT_coreData.databaseID,
      burden: tCT_coreData.burden,
      coreClass: tCT_coreData.coreClass,
      coreNo: tCT_coreData.coreNo,
      ctNo: tCT_coreData.ctNo,
      updateDate: tCT_coreData.updateDate,
    );
    return tCT_coreModel;
  }

  @override
  Future<int> localCT_core(CT_core_Model ctcoretolocal) {
    return (sl<AppDatabase>().createCT_core(ctcoretolocal));
  }

  @override
  Future<void> updateCT_core(CT_core_Model ctcoretoupdate, int id) async {
    return (sl<AppDatabase>().updateCT_core(ctcoretoupdate, id));
  }

  @override
  Future<int> deleteCT_coreById(int id) {
    return (sl<AppDatabase>().deleteCT_coreById(id));
  }

  @override
  Future<List<CT_core_Model>> getCTcorectNoID(int ctNo) async {
    final tCTcore_data =
        await sl<AppDatabase>().getCTcoreLocalDataWithctNoID(ctNo);

    List<CT_core_Model> tCT_core_Model =
        List<CT_core_Model>.empty(growable: true);
    for (var listEle in tCTcore_data) {
      tCT_core_Model.add(CT_core_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        burden: listEle.burden,
        coreClass: listEle.coreClass,
        coreNo: listEle.coreNo,
        ctNo: listEle.ctNo,
        updateDate: listEle.updateDate,
      ));
    }
    return tCT_core_Model;
  }

  @override
  Future<List<CT_core_Model>> getctcoreEquipmentLists() async {
    final tCTcoreData = await sl<AppDatabase>().getctcoreEquipmentListwithAll();
    List<CT_core_Model> tCTcoreTestModel =
        List<CT_core_Model>.empty(growable: true);
    for (var element in tCTcoreData) {
      tCTcoreTestModel.add(CT_core_Model(
        id: element.id,
        databaseID: element.databaseID,
        burden: element.burden,
        coreClass: element.coreClass,
        coreNo: element.coreNo,
        ctNo: element.ctNo,
        updateDate: element.updateDate,
      ));
    }
    return tCTcoreTestModel;
  }
}

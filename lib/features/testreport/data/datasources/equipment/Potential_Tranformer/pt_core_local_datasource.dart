// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/PT/pt_core_model.dart';
import '../../test_report_local_datasource.dart';

abstract class PT_core_LocalDatasource {
  Future<PT_core_Model> getPT_core_ById(int id);
  Future<int> localPT_core(PT_core_Model ptcoretolocal);
  Future<void> updatePT_core(PT_core_Model ptcoretoupdate, int id);
  Future<int> deletePT_coreById(int id);
  Future<List<PT_core_Model>> getPTcoreptNoID(int ptNo);
  Future<List<PT_core_Model>> getPTcoreEquipmentLists();
}

@DataClassName('PTcoreLocalData')
class PT_core_LocalDatasourceImpl extends Table
    implements PT_core_LocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get coreNo => integer()();
  @required
  TextColumn get coreName => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get ratio => integer()();
  @required
  TextColumn get coreClass => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get burden => integer()();
  @required
  IntColumn get ptNo => integer()();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<PT_core_Model> getPT_core_ById(int id) async {
    PTcoreLocalData tPT_coreData =
        await sl<AppDatabase>().getPT_coreLocalDataWithId(id);
    PT_core_Model tPT_coreModel = PT_core_Model(
      id: tPT_coreData.id,
      databaseID: tPT_coreData.databaseID,
      burden: tPT_coreData.burden,
      coreName: tPT_coreData.coreName,
      ratio: tPT_coreData.ratio,
      coreClass: tPT_coreData.coreClass,
      coreNo: tPT_coreData.coreNo,
      ptNo: tPT_coreData.ptNo,
      updateDate: tPT_coreData.updateDate,
    );
    return tPT_coreModel;
  }

  @override
  Future<int> localPT_core(PT_core_Model ptcoretolocal) {
    return (sl<AppDatabase>().createPT_core(ptcoretolocal));
  }

  @override
  Future<void> updatePT_core(PT_core_Model ptcoretoupdate, int id) async {
    sl<AppDatabase>().updatePT_core(ptcoretoupdate, id);
  }

  @override
  Future<int> deletePT_coreById(int id) {
    return (sl<AppDatabase>().deletePT_coreById(id));
  }

  @override
  Future<List<PT_core_Model>> getPTcoreptNoID(int ptNo) async {
    final tPTcore_data =
        await sl<AppDatabase>().getPTcoreLocalDataWithptNoID(ptNo);

    List<PT_core_Model> tPT_core_Model =
        List<PT_core_Model>.empty(growable: true);
    for (var listEle in tPTcore_data) {
      tPT_core_Model.add(PT_core_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        burden: listEle.burden,
        coreName: listEle.coreName,
        ratio: listEle.ratio,
        coreClass: listEle.coreClass,
        coreNo: listEle.coreNo,
        ptNo: listEle.ptNo,
        updateDate: listEle.updateDate,
      ));
    }
    return tPT_core_Model;
  }

  @override
  Future<List<PT_core_Model>> getPTcoreEquipmentLists() async {
    final tPTcoreData = await sl<AppDatabase>().getPTcoreEquipmentListwithAll();
    List<PT_core_Model> tPTcoreTestModel =
        List<PT_core_Model>.empty(growable: true);
    for (var element in tPTcoreData) {
      tPTcoreTestModel.add(PT_core_Model(
        id: element.id,
        databaseID: element.databaseID,
        burden: element.burden,
        coreName: element.coreName,
        ratio: element.ratio,
        coreClass: element.coreClass,
        coreNo: element.coreNo,
        ptNo: element.ptNo,
        updateDate: element.updateDate,
      ));
    }
    return tPTcoreTestModel;
  }
}

// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/AT/AT_wrHv_model.dart';
import '../../test_report_local_datasource.dart';
// import '../../../../../../injection_container.dart';
// import '../../test_report_local_datasource.dart';

abstract class ATwrHv_LocalDatasource {
  Future<ATwrHv_Model> getATwrHv_ById(int id);
  Future<int> localATwrHv(ATwrHv_Model atwrHvtolocal);
  Future<void> updateATwrHv(ATwrHv_Model atwrHvtoupdate, int id);
  Future<int> deleteATwrHvById(int id);
  Future<List<ATwrHv_Model>> getATwrHvTrNoID(int trNo);
  Future<List<ATwrHv_Model>> getATwrHvSerialNo(String serialNo);
  Future<List<ATwrHv_Model>> getATwrHvEquipmentLists();
}

@DataClassName('ATwrHvLocalData')
class ATwrHv_LocalDatasourceImpl extends Table
    implements ATwrHv_LocalDatasource {
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

  @override
  Future<ATwrHv_Model> getATwrHv_ById(int id) async {
    ATwrHvLocalData tATwrHVData =
        await sl<AppDatabase>().getATwrHvLocalDataWithId(id);
    ATwrHv_Model tATwrHvModel = ATwrHv_Model(
      id: tATwrHVData.id,
      databaseID: tATwrHVData.databaseID,
      trNo: tATwrHVData.trNo,
      serialNo: tATwrHVData.serialNo,
      hv_1u_1n: tATwrHVData.hv_1u_1n,
      hv_1v_1n: tATwrHVData.hv_1v_1n,
      hv_1w_1n: tATwrHVData.hv_1w_1n,
      tapPosition: tATwrHVData.tapPosition,
    );
    return tATwrHvModel;
  }

  @override
  Future<int> localATwrHv(ATwrHv_Model atwrHvtolocal) {
    return (sl<AppDatabase>().createATwrHv(atwrHvtolocal));
  }

  @override
  Future<void> updateATwrHv(ATwrHv_Model atwrHvtoupdate, int id) async {
    sl<AppDatabase>().updateATwrHv(atwrHvtoupdate, id);
  }

  @override
  Future<int> deleteATwrHvById(int id) {
    return (sl<AppDatabase>().deleteATwrHvById(id));
  }

  @override
  Future<List<ATwrHv_Model>> getATwrHvTrNoID(int trNo) async {
    final tATwrHv_data =
        await sl<AppDatabase>().getATwrHvLocalDataWithtrNoID(trNo);

    List<ATwrHv_Model> tATwrHv_Model = List<ATwrHv_Model>.empty(growable: true);
    for (var listEle in tATwrHv_data) {
      tATwrHv_Model.add(ATwrHv_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_1u_1n: listEle.hv_1u_1n,
        hv_1v_1n: listEle.hv_1v_1n,
        hv_1w_1n: listEle.hv_1w_1n,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tATwrHv_Model;
  }

  @override
  Future<List<ATwrHv_Model>> getATwrHvSerialNo(String serialNo) async {
    final tATwrHv_data =
        await sl<AppDatabase>().getATwrHvLocalDataWithSerialNo(serialNo);

    List<ATwrHv_Model> tATwrHv_Model = List<ATwrHv_Model>.empty(growable: true);
    for (var listEle in tATwrHv_data) {
      tATwrHv_Model.add(ATwrHv_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_1u_1n: listEle.hv_1u_1n,
        hv_1v_1n: listEle.hv_1v_1n,
        hv_1w_1n: listEle.hv_1w_1n,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tATwrHv_Model;
  }

  @override
  Future<List<ATwrHv_Model>> getATwrHvEquipmentLists() async {
    final tATwrHvData = await sl<AppDatabase>().getATwrHvEquipmentListwithAll();
    List<ATwrHv_Model> tATwrHvTestModel =
        List<ATwrHv_Model>.empty(growable: true);
    for (var element in tATwrHvData) {
      tATwrHvTestModel.add(ATwrHv_Model(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        hv_1u_1n: element.hv_1u_1n,
        hv_1v_1n: element.hv_1v_1n,
        hv_1w_1n: element.hv_1w_1n,
        tapPosition: element.tapPosition,
      ));
    }
    return tATwrHvTestModel;
  }
}

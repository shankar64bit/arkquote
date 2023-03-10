// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/PT/pt_core_wr_model.dart';
import '../../test_report_local_datasource.dart';

// import '../../../../../../injection_container.dart';
// import '../../../models/equipment/CT/ct_core_wr_model.dart';
// import '../../test_report_local_datasource.dart';

abstract class PTcoreWRLocalDatasource {
  Future<PTcoreWRModel> getPTcoreWR_ById(int id);
  Future<int> localPTcoreWR(PTcoreWRModel ptwrtolocal);
  Future<void> updatePTcoreWR(PTcoreWRModel ptwrtoupdate, int id);
  Future<int> deletePTcoreWRById(int id);
  Future<List<PTcoreWRModel>> getPTcoreWR_SerialNo(String serialNo);
  Future<List<PTcoreWRModel>> getPTwrEquipmentLists();
}

@DataClassName('PTcoreWRLocalData')
class PTcoreWRLocalDatasourceImpl extends Table
    implements PTcoreWRLocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @required
  RealColumn get R_1a_1n => real()();
  @required
  RealColumn get R_2a_2n => real()();
  @required
  RealColumn get R_3a_3n => real()();

  @required
  RealColumn get Y_1a_1n => real()();
  @required
  RealColumn get Y_2a_2n => real()();
  @required
  RealColumn get Y_3a_3n => real()();

  @required
  RealColumn get B_1a_1n => real()();
  @required
  RealColumn get B_2a_2n => real()();
  @required
  RealColumn get B_3a_3n => real()();

  @override
  Future<PTcoreWRModel> getPTcoreWR_ById(int id) async {
    PTcoreWRLocalData tPTcoreWRData =
        await sl<AppDatabase>().getPTcoreWRLocalDataWithId(id);
    PTcoreWRModel tPTcoreWRModel = PTcoreWRModel(
      id: tPTcoreWRData.id,
      databaseID: tPTcoreWRData.databaseID,
      trNo: tPTcoreWRData.trNo,
      serialNo: tPTcoreWRData.serialNo,
      equipmentUsed: tPTcoreWRData.equipmentUsed,
      updateDate: tPTcoreWRData.updateDate,
      R_1a_1n: tPTcoreWRData.R_1a_1n,
      R_2a_2n: tPTcoreWRData.R_2a_2n,
      R_3a_3n: tPTcoreWRData.R_3a_3n,
      Y_1a_1n: tPTcoreWRData.Y_1a_1n,
      Y_2a_2n: tPTcoreWRData.Y_2a_2n,
      Y_3a_3n: tPTcoreWRData.Y_3a_3n,
      B_1a_1n: tPTcoreWRData.B_1a_1n,
      B_2a_2n: tPTcoreWRData.B_2a_2n,
      B_3a_3n: tPTcoreWRData.B_3a_3n,
    );
    return tPTcoreWRModel;
  }

  @override
  Future<int> localPTcoreWR(PTcoreWRModel ptwrtolocal) {
    return (sl<AppDatabase>().createPTcoreWR(ptwrtolocal));
  }

  @override
  Future<void> updatePTcoreWR(PTcoreWRModel ptwrtoupdate, int id) async {
    sl<AppDatabase>().updatePTcoreWR(ptwrtoupdate, id);
  }

  @override
  Future<int> deletePTcoreWRById(int id) {
    return (sl<AppDatabase>().deletePTcoreWRById(id));
  }

  @override
  Future<List<PTcoreWRModel>> getPTcoreWR_SerialNo(String serialNo) async {
    final tPTcoreWR_data =
        await sl<AppDatabase>().getPTcoreWRLocalDataWithSerialNo(serialNo);

    List<PTcoreWRModel> tPTcoreWR_Model =
        List<PTcoreWRModel>.empty(growable: true);
    for (var listEle in tPTcoreWR_data) {
      tPTcoreWR_Model.add(PTcoreWRModel(
        id: listEle.id,
        trNo: listEle.trNo,
        databaseID: listEle.databaseID,
        serialNo: listEle.serialNo,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
        R_1a_1n: listEle.R_1a_1n,
        R_2a_2n: listEle.R_2a_2n,
        R_3a_3n: listEle.R_3a_3n,
        Y_1a_1n: listEle.Y_1a_1n,
        Y_2a_2n: listEle.Y_2a_2n,
        Y_3a_3n: listEle.Y_3a_3n,
        B_1a_1n: listEle.B_1a_1n,
        B_2a_2n: listEle.B_2a_2n,
        B_3a_3n: listEle.B_3a_3n,
      ));
    }
    return tPTcoreWR_Model;
  }

  @override
  Future<List<PTcoreWRModel>> getPTwrEquipmentLists() async {
    final tPTwrData = await sl<AppDatabase>().getPTwrEquipmentListwithAll();
    List<PTcoreWRModel> tPTwrTestModel =
        List<PTcoreWRModel>.empty(growable: true);
    for (var element in tPTwrData) {
      tPTwrTestModel.add(PTcoreWRModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        equipmentUsed: element.equipmentUsed,
        updateDate: element.updateDate,
        R_1a_1n: element.R_1a_1n,
        R_2a_2n: element.R_2a_2n,
        R_3a_3n: element.R_3a_3n,
        Y_1a_1n: element.Y_1a_1n,
        Y_2a_2n: element.Y_2a_2n,
        Y_3a_3n: element.Y_3a_3n,
        B_1a_1n: element.B_1a_1n,
        B_2a_2n: element.B_2a_2n,
        B_3a_3n: element.B_3a_3n,
      ));
    }
    return tPTwrTestModel;
  }
}

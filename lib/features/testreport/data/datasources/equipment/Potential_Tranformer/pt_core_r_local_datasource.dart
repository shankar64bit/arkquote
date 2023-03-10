// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/PT/pt_core_r_model.dart';
import '../../test_report_local_datasource.dart';

abstract class PTcoreRLocalDatasource {
  Future<PTcoreRModel> getPTcoreR_ById(int id);
  Future<int> localPTcoreR(PTcoreRModel ptcorertolocal);
  Future<void> updatePTcoreR(PTcoreRModel ptcorertoupdate, int id);
  Future<int> deletePTcoreRById(int id);
  Future<List<PTcoreRModel>> getPTcoreR_SerialNo(String serialNo);
  Future<List<PTcoreRModel>> getPTcoreREquipmentLists();
}

@DataClassName('PTcoreRLocalData')
class PTcoreRLocalDatasourceImpl extends Table
    implements PTcoreRLocalDatasource {
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
  RealColumn get R_1a_1n_1000 => real()();
  @required
  RealColumn get R_2a_2n_1000 => real()();
  @required
  RealColumn get R_3a_3n_1000 => real()();

  @required
  RealColumn get Y_1a_1n_1000 => real()();
  @required
  RealColumn get Y_2a_2n_1000 => real()();
  @required
  RealColumn get Y_3a_3n_1000 => real()();

  @required
  RealColumn get B_1a_1n_1000 => real()();
  @required
  RealColumn get B_2a_2n_1000 => real()();
  @required
  RealColumn get B_3a_3n_1000 => real()();
  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  @required
  RealColumn get R_1a_1n_2000 => real()();
  @required
  RealColumn get R_2a_2n_2000 => real()();
  @required
  RealColumn get R_3a_3n_2000 => real()();

  @required
  RealColumn get Y_1a_1n_2000 => real()();
  @required
  RealColumn get Y_2a_2n_2000 => real()();
  @required
  RealColumn get Y_3a_3n_2000 => real()();

  @required
  RealColumn get B_1a_1n_2000 => real()();
  @required
  RealColumn get B_2a_2n_2000 => real()();
  @required
  RealColumn get B_3a_3n_2000 => real()();
  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  @required
  RealColumn get R_1a_1n_3000 => real()();
  @required
  RealColumn get R_2a_2n_3000 => real()();
  @required
  RealColumn get R_3a_3n_3000 => real()();

  @required
  RealColumn get Y_1a_1n_3000 => real()();
  @required
  RealColumn get Y_2a_2n_3000 => real()();
  @required
  RealColumn get Y_3a_3n_3000 => real()();

  @required
  RealColumn get B_1a_1n_3000 => real()();
  @required
  RealColumn get B_2a_2n_3000 => real()();
  @required
  RealColumn get B_3a_3n_3000 => real()();
  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  @required
  RealColumn get R_1a_1n_4000 => real()();
  @required
  RealColumn get R_2a_2n_4000 => real()();
  @required
  RealColumn get R_3a_3n_4000 => real()();

  @required
  RealColumn get Y_1a_1n_4000 => real()();
  @required
  RealColumn get Y_2a_2n_4000 => real()();
  @required
  RealColumn get Y_3a_3n_4000 => real()();

  @required
  RealColumn get B_1a_1n_4000 => real()();
  @required
  RealColumn get B_2a_2n_4000 => real()();
  @required
  RealColumn get B_3a_3n_4000 => real()();
  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  @override
  Future<PTcoreRModel> getPTcoreR_ById(int id) async {
    PTcoreRLocalData tPTcoreRData =
        await sl<AppDatabase>().getPTcoreRLocalDataWithId(id);
    PTcoreRModel tPTcoreRModel = PTcoreRModel(
      id: tPTcoreRData.id,
      databaseID: tPTcoreRData.databaseID,
      trNo: tPTcoreRData.trNo,
      serialNo: tPTcoreRData.serialNo,
      equipmentUsed: tPTcoreRData.equipmentUsed,
      updateDate: tPTcoreRData.updateDate,
      R_1a_1n_1000: tPTcoreRData.R_1a_1n_1000,
      R_2a_2n_1000: tPTcoreRData.R_2a_2n_1000,
      R_3a_3n_1000: tPTcoreRData.R_3a_3n_1000,
      Y_1a_1n_1000: tPTcoreRData.Y_1a_1n_1000,
      Y_2a_2n_1000: tPTcoreRData.Y_2a_2n_1000,
      Y_3a_3n_1000: tPTcoreRData.Y_3a_3n_1000,
      B_1a_1n_1000: tPTcoreRData.B_1a_1n_1000,
      B_2a_2n_1000: tPTcoreRData.B_2a_2n_1000,
      B_3a_3n_1000: tPTcoreRData.B_3a_3n_1000,
      R_1a_1n_2000: tPTcoreRData.R_1a_1n_2000,
      R_2a_2n_2000: tPTcoreRData.R_2a_2n_2000,
      R_3a_3n_2000: tPTcoreRData.R_3a_3n_2000,
      Y_1a_1n_2000: tPTcoreRData.Y_1a_1n_2000,
      Y_2a_2n_2000: tPTcoreRData.Y_2a_2n_2000,
      Y_3a_3n_2000: tPTcoreRData.Y_3a_3n_2000,
      B_1a_1n_2000: tPTcoreRData.B_1a_1n_2000,
      B_2a_2n_2000: tPTcoreRData.B_2a_2n_2000,
      B_3a_3n_2000: tPTcoreRData.B_3a_3n_2000,
      R_1a_1n_3000: tPTcoreRData.R_1a_1n_3000,
      R_2a_2n_3000: tPTcoreRData.R_2a_2n_3000,
      R_3a_3n_3000: tPTcoreRData.R_3a_3n_3000,
      Y_1a_1n_3000: tPTcoreRData.Y_1a_1n_3000,
      Y_2a_2n_3000: tPTcoreRData.Y_2a_2n_3000,
      Y_3a_3n_3000: tPTcoreRData.Y_3a_3n_3000,
      B_1a_1n_3000: tPTcoreRData.B_1a_1n_3000,
      B_2a_2n_3000: tPTcoreRData.B_2a_2n_3000,
      B_3a_3n_3000: tPTcoreRData.B_3a_3n_3000,
      R_1a_1n_4000: tPTcoreRData.R_1a_1n_4000,
      R_2a_2n_4000: tPTcoreRData.R_2a_2n_4000,
      R_3a_3n_4000: tPTcoreRData.R_3a_3n_4000,
      Y_1a_1n_4000: tPTcoreRData.Y_1a_1n_4000,
      Y_2a_2n_4000: tPTcoreRData.Y_2a_2n_4000,
      Y_3a_3n_4000: tPTcoreRData.Y_3a_3n_4000,
      B_1a_1n_4000: tPTcoreRData.B_1a_1n_4000,
      B_2a_2n_4000: tPTcoreRData.B_2a_2n_4000,
      B_3a_3n_4000: tPTcoreRData.B_3a_3n_4000,
    );
    return tPTcoreRModel;
  }

  @override
  Future<int> localPTcoreR(PTcoreRModel ptcorertolocal) {
    return (sl<AppDatabase>().createPTcoreR(ptcorertolocal));
  }

  @override
  Future<void> updatePTcoreR(PTcoreRModel ptcorertoupdate, int id) async {
    sl<AppDatabase>().updatePTcoreR(ptcorertoupdate, id);
  }

  @override
  Future<int> deletePTcoreRById(int id) {
    return (sl<AppDatabase>().deletePTcoreRById(id));
  }

  @override
  Future<List<PTcoreRModel>> getPTcoreR_SerialNo(String serialNo) async {
    final tPTcoreR_data =
        await sl<AppDatabase>().getPTcoreRLocalDataWithSerialNo(serialNo);

    List<PTcoreRModel> tPTcoreR_Model =
        List<PTcoreRModel>.empty(growable: true);
    for (var listEle in tPTcoreR_data) {
      tPTcoreR_Model.add(PTcoreRModel(
        id: listEle.id,
        trNo: listEle.trNo,
        databaseID: listEle.databaseID,
        serialNo: listEle.serialNo,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
        R_1a_1n_1000: listEle.R_1a_1n_1000,
        R_2a_2n_1000: listEle.R_2a_2n_1000,
        R_3a_3n_1000: listEle.R_3a_3n_1000,
        Y_1a_1n_1000: listEle.Y_1a_1n_1000,
        Y_2a_2n_1000: listEle.Y_2a_2n_1000,
        Y_3a_3n_1000: listEle.Y_3a_3n_1000,
        B_1a_1n_1000: listEle.B_1a_1n_1000,
        B_2a_2n_1000: listEle.B_2a_2n_1000,
        B_3a_3n_1000: listEle.B_3a_3n_1000,
        R_1a_1n_2000: listEle.R_1a_1n_2000,
        R_2a_2n_2000: listEle.R_2a_2n_2000,
        R_3a_3n_2000: listEle.R_3a_3n_2000,
        Y_1a_1n_2000: listEle.Y_1a_1n_2000,
        Y_2a_2n_2000: listEle.Y_2a_2n_2000,
        Y_3a_3n_2000: listEle.Y_3a_3n_2000,
        B_1a_1n_2000: listEle.B_1a_1n_2000,
        B_2a_2n_2000: listEle.B_2a_2n_2000,
        B_3a_3n_2000: listEle.B_3a_3n_2000,
        R_1a_1n_3000: listEle.R_1a_1n_3000,
        R_2a_2n_3000: listEle.R_2a_2n_3000,
        R_3a_3n_3000: listEle.R_3a_3n_3000,
        Y_1a_1n_3000: listEle.Y_1a_1n_3000,
        Y_2a_2n_3000: listEle.Y_2a_2n_3000,
        Y_3a_3n_3000: listEle.Y_3a_3n_3000,
        B_1a_1n_3000: listEle.B_1a_1n_3000,
        B_2a_2n_3000: listEle.B_2a_2n_3000,
        B_3a_3n_3000: listEle.B_3a_3n_3000,
        R_1a_1n_4000: listEle.R_1a_1n_4000,
        R_2a_2n_4000: listEle.R_2a_2n_4000,
        R_3a_3n_4000: listEle.R_3a_3n_4000,
        Y_1a_1n_4000: listEle.Y_1a_1n_4000,
        Y_2a_2n_4000: listEle.Y_2a_2n_4000,
        Y_3a_3n_4000: listEle.Y_3a_3n_4000,
        B_1a_1n_4000: listEle.B_1a_1n_4000,
        B_2a_2n_4000: listEle.B_2a_2n_4000,
        B_3a_3n_4000: listEle.B_3a_3n_4000,
      ));
    }
    return tPTcoreR_Model;
  }

  @override
  Future<List<PTcoreRModel>> getPTcoreREquipmentLists() async {
    final tptrData = await sl<AppDatabase>().getPTcoreREquipmentListwithAll();
    List<PTcoreRModel> tptrTestModel = List<PTcoreRModel>.empty(growable: true);
    for (var element in tptrData) {
      tptrTestModel.add(PTcoreRModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        equipmentUsed: element.equipmentUsed,
        updateDate: element.updateDate,
        R_1a_1n_1000: element.R_1a_1n_1000,
        R_2a_2n_1000: element.R_2a_2n_1000,
        R_3a_3n_1000: element.R_3a_3n_1000,
        Y_1a_1n_1000: element.Y_1a_1n_1000,
        Y_2a_2n_1000: element.Y_2a_2n_1000,
        Y_3a_3n_1000: element.Y_3a_3n_1000,
        B_1a_1n_1000: element.B_1a_1n_1000,
        B_2a_2n_1000: element.B_2a_2n_1000,
        B_3a_3n_1000: element.B_3a_3n_1000,
        R_1a_1n_2000: element.R_1a_1n_2000,
        R_2a_2n_2000: element.R_2a_2n_2000,
        R_3a_3n_2000: element.R_3a_3n_2000,
        Y_1a_1n_2000: element.Y_1a_1n_2000,
        Y_2a_2n_2000: element.Y_2a_2n_2000,
        Y_3a_3n_2000: element.Y_3a_3n_2000,
        B_1a_1n_2000: element.B_1a_1n_2000,
        B_2a_2n_2000: element.B_2a_2n_2000,
        B_3a_3n_2000: element.B_3a_3n_2000,
        R_1a_1n_3000: element.R_1a_1n_3000,
        R_2a_2n_3000: element.R_2a_2n_3000,
        R_3a_3n_3000: element.R_3a_3n_3000,
        Y_1a_1n_3000: element.Y_1a_1n_3000,
        Y_2a_2n_3000: element.Y_2a_2n_3000,
        Y_3a_3n_3000: element.Y_3a_3n_3000,
        B_1a_1n_3000: element.B_1a_1n_3000,
        B_2a_2n_3000: element.B_2a_2n_3000,
        B_3a_3n_3000: element.B_3a_3n_3000,
        R_1a_1n_4000: element.R_1a_1n_4000,
        R_2a_2n_4000: element.R_2a_2n_4000,
        R_3a_3n_4000: element.R_3a_3n_4000,
        Y_1a_1n_4000: element.Y_1a_1n_4000,
        Y_2a_2n_4000: element.Y_2a_2n_4000,
        Y_3a_3n_4000: element.Y_3a_3n_4000,
        B_1a_1n_4000: element.B_1a_1n_4000,
        B_2a_2n_4000: element.B_2a_2n_4000,
        B_3a_3n_4000: element.B_3a_3n_4000,
      ));
    }
    return tptrTestModel;
  }
}

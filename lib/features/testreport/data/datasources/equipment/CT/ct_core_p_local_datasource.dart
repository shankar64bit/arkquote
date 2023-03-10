// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/CT/ct_core_p_model.dart';
import '../../test_report_local_datasource.dart';

abstract class CTcorePLocalDatasource {
  Future<CTcorePModel> getCTcoreP_ById(int id);
  Future<int> localCTcoreP(CTcorePModel ctcoreptolocal);
  Future<void> updateCTcoreP(CTcorePModel ctcoreptoupdate, int id);
  Future<int> deleteCTcorePById(int id);
  Future<List<CTcorePModel>> getCTcoreP_SerialNo(String serialNo);
  Future<List<CTcorePModel>> getCTpEquipmentLists();
}

@DataClassName('CTcorePLocalData')
class CTcorePLocalDatasourceImpl extends Table
    implements CTcorePLocalDatasource {
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
  TextColumn get R_1S1_1S2 => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get R_2S1_2S2 => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get R_3S1_3S2 => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get R_4S1_4S2 => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get R_5S1_5S2 => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get Y_1S1_1S2 => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get Y_2S1_2S2 => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get Y_3S1_3S2 => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get Y_4S1_4S2 => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get Y_5S1_5S2 => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get B_1S1_1S2 => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get B_2S1_2S2 => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get B_3S1_3S2 => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get B_4S1_4S2 => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get B_5S1_5S2 => text().withLength(min: 1, max: 50)();
  @override
  Future<CTcorePModel> getCTcoreP_ById(int id) async {
    CTcorePLocalData tCTcorePData =
        await sl<AppDatabase>().getCTcorePLocalDataWithId(id);
    CTcorePModel tCTcorePModel = CTcorePModel(
      id: tCTcorePData.id,
      databaseID: tCTcorePData.databaseID,
      trNo: tCTcorePData.trNo,
      serialNo: tCTcorePData.serialNo,
      equipmentUsed: tCTcorePData.equipmentUsed,
      updateDate: tCTcorePData.updateDate,
      R_1S1_1S2: tCTcorePData.R_1S1_1S2,
      R_2S1_2S2: tCTcorePData.R_2S1_2S2,
      R_3S1_3S2: tCTcorePData.R_3S1_3S2,
      R_4S1_4S2: tCTcorePData.R_4S1_4S2,
      R_5S1_5S2: tCTcorePData.R_5S1_5S2,
      Y_1S1_1S2: tCTcorePData.Y_1S1_1S2,
      Y_2S1_2S2: tCTcorePData.Y_2S1_2S2,
      Y_3S1_3S2: tCTcorePData.Y_3S1_3S2,
      Y_4S1_4S2: tCTcorePData.Y_4S1_4S2,
      Y_5S1_5S2: tCTcorePData.Y_5S1_5S2,
      B_1S1_1S2: tCTcorePData.B_1S1_1S2,
      B_2S1_2S2: tCTcorePData.B_2S1_2S2,
      B_3S1_3S2: tCTcorePData.B_3S1_3S2,
      B_4S1_4S2: tCTcorePData.B_4S1_4S2,
      B_5S1_5S2: tCTcorePData.B_5S1_5S2,
    );
    return tCTcorePModel;
  }

  @override
  Future<int> localCTcoreP(CTcorePModel ctcoreptolocal) {
    return (sl<AppDatabase>().createCTcoreP(ctcoreptolocal));
  }

  @override
  Future<void> updateCTcoreP(CTcorePModel ctcoreptoupdate, int id) async {
    sl<AppDatabase>().updateCTcoreP(ctcoreptoupdate, id);
  }

  @override
  Future<int> deleteCTcorePById(int id) {
    return (sl<AppDatabase>().deleteCTcorePById(id));
  }

  @override
  Future<List<CTcorePModel>> getCTcoreP_SerialNo(String serialNo) async {
    final tCTcoreP_data =
        await sl<AppDatabase>().getCTcorePLocalDataWithSerialNo(serialNo);

    List<CTcorePModel> tCTcoreP_Model =
        List<CTcorePModel>.empty(growable: true);
    for (var listEle in tCTcoreP_data) {
      tCTcoreP_Model.add(CTcorePModel(
        id: listEle.id,
        trNo: listEle.trNo,
        databaseID: listEle.databaseID,
        serialNo: listEle.serialNo,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
        R_1S1_1S2: listEle.R_1S1_1S2,
        R_2S1_2S2: listEle.R_2S1_2S2,
        R_3S1_3S2: listEle.R_3S1_3S2,
        R_4S1_4S2: listEle.R_4S1_4S2,
        R_5S1_5S2: listEle.R_5S1_5S2,
        Y_1S1_1S2: listEle.Y_1S1_1S2,
        Y_2S1_2S2: listEle.Y_2S1_2S2,
        Y_3S1_3S2: listEle.Y_3S1_3S2,
        Y_4S1_4S2: listEle.Y_4S1_4S2,
        Y_5S1_5S2: listEle.Y_5S1_5S2,
        B_1S1_1S2: listEle.B_1S1_1S2,
        B_2S1_2S2: listEle.B_2S1_2S2,
        B_3S1_3S2: listEle.B_3S1_3S2,
        B_4S1_4S2: listEle.B_4S1_4S2,
        B_5S1_5S2: listEle.B_5S1_5S2,
      ));
    }
    return tCTcoreP_Model;
  }

  @override
  Future<List<CTcorePModel>> getCTpEquipmentLists() async {
    final tCTpData = await sl<AppDatabase>().getCTpEquipmentListwithAll();
    List<CTcorePModel> tCTpTestModel = List<CTcorePModel>.empty(growable: true);
    for (var element in tCTpData) {
      tCTpTestModel.add(CTcorePModel(
        id: element.id,
        trNo: element.trNo,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        equipmentUsed: element.equipmentUsed,
        updateDate: element.updateDate,
        R_1S1_1S2: element.R_1S1_1S2,
        R_2S1_2S2: element.R_2S1_2S2,
        R_3S1_3S2: element.R_3S1_3S2,
        R_4S1_4S2: element.R_4S1_4S2,
        R_5S1_5S2: element.R_5S1_5S2,
        Y_1S1_1S2: element.Y_1S1_1S2,
        Y_2S1_2S2: element.Y_2S1_2S2,
        Y_3S1_3S2: element.Y_3S1_3S2,
        Y_4S1_4S2: element.Y_4S1_4S2,
        Y_5S1_5S2: element.Y_5S1_5S2,
        B_1S1_1S2: element.B_1S1_1S2,
        B_2S1_2S2: element.B_2S1_2S2,
        B_3S1_3S2: element.B_3S1_3S2,
        B_4S1_4S2: element.B_4S1_4S2,
        B_5S1_5S2: element.B_5S1_5S2,
      ));
    }
    return tCTpTestModel;
  }
}

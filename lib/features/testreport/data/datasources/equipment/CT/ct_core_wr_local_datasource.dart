// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/CT/ct_core_wr_model.dart';
import '../../test_report_local_datasource.dart';

abstract class CTcoreWRLocalDatasource {
  Future<CTcoreWRModel> getCTcoreWR_ById(int id);
  Future<int> localCTcoreWR(CTcoreWRModel ctwrtolocal);
  Future<void> updateCTcoreWR(CTcoreWRModel ctwrtoupdate, int id);
  Future<int> deleteCTcoreWRById(int id);
  Future<List<CTcoreWRModel>> getCTcoreWR_SerialNo(String serialNo);
  Future<List<CTcoreWRModel>> getCTwrlocaldataEquipmentLists();
}

@DataClassName('CTcoreWRLocalData')
class CTcoreWRLocalDatasourceImpl extends Table
    implements CTcoreWRLocalDatasource {
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
  RealColumn get R_1S1_1S2 => real()();
  @required
  RealColumn get R_2S1_2S2 => real()();
  @required
  RealColumn get R_3S1_3S2 => real()();
  @required
  RealColumn get R_4S1_4S2 => real()();
  @required
  RealColumn get R_5S1_5S2 => real()();

  @required
  RealColumn get Y_1S1_1S2 => real()();
  @required
  RealColumn get Y_2S1_2S2 => real()();
  @required
  RealColumn get Y_3S1_3S2 => real()();
  @required
  RealColumn get Y_4S1_4S2 => real()();
  @required
  RealColumn get Y_5S1_5S2 => real()();

  @required
  RealColumn get B_1S1_1S2 => real()();
  @required
  RealColumn get B_2S1_2S2 => real()();
  @required
  RealColumn get B_3S1_3S2 => real()();
  @required
  RealColumn get B_4S1_4S2 => real()();
  @required
  RealColumn get B_5S1_5S2 => real()();

  @override
  Future<CTcoreWRModel> getCTcoreWR_ById(int id) async {
    CTcoreWRLocalData tCTcoreWRData =
        await sl<AppDatabase>().getCTcoreWRLocalDataWithId(id);
    CTcoreWRModel tCTcoreWRModel = CTcoreWRModel(
      id: tCTcoreWRData.id,
      databaseID: tCTcoreWRData.databaseID,
      trNo: tCTcoreWRData.trNo,
      serialNo: tCTcoreWRData.serialNo,
      equipmentUsed: tCTcoreWRData.equipmentUsed,
      updateDate: tCTcoreWRData.updateDate,
      R_1S1_1S2: tCTcoreWRData.R_1S1_1S2,
      R_2S1_2S2: tCTcoreWRData.R_2S1_2S2,
      R_3S1_3S2: tCTcoreWRData.R_3S1_3S2,
      R_4S1_4S2: tCTcoreWRData.R_4S1_4S2,
      R_5S1_5S2: tCTcoreWRData.R_5S1_5S2,
      Y_1S1_1S2: tCTcoreWRData.Y_1S1_1S2,
      Y_2S1_2S2: tCTcoreWRData.Y_2S1_2S2,
      Y_3S1_3S2: tCTcoreWRData.Y_3S1_3S2,
      Y_4S1_4S2: tCTcoreWRData.Y_4S1_4S2,
      Y_5S1_5S2: tCTcoreWRData.Y_5S1_5S2,
      B_1S1_1S2: tCTcoreWRData.B_1S1_1S2,
      B_2S1_2S2: tCTcoreWRData.B_2S1_2S2,
      B_3S1_3S2: tCTcoreWRData.B_3S1_3S2,
      B_4S1_4S2: tCTcoreWRData.B_4S1_4S2,
      B_5S1_5S2: tCTcoreWRData.B_5S1_5S2,
    );
    return tCTcoreWRModel;
  }

  @override
  Future<int> localCTcoreWR(CTcoreWRModel ctwrtolocal) {
    return (sl<AppDatabase>().createCTcoreWR(ctwrtolocal));
  }

  @override
  Future<void> updateCTcoreWR(CTcoreWRModel ctwrtoupdate, int id) async {
    sl<AppDatabase>().updateCTcoreWR(ctwrtoupdate, id);
  }

  @override
  Future<int> deleteCTcoreWRById(int id) {
    return (sl<AppDatabase>().deleteCTcoreWRById(id));
  }

  @override
  Future<List<CTcoreWRModel>> getCTcoreWR_SerialNo(String serialNo) async {
    final tCTcoreWR_data =
        await sl<AppDatabase>().getCTcoreWRLocalDataWithSerialNo(serialNo);

    List<CTcoreWRModel> tCTcoreWR_Model =
        List<CTcoreWRModel>.empty(growable: true);
    for (var listEle in tCTcoreWR_data) {
      tCTcoreWR_Model.add(CTcoreWRModel(
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
    return tCTcoreWR_Model;
  }

  @override
  Future<List<CTcoreWRModel>> getCTwrlocaldataEquipmentLists() async {
    final tCTwrData = await sl<AppDatabase>().getCTwrEquipmentListwithAll();
    List<CTcoreWRModel> tCTwrTestModel =
        List<CTcoreWRModel>.empty(growable: true);
    for (var element in tCTwrData) {
      tCTwrTestModel.add(CTcoreWRModel(
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
    return tCTwrTestModel;
  }
}

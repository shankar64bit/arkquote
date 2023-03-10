// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/CT/ct_core_r_model.dart';
import '../../test_report_local_datasource.dart';

abstract class CTcoreRLocalDatasource {
  Future<CTcoreRModel> getCTcoreR_ById(int id);
  Future<int> localCTcoreR(CTcoreRModel ctcorertolocal);
  Future<void> updateCTcoreR(CTcoreRModel ctcorertoupdate, int id);
  Future<int> deleteCTcoreRById(int id);
  Future<List<CTcoreRModel>> getCTcoreR_SerialNo(String serialNo);
  Future<List<CTcoreRModel>> getCTcoreREquipmentLists();
}

@DataClassName('CTcoreRLocalData')
class CTcoreRLocalDatasourceImpl extends Table
    implements CTcoreRLocalDatasource {
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
  RealColumn get R_1S1_1S2_200 => real()();
  @required
  RealColumn get R_2S1_2S2_200 => real()();
  @required
  RealColumn get R_3S1_3S2_200 => real()();
  @required
  RealColumn get R_4S1_4S2_200 => real()();
  @required
  RealColumn get R_5S1_5S2_200 => real()();

  @required
  RealColumn get Y_1S1_1S2_200 => real()();
  @required
  RealColumn get Y_2S1_2S2_200 => real()();
  @required
  RealColumn get Y_3S1_3S2_200 => real()();
  @required
  RealColumn get Y_4S1_4S2_200 => real()();
  @required
  RealColumn get Y_5S1_5S2_200 => real()();

  @required
  RealColumn get B_1S1_1S2_200 => real()();
  @required
  RealColumn get B_2S1_2S2_200 => real()();
  @required
  RealColumn get B_3S1_3S2_200 => real()();
  @required
  RealColumn get B_4S1_4S2_200 => real()();
  @required
  RealColumn get B_5S1_5S2_200 => real()();
  ////////////////////////////////////////
  @required
  RealColumn get R_1S1_1S2_400 => real()();
  @required
  RealColumn get R_2S1_2S2_400 => real()();
  @required
  RealColumn get R_3S1_3S2_400 => real()();
  @required
  RealColumn get R_4S1_4S2_400 => real()();
  @required
  RealColumn get R_5S1_5S2_400 => real()();

  @required
  RealColumn get Y_1S1_1S2_400 => real()();
  @required
  RealColumn get Y_2S1_2S2_400 => real()();
  @required
  RealColumn get Y_3S1_3S2_400 => real()();
  @required
  RealColumn get Y_4S1_4S2_400 => real()();
  @required
  RealColumn get Y_5S1_5S2_400 => real()();

  @required
  RealColumn get B_1S1_1S2_400 => real()();
  @required
  RealColumn get B_2S1_2S2_400 => real()();
  @required
  RealColumn get B_3S1_3S2_400 => real()();
  @required
  RealColumn get B_4S1_4S2_400 => real()();
  @required
  RealColumn get B_5S1_5S2_400 => real()();
  ////////////////////////////////////////
  @required
  RealColumn get R_1S1_1S2_600 => real()();
  @required
  RealColumn get R_2S1_2S2_600 => real()();
  @required
  RealColumn get R_3S1_3S2_600 => real()();
  @required
  RealColumn get R_4S1_4S2_600 => real()();
  @required
  RealColumn get R_5S1_5S2_600 => real()();

  @required
  RealColumn get Y_1S1_1S2_600 => real()();
  @required
  RealColumn get Y_2S1_2S2_600 => real()();
  @required
  RealColumn get Y_3S1_3S2_600 => real()();
  @required
  RealColumn get Y_4S1_4S2_600 => real()();
  @required
  RealColumn get Y_5S1_5S2_600 => real()();

  @required
  RealColumn get B_1S1_1S2_600 => real()();
  @required
  RealColumn get B_2S1_2S2_600 => real()();
  @required
  RealColumn get B_3S1_3S2_600 => real()();
  @required
  RealColumn get B_4S1_4S2_600 => real()();
  @required
  RealColumn get B_5S1_5S2_600 => real()();
  ////////////////////////////////////////
  @required
  RealColumn get R_1S1_1S2_800 => real()();
  @required
  RealColumn get R_2S1_2S2_800 => real()();
  @required
  RealColumn get R_3S1_3S2_800 => real()();
  @required
  RealColumn get R_4S1_4S2_800 => real()();
  @required
  RealColumn get R_5S1_5S2_800 => real()();

  @required
  RealColumn get Y_1S1_1S2_800 => real()();
  @required
  RealColumn get Y_2S1_2S2_800 => real()();
  @required
  RealColumn get Y_3S1_3S2_800 => real()();
  @required
  RealColumn get Y_4S1_4S2_800 => real()();
  @required
  RealColumn get Y_5S1_5S2_800 => real()();

  @required
  RealColumn get B_1S1_1S2_800 => real()();
  @required
  RealColumn get B_2S1_2S2_800 => real()();
  @required
  RealColumn get B_3S1_3S2_800 => real()();
  @required
  RealColumn get B_4S1_4S2_800 => real()();
  @required
  RealColumn get B_5S1_5S2_800 => real()();
  @override
  Future<CTcoreRModel> getCTcoreR_ById(int id) async {
    CTcoreRLocalData tCTcoreRData =
        await sl<AppDatabase>().getCTcoreRLocalDataWithId(id);
    CTcoreRModel tCTcoreRModel = CTcoreRModel(
      id: tCTcoreRData.id,
      databaseID: tCTcoreRData.databaseID,
      trNo: tCTcoreRData.trNo,
      serialNo: tCTcoreRData.serialNo,
      equipmentUsed: tCTcoreRData.equipmentUsed,
      updateDate: tCTcoreRData.updateDate,
      R_1S1_1S2_200: tCTcoreRData.R_1S1_1S2_200,
      R_2S1_2S2_200: tCTcoreRData.R_2S1_2S2_200,
      R_3S1_3S2_200: tCTcoreRData.R_3S1_3S2_200,
      R_4S1_4S2_200: tCTcoreRData.R_4S1_4S2_200,
      R_5S1_5S2_200: tCTcoreRData.R_5S1_5S2_200,
      Y_1S1_1S2_200: tCTcoreRData.Y_1S1_1S2_200,
      Y_2S1_2S2_200: tCTcoreRData.Y_2S1_2S2_200,
      Y_3S1_3S2_200: tCTcoreRData.Y_3S1_3S2_200,
      Y_4S1_4S2_200: tCTcoreRData.Y_4S1_4S2_200,
      Y_5S1_5S2_200: tCTcoreRData.Y_5S1_5S2_200,
      B_1S1_1S2_200: tCTcoreRData.B_1S1_1S2_200,
      B_2S1_2S2_200: tCTcoreRData.B_2S1_2S2_200,
      B_3S1_3S2_200: tCTcoreRData.B_3S1_3S2_200,
      B_4S1_4S2_200: tCTcoreRData.B_4S1_4S2_200,
      B_5S1_5S2_200: tCTcoreRData.B_5S1_5S2_200,
      R_1S1_1S2_400: tCTcoreRData.R_1S1_1S2_400,
      R_2S1_2S2_400: tCTcoreRData.R_2S1_2S2_400,
      R_3S1_3S2_400: tCTcoreRData.R_3S1_3S2_400,
      R_4S1_4S2_400: tCTcoreRData.R_4S1_4S2_400,
      R_5S1_5S2_400: tCTcoreRData.R_5S1_5S2_400,
      Y_1S1_1S2_400: tCTcoreRData.Y_1S1_1S2_400,
      Y_2S1_2S2_400: tCTcoreRData.Y_2S1_2S2_400,
      Y_3S1_3S2_400: tCTcoreRData.Y_3S1_3S2_400,
      Y_4S1_4S2_400: tCTcoreRData.Y_4S1_4S2_400,
      Y_5S1_5S2_400: tCTcoreRData.Y_5S1_5S2_400,
      B_1S1_1S2_400: tCTcoreRData.B_1S1_1S2_400,
      B_2S1_2S2_400: tCTcoreRData.B_2S1_2S2_400,
      B_3S1_3S2_400: tCTcoreRData.B_3S1_3S2_400,
      B_4S1_4S2_400: tCTcoreRData.B_4S1_4S2_400,
      B_5S1_5S2_400: tCTcoreRData.B_5S1_5S2_400,
      R_1S1_1S2_600: tCTcoreRData.R_1S1_1S2_600,
      R_2S1_2S2_600: tCTcoreRData.R_2S1_2S2_600,
      R_3S1_3S2_600: tCTcoreRData.R_3S1_3S2_600,
      R_4S1_4S2_600: tCTcoreRData.R_4S1_4S2_600,
      R_5S1_5S2_600: tCTcoreRData.R_5S1_5S2_600,
      Y_1S1_1S2_600: tCTcoreRData.Y_1S1_1S2_600,
      Y_2S1_2S2_600: tCTcoreRData.Y_2S1_2S2_600,
      Y_3S1_3S2_600: tCTcoreRData.Y_3S1_3S2_600,
      Y_4S1_4S2_600: tCTcoreRData.Y_4S1_4S2_600,
      Y_5S1_5S2_600: tCTcoreRData.Y_5S1_5S2_600,
      B_1S1_1S2_600: tCTcoreRData.B_1S1_1S2_600,
      B_2S1_2S2_600: tCTcoreRData.B_2S1_2S2_600,
      B_3S1_3S2_600: tCTcoreRData.B_3S1_3S2_600,
      B_4S1_4S2_600: tCTcoreRData.B_4S1_4S2_600,
      B_5S1_5S2_600: tCTcoreRData.B_5S1_5S2_600,
      R_1S1_1S2_800: tCTcoreRData.R_1S1_1S2_800,
      R_2S1_2S2_800: tCTcoreRData.R_2S1_2S2_800,
      R_3S1_3S2_800: tCTcoreRData.R_3S1_3S2_800,
      R_4S1_4S2_800: tCTcoreRData.R_4S1_4S2_800,
      R_5S1_5S2_800: tCTcoreRData.R_5S1_5S2_800,
      Y_1S1_1S2_800: tCTcoreRData.Y_1S1_1S2_800,
      Y_2S1_2S2_800: tCTcoreRData.Y_2S1_2S2_800,
      Y_3S1_3S2_800: tCTcoreRData.Y_3S1_3S2_800,
      Y_4S1_4S2_800: tCTcoreRData.Y_4S1_4S2_800,
      Y_5S1_5S2_800: tCTcoreRData.Y_5S1_5S2_800,
      B_1S1_1S2_800: tCTcoreRData.B_1S1_1S2_800,
      B_2S1_2S2_800: tCTcoreRData.B_2S1_2S2_800,
      B_3S1_3S2_800: tCTcoreRData.B_3S1_3S2_800,
      B_4S1_4S2_800: tCTcoreRData.B_4S1_4S2_800,
      B_5S1_5S2_800: tCTcoreRData.B_5S1_5S2_800,
    );
    return tCTcoreRModel;
  }

  @override
  Future<int> localCTcoreR(CTcoreRModel ctcorertolocal) {
    return (sl<AppDatabase>().createCTcoreR(ctcorertolocal));
  }

  @override
  Future<void> updateCTcoreR(CTcoreRModel ctcorertoupdate, int id) async {
    sl<AppDatabase>().updateCTcoreR(ctcorertoupdate, id);
  }

  @override
  Future<int> deleteCTcoreRById(int id) {
    return (sl<AppDatabase>().deleteCTcoreRById(id));
  }

  @override
  Future<List<CTcoreRModel>> getCTcoreR_SerialNo(String serialNo) async {
    final tCTcoreR_data =
        await sl<AppDatabase>().getCTcoreRLocalDataWithSerialNo(serialNo);

    List<CTcoreRModel> tCTcoreR_Model =
        List<CTcoreRModel>.empty(growable: true);
    for (var listEle in tCTcoreR_data) {
      tCTcoreR_Model.add(CTcoreRModel(
        id: listEle.id,
        trNo: listEle.trNo,
        databaseID: listEle.databaseID,
        serialNo: listEle.serialNo,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
        R_1S1_1S2_200: listEle.R_1S1_1S2_200,
        R_2S1_2S2_200: listEle.R_2S1_2S2_200,
        R_3S1_3S2_200: listEle.R_3S1_3S2_200,
        R_4S1_4S2_200: listEle.R_4S1_4S2_200,
        R_5S1_5S2_200: listEle.R_5S1_5S2_200,
        Y_1S1_1S2_200: listEle.Y_1S1_1S2_200,
        Y_2S1_2S2_200: listEle.Y_2S1_2S2_200,
        Y_3S1_3S2_200: listEle.Y_3S1_3S2_200,
        Y_4S1_4S2_200: listEle.Y_4S1_4S2_200,
        Y_5S1_5S2_200: listEle.Y_5S1_5S2_200,
        B_1S1_1S2_200: listEle.B_1S1_1S2_200,
        B_2S1_2S2_200: listEle.B_2S1_2S2_200,
        B_3S1_3S2_200: listEle.B_3S1_3S2_200,
        B_4S1_4S2_200: listEle.B_4S1_4S2_200,
        B_5S1_5S2_200: listEle.B_5S1_5S2_200,
        R_1S1_1S2_400: listEle.R_1S1_1S2_400,
        R_2S1_2S2_400: listEle.R_2S1_2S2_400,
        R_3S1_3S2_400: listEle.R_3S1_3S2_400,
        R_4S1_4S2_400: listEle.R_4S1_4S2_400,
        R_5S1_5S2_400: listEle.R_5S1_5S2_400,
        Y_1S1_1S2_400: listEle.Y_1S1_1S2_400,
        Y_2S1_2S2_400: listEle.Y_2S1_2S2_400,
        Y_3S1_3S2_400: listEle.Y_3S1_3S2_400,
        Y_4S1_4S2_400: listEle.Y_4S1_4S2_400,
        Y_5S1_5S2_400: listEle.Y_5S1_5S2_400,
        B_1S1_1S2_400: listEle.B_1S1_1S2_400,
        B_2S1_2S2_400: listEle.B_2S1_2S2_400,
        B_3S1_3S2_400: listEle.B_3S1_3S2_400,
        B_4S1_4S2_400: listEle.B_4S1_4S2_400,
        B_5S1_5S2_400: listEle.B_5S1_5S2_400,
        R_1S1_1S2_600: listEle.R_1S1_1S2_600,
        R_2S1_2S2_600: listEle.R_2S1_2S2_600,
        R_3S1_3S2_600: listEle.R_3S1_3S2_600,
        R_4S1_4S2_600: listEle.R_4S1_4S2_600,
        R_5S1_5S2_600: listEle.R_5S1_5S2_600,
        Y_1S1_1S2_600: listEle.Y_1S1_1S2_600,
        Y_2S1_2S2_600: listEle.Y_2S1_2S2_600,
        Y_3S1_3S2_600: listEle.Y_3S1_3S2_600,
        Y_4S1_4S2_600: listEle.Y_4S1_4S2_600,
        Y_5S1_5S2_600: listEle.Y_5S1_5S2_600,
        B_1S1_1S2_600: listEle.B_1S1_1S2_600,
        B_2S1_2S2_600: listEle.B_2S1_2S2_600,
        B_3S1_3S2_600: listEle.B_3S1_3S2_600,
        B_4S1_4S2_600: listEle.B_4S1_4S2_600,
        B_5S1_5S2_600: listEle.B_5S1_5S2_600,
        R_1S1_1S2_800: listEle.R_1S1_1S2_800,
        R_2S1_2S2_800: listEle.R_2S1_2S2_800,
        R_3S1_3S2_800: listEle.R_3S1_3S2_800,
        R_4S1_4S2_800: listEle.R_4S1_4S2_800,
        R_5S1_5S2_800: listEle.R_5S1_5S2_800,
        Y_1S1_1S2_800: listEle.Y_1S1_1S2_800,
        Y_2S1_2S2_800: listEle.Y_2S1_2S2_800,
        Y_3S1_3S2_800: listEle.Y_3S1_3S2_800,
        Y_4S1_4S2_800: listEle.Y_4S1_4S2_800,
        Y_5S1_5S2_800: listEle.Y_5S1_5S2_800,
        B_1S1_1S2_800: listEle.B_1S1_1S2_800,
        B_2S1_2S2_800: listEle.B_2S1_2S2_800,
        B_3S1_3S2_800: listEle.B_3S1_3S2_800,
        B_4S1_4S2_800: listEle.B_4S1_4S2_800,
        B_5S1_5S2_800: listEle.B_5S1_5S2_800,
      ));
    }
    return tCTcoreR_Model;
  }

  @override
  Future<List<CTcoreRModel>> getCTcoreREquipmentLists() async {
    final tCTcoreRData =
        await sl<AppDatabase>().getCTcoreREquipmentListwithAll();
    List<CTcoreRModel> tCTcoreRTestModel =
        List<CTcoreRModel>.empty(growable: true);
    for (var element in tCTcoreRData) {
      tCTcoreRTestModel.add(CTcoreRModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        equipmentUsed: element.equipmentUsed,
        updateDate: element.updateDate,
        R_1S1_1S2_200: element.R_1S1_1S2_200,
        R_2S1_2S2_200: element.R_2S1_2S2_200,
        R_3S1_3S2_200: element.R_3S1_3S2_200,
        R_4S1_4S2_200: element.R_4S1_4S2_200,
        R_5S1_5S2_200: element.R_5S1_5S2_200,
        Y_1S1_1S2_200: element.Y_1S1_1S2_200,
        Y_2S1_2S2_200: element.Y_2S1_2S2_200,
        Y_3S1_3S2_200: element.Y_3S1_3S2_200,
        Y_4S1_4S2_200: element.Y_4S1_4S2_200,
        Y_5S1_5S2_200: element.Y_5S1_5S2_200,
        B_1S1_1S2_200: element.B_1S1_1S2_200,
        B_2S1_2S2_200: element.B_2S1_2S2_200,
        B_3S1_3S2_200: element.B_3S1_3S2_200,
        B_4S1_4S2_200: element.B_4S1_4S2_200,
        B_5S1_5S2_200: element.B_5S1_5S2_200,
        R_1S1_1S2_400: element.R_1S1_1S2_400,
        R_2S1_2S2_400: element.R_2S1_2S2_400,
        R_3S1_3S2_400: element.R_3S1_3S2_400,
        R_4S1_4S2_400: element.R_4S1_4S2_400,
        R_5S1_5S2_400: element.R_5S1_5S2_400,
        Y_1S1_1S2_400: element.Y_1S1_1S2_400,
        Y_2S1_2S2_400: element.Y_2S1_2S2_400,
        Y_3S1_3S2_400: element.Y_3S1_3S2_400,
        Y_4S1_4S2_400: element.Y_4S1_4S2_400,
        Y_5S1_5S2_400: element.Y_5S1_5S2_400,
        B_1S1_1S2_400: element.B_1S1_1S2_400,
        B_2S1_2S2_400: element.B_2S1_2S2_400,
        B_3S1_3S2_400: element.B_3S1_3S2_400,
        B_4S1_4S2_400: element.B_4S1_4S2_400,
        B_5S1_5S2_400: element.B_5S1_5S2_400,
        R_1S1_1S2_600: element.R_1S1_1S2_600,
        R_2S1_2S2_600: element.R_2S1_2S2_600,
        R_3S1_3S2_600: element.R_3S1_3S2_600,
        R_4S1_4S2_600: element.R_4S1_4S2_600,
        R_5S1_5S2_600: element.R_5S1_5S2_600,
        Y_1S1_1S2_600: element.Y_1S1_1S2_600,
        Y_2S1_2S2_600: element.Y_2S1_2S2_600,
        Y_3S1_3S2_600: element.Y_3S1_3S2_600,
        Y_4S1_4S2_600: element.Y_4S1_4S2_600,
        Y_5S1_5S2_600: element.Y_5S1_5S2_600,
        B_1S1_1S2_600: element.B_1S1_1S2_600,
        B_2S1_2S2_600: element.B_2S1_2S2_600,
        B_3S1_3S2_600: element.B_3S1_3S2_600,
        B_4S1_4S2_600: element.B_4S1_4S2_600,
        B_5S1_5S2_600: element.B_5S1_5S2_600,
        R_1S1_1S2_800: element.R_1S1_1S2_800,
        R_2S1_2S2_800: element.R_2S1_2S2_800,
        R_3S1_3S2_800: element.R_3S1_3S2_800,
        R_4S1_4S2_800: element.R_4S1_4S2_800,
        R_5S1_5S2_800: element.R_5S1_5S2_800,
        Y_1S1_1S2_800: element.Y_1S1_1S2_800,
        Y_2S1_2S2_800: element.Y_2S1_2S2_800,
        Y_3S1_3S2_800: element.Y_3S1_3S2_800,
        Y_4S1_4S2_800: element.Y_4S1_4S2_800,
        Y_5S1_5S2_800: element.Y_5S1_5S2_800,
        B_1S1_1S2_800: element.B_1S1_1S2_800,
        B_2S1_2S2_800: element.B_2S1_2S2_800,
        B_3S1_3S2_800: element.B_3S1_3S2_800,
        B_4S1_4S2_800: element.B_4S1_4S2_800,
        B_5S1_5S2_800: element.B_5S1_5S2_800,
      ));
    }
    return tCTcoreRTestModel;
  }
}

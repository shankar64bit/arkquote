// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/CT/ct_core_kvp_model.dart';
import '../../test_report_local_datasource.dart';

abstract class CTcoreKVPLocalDatasource {
  Future<CTcoreKVPModel> getCTcoreKVP_ById(int id);
  Future<int> localCTcoreKVP(CTcoreKVPModel ctkvptolocal);
  Future<void> updateCTcoreKVP(CTcoreKVPModel ctkvptoupdate, int id);
  Future<int> deleteCTcoreKVPById(int id);
  Future<List<CTcoreKVPModel>> getCTcoreKVP_SerialNo(String serialNo);
  Future<List<CTcoreKVPModel>> getCTkvpEquipmentLists();
}

@DataClassName('CTcoreKVPLocalData')
class CTcoreKVPLocalDatasourceImpl extends Table
    implements CTcoreKVPLocalDatasource {
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
  RealColumn get R_35 => real()();
  @required
  RealColumn get R_70 => real()();
  @required
  RealColumn get R_105 => real()();
  @required
  RealColumn get R_140 => real()();
  @required
  RealColumn get R_175 => real()();
  @required
  RealColumn get R_210 => real()();
  @required
  RealColumn get R_245 => real()();
  @required
  RealColumn get R_280 => real()();
  @required
  RealColumn get R_315 => real()();
  @required
  RealColumn get R_350 => real()();
  @required
  RealColumn get R_385 => real()();

  @required
  RealColumn get Y_35 => real()();
  @required
  RealColumn get Y_70 => real()();
  @required
  RealColumn get Y_105 => real()();
  @required
  RealColumn get Y_140 => real()();
  @required
  RealColumn get Y_175 => real()();
  @required
  RealColumn get Y_210 => real()();
  @required
  RealColumn get Y_245 => real()();
  @required
  RealColumn get Y_280 => real()();
  @required
  RealColumn get Y_315 => real()();
  @required
  RealColumn get Y_350 => real()();
  @required
  RealColumn get Y_385 => real()();

  @required
  RealColumn get B_35 => real()();
  @required
  RealColumn get B_70 => real()();
  @required
  RealColumn get B_105 => real()();
  @required
  RealColumn get B_140 => real()();
  @required
  RealColumn get B_175 => real()();
  @required
  RealColumn get B_210 => real()();
  @required
  RealColumn get B_245 => real()();
  @required
  RealColumn get B_280 => real()();
  @required
  RealColumn get B_315 => real()();
  @required
  RealColumn get B_350 => real()();
  @required
  RealColumn get B_385 => real()();

  @override
  Future<CTcoreKVPModel> getCTcoreKVP_ById(int id) async {
    CTcoreKVPLocalData tCTcoreKVPData =
        await sl<AppDatabase>().getCTcoreKVPLocalDataWithId(id);
    CTcoreKVPModel tCTcoreKVPModel = CTcoreKVPModel(
      id: tCTcoreKVPData.id,
      databaseID: tCTcoreKVPData.databaseID,
      trNo: tCTcoreKVPData.trNo,
      serialNo: tCTcoreKVPData.serialNo,
      equipmentUsed: tCTcoreKVPData.equipmentUsed,
      updateDate: tCTcoreKVPData.updateDate,
      R_35: tCTcoreKVPData.R_35,
      R_70: tCTcoreKVPData.R_70,
      R_105: tCTcoreKVPData.R_105,
      R_140: tCTcoreKVPData.R_140,
      R_175: tCTcoreKVPData.R_175,
      R_210: tCTcoreKVPData.R_210,
      R_245: tCTcoreKVPData.R_245,
      R_280: tCTcoreKVPData.R_280,
      R_315: tCTcoreKVPData.R_315,
      R_350: tCTcoreKVPData.R_350,
      R_385: tCTcoreKVPData.R_385,
      Y_35: tCTcoreKVPData.Y_35,
      Y_70: tCTcoreKVPData.Y_70,
      Y_105: tCTcoreKVPData.Y_105,
      Y_140: tCTcoreKVPData.Y_140,
      Y_175: tCTcoreKVPData.Y_175,
      Y_210: tCTcoreKVPData.Y_210,
      Y_245: tCTcoreKVPData.Y_245,
      Y_280: tCTcoreKVPData.Y_280,
      Y_315: tCTcoreKVPData.Y_315,
      Y_350: tCTcoreKVPData.Y_350,
      Y_385: tCTcoreKVPData.Y_385,
      B_35: tCTcoreKVPData.B_35,
      B_70: tCTcoreKVPData.B_70,
      B_105: tCTcoreKVPData.B_105,
      B_140: tCTcoreKVPData.B_140,
      B_175: tCTcoreKVPData.B_175,
      B_210: tCTcoreKVPData.B_210,
      B_245: tCTcoreKVPData.B_245,
      B_280: tCTcoreKVPData.B_280,
      B_315: tCTcoreKVPData.B_315,
      B_350: tCTcoreKVPData.B_350,
      B_385: tCTcoreKVPData.B_385,
    );
    return tCTcoreKVPModel;
  }

  @override
  Future<int> localCTcoreKVP(CTcoreKVPModel ctkvptolocal) {
    return (sl<AppDatabase>().createCTcoreKVP(ctkvptolocal));
  }

  @override
  Future<void> updateCTcoreKVP(CTcoreKVPModel ctkvptoupdate, int id) async {
    return (sl<AppDatabase>().updateCTcoreKVP(ctkvptoupdate, id));
  }

  @override
  Future<int> deleteCTcoreKVPById(int id) {
    return (sl<AppDatabase>().deleteCTcoreKVPById(id));
  }

  @override
  Future<List<CTcoreKVPModel>> getCTcoreKVP_SerialNo(String serialNo) async {
    final tCTcoreKVP_data =
        await sl<AppDatabase>().getCTcoreKVPLocalDataWithSerialNo(serialNo);

    List<CTcoreKVPModel> tCTcoreKVP_Model =
        List<CTcoreKVPModel>.empty(growable: true);
    for (var listEle in tCTcoreKVP_data) {
      tCTcoreKVP_Model.add(CTcoreKVPModel(
        id: listEle.id,
        trNo: listEle.trNo,
        databaseID: listEle.databaseID,
        serialNo: listEle.serialNo,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
        R_35: listEle.R_35,
        R_70: listEle.R_70,
        R_105: listEle.R_105,
        R_140: listEle.R_140,
        R_175: listEle.R_175,
        R_210: listEle.R_210,
        R_245: listEle.R_245,
        R_280: listEle.R_280,
        R_315: listEle.R_315,
        R_350: listEle.R_350,
        R_385: listEle.R_385,
        Y_35: listEle.Y_35,
        Y_70: listEle.Y_70,
        Y_105: listEle.Y_105,
        Y_140: listEle.Y_140,
        Y_175: listEle.Y_175,
        Y_210: listEle.Y_210,
        Y_245: listEle.Y_245,
        Y_280: listEle.Y_280,
        Y_315: listEle.Y_315,
        Y_350: listEle.Y_350,
        Y_385: listEle.Y_385,
        B_35: listEle.B_35,
        B_70: listEle.B_70,
        B_105: listEle.B_105,
        B_140: listEle.B_140,
        B_175: listEle.B_175,
        B_210: listEle.B_210,
        B_245: listEle.B_245,
        B_280: listEle.B_280,
        B_315: listEle.B_315,
        B_350: listEle.B_350,
        B_385: listEle.B_385,
      ));
    }
    return tCTcoreKVP_Model;
  }

  @override
  Future<List<CTcoreKVPModel>> getCTkvpEquipmentLists() async {
    final tCTkvpData = await sl<AppDatabase>().getCTkvpEquipmentListwithAll();
    List<CTcoreKVPModel> tCTkvpTestModel =
        List<CTcoreKVPModel>.empty(growable: true);
    for (var element in tCTkvpData) {
      tCTkvpTestModel.add(CTcoreKVPModel(
        id: element.id,
        trNo: element.trNo,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        equipmentUsed: element.equipmentUsed,
        updateDate: element.updateDate,
        R_35: element.R_35,
        R_70: element.R_70,
        R_105: element.R_105,
        R_140: element.R_140,
        R_175: element.R_175,
        R_210: element.R_210,
        R_245: element.R_245,
        R_280: element.R_280,
        R_315: element.R_315,
        R_350: element.R_350,
        R_385: element.R_385,
        Y_35: element.Y_35,
        Y_70: element.Y_70,
        Y_105: element.Y_105,
        Y_140: element.Y_140,
        Y_175: element.Y_175,
        Y_210: element.Y_210,
        Y_245: element.Y_245,
        Y_280: element.Y_280,
        Y_315: element.Y_315,
        Y_350: element.Y_350,
        Y_385: element.Y_385,
        B_35: element.B_35,
        B_70: element.B_70,
        B_105: element.B_105,
        B_140: element.B_140,
        B_175: element.B_175,
        B_210: element.B_210,
        B_245: element.B_245,
        B_280: element.B_280,
        B_315: element.B_315,
        B_350: element.B_350,
        B_385: element.B_385,
      ));
    }
    return tCTkvpTestModel;
  }
}

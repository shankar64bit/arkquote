// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../models/equipment/powt_3_winding/powt3win_wrHv_model.dart';
import '../../test_report_local_datasource.dart';
import '../../../../../../injection_container.dart';

abstract class Powt3winwrHvLocalDatasource {
  Future<Powt3winwrHvModel> getPowt3winwrHv_ById(int id);
  Future<int> localPowt3winwrHv(Powt3winwrHvModel Powt3winwrHvtoLocal);
  Future<void> updatePowt3winwrHv(Powt3winwrHvModel powt3winwrHvupdate, int id);
  Future<int> deletePowt3winwrHvById(int id);
  Future<List<Powt3winwrHvModel>> getPowt3winwrHvTrNoID(int trNo);
  Future<List<Powt3winwrHvModel>> getPowt3winwrHvSerialNo(String serialNo);
  Future<List<Powt3winwrHvModel>> getpowt3winwrHvEquipmentLists();
}

@DataClassName('Powt3winwrHvLocalData')
class Powt3winwrHvLocalDatasourceImpl extends Table
    implements Powt3winwrHvLocalDatasource {
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
  RealColumn get hv_r_1u_1n => real()();
  @required
  RealColumn get hv_r_1v_1n => real()();
  @required
  RealColumn get hv_r_1w_1n => real()();

  @override
  Future<Powt3winwrHvModel> getPowt3winwrHv_ById(int id) async {
    Powt3winwrHvLocalData tPowt3winwrHVData =
        await sl<AppDatabase>().getPowt3winwrHvLocalDataWithId(id);
    Powt3winwrHvModel tPowt3winwrHvModel = Powt3winwrHvModel(
      id: tPowt3winwrHVData.id,
      databaseID: tPowt3winwrHVData.databaseID,
      trNo: tPowt3winwrHVData.trNo,
      serialNo: tPowt3winwrHVData.serialNo,
      hv_r_1u_1n: tPowt3winwrHVData.hv_r_1u_1n,
      hv_r_1v_1n: tPowt3winwrHVData.hv_r_1v_1n,
      hv_r_1w_1n: tPowt3winwrHVData.hv_r_1w_1n,
      tapPosition: tPowt3winwrHVData.tapPosition,
    );
    return tPowt3winwrHvModel;
  }

  @override
  Future<int> localPowt3winwrHv(Powt3winwrHvModel Powt3winwrHvtoLocal) {
    return (sl<AppDatabase>().createPowt3winwrHv(Powt3winwrHvtoLocal));
  }

  @override
  Future<void> updatePowt3winwrHv(
      Powt3winwrHvModel powt3winwrHvupdate, int id) async {
    sl<AppDatabase>().updatePowt3winwrHv(powt3winwrHvupdate, id);
  }

  @override
  Future<int> deletePowt3winwrHvById(int id) {
    return (sl<AppDatabase>().deletePowt3winwrHvById(id));
  }

  @override
  Future<List<Powt3winwrHvModel>> getPowt3winwrHvTrNoID(int trNo) async {
    final tPowt3winwrHv_data =
        await sl<AppDatabase>().getPowt3winwrHvLocalDataWithtrNoID(trNo);

    List<Powt3winwrHvModel> tPowt3winwrHv_Model =
        List<Powt3winwrHvModel>.empty(growable: true);
    for (var listEle in tPowt3winwrHv_data) {
      tPowt3winwrHv_Model.add(Powt3winwrHvModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_r_1u_1n: listEle.hv_r_1u_1n,
        hv_r_1v_1n: listEle.hv_r_1v_1n,
        hv_r_1w_1n: listEle.hv_r_1w_1n,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tPowt3winwrHv_Model;
  }

  @override
  Future<List<Powt3winwrHvModel>> getPowt3winwrHvSerialNo(
      String serialNo) async {
    final tPowt3winwrHv_data =
        await sl<AppDatabase>().getPowt3winwrHvLocalDataWithSerialNo(serialNo);

    List<Powt3winwrHvModel> tPowt3winwrHv_Model =
        List<Powt3winwrHvModel>.empty(growable: true);
    for (var listEle in tPowt3winwrHv_data) {
      tPowt3winwrHv_Model.add(Powt3winwrHvModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_r_1u_1n: listEle.hv_r_1u_1n,
        hv_r_1v_1n: listEle.hv_r_1v_1n,
        hv_r_1w_1n: listEle.hv_r_1w_1n,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tPowt3winwrHv_Model;
  }

  @override
  Future<List<Powt3winwrHvModel>> getpowt3winwrHvEquipmentLists() async {
    final tpowt3winwrHvData =
        await sl<AppDatabase>().getpowt3winwrHvEquipmentListwithAll();
    List<Powt3winwrHvModel> tpowt3winwrhvTestModel =
        List<Powt3winwrHvModel>.empty(growable: true);
    for (var listEle in tpowt3winwrHvData) {
      tpowt3winwrhvTestModel.add(Powt3winwrHvModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_r_1u_1n: listEle.hv_r_1u_1n,
        hv_r_1v_1n: listEle.hv_r_1v_1n,
        hv_r_1w_1n: listEle.hv_r_1w_1n,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tpowt3winwrhvTestModel;
  }
}

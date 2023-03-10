// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/powt/powt_wrHv_model.dart';
import '../../test_report_local_datasource.dart';
// import '../../../../../../injection_container.dart';
// import '../../test_report_local_datasource.dart';

abstract class PowtwrHvLocalDatasource {
  Future<PowtwrHvModel> getPowtwrHv_ById(int id);
  Future<int> localPowtwrHv(PowtwrHvModel powtwrhvtolocal);
  Future<void> updatePowtwrHv(PowtwrHvModel powtwrhvtoupdate, int id);
  Future<int> deletePowtwrHvById(int id);
  Future<List<PowtwrHvModel>> getPowtwrHvTrNoID(int trNo);
  Future<List<PowtwrHvModel>> getPowtwrHvSerialNo(String serialNo);
  Future<List<PowtwrHvModel>> getPowtwrHvEquipmentLists();
}

@DataClassName('PowtwrHvLocalData')
class PowtwrHvLocalDatasourceImpl extends Table
    implements PowtwrHvLocalDatasource {
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
  RealColumn get hv_r_1u_1vn => real()();
  @required
  RealColumn get hv_r_1v_1wn => real()();
  @required
  RealColumn get hv_r_1w_1un => real()();

  @override
  Future<PowtwrHvModel> getPowtwrHv_ById(int id) async {
    PowtwrHvLocalData tPowtwrHVData =
        await sl<AppDatabase>().getPowtwrHvLocalDataWithId(id);
    PowtwrHvModel tPowtwrHvModel = PowtwrHvModel(
      id: tPowtwrHVData.id,
      databaseID: tPowtwrHVData.databaseID,
      trNo: tPowtwrHVData.trNo,
      serialNo: tPowtwrHVData.serialNo,
      hv_r_1u_1vn: tPowtwrHVData.hv_r_1u_1vn,
      hv_r_1v_1wn: tPowtwrHVData.hv_r_1v_1wn,
      hv_r_1w_1un: tPowtwrHVData.hv_r_1w_1un,
      tapPosition: tPowtwrHVData.tapPosition,
    );
    return tPowtwrHvModel;
  }

  @override
  Future<int> localPowtwrHv(PowtwrHvModel powtwrhvtolocal) {
    return (sl<AppDatabase>().createPowtwrHv(powtwrhvtolocal));
  }

  @override
  Future<void> updatePowtwrHv(PowtwrHvModel powtwrhvtoupdate, int id) async {
    sl<AppDatabase>().updatePowtwrHv(powtwrhvtoupdate, id);
  }

  @override
  Future<int> deletePowtwrHvById(int id) {
    return (sl<AppDatabase>().deletePowtwrHvById(id));
  }

  @override
  Future<List<PowtwrHvModel>> getPowtwrHvTrNoID(int trNo) async {
    final tPowtwrHv_data =
        await sl<AppDatabase>().getPowtwrHvLocalDataWithtrNoID(trNo);

    List<PowtwrHvModel> tPowtwrHv_Model =
        List<PowtwrHvModel>.empty(growable: true);
    for (var listEle in tPowtwrHv_data) {
      tPowtwrHv_Model.add(PowtwrHvModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_r_1u_1vn: listEle.hv_r_1u_1vn,
        hv_r_1v_1wn: listEle.hv_r_1v_1wn,
        hv_r_1w_1un: listEle.hv_r_1w_1un,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tPowtwrHv_Model;
  }

  @override
  Future<List<PowtwrHvModel>> getPowtwrHvSerialNo(String serialNo) async {
    final tPowtwrHv_data =
        await sl<AppDatabase>().getPowtwrHvLocalDataWithSerialNo(serialNo);

    List<PowtwrHvModel> tPowtwrHv_Model =
        List<PowtwrHvModel>.empty(growable: true);
    for (var listEle in tPowtwrHv_data) {
      tPowtwrHv_Model.add(PowtwrHvModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_r_1u_1vn: listEle.hv_r_1u_1vn,
        hv_r_1v_1wn: listEle.hv_r_1v_1wn,
        hv_r_1w_1un: listEle.hv_r_1w_1un,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tPowtwrHv_Model;
  }

  @override
  Future<List<PowtwrHvModel>> getPowtwrHvEquipmentLists() async {
    final tpowtwrhvData =
        await sl<AppDatabase>().getPowtwrHvEquipmentListwithAll();
    List<PowtwrHvModel> tpowtwrhvTestModel =
        List<PowtwrHvModel>.empty(growable: true);
    for (var element in tpowtwrhvData) {
      tpowtwrhvTestModel.add(PowtwrHvModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        hv_r_1u_1vn: element.hv_r_1u_1vn,
        hv_r_1v_1wn: element.hv_r_1v_1wn,
        hv_r_1w_1un: element.hv_r_1w_1un,
        tapPosition: element.tapPosition,
      ));
    }
    return tpowtwrhvTestModel;
  }
}

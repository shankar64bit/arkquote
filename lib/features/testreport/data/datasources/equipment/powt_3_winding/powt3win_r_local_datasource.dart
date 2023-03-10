// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'package:drift/drift.dart';
import '../../../models/equipment/powt_3_winding/powt3win_r_model.dart';
import '../../test_report_local_datasource.dart';
import '../../../../../../injection_container.dart';

abstract class Powt3win_R_LocalDatasource {
  // Future<Powt3win_R_Model> getPowt3win_R_ById(int id);
  Future<int> localPowt3win_R(Powt3win_R_Model p3wRtolocal);
  Future<void> updatePowt3win_R(Powt3win_R_Model p3wRtoupdate, int id);
  Future<int> deletePowt3win_RById(int id);
  Future<List<Powt3win_R_Model>> getPowt3win_RTrNoID(int trNo);
  Future<List<Powt3win_R_Model>> getPowt3win_RSerialNo(String sNo);
  Future<List<Powt3win_R_Model>> getpowt3winEquipmentLists();
}

@DataClassName('Powt3winrLocalData')
class Powt3win_R_LocalDatasourceImpl extends Table
    implements Powt3win_R_LocalDatasource {
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
  RealColumn get hv_1u_1vn => real()();
  @required
  RealColumn get hv_1v_1wn => real()();
  @required
  RealColumn get hv_1w_1un => real()();
  @required
  RealColumn get lv_uvn => real()();
  @required
  RealColumn get lv_vwn => real()();
  @required
  RealColumn get lv_wun => real()();
  @required
  RealColumn get ivt_uvn => real()();
  @required
  RealColumn get ivt_vwn => real()();
  @required
  RealColumn get ivt_wun => real()();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<Powt3win_R_Model> getPowt3win_R_ById(int id) async {
    Powt3winrLocalData tPowt3win_RData =
        await sl<AppDatabase>().getPowt3win_RLocalDataWithId(id);
    Powt3win_R_Model tPowt3win_RModel = Powt3win_R_Model(
      id: tPowt3win_RData.id,
      databaseID: tPowt3win_RData.databaseID,
      trNo: tPowt3win_RData.trNo,
      serialNo: tPowt3win_RData.serialNo,
      hv_1u_1vn: tPowt3win_RData.hv_1u_1vn,
      hv_1v_1wn: tPowt3win_RData.hv_1v_1wn,
      hv_1w_1un: tPowt3win_RData.hv_1w_1un,
      lv_uvn: tPowt3win_RData.lv_uvn,
      lv_vwn: tPowt3win_RData.lv_vwn,
      lv_wun: tPowt3win_RData.lv_wun,
      ivt_uvn: tPowt3win_RData.ivt_uvn,
      ivt_vwn: tPowt3win_RData.ivt_vwn,
      ivt_wun: tPowt3win_RData.ivt_wun,
      equipmentUsed: tPowt3win_RData.equipmentUsed,
      tapPosition: tPowt3win_RData.tapPosition,
      updateDate: tPowt3win_RData.updateDate,
    );
    return tPowt3win_RModel;
  }

  @override
  Future<int> localPowt3win_R(Powt3win_R_Model p3wRtolocal) {
    return (sl<AppDatabase>().createPowt3win_R(p3wRtolocal));
  }

  @override
  Future<void> updatePowt3win_R(Powt3win_R_Model p3wRtoupdate, int id) async {
    sl<AppDatabase>().updatePowt3win_R(p3wRtoupdate, id);
  }

  @override
  Future<int> deletePowt3win_RById(int id) {
    return (sl<AppDatabase>().deletePowt3win_RById(id));
  }

  @override
  Future<List<Powt3win_R_Model>> getPowt3win_RTrNoID(int ctNo) async {
    final tPowt3win_R_data =
        await sl<AppDatabase>().getPowt3win_RLocalDataWithtrNoID(ctNo);

    List<Powt3win_R_Model> tPowt3win_R_Model =
        List<Powt3win_R_Model>.empty(growable: true);
    for (var listEle in tPowt3win_R_data) {
      tPowt3win_R_Model.add(Powt3win_R_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_1u_1vn: listEle.hv_1u_1vn,
        hv_1v_1wn: listEle.hv_1v_1wn,
        hv_1w_1un: listEle.hv_1w_1un,
        lv_uvn: listEle.lv_uvn,
        lv_vwn: listEle.lv_vwn,
        lv_wun: listEle.lv_wun,
        ivt_uvn: listEle.ivt_uvn,
        ivt_vwn: listEle.ivt_vwn,
        ivt_wun: listEle.ivt_wun,
        equipmentUsed: listEle.equipmentUsed,
        tapPosition: listEle.tapPosition,
        updateDate: listEle.updateDate,
      ));
    }
    return tPowt3win_R_Model;
  }

  @override
  Future<List<Powt3win_R_Model>> getPowt3win_RSerialNo(String sNo) async {
    final tPowt3win_R_data =
        await sl<AppDatabase>().getPowt3win_RLocalDataWithSerialNo(sNo);

    List<Powt3win_R_Model> tPowt3win_RModel =
        List<Powt3win_R_Model>.empty(growable: true);
    for (var listEle in tPowt3win_R_data) {
      tPowt3win_RModel.add(Powt3win_R_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_1u_1vn: listEle.hv_1u_1vn,
        hv_1v_1wn: listEle.hv_1v_1wn,
        hv_1w_1un: listEle.hv_1w_1un,
        lv_uvn: listEle.lv_uvn,
        lv_vwn: listEle.lv_vwn,
        lv_wun: listEle.lv_wun,
        ivt_uvn: listEle.ivt_uvn,
        ivt_vwn: listEle.ivt_vwn,
        ivt_wun: listEle.ivt_wun,
        tapPosition: listEle.tapPosition,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tPowt3win_RModel;
  }

  @override
  Future<List<Powt3win_R_Model>> getpowt3winEquipmentLists() async {
    final tpowt3winRData =
        await sl<AppDatabase>().getpowt3winREquipmentListwithAll();
    List<Powt3win_R_Model> tpowt3winRTestModel =
        List<Powt3win_R_Model>.empty(growable: true);
    for (var listEle in tpowt3winRData) {
      tpowt3winRTestModel.add(Powt3win_R_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_1u_1vn: listEle.hv_1u_1vn,
        hv_1v_1wn: listEle.hv_1v_1wn,
        hv_1w_1un: listEle.hv_1w_1un,
        lv_uvn: listEle.lv_uvn,
        lv_vwn: listEle.lv_vwn,
        lv_wun: listEle.lv_wun,
        ivt_uvn: listEle.ivt_uvn,
        ivt_vwn: listEle.ivt_vwn,
        ivt_wun: listEle.ivt_wun,
        tapPosition: listEle.tapPosition,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tpowt3winRTestModel;
  }
}

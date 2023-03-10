// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../models/equipment/powt_3_winding/powt3win_wrIvT_model.dart';
import '../../test_report_local_datasource.dart';
import '../../../../../../injection_container.dart';

abstract class Powt3winwrIvTLocalDatasource {
  Future<Powt3winwrIvTModel> getPowt3winwrIvT_ById(int id);
  Future<int> localPowt3winwrIvT(Powt3winwrIvTModel p3wwrIvittolocal);
  Future<void> updatePowt3winwrIvT(
      Powt3winwrIvTModel p3wwrIvittoupdate, int id);
  Future<int> deletePowt3winwrIvTById(int id);
  Future<List<Powt3winwrIvTModel>> getPowt3winwrIvTTrNoID(int trNo);
  Future<List<Powt3winwrIvTModel>> getPowt3winwrIvTSerialNo(String sNo);
  Future<List<Powt3winwrIvTModel>> getPowt3winwrIvtEquipmentLists();
}

@DataClassName('Powt3winwrIvTLocalData')
class Powt3winwrIvTLocalDatasourceImpl extends Table
    implements Powt3winwrIvTLocalDatasource {
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
  RealColumn get ivt_r_uvn => real()();
  @required
  RealColumn get ivt_r_vwn => real()();
  @required
  RealColumn get ivt_r_wun => real()();
  // @required
  // TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  // @required
  // DateTimeColumn get updateDate =>
  //     dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<Powt3winwrIvTModel> getPowt3winwrIvT_ById(int id) async {
    Powt3winwrIvTLocalData tPowtwrLVData =
        await sl<AppDatabase>().getPowt3winwrIvTLocalDataWithId(id);
    Powt3winwrIvTModel tPowt3winwrIvTModel = Powt3winwrIvTModel(
      id: tPowtwrLVData.id,
      databaseID: tPowtwrLVData.databaseID,
      trNo: tPowtwrLVData.trNo,
      serialNo: tPowtwrLVData.serialNo,
      ivt_r_uvn: tPowtwrLVData.ivt_r_uvn,
      ivt_r_vwn: tPowtwrLVData.ivt_r_vwn,
      ivt_r_wun: tPowtwrLVData.ivt_r_wun,
      tapPosition: tPowtwrLVData.tapPosition,
    );
    return tPowt3winwrIvTModel;
  }

  @override
  Future<int> localPowt3winwrIvT(Powt3winwrIvTModel p3wwrIvittolocal) {
    return (sl<AppDatabase>().createPowt3winwrIvT(p3wwrIvittolocal));
  }

  @override
  Future<void> updatePowt3winwrIvT(
      Powt3winwrIvTModel p3wwrIvittoupdate, int id) async {
    sl<AppDatabase>().updatePowt3winwrIvT(p3wwrIvittoupdate, id);
  }

  @override
  Future<int> deletePowt3winwrIvTById(int id) {
    return (sl<AppDatabase>().deletePowt3winwrIvTById(id));
  }

  @override
  Future<List<Powt3winwrIvTModel>> getPowt3winwrIvTTrNoID(int trNo) async {
    final tPowt3winwrIvT_data =
        await sl<AppDatabase>().getPowt3winwrIvTLocalDataWithtrNoID(trNo);

    List<Powt3winwrIvTModel> tPowt3winwrIvT_Model =
        List<Powt3winwrIvTModel>.empty(growable: true);
    for (var listEle in tPowt3winwrIvT_data) {
      tPowt3winwrIvT_Model.add(Powt3winwrIvTModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        ivt_r_uvn: listEle.ivt_r_uvn,
        ivt_r_vwn: listEle.ivt_r_vwn,
        ivt_r_wun: listEle.ivt_r_wun,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tPowt3winwrIvT_Model;
  }

  @override
  Future<List<Powt3winwrIvTModel>> getPowt3winwrIvTSerialNo(String sNo) async {
    final tPowt3winwrIvT_data =
        await sl<AppDatabase>().getPowt3winwrIvTLocalDataWithSerialNo(sNo);

    List<Powt3winwrIvTModel> tPowt3winwrIvT_Model =
        List<Powt3winwrIvTModel>.empty(growable: true);
    for (var listEle in tPowt3winwrIvT_data) {
      tPowt3winwrIvT_Model.add(Powt3winwrIvTModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        ivt_r_uvn: listEle.ivt_r_uvn,
        ivt_r_vwn: listEle.ivt_r_vwn,
        ivt_r_wun: listEle.ivt_r_wun,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tPowt3winwrIvT_Model;
  }

  @override
  Future<List<Powt3winwrIvTModel>> getPowt3winwrIvtEquipmentLists() async {
    final tAcbCrData =
        await sl<AppDatabase>().getPowt3winwrIvtEquipmentListwithAll();
    List<Powt3winwrIvTModel> tAcbCrTestModel =
        List<Powt3winwrIvTModel>.empty(growable: true);
    for (var listEle in tAcbCrData) {
      tAcbCrTestModel.add(Powt3winwrIvTModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        ivt_r_uvn: listEle.ivt_r_uvn,
        ivt_r_vwn: listEle.ivt_r_vwn,
        ivt_r_wun: listEle.ivt_r_wun,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tAcbCrTestModel;
  }
}

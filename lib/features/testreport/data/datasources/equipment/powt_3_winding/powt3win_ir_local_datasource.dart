// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/powt_3_winding/powt3win_ir_model.dart';
import '../../test_report_local_datasource.dart';

abstract class Powt3winIRLocalDatasource {
  Future<Powt3winIRModel> getPowt3winIR_ById(int id);
  Future<int> localPowt3winIR(Powt3winIRModel Powt3winIR_toLocal);
  Future<void> updatePowt3winIR(
      Powt3winIRModel powt3winIR_Model_update, int id);
  Future<int> deletePowt3winIRById(int id);
  Future<List<Powt3winIRModel>> getPowt3winIR_SerialNo(String serialNo);
  Future<List<Powt3winIRModel>> getPowt3winEquipmentLists();
}

@DataClassName('Powt3winIRLocalData')
class Powt3winIRLocalDatasourceImpl extends Table
    implements Powt3winIRLocalDatasource {
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
  RealColumn get hvE_60 => real()();
  @required
  RealColumn get hvE_600 => real()();
  @required
  RealColumn get hvLv_60 => real()();
  @required
  RealColumn get hvLv_600 => real()();
  @required
  RealColumn get hvT_60 => real()();
  @required
  RealColumn get hvT_600 => real()();
  @required
  RealColumn get lvE_60 => real()();
  @required
  RealColumn get lvE_600 => real()();
  @required
  RealColumn get lvT_60 => real()();
  @required
  RealColumn get lvT_600 => real()();
  @required
  RealColumn get tE_60 => real()();
  @required
  RealColumn get tE_600 => real()();
  @required
  RealColumn get cF_60 => real()();
  @required
  RealColumn get cT_60 => real()();
  @required
  RealColumn get fT_60 => real()();

  @override
  Future<Powt3winIRModel> getPowt3winIR_ById(int id) async {
    Powt3winIRLocalData tPowt3winIRData =
        await sl<AppDatabase>().getPowt3winIRLocalDataWithId(id);
    Powt3winIRModel tPowt3winIRModel = Powt3winIRModel(
      id: tPowt3winIRData.id,
      databaseID: tPowt3winIRData.databaseID,
      trNo: tPowt3winIRData.trNo,
      serialNo: tPowt3winIRData.serialNo,
      equipmentUsed: tPowt3winIRData.equipmentUsed,
      updateDate: tPowt3winIRData.updateDate,
      hvE_60: tPowt3winIRData.hvE_60,
      hvE_600: tPowt3winIRData.hvE_600,
      hvLv_60: tPowt3winIRData.hvLv_60,
      hvLv_600: tPowt3winIRData.hvLv_600,
      hvT_60: tPowt3winIRData.hvT_60,
      hvT_600: tPowt3winIRData.hvT_600,
      lvE_60: tPowt3winIRData.lvE_60,
      lvE_600: tPowt3winIRData.lvE_600,
      lvT_60: tPowt3winIRData.lvT_60,
      lvT_600: tPowt3winIRData.lvT_600,
      tE_60: tPowt3winIRData.tE_60,
      tE_600: tPowt3winIRData.tE_600,
      cF_60: tPowt3winIRData.cF_60,
      cT_60: tPowt3winIRData.cT_60,
      fT_60: tPowt3winIRData.fT_60,
    );
    return tPowt3winIRModel;
  }

  @override
  Future<int> localPowt3winIR(Powt3winIRModel Powt3winIR_toLocal) {
    return (sl<AppDatabase>().createPowt3winIR(Powt3winIR_toLocal));
  }

  @override
  Future<void> updatePowt3winIR(
      Powt3winIRModel powt3winIR_Model_update, int id) async {
    return (sl<AppDatabase>().updatePowt3winIR(powt3winIR_Model_update, id));
  }

  @override
  Future<int> deletePowt3winIRById(int id) {
    return (sl<AppDatabase>().deletePowt3winIRById(id));
  }

  @override
  Future<List<Powt3winIRModel>> getPowt3winIR_SerialNo(String serialNo) async {
    final tPowt3winIR_data =
        await sl<AppDatabase>().getPowt3winIRLocalDataWithSerialNo(serialNo);

    List<Powt3winIRModel> tPowt3winIR_Model =
        List<Powt3winIRModel>.empty(growable: true);
    for (var listEle in tPowt3winIR_data) {
      tPowt3winIR_Model.add(Powt3winIRModel(
        id: listEle.id,
        trNo: listEle.trNo,
        databaseID: listEle.databaseID,
        serialNo: listEle.serialNo,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
        hvE_60: listEle.hvE_60,
        hvE_600: listEle.hvE_600,
        hvLv_60: listEle.hvLv_60,
        hvLv_600: listEle.hvLv_600,
        hvT_60: listEle.hvT_60,
        hvT_600: listEle.hvT_600,
        lvE_60: listEle.lvE_60,
        lvE_600: listEle.lvE_600,
        lvT_60: listEle.lvT_60,
        lvT_600: listEle.lvT_600,
        tE_60: listEle.tE_60,
        tE_600: listEle.tE_600,
        cF_60: listEle.cF_60,
        cT_60: listEle.cT_60,
        fT_60: listEle.fT_60,
      ));
    }
    return tPowt3winIR_Model;
  }

  @override
  Future<List<Powt3winIRModel>> getPowt3winEquipmentLists() async {
    final tPowt3winData =
        await sl<AppDatabase>().getPowt3winEquipmentListwithAll();
    List<Powt3winIRModel> tPowt3winTestModel =
        List<Powt3winIRModel>.empty(growable: true);
    for (var tPowt3winIRData in tPowt3winData) {
      tPowt3winTestModel.add(Powt3winIRModel(
        id: tPowt3winIRData.id,
        databaseID: tPowt3winIRData.databaseID,
        trNo: tPowt3winIRData.trNo,
        serialNo: tPowt3winIRData.serialNo,
        equipmentUsed: tPowt3winIRData.equipmentUsed,
        updateDate: tPowt3winIRData.updateDate,
        hvE_60: tPowt3winIRData.hvE_60,
        hvE_600: tPowt3winIRData.hvE_600,
        hvLv_60: tPowt3winIRData.hvLv_60,
        hvLv_600: tPowt3winIRData.hvLv_600,
        hvT_60: tPowt3winIRData.hvT_60,
        hvT_600: tPowt3winIRData.hvT_600,
        lvE_60: tPowt3winIRData.lvE_60,
        lvE_600: tPowt3winIRData.lvE_600,
        lvT_60: tPowt3winIRData.lvT_60,
        lvT_600: tPowt3winIRData.lvT_600,
        tE_60: tPowt3winIRData.tE_60,
        tE_600: tPowt3winIRData.tE_600,
        cF_60: tPowt3winIRData.cF_60,
        cT_60: tPowt3winIRData.cT_60,
        fT_60: tPowt3winIRData.fT_60,
      ));
    }
    return tPowt3winTestModel;
  }
}

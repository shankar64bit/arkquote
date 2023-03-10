// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';

import '../../../models/equipment/powt_3_winding/powt3win_tsc_model.dart';
import '../../test_report_local_datasource.dart';
import '../../../../../../injection_container.dart';
// import '../../../models/equipment/powt/powt_tsc_model.dart';
// import '../../test_report_local_datasource.dart';

abstract class Powt3wintscLocalDatasource {
  Future<Powt3wintscModel> getPowt3wintsc_ById(int id);
  Future<int> localPowt3wintsc(Powt3wintscModel p3wtsctolocal);
  Future<void> updatePowt3wintsc(Powt3wintscModel p3wtsctoupdate, int id);
  Future<int> deletePowt3wintscById(int id);
  Future<List<Powt3wintscModel>> getPowt3wintscTrNoID(int trNo);
  Future<List<Powt3wintscModel>> getPowt3wintscSerialNo(String sNo);
  Future<List<Powt3wintscModel>> getPowt3wintscEquipmentLists();
}

@DataClassName('Powt3wintscLocalData')
class Powt3wintscLocalDatasourceImpl extends Table
    implements Powt3wintscLocalDatasource {
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
  IntColumn get hv_voltage => integer()();
  @required
  RealColumn get hv_current_Onan => real()();
  @required
  RealColumn get hv_current_Onaf => real()();
  @required
  RealColumn get hv_current_Ofaf => real()();

  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<Powt3wintscModel> getPowt3wintsc_ById(int id) async {
    Powt3wintscLocalData tPowt3wintscData =
        await sl<AppDatabase>().getPowt3wintscLocalDataWithId(id);
    Powt3wintscModel tPowttscModel = Powt3wintscModel(
      id: tPowt3wintscData.id,
      databaseID: tPowt3wintscData.databaseID,
      trNo: tPowt3wintscData.trNo,
      serialNo: tPowt3wintscData.serialNo,
      hv_voltage: tPowt3wintscData.hv_voltage,
      hv_current_Onan: tPowt3wintscData.hv_current_Onan,
      hv_current_Onaf: tPowt3wintscData.hv_current_Onaf,
      hv_current_Ofaf: tPowt3wintscData.hv_current_Ofaf,
      equipmentUsed: tPowt3wintscData.equipmentUsed,
      tapPosition: tPowt3wintscData.tapPosition,
      updateDate: tPowt3wintscData.updateDate,
    );
    return tPowttscModel;
  }

  @override
  Future<int> localPowt3wintsc(Powt3wintscModel p3wtsctolocal) {
    return (sl<AppDatabase>().createPowt3wintsc(p3wtsctolocal));
  }

  @override
  Future<void> updatePowt3wintsc(
      Powt3wintscModel p3wtsctoupdate, int id) async {
    sl<AppDatabase>().updatePowt3wintsc(p3wtsctoupdate, id);
  }

  @override
  Future<int> deletePowt3wintscById(int id) {
    return (sl<AppDatabase>().deletePowt3wintscById(id));
  }

  @override
  Future<List<Powt3wintscModel>> getPowt3wintscTrNoID(int trNo) async {
    final tPowt3wintsc_data =
        await sl<AppDatabase>().getPowt3wintscLocalDataWithtrNoID(trNo);

    List<Powt3wintscModel> tPowt3wintsc_Model =
        List<Powt3wintscModel>.empty(growable: true);
    for (var listEle in tPowt3wintsc_data) {
      tPowt3wintsc_Model.add(Powt3wintscModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_voltage: listEle.hv_voltage,
        hv_current_Onan: listEle.hv_current_Onan,
        hv_current_Onaf: listEle.hv_current_Onaf,
        hv_current_Ofaf: listEle.hv_current_Ofaf,
        equipmentUsed: listEle.equipmentUsed,
        tapPosition: listEle.tapPosition,
        updateDate: listEle.updateDate,
      ));
    }
    return tPowt3wintsc_Model;
  }

  @override
  Future<List<Powt3wintscModel>> getPowt3wintscSerialNo(String sNo) async {
    final tPowt3wintsc_data =
        await sl<AppDatabase>().getPowt3wintscLocalDataWithSerialNo(sNo);

    List<Powt3wintscModel> tPowt3wintsc_Model =
        List<Powt3wintscModel>.empty(growable: true);
    for (var listEle in tPowt3wintsc_data) {
      tPowt3wintsc_Model.add(Powt3wintscModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_voltage: listEle.hv_voltage,
        hv_current_Onan: listEle.hv_current_Onan,
        hv_current_Onaf: listEle.hv_current_Onaf,
        hv_current_Ofaf: listEle.hv_current_Ofaf,
        tapPosition: listEle.tapPosition,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tPowt3wintsc_Model;
  }

  @override
  Future<List<Powt3wintscModel>> getPowt3wintscEquipmentLists() async {
    final tpowt3wintscData =
        await sl<AppDatabase>().getpowt3wintscEquipmentListwithAll();
    List<Powt3wintscModel> tpowt3wintscTestModel =
        List<Powt3wintscModel>.empty(growable: true);
    for (var listEle in tpowt3wintscData) {
      tpowt3wintscTestModel.add(Powt3wintscModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_voltage: listEle.hv_voltage,
        hv_current_Onan: listEle.hv_current_Onan,
        hv_current_Onaf: listEle.hv_current_Onaf,
        hv_current_Ofaf: listEle.hv_current_Ofaf,
        equipmentUsed: listEle.equipmentUsed,
        tapPosition: listEle.tapPosition,
        updateDate: listEle.updateDate,
      ));
    }
    return tpowt3wintscTestModel;
  }
}

// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/powt/powt_tsc_model.dart';
import '../../test_report_local_datasource.dart';

abstract class PowttscLocalDatasource {
  Future<PowttscModel> getPowttsc_ById(int id);
  Future<int> localPowttsc(PowttscModel powttsctolocal);
  Future<void> updatePowttsc(PowttscModel powttsctoupdate, int id);
  Future<int> deletePowttscById(int id);
  Future<List<PowttscModel>> getPowttscTrNoID(int trNo);
  Future<List<PowttscModel>> getPowttscSerialNo(String sNo);
  Future<List<PowttscModel>> getPowttscEquipmentLists();
}

@DataClassName('PowttscLocalData')
class PowttscLocalDatasourceImpl extends Table
    implements PowttscLocalDatasource {
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
  RealColumn get hv_current => real()();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<PowttscModel> getPowttsc_ById(int id) async {
    PowttscLocalData tPowttscData =
        await sl<AppDatabase>().getPowttscLocalDataWithId(id);
    PowttscModel tPowttscModel = PowttscModel(
      id: tPowttscData.id,
      databaseID: tPowttscData.databaseID,
      trNo: tPowttscData.trNo,
      serialNo: tPowttscData.serialNo,
      hv_voltage: tPowttscData.hv_voltage,
      hv_current: tPowttscData.hv_current,
      equipmentUsed: tPowttscData.equipmentUsed,
      tapPosition: tPowttscData.tapPosition,
      updateDate: tPowttscData.updateDate,
    );
    return tPowttscModel;
  }

  @override
  Future<int> localPowttsc(PowttscModel powttsctolocal) {
    return (sl<AppDatabase>().createPowttsc(powttsctolocal));
  }

  @override
  Future<void> updatePowttsc(PowttscModel powttsctoupdate, int id) async {
    sl<AppDatabase>().updatePowttsc(powttsctoupdate, id);
  }

  @override
  Future<int> deletePowttscById(int id) {
    return (sl<AppDatabase>().deletePowttscById(id));
  }

  @override
  Future<List<PowttscModel>> getPowttscTrNoID(int trNo) async {
    final tPowttsc_data =
        await sl<AppDatabase>().getPowttscLocalDataWithtrNoID(trNo);

    List<PowttscModel> tPowttsc_Model =
        List<PowttscModel>.empty(growable: true);
    for (var listEle in tPowttsc_data) {
      tPowttsc_Model.add(PowttscModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_voltage: listEle.hv_voltage,
        hv_current: listEle.hv_current,
        equipmentUsed: listEle.equipmentUsed,
        tapPosition: listEle.tapPosition,
        updateDate: listEle.updateDate,
      ));
    }
    return tPowttsc_Model;
  }

  @override
  Future<List<PowttscModel>> getPowttscSerialNo(String sNo) async {
    final tPowttsc_data =
        await sl<AppDatabase>().getPowttscLocalDataWithSerialNo(sNo);

    List<PowttscModel> tPowttsc_Model =
        List<PowttscModel>.empty(growable: true);
    for (var listEle in tPowttsc_data) {
      tPowttsc_Model.add(PowttscModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        hv_voltage: listEle.hv_voltage,
        hv_current: listEle.hv_current,
        tapPosition: listEle.tapPosition,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tPowttsc_Model;
  }

  @override
  Future<List<PowttscModel>> getPowttscEquipmentLists() async {
    final tpowttscData =
        await sl<AppDatabase>().getPowttscEquipmentListwithAll();
    List<PowttscModel> tpowttscTestModel =
        List<PowttscModel>.empty(growable: true);
    for (var element in tpowttscData) {
      tpowttscTestModel.add(PowttscModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        hv_voltage: element.hv_voltage,
        hv_current: element.hv_current,
        equipmentUsed: element.equipmentUsed,
        tapPosition: element.tapPosition,
        updateDate: element.updateDate,
      ));
    }
    return tpowttscTestModel;
  }
}

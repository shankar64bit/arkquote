// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../../../../injection_container.dart';
import '../../../../models/equipment/Relays/AuxiliaryRelay/AR_pudo_model.dart';
import '../../../../models/equipment/Relays/TRelay/tr_pac_model.dart';
import '../../../test_report_local_datasource.dart';

abstract class TrPacLocalDatasource {
  Future<TrPacModel> getTrPacById(int id);
  Future<int> localTrPac(TrPacModel trPactoLocal);
  Future<void> updateTrPac(TrPacModel trPacToUpdate, int id);
  Future<int> deleteTrPacById(int id);
  Future<List<TrPacModel>> getTrPacTrNoID(int trNo);
  Future<List<TrPacModel>> getTrPacSerialNo(String sNo);
  Future<List<TrPacModel>> getTrpacEquipmentLists();
}

@DataClassName('TrPacLocalData')
class TrPacLocalDatasourceImpl extends Table implements TrPacLocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  RealColumn get time => real()();
  @required
  RealColumn get coilResistenace => real()();
  @required
  RealColumn get relayOprTime => real()();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<TrPacModel> getTrPacById(int id) async {
    TrPacLocalData tTrPacData =
        await sl<AppDatabase>().getTrPacLocalDataWithId(id);
    TrPacModel tTrPacModel = TrPacModel(
      id: tTrPacData.id,
      databaseID: tTrPacData.databaseID,
      trNo: tTrPacData.trNo,
      serialNo: tTrPacData.serialNo,
      time: tTrPacData.time,
      coilResistenace: tTrPacData.coilResistenace,
      relayOprTime: tTrPacData.relayOprTime,
      equipmentUsed: tTrPacData.equipmentUsed,
      updateDate: tTrPacData.updateDate,
    );
    return tTrPacModel;
  }

  @override
  Future<int> localTrPac(TrPacModel trPactoLocal) {
    return (sl<AppDatabase>().createTrPac(trPactoLocal));
  }

  @override
  Future<void> updateTrPac(TrPacModel trPacToUpdate, int id) async {
    sl<AppDatabase>().updateTrPac(trPacToUpdate, id);
  }

  @override
  Future<int> deleteTrPacById(int id) {
    return (sl<AppDatabase>().deleteTrPacById(id));
  }

  @override
  Future<List<TrPacModel>> getTrPacTrNoID(int trNo) async {
    final tarpudo_data =
        await sl<AppDatabase>().getTrPacLocalDataWithtrNoID(trNo);

    List<TrPacModel> tFPRcurrentMgmt_Model =
        List<TrPacModel>.empty(growable: true);
    for (var listEle in tarpudo_data) {
      tFPRcurrentMgmt_Model.add(TrPacModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        time: listEle.time,
        coilResistenace: listEle.coilResistenace,
        relayOprTime: listEle.relayOprTime,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tFPRcurrentMgmt_Model;
  }

  @override
  Future<List<TrPacModel>> getTrPacSerialNo(String sNo) async {
    final tTrPac_data =
        await sl<AppDatabase>().getTrPacLocalDataWithSerialNo(sNo);

    List<TrPacModel> tTrPac_Model = List<TrPacModel>.empty(growable: true);
    for (var listEle in tTrPac_data) {
      tTrPac_Model.add(TrPacModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        time: listEle.time,
        coilResistenace: listEle.coilResistenace,
        relayOprTime: listEle.relayOprTime,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tTrPac_Model;
  }

  //getTrpacEquipmentLists
  @override
  Future<List<TrPacModel>> getTrpacEquipmentLists() async {
    final tTrpacData = await sl<AppDatabase>().getTrpacEquipmentListwithAll();
    List<TrPacModel> tTrpacTestModel = List<TrPacModel>.empty(growable: true);
    for (var tTrPacData in tTrpacData) {
      tTrpacTestModel.add(TrPacModel(
        id: tTrPacData.id,
        databaseID: tTrPacData.databaseID,
        trNo: tTrPacData.trNo,
        serialNo: tTrPacData.serialNo,
        time: tTrPacData.time,
        coilResistenace: tTrPacData.coilResistenace,
        relayOprTime: tTrPacData.relayOprTime,
        equipmentUsed: tTrPacData.equipmentUsed,
        updateDate: tTrPacData.updateDate,
      ));
    }
    return tTrpacTestModel;
  }
}

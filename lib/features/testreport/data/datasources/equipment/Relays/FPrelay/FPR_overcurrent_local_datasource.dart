// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../../../../injection_container.dart';
import '../../../../models/equipment/Relays/FPrelay/FPR_overcurrent_model.dart';
import '../../../test_report_local_datasource.dart';
// import '../../../../models/equipment/Relays/FPrelay/FPR_overcurrent_model.dart';

abstract class FPRovercurrentLocalDatasource {
  Future<FPRovercurrentModel> getFPRovercurrentById(int id);
  Future<int> localFPRovercurrent(FPRovercurrentModel fprovercurrenttoLocal);
  Future<void> updateFPRovercurrent(
      FPRovercurrentModel fprovercurrentUpdate, int id);
  Future<int> deleteFPRovercurrentById(int id);
  Future<List<FPRovercurrentModel>> getFPRovercurrentTrNoID(int trNo);
  Future<List<FPRovercurrentModel>> getFPRovercurrentSerialNo(String sNo);
  Future<List<FPRovercurrentModel>> getFPRovercurrEquipmentLists();
}

@DataClassName('FPRovercurrentLocalData')
class FPRovercurrentLocalDatasourceImpl extends Table
    implements FPRovercurrentLocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  RealColumn get CurrentSet => real()();
  @required
  RealColumn get TMS => real()();
  @required
  RealColumn get delay => real()();
  @required
  RealColumn get rn_pickupCurrent => real()();
  @required
  RealColumn get rn_relayOprTime_2x => real()();
  @required
  RealColumn get rn_relayOprTime_5x => real()();
  @required
  RealColumn get yn_pickupCurrent => real()();
  @required
  RealColumn get yn_relayOprTime_2x => real()();
  @required
  RealColumn get yn_relayOprTime_5x => real()();
  @required
  RealColumn get bn_pickupCurrent => real()();
  @required
  RealColumn get bn_relayOprTime_2x => real()();
  @required
  RealColumn get bn_relayOprTime_5x => real()();
  @required
  IntColumn get stageNo => integer()();
  @required
  TextColumn get curve => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get function => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<FPRovercurrentModel> getFPRovercurrentById(int id) async {
    FPRovercurrentLocalData tFPRovercurrentData =
        await sl<AppDatabase>().getFPRovercurrentLocalDataWithId(id);
    FPRovercurrentModel tFPRovercurrentModel = FPRovercurrentModel(
      id: tFPRovercurrentData.id,
      databaseID: tFPRovercurrentData.databaseID,
      trNo: tFPRovercurrentData.trNo,
      serialNo: tFPRovercurrentData.serialNo,
      CurrentSet: tFPRovercurrentData.CurrentSet,
      TMS: tFPRovercurrentData.TMS,
      delay: tFPRovercurrentData.delay,
      rn_pickupCurrent: tFPRovercurrentData.rn_pickupCurrent,
      rn_relayOprTime_2x: tFPRovercurrentData.rn_relayOprTime_2x,
      rn_relayOprTime_5x: tFPRovercurrentData.rn_relayOprTime_5x,
      yn_pickupCurrent: tFPRovercurrentData.yn_pickupCurrent,
      yn_relayOprTime_2x: tFPRovercurrentData.yn_relayOprTime_2x,
      yn_relayOprTime_5x: tFPRovercurrentData.yn_relayOprTime_5x,
      bn_pickupCurrent: tFPRovercurrentData.bn_pickupCurrent,
      bn_relayOprTime_2x: tFPRovercurrentData.bn_relayOprTime_2x,
      bn_relayOprTime_5x: tFPRovercurrentData.bn_relayOprTime_5x,
      stageNo: tFPRovercurrentData.stageNo,
      curve: tFPRovercurrentData.curve,
      function: tFPRovercurrentData.function,
      equipmentUsed: tFPRovercurrentData.equipmentUsed,
      updateDate: tFPRovercurrentData.updateDate,
    );
    return tFPRovercurrentModel;
  }

  @override
  Future<int> localFPRovercurrent(FPRovercurrentModel fprovercurrenttoLocal) {
    return (sl<AppDatabase>().createFPRovercurrent(fprovercurrenttoLocal));
  }

  @override
  Future<void> updateFPRovercurrent(
      FPRovercurrentModel fprovercurrentUpdate, int id) async {
    sl<AppDatabase>().updateFPRovercurrent(fprovercurrentUpdate, id);
  }

  @override
  Future<int> deleteFPRovercurrentById(int id) {
    return (sl<AppDatabase>().deleteFPRovercurrentById(id));
  }

  @override
  Future<List<FPRovercurrentModel>> getFPRovercurrentTrNoID(int trNo) async {
    final tfprovercurrent_data =
        await sl<AppDatabase>().getFPRovercurrentLocalDataWithtrNoID(trNo);

    List<FPRovercurrentModel> tFPRovercurrent_Model =
        List<FPRovercurrentModel>.empty(growable: true);
    for (var listEle in tfprovercurrent_data) {
      tFPRovercurrent_Model.add(FPRovercurrentModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        CurrentSet: listEle.CurrentSet,
        TMS: listEle.TMS,
        delay: listEle.delay,
        rn_pickupCurrent: listEle.rn_pickupCurrent,
        rn_relayOprTime_2x: listEle.rn_relayOprTime_2x,
        rn_relayOprTime_5x: listEle.rn_relayOprTime_5x,
        yn_pickupCurrent: listEle.yn_pickupCurrent,
        yn_relayOprTime_2x: listEle.yn_relayOprTime_2x,
        yn_relayOprTime_5x: listEle.yn_relayOprTime_5x,
        bn_pickupCurrent: listEle.bn_pickupCurrent,
        bn_relayOprTime_2x: listEle.bn_relayOprTime_2x,
        bn_relayOprTime_5x: listEle.bn_relayOprTime_5x,
        stageNo: listEle.stageNo,
        curve: listEle.curve,
        function: listEle.function,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tFPRovercurrent_Model;
  }

  @override
  Future<List<FPRovercurrentModel>> getFPRovercurrentSerialNo(
      String sNo) async {
    final tFPRovercurrent_data =
        await sl<AppDatabase>().getFPRovercurrentLocalDataWithSerialNo(sNo);

    List<FPRovercurrentModel> tFPRovercurrent_Model =
        List<FPRovercurrentModel>.empty(growable: true);
    for (var listEle in tFPRovercurrent_data) {
      tFPRovercurrent_Model.add(FPRovercurrentModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        CurrentSet: listEle.CurrentSet,
        TMS: listEle.TMS,
        delay: listEle.delay,
        rn_pickupCurrent: listEle.rn_pickupCurrent,
        rn_relayOprTime_2x: listEle.rn_relayOprTime_2x,
        rn_relayOprTime_5x: listEle.rn_relayOprTime_5x,
        yn_pickupCurrent: listEle.yn_pickupCurrent,
        yn_relayOprTime_2x: listEle.yn_relayOprTime_2x,
        yn_relayOprTime_5x: listEle.yn_relayOprTime_5x,
        bn_pickupCurrent: listEle.bn_pickupCurrent,
        bn_relayOprTime_2x: listEle.bn_relayOprTime_2x,
        bn_relayOprTime_5x: listEle.bn_relayOprTime_5x,
        stageNo: listEle.stageNo,
        curve: listEle.curve,
        function: listEle.function,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tFPRovercurrent_Model;
  }

  @override
  Future<List<FPRovercurrentModel>> getFPRovercurrEquipmentLists() async {
    final tFPRovercurrData =
        await sl<AppDatabase>().getFPRovercurrentEquipmentListwithAll();
    List<FPRovercurrentModel> tFPRovercurrTestModel =
        List<FPRovercurrentModel>.empty(growable: true);
    for (var listEle in tFPRovercurrData) {
      tFPRovercurrTestModel.add(FPRovercurrentModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        CurrentSet: listEle.CurrentSet,
        TMS: listEle.TMS,
        delay: listEle.delay,
        rn_pickupCurrent: listEle.rn_pickupCurrent,
        rn_relayOprTime_2x: listEle.rn_relayOprTime_2x,
        rn_relayOprTime_5x: listEle.rn_relayOprTime_5x,
        yn_pickupCurrent: listEle.yn_pickupCurrent,
        yn_relayOprTime_2x: listEle.yn_relayOprTime_2x,
        yn_relayOprTime_5x: listEle.yn_relayOprTime_5x,
        bn_pickupCurrent: listEle.bn_pickupCurrent,
        bn_relayOprTime_2x: listEle.bn_relayOprTime_2x,
        bn_relayOprTime_5x: listEle.bn_relayOprTime_5x,
        stageNo: listEle.stageNo,
        curve: listEle.curve,
        function: listEle.function,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tFPRovercurrTestModel;
  }
}

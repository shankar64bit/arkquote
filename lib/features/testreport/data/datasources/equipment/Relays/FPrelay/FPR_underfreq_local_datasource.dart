// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../models/equipment/Relays/FPrelay/FPR_underfreq_model.dart';
import '../../../../../../../injection_container.dart';
import '../../../test_report_local_datasource.dart';

abstract class FPRunderfreqLocalDatasource {
  Future<FPRunderfreqModel> getFPRunderfreqById(int id);
  Future<int> localFPRunderfreq(FPRunderfreqModel fprunderfreqtoLocal);
  Future<void> updateFPRunderfreq(FPRunderfreqModel fprunderfreqUpdate, int id);
  Future<int> deleteFPRunderfreqById(int id);
  Future<List<FPRunderfreqModel>> getFPRunderfreqTrNoID(int trNo);
  Future<List<FPRunderfreqModel>> getFPRunderfreqSerialNo(String sNo);
  Future<List<FPRunderfreqModel>> getFPRunderfreqEquipmentLists();
}

@DataClassName('FPRunderfreqLocalData')
class FPRunderfreqLocalDatasourceImpl extends Table
    implements FPRunderfreqLocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  RealColumn get frequencySet => real()();
  @required
  RealColumn get delay => real()();
  @required
  RealColumn get rn_relayOprTime => real()();
  @required
  RealColumn get yn_relayOprTime => real()();
  @required
  RealColumn get bn_relayOprTime => real()();
  @required
  IntColumn get stageNo => integer()();
  @required
  TextColumn get function => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<FPRunderfreqModel> getFPRunderfreqById(int id) async {
    FPRunderfreqLocalData tFPRunderfreqData =
        await sl<AppDatabase>().getFPRunderfreqLocalDataWithId(id);
    FPRunderfreqModel tFPRunderfreqModel = FPRunderfreqModel(
      id: tFPRunderfreqData.id,
      databaseID: tFPRunderfreqData.databaseID,
      trNo: tFPRunderfreqData.trNo,
      serialNo: tFPRunderfreqData.serialNo,
      frequencySet: tFPRunderfreqData.frequencySet,
      delay: tFPRunderfreqData.delay,
      rn_relayOprTime: tFPRunderfreqData.rn_relayOprTime,
      yn_relayOprTime: tFPRunderfreqData.yn_relayOprTime,
      bn_relayOprTime: tFPRunderfreqData.bn_relayOprTime,
      stageNo: tFPRunderfreqData.stageNo,
      function: tFPRunderfreqData.function,
      equipmentUsed: tFPRunderfreqData.equipmentUsed,
      updateDate: tFPRunderfreqData.updateDate,
    );
    return tFPRunderfreqModel;
  }

  @override
  Future<int> localFPRunderfreq(FPRunderfreqModel fprunderfreqtoLocal) {
    return (sl<AppDatabase>().createFPRunderfreq(fprunderfreqtoLocal));
  }

  @override
  Future<void> updateFPRunderfreq(
      FPRunderfreqModel fprunderfreqUpdate, int id) async {
    sl<AppDatabase>().updateFPRunderfreq(fprunderfreqUpdate, id);
  }

  @override
  Future<int> deleteFPRunderfreqById(int id) {
    return (sl<AppDatabase>().deleteFPRunderfreqById(id));
  }

  @override
  Future<List<FPRunderfreqModel>> getFPRunderfreqTrNoID(int trNo) async {
    final tfprunderfreq_data =
        await sl<AppDatabase>().getFPRunderfreqLocalDataWithtrNoID(trNo);

    List<FPRunderfreqModel> tFPRunderfreq_Model =
        List<FPRunderfreqModel>.empty(growable: true);
    for (var listEle in tfprunderfreq_data) {
      tFPRunderfreq_Model.add(FPRunderfreqModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        frequencySet: listEle.frequencySet,
        delay: listEle.delay,
        rn_relayOprTime: listEle.rn_relayOprTime,
        yn_relayOprTime: listEle.yn_relayOprTime,
        bn_relayOprTime: listEle.bn_relayOprTime,
        stageNo: listEle.stageNo,
        function: listEle.function,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tFPRunderfreq_Model;
  }

  @override
  Future<List<FPRunderfreqModel>> getFPRunderfreqSerialNo(String sNo) async {
    final tFPRunderfreq_data =
        await sl<AppDatabase>().getFPRunderfreqLocalDataWithSerialNo(sNo);

    List<FPRunderfreqModel> tFPRunderfreq_Model =
        List<FPRunderfreqModel>.empty(growable: true);
    for (var listEle in tFPRunderfreq_data) {
      tFPRunderfreq_Model.add(FPRunderfreqModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        frequencySet: listEle.frequencySet,
        delay: listEle.delay,
        rn_relayOprTime: listEle.rn_relayOprTime,
        yn_relayOprTime: listEle.yn_relayOprTime,
        bn_relayOprTime: listEle.bn_relayOprTime,
        stageNo: listEle.stageNo,
        function: listEle.function,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tFPRunderfreq_Model;
  }

  @override
  Future<List<FPRunderfreqModel>> getFPRunderfreqEquipmentLists() async {
    final tfprunderfreqData =
        await sl<AppDatabase>().getFPRunderfreqEquipmentListwithAll();
    List<FPRunderfreqModel> tfprunderfreqTestModel =
        List<FPRunderfreqModel>.empty(growable: true);
    for (var listEle in tfprunderfreqData) {
      tfprunderfreqTestModel.add(FPRunderfreqModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        frequencySet: listEle.frequencySet,
        delay: listEle.delay,
        rn_relayOprTime: listEle.rn_relayOprTime,
        yn_relayOprTime: listEle.yn_relayOprTime,
        bn_relayOprTime: listEle.bn_relayOprTime,
        stageNo: listEle.stageNo,
        function: listEle.function,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tfprunderfreqTestModel;
  }
}

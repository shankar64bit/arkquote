// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/IT/it_wr_model.dart';
import '../../test_report_local_datasource.dart';
// import '../../../../../../injection_container.dart';
// import '../../test_report_local_datasource.dart';

abstract class ItWrLocalDatasource {
  Future<List<ItWrTestModel>> getItWrByTrNo(int trNo);
  Future<ItWrTestModel> getItWrById(int id);
  Future<int> localItWr(ItWrTestModel itWrToLocal);
  Future<void> updateItWr(ItWrTestModel itWrToupdate, int id);
  Future<int> deleteItWrById(int id);
  Future<List<ItWrTestModel>> getItWrBySerialNo(String serialNo);
  Future<List<ItWrTestModel>> getItWrEquipmentList();
}

@DataClassName('ItWrLocalData')
class ItWrLocalDatasourceImpl extends Table implements ItWrLocalDatasource {
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
  RealColumn get uV => real()();
  @required
  RealColumn get vW => real()();
  @required
  RealColumn get wU => real()();
  @required
  TextColumn get tapPosition => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get hvLvOpt => text().withLength(min: 1, max: 50)();

  @override
  Future<ItWrTestModel> getItWrById(int id) async {
    ItWrLocalData tItWrLocalData =
        await sl<AppDatabase>().getItWrLocalDataWithId(id);
    ItWrTestModel tItWrModel = ItWrTestModel(
      id: tItWrLocalData.id,
      databaseID: tItWrLocalData.databaseID,
      trNo: tItWrLocalData.trNo,
      serialNo: tItWrLocalData.serialNo,
      equipmentUsed: tItWrLocalData.equipmentUsed,
      updateDate: tItWrLocalData.updateDate,
      uV: tItWrLocalData.uV,
      vW: tItWrLocalData.vW,
      wU: tItWrLocalData.wU,
      tapPosition: tItWrLocalData.tapPosition,
      hvLVOpt: tItWrLocalData.hvLvOpt,
    );
    return tItWrModel;
  }

  @override
  Future<int> localItWr(ItWrTestModel itWrtoLocal) {
    return (sl<AppDatabase>().createItWr(itWrtoLocal));
  }

  @override
  Future<void> updateItWr(ItWrTestModel itWrToupdate, int id) async {
    sl<AppDatabase>().updateItWr(itWrToupdate, id);
  }

  @override
  Future<int> deleteItWrById(int id) {
    return (sl<AppDatabase>().deleteItWrById(id));
  }

  @override
  Future<List<ItWrTestModel>> getItWrBySerialNo(String serialNo) async {
    final tItWrdata =
        await sl<AppDatabase>().getItWrLocalDataWithSerialNo(serialNo);

    List<ItWrTestModel> tItWrModel = List<ItWrTestModel>.empty(growable: true);
    for (var listEle in tItWrdata) {
      tItWrModel.add(ItWrTestModel(
        id: listEle.id,
        trNo: listEle.trNo,
        databaseID: listEle.databaseID,
        serialNo: listEle.serialNo,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
        uV: listEle.uV,
        vW: listEle.vW,
        wU: listEle.wU,
        tapPosition: listEle.tapPosition,
        hvLVOpt: listEle.hvLvOpt,
      ));
    }
    return tItWrModel;
  }

  @override
  Future<List<ItWrTestModel>> getItWrByTrNo(int trNo) async {
    final tItWrData = await sl<AppDatabase>().getItWrLocalDataWithTrNo(trNo);
    List<ItWrTestModel> tItWrTestModel =
        List<ItWrTestModel>.empty(growable: true);

    for (var element in tItWrData) {
      tItWrTestModel.add(ItWrTestModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        equipmentUsed: element.equipmentUsed,
        updateDate: element.updateDate,
        uV: element.uV,
        vW: element.vW,
        wU: element.wU,
        tapPosition: element.tapPosition,
        hvLVOpt: element.hvLvOpt,
      ));
    }
    return tItWrTestModel;
  }

  @override
  Future<List<ItWrTestModel>> getItWrEquipmentList() async {
    final tItWrData = await sl<AppDatabase>().getItWrEquipmentListAll();
    List<ItWrTestModel> tItWrTestModel =
        List<ItWrTestModel>.empty(growable: true);
    for (var element in tItWrData) {
      tItWrTestModel.add(ItWrTestModel(
        id: element.id,
        uV: element.uV,
        vW: element.vW,
        wU: element.wU,
        tapPosition: element.tapPosition,
        hvLVOpt: element.hvLvOpt,
        equipmentUsed: element.equipmentUsed,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        trNo: element.trNo,
        updateDate: element.updateDate,
      ));
    }
    return tItWrTestModel;
  }
}

import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/isolator/iso_cr_test_model.dart';
import '../../test_report_local_datasource.dart';

abstract class IsoCrLocalDatasource {
  Future<List<IsoCrTestModel>> getIsoCrByTrNo(int trNo);
  Future<IsoCrTestModel> getIsoCrById(int id);
  Future<void> localIsoCr(IsoCrTestModel isocrtolocal);
  Future<void> updateIsoCr(IsoCrTestModel isocrtoupdate, int id);
  Future<int> deleteIsoCrById(int id);
  Future<List<IsoCrTestModel>> getIsoCrBySerialNo(String serialNo);
  Future<List<IsoCrTestModel>> getIsoCrEquipmentList();
  // Future<List<IsoCrTestModel>> getTestedById(int id);
}

@DataClassName('IsoCrLocalData')
class IsoCrLocalDatasourceImpl extends Table implements IsoCrLocalDatasource {
  @required
  DateTimeColumn get lastUpdated =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @required
  TextColumn get EquipmentType => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();

  @required
  RealColumn get rr => real()();
  @required
  RealColumn get yy => real()();
  @required
  RealColumn get bb => real()();

  @override
  Future<IsoCrTestModel> getIsoCrById(int id) async {
    IsoCrLocalData tIsoCrData =
        await sl<AppDatabase>().getIsoCrLocalDataWithId(id);

    IsoCrTestModel tIsoCrTestModel = IsoCrTestModel(
      databaseID: tIsoCrData.databaseID,
      id: tIsoCrData.id,
      rr: tIsoCrData.rr,
      yy: tIsoCrData.yy,
      bb: tIsoCrData.bb,
      trNo: tIsoCrData.trNo,
      serialNo: tIsoCrData.serialNo,
      EquipmentType: tIsoCrData.EquipmentType,
      lastUpdated: tIsoCrData.lastUpdated,
    );

    return tIsoCrTestModel;
  }

  @override
  Future<List<IsoCrTestModel>> getIsoCrByTrNo(int trNo) async {
    final tIsoCrData = await sl<AppDatabase>().getIsoCrLocalDataWithTrNo(trNo);
    List<IsoCrTestModel> tIsoCrTestModel =
        List<IsoCrTestModel>.empty(growable: true);

    for (var element in tIsoCrData) {
      tIsoCrTestModel.add(IsoCrTestModel(
        id: element.id,
        databaseID: element.databaseID,
        rr: element.rr,
        yy: element.yy,
        bb: element.bb,
        trNo: element.trNo,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tIsoCrTestModel;
  }

  @override
  Future<List<IsoCrTestModel>> getIsoCrEquipmentList() async {
    final tIsoCrData = await sl<AppDatabase>().getIsoCrEquipmentList();
    List<IsoCrTestModel> tIsoCrTestModel =
        List<IsoCrTestModel>.empty(growable: true);
    for (var element in tIsoCrData) {
      tIsoCrTestModel.add(IsoCrTestModel(
        id: element.id,
        yy: element.yy,
        rr: element.rr,
        bb: element.bb,
        EquipmentType: element.EquipmentType,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        trNo: element.trNo,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tIsoCrTestModel;
  }

  @override
  Future<List<IsoCrTestModel>> getIsoCrBySerialNo(String serialNo) async {
    final tIsoCrData =
        await sl<AppDatabase>().getIsoCrLocalDataWithSerialNo(serialNo);
    List<IsoCrTestModel> tIsoCrTestModel =
        List<IsoCrTestModel>.empty(growable: true);
    for (var element in tIsoCrData) {
      tIsoCrTestModel.add(IsoCrTestModel(
        id: element.id,
        yy: element.yy,
        rr: element.rr,
        bb: element.bb,
        trNo: element.trNo,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tIsoCrTestModel;
  }

  @override
  Future<int> localIsoCr(IsoCrTestModel isocrtolocal) {
    return (sl<AppDatabase>().createIsoCr(isocrtolocal));
  }

  @override
  Future<void> updateIsoCr(IsoCrTestModel isocrtoupdate, int id) async {
    sl<AppDatabase>().updateIsoCr(isocrtoupdate, id);
  }

  @override
  Future<int> deleteIsoCrById(int id) {
    return (sl<AppDatabase>().deleteIsoCrById(id));
  }
}

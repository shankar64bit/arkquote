// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/EE/eeLoc.dart';
import '../../../../../../injection_container.dart';
import '../../test_report_local_datasource.dart';

abstract class EE_Loc_LocalDatasource {
  Future<EELocModel> getEE_Loc_ById(int id);
  Future<int> localEE_Loc(EELocModel EE_LoctoLocal);
  Future<void> updateEE_Loc(EELocModel EE_LoctoUpdate, int id);
  Future<int> deleteEE_LocById(int id);
  Future<List<EELocModel>> getEELocEENoID(int eeNo);
  Future<List<EELocModel>> getEElocEquipmentLists();
}

@DataClassName('EELocLocalData')
class EE_Loc_LocalDatasourceImpl extends Table
    implements EE_Loc_LocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  // @required
  // IntColumn get trNo => integer().autoIncrement()();
  @required
  IntColumn get eeRef => integer()();
  @required
  TextColumn get location => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<EELocModel> getEE_Loc_ById(int id) async {
    EELocLocalData tEE_LocData =
        await sl<AppDatabase>().getEE_LocLocalDataWithId(id);
    EELocModel tEE_LocModel = EELocModel(
      id: tEE_LocData.id,
      databaseID: tEE_LocData.databaseID,
      location: tEE_LocData.location,
      eeRef: tEE_LocData.eeRef,
      lastUpdated: tEE_LocData.updateDate,
    );
    return tEE_LocModel;
  }

  @override
  Future<int> localEE_Loc(EELocModel EE_LoctoLocal) {
    return (sl<AppDatabase>().createEE_Loc(EE_LoctoLocal));
  }

  @override
  Future<void> updateEE_Loc(EELocModel EE_LoctoUpdate, int id) async {
    sl<AppDatabase>().updateEE_Loc(EE_LoctoUpdate, id);
  }

  @override
  Future<int> deleteEE_LocById(int id) {
    return (sl<AppDatabase>().deleteEE_LocById(id));
  }

  @override
  Future<List<EELocModel>> getEELocEENoID(int eeNo) async {
    final tEELoc_data =
        await sl<AppDatabase>().getEELocLocalDataWithEENoID(eeNo);

    List<EELocModel> tEELocModel = List<EELocModel>.empty(growable: true);
    for (var listEle in tEELoc_data) {
      tEELocModel.add(EELocModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        location: listEle.location,
        eeRef: listEle.eeRef,
        lastUpdated: listEle.updateDate,
      ));
    }
    return tEELocModel;
  }

  @override
  Future<List<EELocModel>> getEElocEquipmentLists() async {
    final tEElocDatas = await sl<AppDatabase>().getEElocEquipmentListwithAll();
    List<EELocModel> tEElocTestModel = List<EELocModel>.empty(growable: true);
    for (var tEE_LocData in tEElocDatas) {
      tEElocTestModel.add(EELocModel(
        id: tEE_LocData.id,
        databaseID: tEE_LocData.databaseID,
        location: tEE_LocData.location,
        eeRef: tEE_LocData.eeRef,
        lastUpdated: tEE_LocData.updateDate,
      ));
    }
    return tEElocTestModel;
  }
}

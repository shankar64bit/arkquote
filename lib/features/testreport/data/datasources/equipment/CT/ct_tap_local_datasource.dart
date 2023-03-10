// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/CT/ct_tap_model.dart';
import '../../test_report_local_datasource.dart';

abstract class CT_tap_LocalDatasource {
  Future<CT_tap_Model> getCT_tap_ById(int id);
  Future<int> localCT_tap(CT_tap_Model CT_taptoLocal);
  Future<void> updateCT_tap(CT_tap_Model ct_tap_update, int id);
  Future<int> deleteCT_tapById(int id);
  Future<List<CT_tap_Model>> getCTtapctNoID(int ctNo);
}

@DataClassName('CTtapLocalData')
class CT_tap_LocalDatasourceImpl extends Table
    implements CT_tap_LocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  TextColumn get tapName => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get ratio => integer()();
  @required
  IntColumn get kneePointVoltage => integer()();
  @required
  IntColumn get leakageCurrent => integer()();
  @required
  IntColumn get coreRef => integer()();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<CT_tap_Model> getCT_tap_ById(int id) async {
    CTtapLocalData tCT_tapData =
        await sl<AppDatabase>().getCT_tapLocalDataWithId(id);
    CT_tap_Model tCT_tapModel = CT_tap_Model(
      id: tCT_tapData.id,
      databaseID: tCT_tapData.databaseID,
      tapName: tCT_tapData.tapName,
      ratio: tCT_tapData.ratio,
      leakageCurrent: tCT_tapData.leakageCurrent,
      kneePointVoltage: tCT_tapData.kneePointVoltage,
      coreRef: tCT_tapData.coreRef,
      updateDate: tCT_tapData.updateDate,
    );
    return tCT_tapModel;
  }

  @override
  Future<int> localCT_tap(CT_tap_Model CT_taptoLocal) {
    return (sl<AppDatabase>().createCT_tap(CT_taptoLocal));
  }

  @override
  Future<void> updateCT_tap(CT_tap_Model ct_tap_update, int id) async {
    sl<AppDatabase>().updateCT_tap(ct_tap_update, id);
  }

  @override
  Future<int> deleteCT_tapById(int id) {
    return (sl<AppDatabase>().deleteCT_tapById(id));
  }

  @override
  Future<List<CT_tap_Model>> getCTtapctNoID(int ctNo) async {
    final tCTtap_data =
        await sl<AppDatabase>().getCTtapLocalDataWithctNoID(ctNo);

    List<CT_tap_Model> tCT_tap_Model = List<CT_tap_Model>.empty(growable: true);

    for (var listEle in tCTtap_data) {
      tCT_tap_Model.add(CT_tap_Model(
        id: listEle.id,
        databaseID: listEle.databaseID,
        tapName: listEle.tapName,
        ratio: listEle.ratio,
        leakageCurrent: listEle.leakageCurrent,
        kneePointVoltage: listEle.kneePointVoltage,
        coreRef: listEle.coreRef,
        updateDate: listEle.updateDate,
      ));
    }
    return tCT_tap_Model;
  }
}

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/CT/ct_core_ir_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/CT/ct_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/acb/acb_crm_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/acb/acb_ir_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/acb/acb_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/acb/vcb_timing_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/power_cable/pc_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/inventory_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/busbar/bb_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/IT/it_ir_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/IT/it_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/IT/it_mc_local_datasource.dart';
import '../models/equipment/DG/dg_ir_test_model.dart';
import '../models/equipment/DG/dg_model.dart';
import '../models/equipment/DG/dg_wr_test_model.dart';
import '../models/equipment/Relays/AuxiliaryRelay/AR_model.dart';
import '../models/equipment/Relays/AuxiliaryRelay/AR_pudo_model.dart';
import '../models/equipment/Relays/EFELRelay/efelr_model.dart';
import '../models/equipment/Relays/EFELRelay/efelr_pac_model.dart';
import '../models/equipment/Relays/FPrelay/FPR_currentMgmt_model.dart';
import '../models/equipment/Relays/FPrelay/FPR_earthfault_model.dart';
import '../models/equipment/Relays/FPrelay/FPR_overcurrent_model.dart';
import '../models/equipment/Relays/FPrelay/FPR_overfreq_model.dart';
import '../models/equipment/Relays/FPrelay/FPR_overvoltage_model.dart';
import '../models/equipment/Relays/FPrelay/FPR_underfreq_model.dart';
import '../models/equipment/Relays/FPrelay/FPR_undervoltage_model.dart';
import '../models/equipment/Relays/FPrelay/FPR_voltageMgmt_model.dart';
import '../models/equipment/Relays/FPrelay/FPrelay_model.dart';
import '../models/equipment/Relays/OCEFRelay/ocefr_model.dart';
import '../models/equipment/Relays/OCEFRelay/ocefr_pac_model.dart';
import '../models/equipment/Relays/TRelay/tr_model.dart';
import '../models/equipment/Relays/TRelay/tr_pac_model.dart';
import '../models/equipment/Relays/VoltageRelay/vr_model.dart';
import '../models/equipment/Relays/VoltageRelay/vr_pac_model.dart';
import 'equipment/IT/it_mb_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/IT/it_wr_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/acb/acb_crm_test_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/acb/acb_ir_test_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/acb/acb_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/inventory_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/test_report_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/user_table_model.dart';
import '../models/equipment/IT/it_ir_model.dart';
import '../models/equipment/IT/it_mb_model.dart';
import '../models/equipment/IT/it_mc_model.dart';
import '../models/equipment/IT/it_model.dart';
import '../models/equipment/IT/it_r_model.dart';
import '../models/equipment/IT/it_vg_model.dart';
import '../models/equipment/IT/it_wr_model.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../../../../injection_container.dart';
import '../models/equipment/AT/AT_ir_model.dart';
import '../models/equipment/AT/AT_mb_model.dart';
import '../models/equipment/AT/AT_mc_model.dart';
import '../models/equipment/AT/AT_model.dart';
import '../models/equipment/AT/AT_r_model.dart';
import '../models/equipment/AT/AT_wrHv_model.dart';
import '../models/equipment/AT/AT_wrLv_model.dart';
import '../models/equipment/CT/ct_core_ir_model.dart';
import '../models/equipment/CT/ct_core_kvp_model.dart';
import '../models/equipment/CT/ct_core_model.dart';
import '../models/equipment/CT/ct_core_p_model.dart';
import '../models/equipment/CT/ct_core_r_model.dart';
import '../models/equipment/CT/ct_core_wr_model.dart';
import '../models/equipment/CT/ct_model.dart';
import '../models/equipment/CT/ct_tap_model.dart';
import '../models/equipment/EE/eeLoc.dart';
import '../models/equipment/EE/ee_model.dart';
import '../models/equipment/EE/ee_r_test_model.dart';
import '../models/equipment/EE/ee_test_model.dart';
import '../models/equipment/LA/la_ir_test_model.dart';
import '../models/equipment/LA/la_model.dart';
import '../models/equipment/PT/pt_core_model.dart';
import '../models/equipment/PT/pt_core_r_model.dart';
import '../models/equipment/PT/pt_core_wr_model.dart';
import '../models/equipment/PT/pt_ir_model.dart';
import '../models/equipment/PT/pt_model.dart';
import '../models/equipment/SC/sc_c_test_model.dart';
import '../models/equipment/SC/sc_model.dart';
import '../models/equipment/acb/acb_cr_test_model.dart';
import '../models/equipment/acb/vcb_timing_test_model.dart';
import '../models/equipment/busbar/bb_cr_test_model.dart';
import '../models/equipment/busbar/bb_hv_test_model.dart';
import '../models/equipment/busbar/bb_ir_test_model.dart';
import '../models/equipment/busbar/bb_model.dart';
import '../models/equipment/energy_meter/energu_meter_aprp_test.dart';
import '../models/equipment/energy_meter/energy_meter_Fi_test.dart';
import '../models/equipment/energy_meter/energy_meter_Pfi_test.dart';
import '../models/equipment/energy_meter/energy_meter_ap_test.dart';
import '../models/equipment/energy_meter/energy_meter_ci_test.dart';
import '../models/equipment/energy_meter/energy_meter_model.dart';
import '../models/equipment/energy_meter/energy_meter_rp_test.dart';
import '../models/equipment/energy_meter/energy_meter_vi_test_model.dart';
import '../models/equipment/powt/powt_bNamePlate_model.dart';
import '../models/equipment/powt/powt_ir_model.dart';
import '../models/equipment/powt/powt_mb_model.dart';
import '../models/equipment/powt/powt_mc_model.dart';
import '../models/equipment/powt/powt_model.dart';
import '../models/equipment/powt/powt_r_model.dart';
import '../models/equipment/powt/powt_sc_model.dart';
import '../models/equipment/powt/powt_td_model.dart';
import '../models/equipment/powt/powt_tsc_model.dart';
import '../models/equipment/powt/powt_wrHv_model.dart';
import '../models/equipment/powt/powt_wrLv_model.dart';
import '../models/equipment/powt_3_winding/powt3win_ir_model.dart';
import '../models/equipment/powt_3_winding/powt3win_mb_model.dart';
import '../models/equipment/powt_3_winding/powt3win_mcHv_model.dart';
import '../models/equipment/powt_3_winding/powt3win_mcIvT_model.dart';
import '../models/equipment/powt_3_winding/powt3win_mcLv_model.dart';
import '../models/equipment/powt_3_winding/powt3win_r_model.dart';
import '../models/equipment/powt_3_winding/powt3win_schvivt_model.dart';
import '../models/equipment/powt_3_winding/powt3win_schvlv_model.dart';
import '../models/equipment/powt_3_winding/powt3win_tsc_model.dart';
import '../models/equipment/powt_3_winding/powt3win_wrHv_model.dart';
import '../models/equipment/powt_3_winding/powt3win_wrIvT_model.dart';
import '../models/equipment/powt_3_winding/powt3win_wrLv_model.dart';
import '../models/equipment/powt_3_winding/powt3winding_model.dart';
import 'equipment/Auxiliary_transformer/at_ir_local_datasource.dart';
import 'equipment/Auxiliary_transformer/at_local_datasource.dart';
import 'equipment/Auxiliary_transformer/at_mb_local_datasource.dart';
import 'equipment/Auxiliary_transformer/at_mc_local_datasource.dart';
import 'equipment/Auxiliary_transformer/at_r_local_datasource.dart';
import 'equipment/Auxiliary_transformer/at_wrHv_local_datasource.dart';
import 'equipment/Auxiliary_transformer/at_wrLv_local_datasource.dart';
import '../models/equipment/isolator/iso_cr_test_model.dart';
import '../models/equipment/isolator/iso_ir_test_model.dart';
import '../models/equipment/isolator/iso_model.dart';
import '../models/equipment/power_cable/pc_hv_test_model.dart';
import '../models/equipment/power_cable/pc_ir_test_model.dart';
import '../models/equipment/power_cable/pc_model.dart';
import 'equipment/CT/ct_core_kvp_local_datasource.dart';
import 'equipment/CT/ct_core_local_datasource.dart';
import 'equipment/CT/ct_core_p_local_datasource.dart';
import 'equipment/CT/ct_core_r_local_datasource.dart';
import 'equipment/CT/ct_core_wr_local_datasource.dart';
import 'equipment/CT/ct_tap_local_datasource.dart';
import 'equipment/EE/ee_loc_local_datasource.dart';
import 'equipment/EE/ee_local_datasource.dart';
import 'equipment/EE/ee_rtest_local_datasource copy.dart';
import 'equipment/EE/ee_test_local_datasource.dart';
import 'equipment/IT/it_r_local_datasource.dart';
import 'equipment/IT/it_vg_local_datasource.dart';
import 'equipment/LA/la_ir_local_datasource.dart';
import 'equipment/LA/la_local_datasource.dart';
import 'equipment/Potential_Tranformer/pt_core_local_datasource.dart';
import 'equipment/Potential_Tranformer/pt_core_r_local_datasource.dart';
import 'equipment/Potential_Tranformer/pt_core_wr_local_datasource.dart';
import 'equipment/Potential_Tranformer/pt_ir_local_datasource.dart';
import 'equipment/Potential_Tranformer/pt_local_datasource.dart';
import 'equipment/Power_transformer/powt_bNamePlate_local_datasource.dart';
import 'equipment/Power_transformer/powt_ir_local_datasource.dart';
import 'equipment/Power_transformer/powt_local_datasource.dart';
import 'equipment/Power_transformer/powt_mb_local_datasource.dart';
import 'equipment/Power_transformer/powt_mc_local_datasource.dart';
import 'equipment/Power_transformer/powt_r_local_datasource.dart';
import 'equipment/Power_transformer/powt_sc_local_datasource.dart';
import 'equipment/Power_transformer/powt_td_local_datasource.dart';
import 'equipment/Power_transformer/powt_tsc_local_datasource.dart';
import 'equipment/Power_transformer/powt_wrHv_local_datasource.dart';
import 'equipment/Power_transformer/powt_wrLv_local_datasource.dart';
import 'equipment/Relays/EFELRelay/efelr_local_datasource.dart';
import 'equipment/Relays/EFELRelay/efelr_pac_local_datasource.dart';
import 'equipment/Relays/OCEFRelay/ocefr_local_datasource.dart';
import 'equipment/Relays/OCEFRelay/ocefr_pac_local_datasource.dart';
import 'equipment/Relays/TimerRelay/tr_local_datasource.dart';
import 'equipment/Relays/TimerRelay/tr_pac_local_datasource.dart';
import 'equipment/Relays/VoltageRelay/vr_local_datasource.dart';
import 'equipment/Relays/VoltageRelay/vr_pac_local_datasource.dart';
import 'equipment/SC/sc_c_local_datasource.dart';
import 'equipment/SC/sc_local_datasource.dart';
import 'equipment/acb/acb_cr_local_datasource.dart';
import 'equipment/busbar/bb_cr_local_datasource copy.dart';
import 'equipment/busbar/bb_hv_local_datasource.dart';
import 'equipment/busbar/bb_ir_local_datasource.dart';
import 'equipment/energy_meter/energy_meter_ap_local_datasource.dart';
import 'equipment/energy_meter/energy_meter_aprp_local_datasource.dart';
import 'equipment/energy_meter/energy_meter_ci_local_datasource.dart';
import 'equipment/energy_meter/energy_meter_fi_local_datasource.dart';
import 'equipment/energy_meter/energy_meter_local_datasource.dart';
import 'equipment/energy_meter/energy_meter_pfi_local_datasource.dart';
import 'equipment/energy_meter/energy_meter_rp_local_datasource.dart';
import 'equipment/energy_meter/energy_meter_vi_local_datasource.dart';
import 'equipment/isolator/iso_cr_local_datasource.dart';
import 'equipment/isolator/iso_ir_local_datasource.dart';
import 'equipment/isolator/iso_local_datasource.dart';

import 'equipment/Relays/AuxiliaryRelay/AR_local_datasource.dart';
import 'equipment/Relays/AuxiliaryRelay/AR_pudo_local_datasource.dart';
import 'equipment/Relays/FPrelay/FPR_currentMgmt_local_datasource.dart';
import 'equipment/Relays/FPrelay/FPR_earthfault_local_datasource.dart';
import 'equipment/Relays/FPrelay/FPR_overcurrent_local_datasource.dart';
import 'equipment/Relays/FPrelay/FPR_overfreq_local_datasource.dart';
import 'equipment/Relays/FPrelay/FPR_overvoltage_local_datasource.dart';
import 'equipment/Relays/FPrelay/FPR_underfreq_local_datasource.dart';
import 'equipment/Relays/FPrelay/FPR_undervoltage_local_datasource.dart';
import 'equipment/Relays/FPrelay/FPR_voltageMgmt_local_datasource.dart';
import 'equipment/Relays/FPrelay/FPrelay_local_datasource.dart';
import 'equipment/power_cable/pc_hv_local_datasource.dart';
import 'equipment/power_cable/pc_ir_local_datasource.dart';
import 'equipment/powt_3_winding/powt3win_ir_local_datasource.dart';
import 'equipment/powt_3_winding/powt3win_local_datasource.dart';
import 'equipment/powt_3_winding/powt3win_mb_local_datasource.dart';
import 'equipment/powt_3_winding/powt3win_mcHv_local_datasource.dart';
import 'equipment/powt_3_winding/powt3win_mcIvT_local_datasource.dart';
import 'equipment/powt_3_winding/powt3win_mcLv_local_datasource.dart';
import 'equipment/powt_3_winding/powt3win_r_local_datasource.dart';
import 'equipment/powt_3_winding/powt3win_schvivt_local_datasource.dart';
import 'equipment/powt_3_winding/powt3win_schvlv_local_datasource.dart';
import 'equipment/powt_3_winding/powt3win_tsc_local_datasource.dart';
import 'equipment/powt_3_winding/powt3win_wrHv_local_datasource.dart';
import 'equipment/powt_3_winding/powt3win_wrIvT_local_datasource.dart';
import 'equipment/powt_3_winding/powt3win_wrLv_local_datasource.dart';
import 'equipment/DG/dg_local_datasource.dart';
import 'equipment/DG/dg_ir_local_datasource.dart';
import 'equipment/DG/dg_wr_local_datasource.dart';
import 'users_table_local_datasource.dart';

part 'test_report_local_datasource.g.dart';

abstract class TestReportLocalDatasource {
  ///Gets [TestReportModel] from local datasource
  ///if internet connection is not present

  ///Throws a [NoLocalDataException] if no local data is present
  Future<TestReportModel> getTestReport(int trNo);
  Future<TestReportModel> getTestReportById(int id);
  Future<TestReportModel> getReportByTrNo(int trNo);
  Future<void> localTestReport(TestReportModel reportToLocal);
  Future<void> updateTestReport(TestReportModel reportToUpdate, int id);
  Future<List<TestReportModel>> listOfReports();
  Future<int> deleteReportById(int id);
  Future<int> deleteReportByDatabaseId(int databaseID);
}

@DataClassName('TestReportLocalData')
class TestReportLocalDatasourceImpl extends Table
    implements TestReportLocalDatasource {
  // @required
  // RealColumn get some_name => real()();

  @required
  DateTimeColumn get lastUpdated =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @required
  IntColumn get databaseID => integer()();

  // autoIncrement automatically sets this to be the primary key
  @required
  IntColumn get id => integer().autoIncrement()();

  // If the length constraint is not fulfilled, the Task will not
  // be inserted into the database and an exception will be thrown.
  @required
  TextColumn get client => text().withLength(min: 1, max: 50)();

  TextColumn get customer => text().withLength(min: 1, max: 50).nullable()();
  @required
  TextColumn get project => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get trNo => integer()();
  // DateTime is not natively supported by SQLite
  // Moor converts it to & from UNIX seconds
  @required
  DateTimeColumn get testDate =>
      dateTime().withDefault(Constant(DateTime.now()))();
  // Booleans are not supported as well, Moor converts them to integers

  @override
  Future<TestReportModel> getTestReport(int trNo) async {
    int tid;
    int tdatabaseID;
    int ttrNo;
    String tClient;
    String tCustomer;
    String tProject;
    DateTime ttestDate;
    DateTime tlastUpdated;
    TestReportLocalData tAppData =
        await sl<AppDatabase>().watchTestReportLocalDataWithtrNo(trNo).first;

    tid = tAppData.id;
    tdatabaseID = tAppData.databaseID;
    ttrNo = tAppData.trNo;
    tClient = tAppData.client;
    tCustomer = tAppData.customer;
    tProject = tAppData.project;
    ttestDate = tAppData.testDate;
    tlastUpdated = tAppData.lastUpdated;

    final tTestReportModel = TestReportModel(
      databaseID: tdatabaseID,
      id: tid,
      trNo: ttrNo,
      client: tClient,
      customer: tCustomer,
      project: tProject,
      testDate: ttestDate,
      lastUpdated: tlastUpdated,
    );

    return tTestReportModel;
  }

  @override
  Future<TestReportModel> getTestReportById(int id) async {
    TestReportLocalData tAppData =
        await sl<AppDatabase>().watchTestReportLocalDataWithId(id).first;
    int tid = tAppData.id;
    int tdatabaseID = tAppData.databaseID;
    int ttrNo = tAppData.trNo;
    String tClient = tAppData.client;
    String tCustomer = tAppData.customer;
    String tProject = tAppData.project;
    DateTime ttestDate = tAppData.testDate;
    DateTime tlastUpdated = tAppData.lastUpdated;
    final tTestReportModel = TestReportModel(
      id: tid,
      databaseID: tdatabaseID,
      trNo: ttrNo,
      client: tClient,
      customer: tCustomer,
      project: tProject,
      testDate: ttestDate,
      lastUpdated: tlastUpdated,
    );
    return tTestReportModel;
  }

  //getReportByDatabaseID
  @override
  Future<TestReportModel> getReportByTrNo(int trNo) async {
    TestReportLocalData tAppData =
        await sl<AppDatabase>().watchTestReportLocalDataWithTrNo(trNo);

    TestReportModel tAppModel = TestReportModel(
      id: tAppData.id,
      databaseID: tAppData.databaseID,
      client: tAppData.client,
      customer: tAppData.customer,
      project: tAppData.project,
      trNo: tAppData.trNo,
      testDate: tAppData.testDate,
      lastUpdated: tAppData.lastUpdated,
    );

    return tAppModel;
  }

  @override
  Future<void> localTestReport(TestReportModel reportToLocal) async {
    int ttrNo;
    int tdatabaseID;
    String tClient;
    String tCustomer;
    String tProject;
    DateTime ttestDate;
    // DateTime tlastUpdated;

    ttrNo = reportToLocal.trNo;
    tdatabaseID = reportToLocal.databaseID;
    tClient = reportToLocal.client;
    tCustomer = reportToLocal.customer;
    tProject = reportToLocal.project;
    ttestDate = reportToLocal.testDate;
    // tlastUpdated = reportToLocal.lastUpdated;

    sl<AppDatabase>().createReport(
        ttrNo, tdatabaseID, tClient, tCustomer, tProject, ttestDate);
  }

  @override
  Future<void> updateTestReport(TestReportModel reportToUpdate, int id) async {
    int newTrNo;
    int newdatabaseID;
    String newClient;
    String newCustomer;
    String newProject;
    DateTime newtestDate;
    DateTime newlastUpdated;

    newTrNo = reportToUpdate.trNo;
    newdatabaseID = reportToUpdate.databaseID;
    newClient = reportToUpdate.client;
    newCustomer = reportToUpdate.customer;
    newProject = reportToUpdate.project;
    newtestDate = reportToUpdate.testDate;
    newlastUpdated = reportToUpdate.lastUpdated;

    sl<AppDatabase>().updateReport(id, newdatabaseID, newClient, newCustomer,
        newProject, newTrNo, newtestDate, newlastUpdated);
  }

  @override
  Future<List<TestReportModel>> listOfReports() async {
    final dataList =
        await sl<AppDatabase>().getTestReportLocalDatasourceImplList();
    List<TestReportModel> tmpReportModel =
        List<TestReportModel>.empty(growable: true);

    for (var element in dataList) {
      tmpReportModel.add(TestReportModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        client: element.client,
        customer: element.customer,
        project: element.project,
        testDate: element.testDate,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tmpReportModel;
  }

  @override
  Future<int> deleteReportById(int id) async {
    final int rowsDeleted = await sl<AppDatabase>().deleteById(id);
    return rowsDeleted;
  }

  @override
  Future<int> deleteReportByDatabaseId(int databaseID) async {
    final int rowsDeleted =
        await sl<AppDatabase>().deleteBydatabaseId(databaseID);
    return rowsDeleted;
  }
}

//------------------------------------AppDataBase-Tables--------------------------------------------------------//

@DriftDatabase(tables: [
  TestReportLocalDatasourceImpl,
  AcbLocalDatasourceImpl,
  AcbIrLocalDatasourceImpl,
  AcbCrmLocalDatasourceImpl,
  AcbCRLocalDatasourceImpl,
  VcbTimingLocalDatasourceImpl,
  UserLocalDatasourceImpl,
  InventorytocalDatasourceImpl,
  // ---------------------------
  EnergyMeterLocalDatasourceImpl,
  EnergyMeterViLocalDatasourceImpl,
  EnergyMeterCiLocalDatasourceImpl,
  EnergyMeterFiLocalDatasourceImpl,
  EnergyMeterPfiLocalDatasourceImpl,
  EnergyMeterApLocalDatasourceImpl,
  EnergyMeterRpLocalDatasourceImpl,
  EnergyMeterAprpLocalDatasourceImpl,
  // --------------------------------
  CTLocalDatasourceImpl,
  CT_core_LocalDatasourceImpl,
  CTcoreIRLocalDatasourceImpl,
  CTcoreWRLocalDatasourceImpl,
  CTcorePLocalDatasourceImpl,
  CTcoreRLocalDatasourceImpl,
  CTcoreKVPLocalDatasourceImpl,
  CT_tap_LocalDatasourceImpl,
  // --------------------------------
  PTLocalDatasourceImpl,
  PT_core_LocalDatasourceImpl,
  PTcoreIRLocalDatasourceImpl,
  PTcoreWRLocalDatasourceImpl,
  PTcoreRLocalDatasourceImpl,
  // --------------------------------
  ATLocalDatasourceImpl,
  ATcoreIRLocalDatasourceImpl,
  ATwrHv_LocalDatasourceImpl,
  ATwrLv_LocalDatasourceImpl,
  AT_R_LocalDatasourceImpl,
  AT_mc_LocalDatasourceImpl,
  AT_mb_LocalDatasourceImpl,
  // --------------------------------
  PowtLocalDatasourceImpl,
  PowtcoreIRLocalDatasourceImpl,
  PowttscLocalDatasourceImpl,
  PowtwrHvLocalDatasourceImpl,
  PowtwrLvLocalDatasourceImpl,
  Powt_R_LocalDatasourceImpl,
  Powt_mc_LocalDatasourceImpl,
  Powt_mb_LocalDatasourceImpl,
  PowtscLocalDatasourceImpl,
  PowtbNamePlateLocalDatasourceImpl,
  PowttdLocalDatasourceImpl,
  //--------------------------
  IsoLocalDatasourceImpl,
  IsoIrLocalDatasourceImpl,
  IsoCrLocalDatasourceImpl,
  //------------------------
  LaLocalDatasourceImpl,
  LaIrLocalDatasourceImpl,
  // //------------------------
  ScLocalDatasourceImpl,
  ScCLocalDatasourceImpl,
  //------------------------
  PcLocalDatasourceImpl,
  PcIrLocalDatasourceImpl,
  PcHvLocalDatasourceImpl,
  //--------------------
  EELocalDatasourceImpl,
  EE_Loc_LocalDatasourceImpl,
  EETestLocalDatasourceImpl,
  EERTestLocalDatasourceImpl,
  //-----------------------------
  BbLocalDatasourceImpl,
  BbIrLocalDatasourceImpl,
  BbHvLocalDatasourceImpl,
  BbCrLocalDatasourceImpl,
  // -----------------------------
  Powt3WindingLocalDatasourceImpl,
  Powt3winIRLocalDatasourceImpl,
  Powt3wintscLocalDatasourceImpl,
  Powt3winwrHvLocalDatasourceImpl,
  Powt3winwrLvLocalDatasourceImpl,
  Powt3winwrIvTLocalDatasourceImpl,
  Powt3win_R_LocalDatasourceImpl,
  Powt3win_mcHv_LocalDatasourceImpl,
  Powt3win_mcLv_LocalDatasourceImpl,
  Powt3winmcIvTLocalDatasourceImpl,
  Powt3win_mb_LocalDatasourceImpl,

  Powt3winschvlvLocalDatasourceImpl,
  Powt3winschvivtLocalDatasourceImpl,
  // -----------------------------
  ItLocalDatasourceImpl,
  ItIrLocalDatasourceImpl,
  ItWrLocalDatasourceImpl,
  ItRLocalDatasourceImpl,
  ItMcLocalDatasourceImpl,
  ItMbLocalDatasourceImpl,
  ItVgLocalDatasourceImpl,
  // -----------------------------
  FPrelayLocalDatasourceImpl,
  FPRcurrentMgmtLocalDatasourceImpl,
  FPRvoltageMgmtLocalDatasourceImpl,
  FPRovercurrentLocalDatasourceImpl,
  FPRearthfaultLocalDatasourceImpl,
  FPRovervoltageLocalDatasourceImpl,
  FPRundervoltageLocalDatasourceImpl,
  FPRoverfreqLocalDatasourceImpl,
  FPRunderfreqLocalDatasourceImpl,
  // -------------------------------
  ARLocalDatasourceImpl,
  ARpudoLocalDatasourceImpl,
  //---------------------------
  DgLocalDatasourceImpl,
  DgIrLocalDatasourceImpl,
  DgWrLocalDatasourceImpl,
  //---------------------------
  TrLocalDatasourceImpl,
  TrPacLocalDatasourceImpl,
  //---------------------------
  VrLocalDatasourceImpl,
  VrPacLocalDatasourceImpl,
  //---------------------------
  EfElrLocalDatasourceImpl,
  EfElrPacLocalDatasourceImpl,
  //---------------------------
  OcEfrLocalDatasourceImpl,
  OcEfrPacLocalDatasourceImpl,
])
//---------------------------------------------------------------------------------------------------------------//

// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // Bump this when changing tables and columns.

  @override
  int get schemaVersion => 1;

  // @override
  // MigrationStrategy get migration {
  //   return MigrationStrategy(
  //     onCreate: (Migrator m) async {
  //       await m.createAll();
  //     },
  //     onUpgrade: (Migrator m, int from, int to) async {
  //       if (from < 2) {
  //         // we added the dueDate property in the change from version 1 to
  //         // version 2
  //         await m.createTable(userLocalDatasourceImpl);
  //       }
  //       if (from < 3) {
  //         // we added the databaseID column for all tables except User_Table
  //         // version 3
  //         await m.addColumn(testReportLocalDatasourceImpl,
  //             testReportLocalDatasourceImpl.databaseID);
  //         await m.addColumn(inventorytocalDatasourceImpl,
  //             inventorytocalDatasourceImpl.databaseID);

  //         await m.addColumn(
  //             acbCrmLocalDatasourceImpl, acbCrmLocalDatasourceImpl.databaseID);

  //         await m.addColumn(
  //             acbIrLocalDatasourceImpl, acbIrLocalDatasourceImpl.databaseID);
  //         await m.addColumn(
  //             acbCrmLocalDatasourceImpl, acbCrmLocalDatasourceImpl.databaseID);
  //         await m.addColumn(vcbTimingLocalDatasourceImpl,
  //             vcbTimingLocalDatasourceImpl.databaseID);
  //       }
  //       if (from < 4) {
  //         // we added the 3 column for ACB_IR and ACB_CRM and VCB_timing Table
  //         // Column for TestedBy
  //         // Column for VerifiedBy
  //         // Column for WitnessedBy
  //         // version 4
  //         ////////////////////////////ACB_IR_TABLE_3_Col_add////////////////////////////////
  //         await m.addColumn(
  //             acbIrLocalDatasourceImpl, acbIrLocalDatasourceImpl.TestedBy);
  //         await m.addColumn(
  //             acbIrLocalDatasourceImpl, acbIrLocalDatasourceImpl.VerifiedBy);
  //         await m.addColumn(
  //             acbIrLocalDatasourceImpl, acbIrLocalDatasourceImpl.WitnessedBy);

  //         ////////////////////////////ACB_CRM_TABLE_3_Col_add////////////////////////////////
  //         await m.addColumn(
  //             acbCrmLocalDatasourceImpl, acbCrmLocalDatasourceImpl.TestedBy);
  //         await m.addColumn(
  //             acbCrmLocalDatasourceImpl, acbCrmLocalDatasourceImpl.VerifiedBy);
  //         await m.addColumn(
  //             acbCrmLocalDatasourceImpl, acbCrmLocalDatasourceImpl.WitnessedBy);

  //         ///////////////////////////////VCB_TIMING_TABLE_3_Col_add///////////////////////////

  //         await m.addColumn(vcbTimingLocalDatasourceImpl,
  //             vcbTimingLocalDatasourceImpl.TestedBy);
  //         await m.addColumn(vcbTimingLocalDatasourceImpl,
  //             vcbTimingLocalDatasourceImpl.VerifiedBy);
  //         await m.addColumn(vcbTimingLocalDatasourceImpl,
  //             vcbTimingLocalDatasourceImpl.WitnessedBy);
  //       }
  //       if (from < 5) {
  //         // Adding 10 columns to the [USERTABLE] of Employee Related details
  //         // version 5
  //         await m.addColumn(
  //             userLocalDatasourceImpl, userLocalDatasourceImpl.empNo);
  //         await m.addColumn(
  //             userLocalDatasourceImpl, userLocalDatasourceImpl.empEmail);
  //         await m.addColumn(
  //             userLocalDatasourceImpl, userLocalDatasourceImpl.empPfNo);
  //         await m.addColumn(
  //             userLocalDatasourceImpl, userLocalDatasourceImpl.empEsic);
  //         await m.addColumn(
  //             userLocalDatasourceImpl, userLocalDatasourceImpl.empGIP);
  //         await m.addColumn(
  //             userLocalDatasourceImpl, userLocalDatasourceImpl.empDOJ);
  //         await m.addColumn(
  //             userLocalDatasourceImpl, userLocalDatasourceImpl.empDOB);
  //         await m.addColumn(
  //             userLocalDatasourceImpl, userLocalDatasourceImpl.empGender);
  //         await m.addColumn(
  //             userLocalDatasourceImpl, userLocalDatasourceImpl.empMangerName);
  //         await m.addColumn(
  //             userLocalDatasourceImpl, userLocalDatasourceImpl.empMangerEmpNo);
  //       }
  //       if (from < 6) {
  //         // Version 6
  //         ///////////////////////////ACBLOCALDS-tested,verified,witnessed 3 cols////////////////
  //         await m.addColumn(
  //             acbLocalDatasourceImpl, acbLocalDatasourceImpl.TestedBy);
  //         await m.addColumn(
  //             acbLocalDatasourceImpl, acbLocalDatasourceImpl.VerifiedBy);
  //         await m.addColumn(
  //             acbLocalDatasourceImpl, acbLocalDatasourceImpl.WitnessedBy);

  //         ///////////////////////////Inventory-isSpecialKit col/////////////////////////////////
  //         await m.addColumn(inventorytocalDatasourceImpl,
  //             inventorytocalDatasourceImpl.isSpecialKit);

  //         ///////////////////////////AcbIr,Crm,Vcb-Time for Equipment Type col 1 : 3////////////
  //         await m.addColumn(
  //             acbIrLocalDatasourceImpl, acbIrLocalDatasourceImpl.EquipmentType);
  //         await m.addColumn(acbCrmLocalDatasourceImpl,
  //             acbCrmLocalDatasourceImpl.EquipmentType);
  //         await m.addColumn(vcbTimingLocalDatasourceImpl,
  //             vcbTimingLocalDatasourceImpl.EquipmentType);

  //         /////////////AcbIr,Crm,Vcb-Time Delete (TestedBy)(VerifiedBy)(WitnessedBY) 3 cols in 3 tables////////

  //       }
  //       if (from < 7) {
  //         // await m.alterTable(TableMigration(acbIrLocalDatasourceImpl.TestedBy));
  //         // await m
  //         //     .alterTable(TableMigration(
  // LocalDatasourceImpl.VerifiedBy));
  //         // await m
  //         //     .alterTable(TableMigration(acbIrLocalDatasourceImpl.WitnessedBy));

  //         // await m
  //         //     .alterTable(TableMigration(acbCrmLocalDatasourceImpl.TestedBy));
  //         // await m
  //         //     .alterTable(TableMigration(acbCrmLocalDatasourceImpl.VerifiedBy));
  //         // await m.alterTable(
  //         //     TableMigration(acbCrmLocalDatasourceImpl.WitnessedBy));

  //         // await m.alterTable(
  //         //     TableMigration(vcbTimingLocalDatasourceImpl.TestedBy));
  //         // await m.alterTable(
  //         //     TableMigration(vcbTimingLocalDatasourceImpl.VerifiedBy));
  //         // await m.alterTable(
  //         //     TableMigration(vcbTimingLocalDatasourceImpl.WitnessedBy));
  //       }
  //     },
  //   );
  // }

  //---------------------------------------------------------------------------------------------------------------//

  /////////////////////////UserLocalDataSource (called functions) START //////////////////////////
  Future<UserLocalData> getUserLocalDataWithId(int empNo) async {
    return await (select(userLocalDatasourceImpl)
          ..where((u) => u.empNo.equals(empNo)))
        .getSingle();
  }

  Future<UserLocalData> getUserLocalDataWithDBID(int databaseID) {
    return (select(userLocalDatasourceImpl)
          ..where((u) => u.databaseID.equals(databaseID)))
        .getSingle();
  }

  Future<List<UserLocalData>> getUserLocalDataList() async {
    return await select(userLocalDatasourceImpl).get();
  }

  Future<int> createUser(UserModel usermodel) {
    return into(userLocalDatasourceImpl)
        .insert(UserLocalDatasourceImplCompanion.insert(
      // id: const Value.absent(),
      // empDOJ: usermodel.,
      // empDOB: const Value.absent(),
      // lastUpdated: const Value.absent(),
      databaseID: usermodel.databaseID,
      empNo: usermodel.empNo,
      name: usermodel.name,
      designation: usermodel.designation,
      contact: usermodel.contact,
      empGender: usermodel.empGender,
      empEmail: usermodel.empEmail,
      empMangerName: usermodel.empMangerName,
      empMangerEmpNo: usermodel.empMangerEmpNo,
      empEsic: usermodel.empEsic,
      empPfNo: usermodel.empPfNo,
      empGIP: usermodel.empGIP,
    ));
  }

  ///////////////////////UserLocalDataSource (called functions) END ///////////////////////////

  //---------------------------------------------------------------------------------------------------------------//
  ////////////////////////INVENTORY-Functions-START///////////////////////
  Future<InventoryLocalData> getInventoryLocaldataWithId(String barcode) async {
    return await (select(inventorytocalDatasourceImpl)
          ..where((u) => u.barcode.equals(barcode)))
        .getSingle();
  }

  Future<List<InventoryLocalData>> getEquipmentLocalDataList() async {
    return await select(inventorytocalDatasourceImpl).get();
  }

  Future<int> createInventory(InventoryModel inventorymodel) {
    return into(inventorytocalDatasourceImpl)
        .insert(InventorytocalDatasourceImplCompanion.insert(
      // lastUpdated: const Value.absent(),
      // dateOfTesting: const Value.absent(),
      // dueDateOfTesting: const Value.absent(),
      barcode: inventorymodel.barcode,
      type: inventorymodel.type,
      make: inventorymodel.make,
      model: inventorymodel.model,
      serialNo: inventorymodel.serialNo,
      SpecialKit: inventorymodel.SpecialKit,
    ));
  }

  // Future<int> deleteInventoryById(int id) {
  //   return (delete(inventorytocalDatasourceImpl)
  //         ..where((tbl) => tbl.id.equals(id)))
  //       .go();
  // }

  ////////////////////////INVENTORY-Functions-END///////////////////////
//---------------------------------------------------------------------------------------------------------------//

  //////////////////////TEST-REPORT-LOCAL-DATASOURCE-STARTS/////////////////////

  Future<List<TestReportLocalData>>
      getTestReportLocalDatasourceImplList() async {
    return await select(testReportLocalDatasourceImpl).get();
  }

  Stream<TestReportLocalData> watchTestReportLocalDataWithtrNo(int trNo) {
    return (select(testReportLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .watchSingle();
  }

  Stream<TestReportLocalData> watchTestReportLocalDataWithId(int id) {
    return (select(testReportLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .watchSingle();
  }

  //watchTestReportLocalDataWithTrNo
  Future<TestReportLocalData> watchTestReportLocalDataWithTrNo(int trNo) async {
    return await (select(testReportLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .getSingle();
  }

  Future<int> createReport(int trNo, int databaseID, String client,
      String customer, String project, DateTime testDate) {
    return into(testReportLocalDatasourceImpl)
        .insert(TestReportLocalDatasourceImplCompanion.insert(
      testDate: Value(testDate),
      client: client,
      databaseID: databaseID,
      customer: Value(customer),
      project: project,
      trNo: trNo,
    ));
  }

  Future<void> updateReport(
    int id,
    int databaseID,
    String newClient,
    String newCustomer,
    String newProject,
    int newTrNo,
    DateTime newtestDate,
    DateTime newlastUpdated,
  ) {
    return update(testReportLocalDatasourceImpl).replace(TestReportLocalData(
      id: id,
      databaseID: databaseID,
      client: newClient,
      customer: newCustomer,
      project: newProject,
      trNo: newTrNo,
      testDate: newtestDate,
      lastUpdated: newlastUpdated,
    ));
  }

  Future<int> deleteById(int id) {
    return (delete(testReportLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<int> deleteBydatabaseId(int databaseID) {
    return (delete(testReportLocalDatasourceImpl)
          ..where((tbl) => tbl.databaseID.equals(databaseID)))
        .go();
  }

  //////////////////////TEST-REPORT-LOCAL-DATASOURCE-END/////////////////////

  //---------------------------------------------------------------------------------------------------------------//
  //////////////////////////////////////ACB-LOCAL-DATA-START////////////////////////////

  Future<int> createAcb(
      AcbModel acbModel, DateTime dateOfTesting, DateTime dueDateOfTesting) {
    return into(acbLocalDatasourceImpl)
        .insert(AcbLocalDatasourceImplCompanion.insert(
      databaseID: acbModel.databaseID,
      etype: acbModel.etype,
      designation: acbModel.designation,
      location: acbModel.location,
      panel: acbModel.panel,
      make: acbModel.make,
      type: acbModel.type,
      serialNo: acbModel.serialNo,
      ratedSystemVoltage: acbModel.ratedSystemVoltage,
      ratedSystemCurrent: acbModel.ratedSystemCurrent,
      yom: acbModel.yom,
      noOfPoles: acbModel.noOfPoles,
      iecStandard: acbModel.iecStandard,
      trNo: acbModel.trNo,
      TestedBy: acbModel.TestedBy,
      VerifiedBy: acbModel.VerifiedBy,
      WitnessedBy: acbModel.WitnessedBy,
      motorVoltage: acbModel.motorVoltage,
      closeCoilTripVolt: acbModel.closeCoilTripVolt,
      dateOfTesting: Value(dateOfTesting),
      dueDateOfTesting: Value(dueDateOfTesting),

      //TODO: FIX DATE OF TESTING
      // dateOfTesting: acbModel.dateOfTesting,
      // dueDateOfTesting: acbModel.dueDateOfTesting,
    ));
  }

  Future<List<AcbLocalData>> getAcbLocalDataList() async {
    return await select(acbLocalDatasourceImpl).get();
  }

  Future<bool> updateAcb(AcbModel acbToUpdate, int id) {
    int databaseID = acbToUpdate.databaseID;
    String etype = acbToUpdate.etype;
    String designation = acbToUpdate.designation;
    String location = acbToUpdate.location;
    String panel = acbToUpdate.panel;
    String serialNo = acbToUpdate.serialNo;
    String make = acbToUpdate.make;
    String type = acbToUpdate.type;
    int ratedSystemVoltage = acbToUpdate.ratedSystemVoltage;
    int ratedSystemCurrent = acbToUpdate.ratedSystemCurrent;
    int yom = acbToUpdate.yom;
    DateTime dateOfTesting = acbToUpdate.dateOfTesting;
    DateTime dueDateOfTesting = acbToUpdate.dueDateOfTesting;
    int noOfPoles = acbToUpdate.noOfPoles;
    int iecStandard = acbToUpdate.iecStandard;
    int trNo = acbToUpdate.trNo;
    String TestedBy = acbToUpdate.TestedBy;
    String VerifiedBy = acbToUpdate.VerifiedBy;
    String WitnessedBy = acbToUpdate.WitnessedBy;
    DateTime lastUpdated = acbToUpdate.lastUpdated;
    double motorVoltage = acbToUpdate.motorVoltage;
    double closeCoilTripVolt = acbToUpdate.closeCoilTripVolt;

    return update(acbLocalDatasourceImpl).replace(AcbLocalData(
      etype: etype,
      id: id,
      databaseID: databaseID,
      designation: designation,
      location: location,
      panel: panel,
      make: make,
      type: type,
      serialNo: serialNo,
      ratedSystemVoltage: ratedSystemVoltage,
      ratedSystemCurrent: ratedSystemCurrent,
      yom: yom,
      noOfPoles: noOfPoles,
      iecStandard: iecStandard,
      trNo: trNo,
      dateOfTesting: dateOfTesting,
      dueDateOfTesting: dueDateOfTesting,
      TestedBy: TestedBy,
      VerifiedBy: VerifiedBy,
      WitnessedBy: WitnessedBy,
      lastUpdated: lastUpdated,
      motorVoltage: motorVoltage,
      closeCoilTripVolt: closeCoilTripVolt,
    ));
  }

  Future<int> deleteAcbById(int id) {
    return (delete(acbLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<AcbLocalData>> getAcbLocalDatadourceImpleList() async {
    return await select(acbLocalDatasourceImpl).get();
  }

  Future<List<AcbLocalData>> getAcbLocalDataWithtrNo(int trNo) {
    return (select(acbLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<AcbLocalData> getAcbLocalDataWithId(int id) {
    return (select(acbLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }
  //////////////////////////////////////ACB-LOCAL-DATA-END////////////////////////////

  //---------------------------------------------------------------------------------------------------------------//
  //////////////////////////////////////ACB-IR-START////////////////////////////

  //Get AcbIr by Serial No
  Future<List<AcbIrLocalData>> getAcbIrLocalDataWithSerialNo(String SerialNo) {
    return (select(acbIrLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Get AcbIr by id
  Future<AcbIrLocalData> getAcbIrLocalDataWithId(int id) {
    return (select(acbIrLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get AcbIr by trNo
  Future<List<AcbIrLocalData>> getAcbIrLocalDataWithTrNo(int trNo) {
    return (select(acbIrLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get AcbIr Equipment List
  Future<List<AcbIrLocalData>> getAcbIrEquipmentListwithAll() async {
    return await select(acbIrLocalDatasourceImpl).get();
  }

  // Create AcbIr and return id

  Future<int> createAcbIr(AcbIrTestModel acbIrModel) {
    return into(acbIrLocalDatasourceImpl)
        .insert(AcbIrLocalDatasourceImplCompanion.insert(
      bB: acbIrModel.bB,
      rR: acbIrModel.rR,
      re: acbIrModel.re,
      ry: acbIrModel.ry,
      rn: acbIrModel.rn,
      yY: acbIrModel.yY,
      yb: acbIrModel.yb,
      ye: acbIrModel.ye,
      yn: acbIrModel.yn,
      be: acbIrModel.be,
      br: acbIrModel.br,
      bn: acbIrModel.bn,
      nN: acbIrModel.nN,
      ne: acbIrModel.ne,
      cb: acbIrModel.cb,
      cr: acbIrModel.cr,
      cy: acbIrModel.cy,
      serialNo: acbIrModel.serialNo,
      trNo: acbIrModel.trNo,
      databaseID: acbIrModel.databaseID,
      EquipmentType: acbIrModel.EquipmentType,
    ));
  }

  //TODO: Update AcbIr by id
  Future<bool> updateAcbIr(AcbIrTestModel acbIrToUpdate, int id) {
    String serialNo = acbIrToUpdate.serialNo;
    int trNo = acbIrToUpdate.trNo;
    int databaseID = acbIrToUpdate.databaseID;
    String EquipmentType = acbIrToUpdate.EquipmentType;

    double bB = acbIrToUpdate.bB;
    double rR = acbIrToUpdate.rR;
    double re = acbIrToUpdate.re;
    double ry = acbIrToUpdate.ry;
    double rn = acbIrToUpdate.rn;
    double yY = acbIrToUpdate.yY;
    double yb = acbIrToUpdate.yb;
    double ye = acbIrToUpdate.ye;
    double yn = acbIrToUpdate.yn;
    double be = acbIrToUpdate.be;
    double br = acbIrToUpdate.br;
    double bn = acbIrToUpdate.bn;
    double nN = acbIrToUpdate.nN;
    double ne = acbIrToUpdate.ne;
    double cb = acbIrToUpdate.cb;
    double cr = acbIrToUpdate.cr;
    double cy = acbIrToUpdate.cy;

    DateTime lastUpdated = acbIrToUpdate.lastUpdated;

    return update(acbIrLocalDatasourceImpl).replace(AcbIrLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      bB: bB,
      rR: rR,
      re: re,
      ry: ry,
      rn: rn,
      yY: yY,
      yb: yb,
      ye: ye,
      yn: yn,
      be: be,
      br: br,
      bn: bn,
      nN: nN,
      ne: ne,
      cb: cb,
      cr: cr,
      cy: cy,
      EquipmentType: EquipmentType,
      lastUpdated: lastUpdated,
    ));
  }

  //Delete AcbIr by id
  Future<int> deleteAcbIrById(int id) {
    return (delete(acbIrLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////ACB-IR-END/////////////////////////////////

  //---------------------------------------------------------------------------------------------------------------//
  //////////////////////////////////////ACB-CRM-START/////////////////////////////////

  //Create AcbCrm

  Future<int> createAcbCrm(AcbCrmTestModel acbCrmToLocal) {
    return into(acbCrmLocalDatasourceImpl)
        .insert(AcbCrmLocalDatasourceImplCompanion.insert(
      bB: acbCrmToLocal.bB,
      rR: acbCrmToLocal.rR,
      yY: acbCrmToLocal.yY,
      nN: acbCrmToLocal.nN,
      serialNo: acbCrmToLocal.serialNo,
      trNo: acbCrmToLocal.trNo,
      databaseID: acbCrmToLocal.databaseID,
      EquipmentType: acbCrmToLocal.EquipmentType,
    ));
  }

  // Get AcbCrm by id
  Future<AcbCrmLocalData> getAcbCrmLocalDataWithId(int id) {
    return (select(acbCrmLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //  Get AcbCrm by trNo
  Future<List<AcbCrmLocalData>> getAcbCrmLocalDataWithTrNo(int trNo) {
    return (select(acbCrmLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get AcbCrm Equipment List
  Future<List<AcbCrmLocalData>> getAcbCrmEquipmentListwithAll() async {
    return await select(acbCrmLocalDatasourceImpl).get();
  }

  //Get AcbCrm by Serial No
  Future<List<AcbCrmLocalData>> getAcbCrmLocalDataWithSerialNo(
      String serialNo) {
    return (select(acbCrmLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(serialNo)))
        .get();
  }

  // Update AcbCrm by id

  Future<bool> updateAcbCrm(AcbCrmTestModel acbCrmToUpdate, int id) {
    String serialNo = acbCrmToUpdate.serialNo;
    int trNo = acbCrmToUpdate.trNo;
    int databaseID = acbCrmToUpdate.databaseID;
    String EquipmentType = acbCrmToUpdate.EquipmentType;
    double bB = acbCrmToUpdate.bB;
    double rR = acbCrmToUpdate.rR;
    double yY = acbCrmToUpdate.yY;
    double nN = acbCrmToUpdate.nN;
    DateTime lastUpdated = acbCrmToUpdate.lastUpdated;

    return update(acbCrmLocalDatasourceImpl).replace(AcbCrmLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      bB: bB,
      rR: rR,
      yY: yY,
      nN: nN,
      EquipmentType: EquipmentType,
      lastUpdated: lastUpdated,
    ));
  }

  //  Delete AcbCrm by id
  Future<int> deleteAcbCrmById(int id) {
    return (delete(acbCrmLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }
  //////////////////////////////////////ACB-CRM-END/////////////////////////////////
  //---------------------------------------------------------------------------------------------------------------//
  //////////////////////////////////////ACB-CR-START/////////////////////////////////

  //Create AcbCR

  Future<int> createAcbCR(AcbCRTestModel acbCRtoLocal) {
    return into(acbCRLocalDatasourceImpl)
        .insert(AcbCRLocalDatasourceImplCompanion.insert(
      serialNo: acbCRtoLocal.serialNo,
      trNo: acbCRtoLocal.trNo,
      closeCoil: acbCRtoLocal.closeCoil,
      motorCoil: acbCRtoLocal.motorCoil,
      tripCoil: acbCRtoLocal.tripCoil,
      databaseID: acbCRtoLocal.databaseID,
      EquipmentType: acbCRtoLocal.EquipmentType,
    ));
  }

  // Get AcbCR by id
  Future<AcbCRLocalData> getAcbCRLocalDataWithId(int id) {
    return (select(acbCRLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //  Get AcbCR by trNo
  Future<List<AcbCRLocalData>> getAcbCRLocalDataWithTrNo(int trNo) {
    return (select(acbCRLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get AcbCR by Serial No
  Future<List<AcbCRLocalData>> getAcbCRLocalDataWithSerialNo(String serialNo) {
    return (select(acbCRLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(serialNo)))
        .get();
  }

  // Update AcbCR by id

  Future<bool> updateAcbCR(AcbCRTestModel acbCRToUpdate, int id) {
    String serialNo = acbCRToUpdate.serialNo;
    int trNo = acbCRToUpdate.trNo;
    int databaseID = acbCRToUpdate.databaseID;
    double motorCoil = acbCRToUpdate.motorCoil;
    double closeCoil = acbCRToUpdate.closeCoil;
    double tripCoil = acbCRToUpdate.tripCoil;
    String EquipmentType = acbCRToUpdate.EquipmentType;
    DateTime lastUpdated = acbCRToUpdate.lastUpdated;

    return update(acbCRLocalDatasourceImpl).replace(AcbCRLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      closeCoil: closeCoil,
      motorCoil: motorCoil,
      tripCoil: tripCoil,
      EquipmentType: EquipmentType,
      lastUpdated: lastUpdated,
    ));
  }

  //Get AcbCrm Equipment List
  Future<List<AcbCRLocalData>> getAcbCrEquipmentListwithAll() async {
    return await select(acbCRLocalDatasourceImpl).get();
  }

  //  Delete AcbCR by id
  Future<int> deleteAcbCRById(int id) {
    return (delete(acbCRLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }
  //////////////////////////////////////ACB-CR-END/////////////////////////////////

  //---------------------------------------------------------------------------------------------------------------//

  //---------------------------------------------------------------------------------------------------------------//
  /////////////////////////////////////////VCB-TIME-START/////////////////////////////////

  //  Delete VcbTiming by id
  Future<int> deleteVcbTimingById(int id) {
    return (delete(vcbTimingLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  // Get Vcb timing by id
  Future<VcbTimingLocalData> getVcbTimingLocalDataWithId(int id) {
    return (select(vcbTimingLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //  Get Vcb timing by trNo
  Future<List<VcbTimingLocalData>> getVcbTimingLocalDataWithTrNo(int trNo) {
    return (select(vcbTimingLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get AcbCrm Equipment List
  Future<List<VcbTimingLocalData>> getVcbtimeEquipmentListwithAll() async {
    return await select(vcbTimingLocalDatasourceImpl).get();
  }

  //Get VcbTiming by Serial No
  Future<List<VcbTimingLocalData>> getVcbTimingLocalDataWithSerialNo(
      String SerialNo) {
    return (select(vcbTimingLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Create VcbTiming

  Future<int> createVcbTiming(VcbTimingTestModel vcbTimingToLocal) {
    return into(vcbTimingLocalDatasourceImpl)
        .insert(VcbTimingLocalDatasourceImplCompanion.insert(
      serialNo: vcbTimingToLocal.serialNo,
      databaseID: vcbTimingToLocal.databaseID,
      trNo: vcbTimingToLocal.trNo,
      closeR: vcbTimingToLocal.closeR,
      closeY: vcbTimingToLocal.closeY,
      closeB: vcbTimingToLocal.closeB,
      tc1OpenR: vcbTimingToLocal.tc1OpenY,
      tc1OpenY: vcbTimingToLocal.tc1OpenY,
      tc1OpenB: vcbTimingToLocal.tc1OpenB,
      tc1CloseR: vcbTimingToLocal.tc1CloseR,
      tc1CloseY: vcbTimingToLocal.tc1CloseY,
      tc1CloseB: vcbTimingToLocal.tc1CloseB,
      tc2OpenR: vcbTimingToLocal.tc1OpenR,
      tc2OpenY: vcbTimingToLocal.tc2OpenY,
      tc2OpenB: vcbTimingToLocal.tc2OpenB,
      tc2CloseR: vcbTimingToLocal.tc2CloseR,
      tc2CloseY: vcbTimingToLocal.tc2CloseY,
      tc2CloseB: vcbTimingToLocal.tc2CloseB,
      EquipmentType: vcbTimingToLocal.EquipmentType,
    ));
  }

  // Update AcbCrm by id
  Future<bool> updateVcbTiming(VcbTimingTestModel vcbTimingToUpdate, int id) {
    String serialNo = vcbTimingToUpdate.serialNo;
    int databaseID = vcbTimingToUpdate.databaseID;
    int trNo = vcbTimingToUpdate.trNo;
    String EquipmentType = vcbTimingToUpdate.EquipmentType;

    double closeR = vcbTimingToUpdate.closeR;
    double closeY = vcbTimingToUpdate.closeY;
    double closeB = vcbTimingToUpdate.closeB;
    double tc1OpenR = vcbTimingToUpdate.tc1OpenY;
    double tc1OpenY = vcbTimingToUpdate.tc1OpenY;
    double tc1OpenB = vcbTimingToUpdate.tc1OpenB;
    double tc1CloseR = vcbTimingToUpdate.tc1CloseR;
    double tc1CloseY = vcbTimingToUpdate.tc1CloseY;
    double tc1CloseB = vcbTimingToUpdate.tc1CloseB;
    double tc2OpenR = vcbTimingToUpdate.tc1OpenR;
    double tc2OpenY = vcbTimingToUpdate.tc2OpenY;
    double tc2OpenB = vcbTimingToUpdate.tc2OpenB;
    double tc2CloseR = vcbTimingToUpdate.tc2CloseR;
    double tc2CloseY = vcbTimingToUpdate.tc2CloseY;
    double tc2CloseB = vcbTimingToUpdate.tc2CloseB;
    DateTime lastUpdated = vcbTimingToUpdate.lastUpdated;

    return update(vcbTimingLocalDatasourceImpl).replace(VcbTimingLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      closeR: closeR,
      closeY: closeY,
      closeB: closeB,
      tc1OpenR: tc1OpenR,
      tc1OpenY: tc1OpenY,
      tc1OpenB: tc1OpenB,
      tc1CloseR: tc1CloseR,
      tc1CloseY: tc1CloseY,
      tc1CloseB: tc1CloseB,
      tc2OpenR: tc2OpenR,
      tc2OpenY: tc2OpenY,
      tc2OpenB: tc2OpenB,
      tc2CloseR: tc2CloseR,
      tc2CloseY: tc2CloseY,
      tc2CloseB: tc2CloseB,
      EquipmentType: EquipmentType,
      lastUpdated: lastUpdated,
    ));
  }

/////////////////////////////////////////VCB-TIME-END/////////////////////////////////
//------------------------------------------------------------------------------------------------------//

//---------------------------------------------------------------------------------------------------------------//
//////////////////////////////////////Energy Meter-LOCAL-DATA-START////////////////////////////

  Future<int> createEnergyMeter(
      EnergyMeterModel emtolocal, DateTime dateOfTesting) {
    print(" energy meter model");
    return into(energyMeterLocalDatasourceImpl)
        .insert(EnergyMeterLocalDatasourceImplCompanion.insert(
      databaseID: emtolocal.databaseID,
      etype: emtolocal.etype,
      designation: emtolocal.designation,
      location: emtolocal.location,
      panel: emtolocal.panel,
      make: emtolocal.make,
      serialNo: emtolocal.serialNo,
      voltage: emtolocal.voltage,
      frequency: emtolocal.frequency,
      eqClass: emtolocal.eqClass,
      trNo: emtolocal.trNo,
      TestedBy: emtolocal.TestedBy,
      VerifiedBy: emtolocal.VerifiedBy,
      WitnessedBy: emtolocal.WitnessedBy,
      ctr: emtolocal.ctr,
      ptr: emtolocal.ptr,
      dateOfTesting: Value(dateOfTesting),

      //TODO: FIX DATE OF TESTING
      //lastUpdated: energyMeterModel.updateDate,
      //dateOfTesting: energyMeterModel.dateOfTesting,
    ));
  }

  Future<bool> updateEnergyMeter(EnergyMeterModel emtoupdate, int id) {
    int databaseID = emtoupdate.databaseID;
    String etype = emtoupdate.etype;
    String designation = emtoupdate.designation;
    String location = emtoupdate.location;
    String panel = emtoupdate.panel;
    String serialNo = emtoupdate.serialNo;
    String make = emtoupdate.make;
    int voltage = emtoupdate.voltage;
    int frequency = emtoupdate.frequency;
    double eqClass = emtoupdate.eqClass;
    DateTime dateOfTesting = emtoupdate.dateOfTesting;
    int trNo = emtoupdate.trNo;
    String TestedBy = emtoupdate.TestedBy;
    String VerifiedBy = emtoupdate.VerifiedBy;
    String WitnessedBy = emtoupdate.WitnessedBy;
    DateTime updateDate = emtoupdate.updateDate;
    String ctr = emtoupdate.ctr;
    String ptr = emtoupdate.ptr;

    return update(energyMeterLocalDatasourceImpl).replace(EnergyMeterLocalData(
      etype: etype,
      id: id,
      databaseID: databaseID,
      designation: designation,
      location: location,
      panel: panel,
      make: make,
      serialNo: serialNo,
      voltage: voltage,
      frequency: frequency,
      eqClass: eqClass,
      trNo: trNo,
      dateOfTesting: dateOfTesting,
      TestedBy: TestedBy,
      VerifiedBy: VerifiedBy,
      WitnessedBy: WitnessedBy,
      lastUpdated: updateDate,
      ctr: ctr,
      ptr: ptr,
    ));
  }

  Future<int> deleteEnergyMeterById(int id) {
    return (delete(energyMeterLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<EnergyMeterLocalData>> getEMLocalDatadourceImpleList() async {
    return await select(energyMeterLocalDatasourceImpl).get();
  }

  Future<List<EnergyMeterLocalData>> getEnergyMeterLocalDataWithtrNo(int trNo) {
    return (select(energyMeterLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<EnergyMeterLocalData> getEnergyMeterLocalDataWithId(int id) {
    return (select(energyMeterLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

//////////////////////////////////////Energy Meter-LOCAL-DATA-END////////////////////////////
  ///
  ///
  //---------------------------------------------------------------------------------------------------------------//
  /////////////////////////////////////////Energy Meter-Vi-START/////////////////////////////////

  //  Delete Energy Meter Vi by id
  Future<int> deleteEnergyMeterViById(int id) {
    return (delete(energyMeterViLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  // Get Energy Meter Vi by id
  Future<EnergyMeterViLocalData> getEnergyMeterViLocalDataWithId(int id) {
    return (select(energyMeterViLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<EnergyMeterViLocalData>>
      getEnergyMeterEquipmentListwithAll() async {
    return await select(energyMeterViLocalDatasourceImpl).get();
  }

  //  Get Energy Meter Vi by trNo
  Future<List<EnergyMeterViLocalData>> getEnergyMeterViLocalDataWithTrNo(
      int trNo) {
    return (select(energyMeterViLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get Energy Meter Vi by Serial No
  Future<List<EnergyMeterViLocalData>> getEnergyMeterViLocalDataWithSerialNo(
      String SerialNo) {
    return (select(energyMeterViLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

// //Get Energy Meter Vi Equipment List
//   Future<List<AcbIrTestModel>> getEnergyMeterViEquipmentList() {
//     return (energyMeterViLocalDatasourceImpl).getEnergyMeterViEquipmentList();
//   }

  //Create Energy Meter Vi

  Future<int> createEnergyMeterVi(EnergyMeterViTestModel emvitolocal) {
    return into(energyMeterViLocalDatasourceImpl)
        .insert(EnergyMeterViLocalDatasourceImplCompanion.insert(
      serialNo: emvitolocal.serialNo,
      databaseID: emvitolocal.databaseID,
      trNo: emvitolocal.trNo,
      EquipmentType: emvitolocal.EquipmentType,
      yr: emvitolocal.yr,
      ya: emvitolocal.ya,
      rr: emvitolocal.rr,
      ra: emvitolocal.ra,
      br: emvitolocal.br,
      ba: emvitolocal.ba,
    ));
  }

  // Update Energy Meter Vi by id
  Future<bool> updateEnergyMeterVi(
      EnergyMeterViTestModel emvitoupdate, int id) {
    String serialNo = emvitoupdate.serialNo;
    int databaseID = emvitoupdate.databaseID;
    int trNo = emvitoupdate.trNo;
    String EquipmentType = emvitoupdate.EquipmentType;
    DateTime updateDate = emvitoupdate.updateDate;
    double rr = emvitoupdate.rr;
    double ra = emvitoupdate.ra;
    double yr = emvitoupdate.yr;
    double ya = emvitoupdate.ya;
    double br = emvitoupdate.br;
    double ba = emvitoupdate.ba;

    return update(energyMeterViLocalDatasourceImpl)
        .replace(EnergyMeterViLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      EquipmentType: EquipmentType,
      lastUpdated: updateDate,
      yr: yr,
      ya: ya,
      rr: rr,
      ra: ra,
      br: br,
      ba: ba,
    ));
  }

/////////////////////////////////////////Energy Meter-Vi-END/////////////////////////////////

//---------------------------------------------------------------------------------------------------------------//
  /////////////////////////////////////////Energy Meter-Ci-START/////////////////////////////////

  //  Delete Energy Meter Ci by id
  Future<int> deleteEnergyMeterCiById(int id) {
    return (delete(energyMeterCiLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<EnergyMeterCiLocalData>> getEMciEquipmentListwithAll() async {
    return await select(energyMeterCiLocalDatasourceImpl).get();
  }

  // Get Energy Meter Ci by id
  Future<EnergyMeterCiLocalData> getEnergyMeterCiLocalDataWithId(int id) {
    return (select(energyMeterCiLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //  Get Energy Meter Ci by trNo
  Future<List<EnergyMeterCiLocalData>> getEnergyMeterCiLocalDataWithTrNo(
      int trNo) {
    return (select(energyMeterCiLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get Energy Meter Ci by Serial No
  Future<List<EnergyMeterCiLocalData>> getEnergyMeterCiLocalDataWithSerialNo(
      String SerialNo) {
    return (select(energyMeterCiLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Create Energy Meter Ci

  Future<int> createEnergyMeterCi(EnergyMeterCiTestModel emcitolocal) {
    return into(energyMeterCiLocalDatasourceImpl)
        .insert(EnergyMeterCiLocalDatasourceImplCompanion.insert(
      serialNo: emcitolocal.serialNo,
      databaseID: emcitolocal.databaseID,
      trNo: emcitolocal.trNo,
      EquipmentType: emcitolocal.EquipmentType,
      yr: emcitolocal.yr,
      ya: emcitolocal.ya,
      rr: emcitolocal.rr,
      ra: emcitolocal.ra,
      br: emcitolocal.br,
      ba: emcitolocal.ba,
    ));
  }

  // Update Energy Meter Ci by id
  Future<bool> updateEnergyMeterCi(
      EnergyMeterCiTestModel emcitoupdate, int id) {
    String serialNo = emcitoupdate.serialNo;
    int databaseID = emcitoupdate.databaseID;
    int trNo = emcitoupdate.trNo;
    String EquipmentType = emcitoupdate.EquipmentType;
    DateTime updateDate = emcitoupdate.updateDate;
    double rr = emcitoupdate.rr;
    double ra = emcitoupdate.ra;
    double yr = emcitoupdate.yr;
    double ya = emcitoupdate.ya;
    double br = emcitoupdate.br;
    double ba = emcitoupdate.ba;

    return update(energyMeterCiLocalDatasourceImpl)
        .replace(EnergyMeterCiLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      EquipmentType: EquipmentType,
      lastUpdated: updateDate,
      yr: yr,
      ya: ya,
      rr: rr,
      ra: ra,
      br: br,
      ba: ba,
    ));
  }

/////////////////////////////////////////Energy Meter-ci-END/////////////////////////////////

//---------------------------------------------------------------------------------------------------------------//
  /////////////////////////////////////////Energy Meter-Fi-START/////////////////////////////////

  //  Delete Energy Meter Fi by id
  Future<int> deleteEnergyMeterFiById(int id) {
    return (delete(energyMeterFiLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  // Get Energy Meter Fi by id
  Future<EnergyMeterFiLocalData> getEnergyMeterFiLocalDataWithId(int id) {
    return (select(energyMeterFiLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<EnergyMeterFiLocalData>> getEMfiEquipmentListwithAll() async {
    return await select(energyMeterFiLocalDatasourceImpl).get();
  }

  //  Get Energy Meter Fi by trNo
  Future<List<EnergyMeterFiLocalData>> getEnergyMeterFiLocalDataWithTrNo(
      int trNo) {
    return (select(energyMeterFiLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get Energy Meter Fi by Serial No
  Future<List<EnergyMeterFiLocalData>> getEnergyMeterFiLocalDataWithSerialNo(
      String SerialNo) {
    return (select(energyMeterFiLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Create Energy Meter Fi

  Future<int> createEnergyMeterFi(
      EnergyMeterFiTestModel energyMeterFiTestModel) {
    return into(energyMeterFiLocalDatasourceImpl)
        .insert(EnergyMeterFiLocalDatasourceImplCompanion.insert(
      serialNo: energyMeterFiTestModel.serialNo,
      databaseID: energyMeterFiTestModel.databaseID,
      trNo: energyMeterFiTestModel.trNo,
      EquipmentType: energyMeterFiTestModel.EquipmentType,
      // lastUpdated: energyMeterFiTestModel.updateDate,
      yr: energyMeterFiTestModel.yr,
      ya: energyMeterFiTestModel.ya,
      rr: energyMeterFiTestModel.rr,
      ra: energyMeterFiTestModel.ra,
      br: energyMeterFiTestModel.br,
      ba: energyMeterFiTestModel.ba,
    ));
  }

  // Update Energy Meter Fi by id
  Future<bool> updateEnergyMeterFi(
      EnergyMeterFiTestModel energyMeterFiToUpdate, int id) {
    String serialNo = energyMeterFiToUpdate.serialNo;
    int databaseID = energyMeterFiToUpdate.databaseID;
    int trNo = energyMeterFiToUpdate.trNo;
    String EquipmentType = energyMeterFiToUpdate.EquipmentType;
    DateTime updateDate = energyMeterFiToUpdate.updateDate;
    double rr = energyMeterFiToUpdate.rr;
    double ra = energyMeterFiToUpdate.ra;
    double yr = energyMeterFiToUpdate.yr;
    double ya = energyMeterFiToUpdate.ya;
    double br = energyMeterFiToUpdate.br;
    double ba = energyMeterFiToUpdate.ba;

    return update(energyMeterFiLocalDatasourceImpl)
        .replace(EnergyMeterFiLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      EquipmentType: EquipmentType,
      lastUpdated: updateDate,
      yr: yr,
      ya: ya,
      rr: rr,
      ra: ra,
      br: br,
      ba: ba,
    ));
  }

/////////////////////////////////////////Energy Meter-Fi-END/////////////////////////////////

//---------------------------------------------------------------------------------------------------------------//
  /////////////////////////////////////////Energy Meter-Pfi-START/////////////////////////////////

  //  Delete Energy Meter Pfi by id
  Future<int> deleteEnergyMeterPfiById(int id) {
    return (delete(energyMeterPfiLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<EnergyMeterPfiLocalData>> getEMPFIEquipmentListwithAll() async {
    return await select(energyMeterPfiLocalDatasourceImpl).get();
  }

  // Get Energy Meter Pfi by id
  Future<EnergyMeterPfiLocalData> getEnergyMeterPfiLocalDataWithId(int id) {
    return (select(energyMeterPfiLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //  Get Energy Meter Pfi by trNo
  Future<List<EnergyMeterPfiLocalData>> getEnergyMeterPfiLocalDataWithTrNo(
      int trNo) {
    return (select(energyMeterPfiLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get Energy Meter Pfi by Serial No
  Future<List<EnergyMeterPfiLocalData>> getEnergyMeterPfiLocalDataWithSerialNo(
      String SerialNo) {
    return (select(energyMeterPfiLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Create Energy Meter Pfi
  Future<int> createEnergyMeterPfi(EnergyMeterPfiTestModel empfitolocal) {
    return into(energyMeterPfiLocalDatasourceImpl)
        .insert(EnergyMeterPfiLocalDatasourceImplCompanion.insert(
      serialNo: empfitolocal.serialNo,
      databaseID: empfitolocal.databaseID,
      trNo: empfitolocal.trNo,
      EquipmentType: empfitolocal.EquipmentType,
      // lastUpdated: empfitolocal.updateDate,
      yr: empfitolocal.yr,
      ya: empfitolocal.ya,
      rr: empfitolocal.rr,
      ra: empfitolocal.ra,
      br: empfitolocal.br,
      ba: empfitolocal.ba,
    ));
  }

  // Update Energy Meter Pfi by id
  Future<bool> updateEnergyMeterPfi(
      EnergyMeterPfiTestModel empfitoupdate, int id) {
    String serialNo = empfitoupdate.serialNo;
    int databaseID = empfitoupdate.databaseID;
    int trNo = empfitoupdate.trNo;
    String EquipmentType = empfitoupdate.EquipmentType;
    DateTime updateDate = empfitoupdate.updateDate;
    double rr = empfitoupdate.rr;
    double ra = empfitoupdate.ra;
    double yr = empfitoupdate.yr;
    double ya = empfitoupdate.ya;
    double br = empfitoupdate.br;
    double ba = empfitoupdate.ba;

    return update(energyMeterPfiLocalDatasourceImpl)
        .replace(EnergyMeterPfiLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      EquipmentType: EquipmentType,
      lastUpdated: updateDate,
      yr: yr,
      ya: ya,
      rr: rr,
      ra: ra,
      br: br,
      ba: ba,
    ));
  }

/////////////////////////////////////////Energy Meter-Pfi-END/////////////////////////////////

//---------------------------------------------------------------------------------------------------------------//
  /////////////////////////////////////////Energy Meter-Ap-START/////////////////////////////////

  //  Delete Energy Meter AP by id
  Future<int> deleteEnergyMeterApById(int id) {
    return (delete(energyMeterApLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //getEMAPEquipmentListwithAll
  Future<List<EnergyMeterApLocalData>> getEMAPEquipmentListwithAll() async {
    return await select(energyMeterApLocalDatasourceImpl).get();
  }

  // Get Energy Meter Ap by id
  Future<EnergyMeterApLocalData> getEnergyMeterApLocalDataWithId(int id) {
    return (select(energyMeterApLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //  Get Energy Meter Ap by trNo
  Future<List<EnergyMeterApLocalData>> getEnergyMeterApLocalDataWithTrNo(
      int trNo) {
    return (select(energyMeterApLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get Energy Meter Ap by Serial No
  Future<List<EnergyMeterApLocalData>> getEnergyMeterApLocalDataWithSerialNo(
      String SerialNo) {
    return (select(energyMeterApLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Create Energy Meter Ap

  Future<int> createEnergyMeterAp(EnergyMeterApTestModel emaptolocal) {
    return into(energyMeterApLocalDatasourceImpl)
        .insert(EnergyMeterApLocalDatasourceImplCompanion.insert(
      serialNo: emaptolocal.serialNo,
      databaseID: emaptolocal.databaseID,
      trNo: emaptolocal.trNo,
      EquipmentType: emaptolocal.EquipmentType,
      // lastUpdated: emaptolocal.updateDate,
      initialTestMeterReading: emaptolocal.initialTestMeterReading,
      afterTestMeterReading: emaptolocal.afterTestMeterReading,
      testMeterReading_R: emaptolocal.testMeterReading_R,
      initialStandardMeterReading: emaptolocal.initialStandardMeterReading,
      afterStandardMeterReading: emaptolocal.afterStandardMeterReading,
      standardMeterReading_A: emaptolocal.standardMeterReading_A,
    ));
  }

  // Update Energy Meter Ap by id
  Future<bool> updateEnergyMeterAp(
      EnergyMeterApTestModel emaptoupdate, int id) {
    String serialNo = emaptoupdate.serialNo;
    int databaseID = emaptoupdate.databaseID;
    int trNo = emaptoupdate.trNo;
    String EquipmentType = emaptoupdate.EquipmentType;
    DateTime updateDate = emaptoupdate.updateDate;
    double initialTestMeterReading = emaptoupdate.initialTestMeterReading;
    double afterTestMeterReading = emaptoupdate.afterTestMeterReading;
    double testMeterReading_R = emaptoupdate.testMeterReading_R;
    double initialStandardMeterReading =
        emaptoupdate.initialStandardMeterReading;
    double afterStandardMeterReading = emaptoupdate.afterStandardMeterReading;
    double standardMeterReading_A = emaptoupdate.standardMeterReading_A;

    return update(energyMeterApLocalDatasourceImpl)
        .replace(EnergyMeterApLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      EquipmentType: EquipmentType,
      lastUpdated: updateDate,
      initialTestMeterReading: initialTestMeterReading,
      afterTestMeterReading: afterTestMeterReading,
      testMeterReading_R: testMeterReading_R,
      initialStandardMeterReading: initialStandardMeterReading,
      afterStandardMeterReading: afterStandardMeterReading,
      standardMeterReading_A: standardMeterReading_A,
    ));
  }

/////////////////////////////////////////Energy Meter-Ap-END/////////////////////////////////

//---------------------------------------------------------------------------------------------------------------//
  /////////////////////////////////////////Energy Meter-Rp-START/////////////////////////////////

  //  Delete Energy Meter Rp by id
  Future<int> deleteEnergyMeterRpById(int id) {
    return (delete(energyMeterRpLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<EnergyMeterRpLocalData>> getEMRPEquipmentListwithAll() async {
    return await select(energyMeterRpLocalDatasourceImpl).get();
  }

  // Get Energy Meter Rp by id
  Future<EnergyMeterRpLocalData> getEnergyMeterRpLocalDataWithId(int id) {
    return (select(energyMeterRpLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //  Get Energy Meter Rp by trNo
  Future<List<EnergyMeterRpLocalData>> getEnergyMeterRpLocalDataWithTrNo(
      int trNo) {
    return (select(energyMeterRpLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get Energy Meter Rp by Serial No
  Future<List<EnergyMeterRpLocalData>> getEnergyMeterRpLocalDataWithSerialNo(
      String SerialNo) {
    return (select(energyMeterRpLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Create Energy Meter Rp

  Future<int> createEnergyMeterRp(EnergyMeterRpTestModel emrptolocal) {
    return into(energyMeterRpLocalDatasourceImpl)
        .insert(EnergyMeterRpLocalDatasourceImplCompanion.insert(
      serialNo: emrptolocal.serialNo,
      databaseID: emrptolocal.databaseID,
      trNo: emrptolocal.trNo,
      EquipmentType: emrptolocal.EquipmentType,
      // lastUpdated: emrptolocal.updateDate,
      initialTestMeterReading: emrptolocal.initialTestMeterReading,
      afterTestMeterReading: emrptolocal.afterTestMeterReading,
      testMeterReading_R: emrptolocal.testMeterReading_R,
      initialStandardMeterReading: emrptolocal.initialStandardMeterReading,
      afterStandardMeterReading: emrptolocal.afterStandardMeterReading,
      standardMeterReading_A: emrptolocal.standardMeterReading_A,
    ));
  }

  // Update Energy Meter Rp by id
  Future<bool> updateEnergyMeterRp(
      EnergyMeterRpTestModel emrptoupdate, int id) {
    String serialNo = emrptoupdate.serialNo;
    int databaseID = emrptoupdate.databaseID;
    int trNo = emrptoupdate.trNo;
    String EquipmentType = emrptoupdate.EquipmentType;
    DateTime updateDate = emrptoupdate.updateDate;
    double initialTestMeterReading = emrptoupdate.initialTestMeterReading;
    double afterTestMeterReading = emrptoupdate.afterTestMeterReading;
    double testMeterReading_R = emrptoupdate.testMeterReading_R;
    double initialStandardMeterReading =
        emrptoupdate.initialStandardMeterReading;
    double afterStandardMeterReading = emrptoupdate.afterStandardMeterReading;
    double standardMeterReading_A = emrptoupdate.standardMeterReading_A;

    return update(energyMeterRpLocalDatasourceImpl)
        .replace(EnergyMeterRpLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      EquipmentType: EquipmentType,
      lastUpdated: updateDate,
      initialTestMeterReading: initialTestMeterReading,
      afterTestMeterReading: afterTestMeterReading,
      testMeterReading_R: testMeterReading_R,
      initialStandardMeterReading: initialStandardMeterReading,
      afterStandardMeterReading: afterStandardMeterReading,
      standardMeterReading_A: standardMeterReading_A,
    ));
  }

/////////////////////////////////////////Energy Meter-Rp-END/////////////////////////////////

//---------------------------------------------------------------------------------------------------------------//
  /////////////////////////////////////////Energy Meter-Aprp-START/////////////////////////////////

  //  Delete Energy Meter Aprp by id
  Future<int> deleteEnergyMeterAprpById(int id) {
    return (delete(energyMeterAprpLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  // Get Energy Meter Aprp by id
  Future<EnergyMeterAprpLocalData> getEnergyMeterAprpLocalDataWithId(int id) {
    return (select(energyMeterAprpLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<EnergyMeterAprpLocalData>> getEMAPRPEquipmentListwithAll() async {
    return await select(energyMeterAprpLocalDatasourceImpl).get();
  }

  //  Get Energy Meter Aprp by trNo
  Future<List<EnergyMeterAprpLocalData>> getEnergyMeterAprpLocalDataWithTrNo(
      int trNo) {
    return (select(energyMeterAprpLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get Energy Meter Aprp by Serial No
  Future<List<EnergyMeterAprpLocalData>>
      getEnergyMeterAprpLocalDataWithSerialNo(String SerialNo) {
    return (select(energyMeterAprpLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Create Energy Meter Aprp

  Future<int> createEnergyMeterAprp(EnergyMeterAprpTestModel emaprptolocal) {
    return into(energyMeterAprpLocalDatasourceImpl)
        .insert(EnergyMeterAprpLocalDatasourceImplCompanion.insert(
      serialNo: emaprptolocal.serialNo,
      databaseID: emaprptolocal.databaseID,
      trNo: emaprptolocal.trNo,
      EquipmentType: emaprptolocal.EquipmentType,
      initialTestMeterReading: emaprptolocal.initialTestMeterReading,
      afterTestMeterReading: emaprptolocal.afterTestMeterReading,
      testMeterReading_R: emaprptolocal.testMeterReading_R,
      initialStandardMeterReading: emaprptolocal.initialStandardMeterReading,
      afterStandardMeterReading: emaprptolocal.afterStandardMeterReading,
      standardMeterReading_A: emaprptolocal.standardMeterReading_A,
    ));
  }

  // Update Energy Meter Aprp by id
  Future<bool> updateEnergyMeterAprp(
      EnergyMeterAprpTestModel emaprptoupdate, int id) {
    String serialNo = emaprptoupdate.serialNo;
    int databaseID = emaprptoupdate.databaseID;
    int trNo = emaprptoupdate.trNo;
    String EquipmentType = emaprptoupdate.EquipmentType;
    DateTime updateDate = emaprptoupdate.updateDate;
    double initialTestMeterReading = emaprptoupdate.initialTestMeterReading;
    double afterTestMeterReading = emaprptoupdate.afterTestMeterReading;
    double testMeterReading_R = emaprptoupdate.testMeterReading_R;
    double initialStandardMeterReading =
        emaprptoupdate.initialStandardMeterReading;
    double afterStandardMeterReading = emaprptoupdate.afterStandardMeterReading;
    double standardMeterReading_A = emaprptoupdate.standardMeterReading_A;

    return update(energyMeterAprpLocalDatasourceImpl)
        .replace(EnergyMeterAprpLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      EquipmentType: EquipmentType,
      lastUpdated: updateDate,
      initialTestMeterReading: initialTestMeterReading,
      afterTestMeterReading: afterTestMeterReading,
      testMeterReading_R: testMeterReading_R,
      initialStandardMeterReading: initialStandardMeterReading,
      afterStandardMeterReading: afterStandardMeterReading,
      standardMeterReading_A: standardMeterReading_A,
    ));
  }

/////////////////////////////////////////Energy Meter-Aprp-END/////////////////////////////////

/////////////////////////////////////////Current-Transformer-Starts/////////////////////////////////
  Future<int> createCT(CTModel cttolocal, DateTime dateOfTesting) {
    return into(cTLocalDatasourceImpl)
        .insert(CTLocalDatasourceImplCompanion.insert(
      WitnessedBy: cttolocal.WitnessedBy,
      databaseID: cttolocal.databaseID,
      designation: cttolocal.designation,
      etype: cttolocal.etype,
      location: cttolocal.location,
      make: cttolocal.make,
      noOfCores: cttolocal.noOfCores,
      noOfTaps: cttolocal.noOfTaps,
      pRatio: cttolocal.pRatio,
      panel: cttolocal.panel,
      ratedVoltage: cttolocal.ratedVoltage,
      sRatio: cttolocal.sRatio,
      serialNo_Bph: cttolocal.serialNo_Bph,
      serialNo_Rph: cttolocal.serialNo_Rph,
      serialNo_Yph: cttolocal.serialNo_Yph,
      testedBy: cttolocal.testedBy,
      trNo: cttolocal.trNo,
      verifiedBy: cttolocal.verifiedBy,
      yom: cttolocal.yom,
      dateOfTesting: Value(dateOfTesting),
      connectedTap: cttolocal.connectedTap,
      vk: cttolocal.vk,
    ));
  }

  Future<bool> updateCT(CTModel cttoupdate, int id) {
    int databaseID = cttoupdate.databaseID;
    String etype = cttoupdate.etype;
    int trNo = cttoupdate.trNo;
    String designation = cttoupdate.designation;
    String location = cttoupdate.location;
    String make = cttoupdate.make;
    String panel = cttoupdate.panel;
    String serialNo_Rph = cttoupdate.serialNo_Rph;
    String serialNo_Yph = cttoupdate.serialNo_Yph;
    String serialNo_Bph = cttoupdate.serialNo_Bph;
    int pRatio = cttoupdate.pRatio;
    int sRatio = cttoupdate.sRatio;
    int noOfCores = cttoupdate.noOfCores;
    int noOfTaps = cttoupdate.noOfTaps;
    int yom = cttoupdate.yom;
    DateTime dateOfTesting = cttoupdate.dateOfTesting;
    DateTime updateDate = cttoupdate.updateDate;
    String testedBy = cttoupdate.testedBy;
    String verifiedBy = cttoupdate.verifiedBy;
    String WitnessedBy = cttoupdate.WitnessedBy;
    int ratedVoltage = cttoupdate.ratedVoltage;
    String connectedTap = cttoupdate.connectedTap;
    double vk = cttoupdate.vk;

    return update(cTLocalDatasourceImpl).replace(CTLocalData(
      WitnessedBy: WitnessedBy,
      databaseID: databaseID,
      dateOfTesting: dateOfTesting,
      designation: designation,
      etype: etype,
      id: id,
      location: location,
      make: make,
      noOfCores: noOfCores,
      noOfTaps: noOfTaps,
      pRatio: pRatio,
      panel: panel,
      ratedVoltage: ratedVoltage,
      sRatio: sRatio,
      serialNo_Bph: serialNo_Bph,
      serialNo_Rph: serialNo_Rph,
      serialNo_Yph: serialNo_Yph,
      testedBy: testedBy,
      trNo: trNo,
      updateDate: updateDate,
      verifiedBy: verifiedBy,
      yom: yom,
      connectedTap: connectedTap,
      vk: vk,
    ));
  }

  Future<List<CTLocalData>> getCTLocalDatadourceImpleList() async {
    return await select(cTLocalDatasourceImpl).get();
  }

  Future<int> deleteCTById(int id) {
    return (delete(cTLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<CTLocalData>> getCTLocalDataWithtrNo(int trNo) {
    return (select(cTLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //getCTLocalDataWithSerialNo
  Future<List<CTLocalData>> getCTLocalDataWithSerialNo(String sn) {
    return (select(cTLocalDatasourceImpl)
          ..where((u) => u.serialNo_Bph.equals(sn)))
        .get();
  }

  Future<CTLocalData> getCTLocalDataWithId(int id) {
    return (select(cTLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

////////////////////////////////CT_core_LocalDatasource/////////////////////////
  Future<int> createCT_core(CT_core_Model ctcoretolocal) {
    return into(cTCoreLocalDatasourceImpl)
        .insert(CT_core_LocalDatasourceImplCompanion.insert(
      databaseID: ctcoretolocal.databaseID,
      burden: ctcoretolocal.burden,
      coreClass: ctcoretolocal.coreClass,
      coreNo: ctcoretolocal.coreNo,
      ctNo: ctcoretolocal.ctNo,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateCT_core(CT_core_Model ctcoretoupdate, int id) {
    int databaseID = ctcoretoupdate.databaseID;
    int burden = ctcoretoupdate.burden;
    String coreClass = ctcoretoupdate.coreClass;
    int coreNo = ctcoretoupdate.coreNo;
    int ctNo = ctcoretoupdate.ctNo;
    DateTime updateDate = ctcoretoupdate.updateDate;

    return update(cTCoreLocalDatasourceImpl).replace(CTcoreLocalData(
      id: id,
      databaseID: databaseID,
      burden: burden,
      coreClass: coreClass,
      coreNo: coreNo,
      ctNo: ctNo,
      updateDate: updateDate,
    ));
  }

  Future<List<CTcoreLocalData>> getctcoreEquipmentListwithAll() async {
    return await select(cTCoreLocalDatasourceImpl).get();
  }

  Future<int> deleteCT_coreById(int id) {
    return (delete(cTCoreLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<CTcoreLocalData> getCT_coreLocalDataWithId(int id) {
    return (select(cTCoreLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<CTcoreLocalData>> getCTcoreLocalDataWithctNoID(int ctNo) {
    return (select(cTCoreLocalDatasourceImpl)
          ..where((u) => u.ctNo.equals(ctNo)))
        .get();
  }

  ////////////////////////////////CTcoreIR_LocalDatasource/////////////////////////
  Future<int> createCTcoreIR(CTcoreIRModel ctirtolocal) {
    return into(cTcoreIRLocalDatasourceImpl)
        .insert(CTcoreIRLocalDatasourceImplCompanion.insert(
      trNo: ctirtolocal.trNo,
      serialNo: ctirtolocal.serialNo,
      equipmentUsed: ctirtolocal.equipmentUsed,
      databaseID: ctirtolocal.databaseID,
      peR: ctirtolocal.peR,
      peY: ctirtolocal.peY,
      peB: ctirtolocal.peB,
      pc1R: ctirtolocal.pc1R,
      pc2R: ctirtolocal.pc2R,
      pc3R: ctirtolocal.pc3R,
      pc4R: ctirtolocal.pc4R,
      pc5R: ctirtolocal.pc5R,
      pc1Y: ctirtolocal.pc1Y,
      pc2Y: ctirtolocal.pc2Y,
      pc3Y: ctirtolocal.pc3Y,
      pc4Y: ctirtolocal.pc4Y,
      pc5Y: ctirtolocal.pc5Y,
      pc1B: ctirtolocal.pc1B,
      pc2B: ctirtolocal.pc2B,
      pc3B: ctirtolocal.pc3B,
      pc4B: ctirtolocal.pc4B,
      pc5B: ctirtolocal.pc5B,
      c1eR: ctirtolocal.c1eR,
      c2eR: ctirtolocal.c2eR,
      c3eR: ctirtolocal.c3eR,
      c4eR: ctirtolocal.c4eR,
      c5eR: ctirtolocal.c5eR,
      c1eY: ctirtolocal.c1eY,
      c2eY: ctirtolocal.c2eY,
      c3eY: ctirtolocal.c3eY,
      c4eY: ctirtolocal.c4eY,
      c5eY: ctirtolocal.c5eY,
      c1eB: ctirtolocal.c1eB,
      c2eB: ctirtolocal.c2eB,
      c3eB: ctirtolocal.c3eB,
      c4eB: ctirtolocal.c4eB,
      c5eB: ctirtolocal.c5eB,
      c1c2R: ctirtolocal.c1c2R,
      c1c2Y: ctirtolocal.c1c2Y,
      c1c2B: ctirtolocal.c1c2B,
      c2c3R: ctirtolocal.c2c3R,
      c2c3Y: ctirtolocal.c2c3Y,
      c2c3B: ctirtolocal.c2c3B,
      c3c4R: ctirtolocal.c3c4R,
      c3c4Y: ctirtolocal.c3c4Y,
      c3c4B: ctirtolocal.c3c4B,
      c4c5R: ctirtolocal.c4c5R,
      c4c5Y: ctirtolocal.c4c5Y,
      c4c5B: ctirtolocal.c4c5B,
      clc1R: ctirtolocal.clc1R,
      clc1Y: ctirtolocal.clc1Y,
      clc1B: ctirtolocal.clc1B,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateCTcoreIR(CTcoreIRModel ctirtoupdate, int id) {
    int databaseID = ctirtoupdate.databaseID;
    int trNo = ctirtoupdate.trNo;
    String serialNo = ctirtoupdate.serialNo;
    String equipmentUsed = ctirtoupdate.equipmentUsed;
    double peR = ctirtoupdate.peR;
    double peY = ctirtoupdate.peY;
    double peB = ctirtoupdate.peB;
    double pc1R = ctirtoupdate.pc1R;
    double pc2R = ctirtoupdate.pc2R;
    double pc3R = ctirtoupdate.pc3R;
    double pc4R = ctirtoupdate.pc4R;
    double pc5R = ctirtoupdate.pc5R;
    double pc1Y = ctirtoupdate.pc1Y;
    double pc2Y = ctirtoupdate.pc2Y;
    double pc3Y = ctirtoupdate.pc3Y;
    double pc4Y = ctirtoupdate.pc4Y;
    double pc5Y = ctirtoupdate.pc5Y;
    double pc1B = ctirtoupdate.pc1B;
    double pc2B = ctirtoupdate.pc2B;
    double pc3B = ctirtoupdate.pc3B;
    double pc4B = ctirtoupdate.pc4B;
    double pc5B = ctirtoupdate.pc5B;
    double c1eR = ctirtoupdate.c1eR;
    double c2eR = ctirtoupdate.c2eR;
    double c3eR = ctirtoupdate.c3eR;
    double c4eR = ctirtoupdate.c4eR;
    double c5eR = ctirtoupdate.c5eR;
    double c1eY = ctirtoupdate.c1eY;
    double c2eY = ctirtoupdate.c2eY;
    double c3eY = ctirtoupdate.c3eY;
    double c4eY = ctirtoupdate.c4eY;
    double c5eY = ctirtoupdate.c5eY;
    double c1eB = ctirtoupdate.c1eB;
    double c2eB = ctirtoupdate.c2eB;
    double c3eB = ctirtoupdate.c3eB;
    double c4eB = ctirtoupdate.c4eB;
    double c5eB = ctirtoupdate.c5eB;
    double c1c2R = ctirtoupdate.c1c2R;
    double c1c2Y = ctirtoupdate.c1c2Y;
    double c1c2B = ctirtoupdate.c1c2B;
    double c2c3R = ctirtoupdate.c2c3R;
    double c2c3Y = ctirtoupdate.c2c3Y;
    double c2c3B = ctirtoupdate.c2c3B;
    double c3c4R = ctirtoupdate.c3c4R;
    double c3c4Y = ctirtoupdate.c3c4Y;
    double c3c4B = ctirtoupdate.c3c4B;
    double c4c5R = ctirtoupdate.c4c5R;
    double c4c5Y = ctirtoupdate.c4c5Y;
    double c4c5B = ctirtoupdate.c4c5B;
    double clc1R = ctirtoupdate.clc1R;
    double clc1Y = ctirtoupdate.clc1Y;
    double clc1B = ctirtoupdate.clc1B;
    DateTime updateDate = ctirtoupdate.updateDate;

    return update(cTcoreIRLocalDatasourceImpl).replace(CTcoreIRLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      equipmentUsed: equipmentUsed,
      peR: peR,
      peY: peY,
      peB: peB,
      pc1R: pc1R,
      pc2R: pc2R,
      pc3R: pc3R,
      pc4R: pc4R,
      pc5R: pc5R,
      pc1Y: pc1Y,
      pc2Y: pc2Y,
      pc3Y: pc3Y,
      pc4Y: pc4Y,
      pc5Y: pc5Y,
      pc1B: pc1B,
      pc2B: pc2B,
      pc3B: pc3B,
      pc4B: pc4B,
      pc5B: pc5B,
      c1eR: c1eR,
      c2eR: c2eR,
      c3eR: c3eR,
      c4eR: c4eR,
      c5eR: c5eR,
      c1eY: c1eY,
      c2eY: c2eY,
      c3eY: c3eY,
      c4eY: c4eY,
      c5eY: c5eY,
      c1eB: c1eB,
      c2eB: c2eB,
      c3eB: c3eB,
      c4eB: c4eB,
      c5eB: c5eB,
      c1c2R: c1c2R,
      c1c2Y: c1c2Y,
      c1c2B: c1c2B,
      c2c3R: c2c3R,
      c2c3Y: c2c3Y,
      c2c3B: c2c3B,
      c3c4R: c3c4R,
      c3c4Y: c3c4Y,
      c3c4B: c3c4B,
      c4c5R: c4c5R,
      c4c5Y: c4c5Y,
      c4c5B: c4c5B,
      clc1R: clc1R,
      clc1Y: clc1Y,
      clc1B: clc1B,
      updateDate: updateDate,
    ));
  }

  //Get AcbCrm Equipment List
  Future<List<CTcoreIRLocalData>> getCTirEquipmentListwithAll() async {
    return await select(cTcoreIRLocalDatasourceImpl).get();
  }

  Future<int> deleteCTcoreIRById(int id) {
    return (delete(cTcoreIRLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<CTcoreIRLocalData> getCTcoreIRLocalDataWithId(int id) {
    return (select(cTcoreIRLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //getCTcoreLocalDataWithSerialNo
  Future<List<CTcoreIRLocalData>> getCTcoreLocalDataWithSerialNo(
      String serialNo) {
    return (select(cTcoreIRLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(serialNo)))
        .get();
  }

  ////////////////////////////////CTcoreWR_LocalDatasource/////////////////////////
  Future<int> createCTcoreWR(CTcoreWRModel ctwrtolocal) {
    return into(cTcoreWRLocalDatasourceImpl)
        .insert(CTcoreWRLocalDatasourceImplCompanion.insert(
      trNo: ctwrtolocal.trNo,
      serialNo: ctwrtolocal.serialNo,
      equipmentUsed: ctwrtolocal.equipmentUsed,
      databaseID: ctwrtolocal.databaseID,
      R_1S1_1S2: ctwrtolocal.R_1S1_1S2,
      R_2S1_2S2: ctwrtolocal.R_2S1_2S2,
      R_3S1_3S2: ctwrtolocal.R_3S1_3S2,
      R_4S1_4S2: ctwrtolocal.R_4S1_4S2,
      R_5S1_5S2: ctwrtolocal.R_5S1_5S2,

      Y_1S1_1S2: ctwrtolocal.Y_1S1_1S2,
      Y_2S1_2S2: ctwrtolocal.Y_2S1_2S2,
      Y_3S1_3S2: ctwrtolocal.Y_3S1_3S2,
      Y_4S1_4S2: ctwrtolocal.Y_4S1_4S2,
      Y_5S1_5S2: ctwrtolocal.Y_5S1_5S2,

      B_1S1_1S2: ctwrtolocal.B_1S1_1S2,
      B_2S1_2S2: ctwrtolocal.B_2S1_2S2,
      B_3S1_3S2: ctwrtolocal.B_3S1_3S2,
      B_4S1_4S2: ctwrtolocal.B_4S1_4S2,
      B_5S1_5S2: ctwrtolocal.B_5S1_5S2,

      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateCTcoreWR(CTcoreWRModel ctwrtoupdate, int id) {
    int databaseID = ctwrtoupdate.databaseID;
    int trNo = ctwrtoupdate.trNo;
    String serialNo = ctwrtoupdate.serialNo;
    String equipmentUsed = ctwrtoupdate.equipmentUsed;
    double R_1S1_1S2 = ctwrtoupdate.R_1S1_1S2;
    double R_2S1_2S2 = ctwrtoupdate.R_2S1_2S2;
    double R_3S1_3S2 = ctwrtoupdate.R_3S1_3S2;
    double R_4S1_4S2 = ctwrtoupdate.R_4S1_4S2;
    double R_5S1_5S2 = ctwrtoupdate.R_5S1_5S2;

    double Y_1S1_1S2 = ctwrtoupdate.Y_1S1_1S2;
    double Y_2S1_2S2 = ctwrtoupdate.Y_2S1_2S2;
    double Y_3S1_3S2 = ctwrtoupdate.Y_3S1_3S2;
    double Y_4S1_4S2 = ctwrtoupdate.Y_4S1_4S2;
    double Y_5S1_5S2 = ctwrtoupdate.Y_5S1_5S2;

    double B_1S1_1S2 = ctwrtoupdate.B_1S1_1S2;
    double B_2S1_2S2 = ctwrtoupdate.B_2S1_2S2;
    double B_3S1_3S2 = ctwrtoupdate.B_3S1_3S2;
    double B_4S1_4S2 = ctwrtoupdate.B_4S1_4S2;
    double B_5S1_5S2 = ctwrtoupdate.B_5S1_5S2;
    DateTime updateDate = ctwrtoupdate.updateDate;

    return update(cTcoreWRLocalDatasourceImpl).replace(CTcoreWRLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      equipmentUsed: equipmentUsed,
      R_1S1_1S2: R_1S1_1S2,
      R_2S1_2S2: R_2S1_2S2,
      R_3S1_3S2: R_3S1_3S2,
      R_4S1_4S2: R_4S1_4S2,
      R_5S1_5S2: R_5S1_5S2,
      Y_1S1_1S2: Y_1S1_1S2,
      Y_2S1_2S2: Y_2S1_2S2,
      Y_3S1_3S2: Y_3S1_3S2,
      Y_4S1_4S2: Y_4S1_4S2,
      Y_5S1_5S2: Y_5S1_5S2,
      B_1S1_1S2: B_1S1_1S2,
      B_2S1_2S2: B_2S1_2S2,
      B_3S1_3S2: B_3S1_3S2,
      B_4S1_4S2: B_4S1_4S2,
      B_5S1_5S2: B_5S1_5S2,
      updateDate: updateDate,
    ));
  }

  Future<int> deleteCTcoreWRById(int id) {
    return (delete(cTcoreWRLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<CTcoreWRLocalData>> getCTwrEquipmentListwithAll() async {
    return await select(cTcoreWRLocalDatasourceImpl).get();
  }

  Future<CTcoreWRLocalData> getCTcoreWRLocalDataWithId(int id) {
    return (select(cTcoreWRLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //getCTcoreLocalDataWithSerialNo
  Future<List<CTcoreWRLocalData>> getCTcoreWRLocalDataWithSerialNo(
      String serialNo) {
    return (select(cTcoreWRLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(serialNo)))
        .get();
  }

  ////////////////////////////////CTcoreP_LocalDatasource/////////////////////////
  Future<int> createCTcoreP(CTcorePModel ctcoreptolocal) {
    return into(cTcorePLocalDatasourceImpl)
        .insert(CTcorePLocalDatasourceImplCompanion.insert(
      trNo: ctcoreptolocal.trNo,
      serialNo: ctcoreptolocal.serialNo,
      equipmentUsed: ctcoreptolocal.equipmentUsed,
      databaseID: ctcoreptolocal.databaseID,
      R_1S1_1S2: ctcoreptolocal.R_1S1_1S2,
      R_2S1_2S2: ctcoreptolocal.R_2S1_2S2,
      R_3S1_3S2: ctcoreptolocal.R_3S1_3S2,
      R_4S1_4S2: ctcoreptolocal.R_4S1_4S2,
      R_5S1_5S2: ctcoreptolocal.R_5S1_5S2,

      Y_1S1_1S2: ctcoreptolocal.Y_1S1_1S2,
      Y_2S1_2S2: ctcoreptolocal.Y_2S1_2S2,
      Y_3S1_3S2: ctcoreptolocal.Y_3S1_3S2,
      Y_4S1_4S2: ctcoreptolocal.Y_4S1_4S2,
      Y_5S1_5S2: ctcoreptolocal.Y_5S1_5S2,

      B_1S1_1S2: ctcoreptolocal.B_1S1_1S2,
      B_2S1_2S2: ctcoreptolocal.B_2S1_2S2,
      B_3S1_3S2: ctcoreptolocal.B_3S1_3S2,
      B_4S1_4S2: ctcoreptolocal.B_4S1_4S2,
      B_5S1_5S2: ctcoreptolocal.B_5S1_5S2,

      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateCTcoreP(CTcorePModel ctcoreptoupdate, int id) {
    int databaseID = ctcoreptoupdate.databaseID;
    int trNo = ctcoreptoupdate.trNo;
    String serialNo = ctcoreptoupdate.serialNo;
    String equipmentUsed = ctcoreptoupdate.equipmentUsed;
    String R_1S1_1S2 = ctcoreptoupdate.R_1S1_1S2;
    String R_2S1_2S2 = ctcoreptoupdate.R_2S1_2S2;
    String R_3S1_3S2 = ctcoreptoupdate.R_3S1_3S2;
    String R_4S1_4S2 = ctcoreptoupdate.R_4S1_4S2;
    String R_5S1_5S2 = ctcoreptoupdate.R_5S1_5S2;

    String Y_1S1_1S2 = ctcoreptoupdate.Y_1S1_1S2;
    String Y_2S1_2S2 = ctcoreptoupdate.Y_2S1_2S2;
    String Y_3S1_3S2 = ctcoreptoupdate.Y_3S1_3S2;
    String Y_4S1_4S2 = ctcoreptoupdate.Y_4S1_4S2;
    String Y_5S1_5S2 = ctcoreptoupdate.Y_5S1_5S2;

    String B_1S1_1S2 = ctcoreptoupdate.B_1S1_1S2;
    String B_2S1_2S2 = ctcoreptoupdate.B_2S1_2S2;
    String B_3S1_3S2 = ctcoreptoupdate.B_3S1_3S2;
    String B_4S1_4S2 = ctcoreptoupdate.B_4S1_4S2;
    String B_5S1_5S2 = ctcoreptoupdate.B_5S1_5S2;

    DateTime updateDate = ctcoreptoupdate.updateDate;

    return update(cTcorePLocalDatasourceImpl).replace(CTcorePLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      equipmentUsed: equipmentUsed,
      R_1S1_1S2: R_1S1_1S2,
      R_2S1_2S2: R_2S1_2S2,
      R_3S1_3S2: R_3S1_3S2,
      R_4S1_4S2: R_4S1_4S2,
      R_5S1_5S2: R_5S1_5S2,
      Y_1S1_1S2: Y_1S1_1S2,
      Y_2S1_2S2: Y_2S1_2S2,
      Y_3S1_3S2: Y_3S1_3S2,
      Y_4S1_4S2: Y_4S1_4S2,
      Y_5S1_5S2: Y_5S1_5S2,
      B_1S1_1S2: B_1S1_1S2,
      B_2S1_2S2: B_2S1_2S2,
      B_3S1_3S2: B_3S1_3S2,
      B_4S1_4S2: B_4S1_4S2,
      B_5S1_5S2: B_5S1_5S2,
      updateDate: updateDate,
    ));
  }

  Future<List<CTcorePLocalData>> getCTpEquipmentListwithAll() async {
    return await select(cTcorePLocalDatasourceImpl).get();
  }

  Future<int> deleteCTcorePById(int id) {
    return (delete(cTcorePLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<CTcorePLocalData> getCTcorePLocalDataWithId(int id) {
    return (select(cTcorePLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //getCTcoreLocalDataWithSerialNo
  Future<List<CTcorePLocalData>> getCTcorePLocalDataWithSerialNo(
      String serialNo) {
    return (select(cTcorePLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(serialNo)))
        .get();
  }

  ////////////////////////////////CTcoreR_LocalDatasource/////////////////////////
  Future<int> createCTcoreR(CTcoreRModel ctcorertolocal) {
    return into(cTcoreRLocalDatasourceImpl)
        .insert(CTcoreRLocalDatasourceImplCompanion.insert(
      trNo: ctcorertolocal.trNo,
      serialNo: ctcorertolocal.serialNo,
      equipmentUsed: ctcorertolocal.equipmentUsed,
      databaseID: ctcorertolocal.databaseID,
      R_1S1_1S2_200: ctcorertolocal.R_1S1_1S2_200,
      R_2S1_2S2_200: ctcorertolocal.R_2S1_2S2_200,
      R_3S1_3S2_200: ctcorertolocal.R_3S1_3S2_200,
      R_4S1_4S2_200: ctcorertolocal.R_4S1_4S2_200,
      R_5S1_5S2_200: ctcorertolocal.R_5S1_5S2_200,

      Y_1S1_1S2_200: ctcorertolocal.Y_1S1_1S2_200,
      Y_2S1_2S2_200: ctcorertolocal.Y_2S1_2S2_200,
      Y_3S1_3S2_200: ctcorertolocal.Y_3S1_3S2_200,
      Y_4S1_4S2_200: ctcorertolocal.Y_4S1_4S2_200,
      Y_5S1_5S2_200: ctcorertolocal.Y_5S1_5S2_200,

      B_1S1_1S2_200: ctcorertolocal.B_1S1_1S2_200,
      B_2S1_2S2_200: ctcorertolocal.B_2S1_2S2_200,
      B_3S1_3S2_200: ctcorertolocal.B_3S1_3S2_200,
      B_4S1_4S2_200: ctcorertolocal.B_4S1_4S2_200,
      B_5S1_5S2_200: ctcorertolocal.B_5S1_5S2_200,
      /////////////////////////////////////////////
      R_1S1_1S2_400: ctcorertolocal.R_1S1_1S2_400,
      R_2S1_2S2_400: ctcorertolocal.R_2S1_2S2_400,
      R_3S1_3S2_400: ctcorertolocal.R_3S1_3S2_400,
      R_4S1_4S2_400: ctcorertolocal.R_4S1_4S2_400,
      R_5S1_5S2_400: ctcorertolocal.R_5S1_5S2_400,

      Y_1S1_1S2_400: ctcorertolocal.Y_1S1_1S2_400,
      Y_2S1_2S2_400: ctcorertolocal.Y_2S1_2S2_400,
      Y_3S1_3S2_400: ctcorertolocal.Y_3S1_3S2_400,
      Y_4S1_4S2_400: ctcorertolocal.Y_4S1_4S2_400,
      Y_5S1_5S2_400: ctcorertolocal.Y_5S1_5S2_400,

      B_1S1_1S2_400: ctcorertolocal.B_1S1_1S2_400,
      B_2S1_2S2_400: ctcorertolocal.B_2S1_2S2_400,
      B_3S1_3S2_400: ctcorertolocal.B_3S1_3S2_400,
      B_4S1_4S2_400: ctcorertolocal.B_4S1_4S2_400,
      B_5S1_5S2_400: ctcorertolocal.B_5S1_5S2_400,
      ////////////////////////////////////////////
      R_1S1_1S2_600: ctcorertolocal.R_1S1_1S2_600,
      R_2S1_2S2_600: ctcorertolocal.R_2S1_2S2_600,
      R_3S1_3S2_600: ctcorertolocal.R_3S1_3S2_600,
      R_4S1_4S2_600: ctcorertolocal.R_4S1_4S2_600,
      R_5S1_5S2_600: ctcorertolocal.R_5S1_5S2_600,

      Y_1S1_1S2_600: ctcorertolocal.Y_1S1_1S2_600,
      Y_2S1_2S2_600: ctcorertolocal.Y_2S1_2S2_600,
      Y_3S1_3S2_600: ctcorertolocal.Y_3S1_3S2_600,
      Y_4S1_4S2_600: ctcorertolocal.Y_4S1_4S2_600,
      Y_5S1_5S2_600: ctcorertolocal.Y_5S1_5S2_600,

      B_1S1_1S2_600: ctcorertolocal.B_1S1_1S2_600,
      B_2S1_2S2_600: ctcorertolocal.B_2S1_2S2_600,
      B_3S1_3S2_600: ctcorertolocal.B_3S1_3S2_600,
      B_4S1_4S2_600: ctcorertolocal.B_4S1_4S2_600,
      B_5S1_5S2_600: ctcorertolocal.B_5S1_5S2_600,
      ////////////////////////////////////////////
      R_1S1_1S2_800: ctcorertolocal.R_1S1_1S2_800,
      R_2S1_2S2_800: ctcorertolocal.R_2S1_2S2_800,
      R_3S1_3S2_800: ctcorertolocal.R_3S1_3S2_800,
      R_4S1_4S2_800: ctcorertolocal.R_4S1_4S2_800,
      R_5S1_5S2_800: ctcorertolocal.R_5S1_5S2_800,

      Y_1S1_1S2_800: ctcorertolocal.Y_1S1_1S2_800,
      Y_2S1_2S2_800: ctcorertolocal.Y_2S1_2S2_800,
      Y_3S1_3S2_800: ctcorertolocal.Y_3S1_3S2_800,
      Y_4S1_4S2_800: ctcorertolocal.Y_4S1_4S2_800,
      Y_5S1_5S2_800: ctcorertolocal.Y_5S1_5S2_800,

      B_1S1_1S2_800: ctcorertolocal.B_1S1_1S2_800,
      B_2S1_2S2_800: ctcorertolocal.B_2S1_2S2_800,
      B_3S1_3S2_800: ctcorertolocal.B_3S1_3S2_800,
      B_4S1_4S2_800: ctcorertolocal.B_4S1_4S2_800,
      B_5S1_5S2_800: ctcorertolocal.B_5S1_5S2_800,

      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateCTcoreR(CTcoreRModel ctcorertoupdate, int id) {
    int databaseID = ctcorertoupdate.databaseID;
    int trNo = ctcorertoupdate.trNo;
    String serialNo = ctcorertoupdate.serialNo;
    String equipmentUsed = ctcorertoupdate.equipmentUsed;
    double R_1S1_1S2_200 = ctcorertoupdate.R_1S1_1S2_200;
    double R_2S1_2S2_200 = ctcorertoupdate.R_2S1_2S2_200;
    double R_3S1_3S2_200 = ctcorertoupdate.R_3S1_3S2_200;
    double R_4S1_4S2_200 = ctcorertoupdate.R_4S1_4S2_200;
    double R_5S1_5S2_200 = ctcorertoupdate.R_5S1_5S2_200;
    double Y_1S1_1S2_200 = ctcorertoupdate.Y_1S1_1S2_200;
    double Y_2S1_2S2_200 = ctcorertoupdate.Y_2S1_2S2_200;
    double Y_3S1_3S2_200 = ctcorertoupdate.Y_3S1_3S2_200;
    double Y_4S1_4S2_200 = ctcorertoupdate.Y_4S1_4S2_200;
    double Y_5S1_5S2_200 = ctcorertoupdate.Y_5S1_5S2_200;
    double B_1S1_1S2_200 = ctcorertoupdate.B_1S1_1S2_200;
    double B_2S1_2S2_200 = ctcorertoupdate.B_2S1_2S2_200;
    double B_3S1_3S2_200 = ctcorertoupdate.B_3S1_3S2_200;
    double B_4S1_4S2_200 = ctcorertoupdate.B_4S1_4S2_200;
    double B_5S1_5S2_200 = ctcorertoupdate.B_5S1_5S2_200;
    double R_1S1_1S2_400 = ctcorertoupdate.R_1S1_1S2_400;
    double R_2S1_2S2_400 = ctcorertoupdate.R_2S1_2S2_400;
    double R_3S1_3S2_400 = ctcorertoupdate.R_3S1_3S2_400;
    double R_4S1_4S2_400 = ctcorertoupdate.R_4S1_4S2_400;
    double R_5S1_5S2_400 = ctcorertoupdate.R_5S1_5S2_400;
    double Y_1S1_1S2_400 = ctcorertoupdate.Y_1S1_1S2_400;
    double Y_2S1_2S2_400 = ctcorertoupdate.Y_2S1_2S2_400;
    double Y_3S1_3S2_400 = ctcorertoupdate.Y_3S1_3S2_400;
    double Y_4S1_4S2_400 = ctcorertoupdate.Y_4S1_4S2_400;
    double Y_5S1_5S2_400 = ctcorertoupdate.Y_5S1_5S2_400;
    double B_1S1_1S2_400 = ctcorertoupdate.B_1S1_1S2_400;
    double B_2S1_2S2_400 = ctcorertoupdate.B_2S1_2S2_400;
    double B_3S1_3S2_400 = ctcorertoupdate.B_3S1_3S2_400;
    double B_4S1_4S2_400 = ctcorertoupdate.B_4S1_4S2_400;
    double B_5S1_5S2_400 = ctcorertoupdate.B_5S1_5S2_400;
    double R_1S1_1S2_600 = ctcorertoupdate.R_1S1_1S2_600;
    double R_2S1_2S2_600 = ctcorertoupdate.R_2S1_2S2_600;
    double R_3S1_3S2_600 = ctcorertoupdate.R_3S1_3S2_600;
    double R_4S1_4S2_600 = ctcorertoupdate.R_4S1_4S2_600;
    double R_5S1_5S2_600 = ctcorertoupdate.R_5S1_5S2_600;
    double Y_1S1_1S2_600 = ctcorertoupdate.Y_1S1_1S2_600;
    double Y_2S1_2S2_600 = ctcorertoupdate.Y_2S1_2S2_600;
    double Y_3S1_3S2_600 = ctcorertoupdate.Y_3S1_3S2_600;
    double Y_4S1_4S2_600 = ctcorertoupdate.Y_4S1_4S2_600;
    double Y_5S1_5S2_600 = ctcorertoupdate.Y_5S1_5S2_600;
    double B_1S1_1S2_600 = ctcorertoupdate.B_1S1_1S2_600;
    double B_2S1_2S2_600 = ctcorertoupdate.B_2S1_2S2_600;
    double B_3S1_3S2_600 = ctcorertoupdate.B_3S1_3S2_600;
    double B_4S1_4S2_600 = ctcorertoupdate.B_4S1_4S2_600;
    double B_5S1_5S2_600 = ctcorertoupdate.B_5S1_5S2_600;
    double R_1S1_1S2_800 = ctcorertoupdate.R_1S1_1S2_800;
    double R_2S1_2S2_800 = ctcorertoupdate.R_2S1_2S2_800;
    double R_3S1_3S2_800 = ctcorertoupdate.R_3S1_3S2_800;
    double R_4S1_4S2_800 = ctcorertoupdate.R_4S1_4S2_800;
    double R_5S1_5S2_800 = ctcorertoupdate.R_5S1_5S2_800;
    double Y_1S1_1S2_800 = ctcorertoupdate.Y_1S1_1S2_800;
    double Y_2S1_2S2_800 = ctcorertoupdate.Y_2S1_2S2_800;
    double Y_3S1_3S2_800 = ctcorertoupdate.Y_3S1_3S2_800;
    double Y_4S1_4S2_800 = ctcorertoupdate.Y_4S1_4S2_800;
    double Y_5S1_5S2_800 = ctcorertoupdate.Y_5S1_5S2_800;
    double B_1S1_1S2_800 = ctcorertoupdate.B_1S1_1S2_800;
    double B_2S1_2S2_800 = ctcorertoupdate.B_2S1_2S2_800;
    double B_3S1_3S2_800 = ctcorertoupdate.B_3S1_3S2_800;
    double B_4S1_4S2_800 = ctcorertoupdate.B_4S1_4S2_800;
    double B_5S1_5S2_800 = ctcorertoupdate.B_5S1_5S2_800;
    DateTime updateDate = ctcorertoupdate.updateDate;

    return update(cTcoreRLocalDatasourceImpl).replace(CTcoreRLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      equipmentUsed: equipmentUsed,
      R_1S1_1S2_200: R_1S1_1S2_200,
      R_2S1_2S2_200: R_2S1_2S2_200,
      R_3S1_3S2_200: R_3S1_3S2_200,
      R_4S1_4S2_200: R_4S1_4S2_200,
      R_5S1_5S2_200: R_5S1_5S2_200,
      Y_1S1_1S2_200: Y_1S1_1S2_200,
      Y_2S1_2S2_200: Y_2S1_2S2_200,
      Y_3S1_3S2_200: Y_3S1_3S2_200,
      Y_4S1_4S2_200: Y_4S1_4S2_200,
      Y_5S1_5S2_200: Y_5S1_5S2_200,
      B_1S1_1S2_200: B_1S1_1S2_200,
      B_2S1_2S2_200: B_2S1_2S2_200,
      B_3S1_3S2_200: B_3S1_3S2_200,
      B_4S1_4S2_200: B_4S1_4S2_200,
      B_5S1_5S2_200: B_5S1_5S2_200,
      R_1S1_1S2_400: R_1S1_1S2_400,
      R_2S1_2S2_400: R_2S1_2S2_400,
      R_3S1_3S2_400: R_3S1_3S2_400,
      R_4S1_4S2_400: R_4S1_4S2_400,
      R_5S1_5S2_400: R_5S1_5S2_400,
      Y_1S1_1S2_400: Y_1S1_1S2_400,
      Y_2S1_2S2_400: Y_2S1_2S2_400,
      Y_3S1_3S2_400: Y_3S1_3S2_400,
      Y_4S1_4S2_400: Y_4S1_4S2_400,
      Y_5S1_5S2_400: Y_5S1_5S2_400,
      B_1S1_1S2_400: B_1S1_1S2_400,
      B_2S1_2S2_400: B_2S1_2S2_400,
      B_3S1_3S2_400: B_3S1_3S2_400,
      B_4S1_4S2_400: B_4S1_4S2_400,
      B_5S1_5S2_400: B_5S1_5S2_400,
      R_1S1_1S2_600: R_1S1_1S2_600,
      R_2S1_2S2_600: R_2S1_2S2_600,
      R_3S1_3S2_600: R_3S1_3S2_600,
      R_4S1_4S2_600: R_4S1_4S2_600,
      R_5S1_5S2_600: R_5S1_5S2_600,
      Y_1S1_1S2_600: Y_1S1_1S2_600,
      Y_2S1_2S2_600: Y_2S1_2S2_600,
      Y_3S1_3S2_600: Y_3S1_3S2_600,
      Y_4S1_4S2_600: Y_4S1_4S2_600,
      Y_5S1_5S2_600: Y_5S1_5S2_600,
      B_1S1_1S2_600: B_1S1_1S2_600,
      B_2S1_2S2_600: B_2S1_2S2_600,
      B_3S1_3S2_600: B_3S1_3S2_600,
      B_4S1_4S2_600: B_4S1_4S2_600,
      B_5S1_5S2_600: B_5S1_5S2_600,
      R_1S1_1S2_800: R_1S1_1S2_800,
      R_2S1_2S2_800: R_2S1_2S2_800,
      R_3S1_3S2_800: R_3S1_3S2_800,
      R_4S1_4S2_800: R_4S1_4S2_800,
      R_5S1_5S2_800: R_5S1_5S2_800,
      Y_1S1_1S2_800: Y_1S1_1S2_800,
      Y_2S1_2S2_800: Y_2S1_2S2_800,
      Y_3S1_3S2_800: Y_3S1_3S2_800,
      Y_4S1_4S2_800: Y_4S1_4S2_800,
      Y_5S1_5S2_800: Y_5S1_5S2_800,
      B_1S1_1S2_800: B_1S1_1S2_800,
      B_2S1_2S2_800: B_2S1_2S2_800,
      B_3S1_3S2_800: B_3S1_3S2_800,
      B_4S1_4S2_800: B_4S1_4S2_800,
      B_5S1_5S2_800: B_5S1_5S2_800,
      updateDate: updateDate,
    ));
  }

  Future<List<CTcoreRLocalData>> getCTcoreREquipmentListwithAll() async {
    return await select(cTcoreRLocalDatasourceImpl).get();
  }

  Future<int> deleteCTcoreRById(int id) {
    return (delete(cTcoreRLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<CTcoreRLocalData> getCTcoreRLocalDataWithId(int id) {
    return (select(cTcoreRLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<CTcoreRLocalData>> getCTcoreRLocalDataWithSerialNo(
      String serialNo) {
    return (select(cTcoreRLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(serialNo)))
        .get();
  }

  ////////////////////////////////CTcoreP_LocalDatasource/////////////////////////
  Future<int> createCTcoreKVP(CTcoreKVPModel ctkvptolocal) {
    return into(cTcoreKVPLocalDatasourceImpl)
        .insert(CTcoreKVPLocalDatasourceImplCompanion.insert(
      trNo: ctkvptolocal.trNo,
      serialNo: ctkvptolocal.serialNo,
      equipmentUsed: ctkvptolocal.equipmentUsed,
      databaseID: ctkvptolocal.databaseID,
      R_35: ctkvptolocal.R_35,
      R_70: ctkvptolocal.R_70,
      R_105: ctkvptolocal.R_105,
      R_140: ctkvptolocal.R_140,
      R_175: ctkvptolocal.R_175,
      R_210: ctkvptolocal.R_210,
      R_245: ctkvptolocal.R_245,
      R_280: ctkvptolocal.R_280,
      R_315: ctkvptolocal.R_315,
      R_350: ctkvptolocal.R_350,
      R_385: ctkvptolocal.R_385,
      Y_35: ctkvptolocal.Y_35,
      Y_70: ctkvptolocal.Y_70,
      Y_105: ctkvptolocal.Y_105,
      Y_140: ctkvptolocal.Y_140,
      Y_175: ctkvptolocal.Y_175,
      Y_210: ctkvptolocal.Y_210,
      Y_245: ctkvptolocal.Y_245,
      Y_280: ctkvptolocal.Y_280,
      Y_315: ctkvptolocal.Y_315,
      Y_350: ctkvptolocal.Y_350,
      Y_385: ctkvptolocal.Y_385,
      B_35: ctkvptolocal.B_35,
      B_70: ctkvptolocal.B_70,
      B_105: ctkvptolocal.B_105,
      B_140: ctkvptolocal.B_140,
      B_175: ctkvptolocal.B_175,
      B_210: ctkvptolocal.B_210,
      B_245: ctkvptolocal.B_245,
      B_280: ctkvptolocal.B_280,
      B_315: ctkvptolocal.B_315,
      B_350: ctkvptolocal.B_350,
      B_385: ctkvptolocal.B_385,

      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateCTcoreKVP(CTcoreKVPModel ctkvptoupdate, int id) {
    int databaseID = ctkvptoupdate.databaseID;
    int trNo = ctkvptoupdate.trNo;
    String serialNo = ctkvptoupdate.serialNo;
    String equipmentUsed = ctkvptoupdate.equipmentUsed;
    double R_35 = ctkvptoupdate.R_35;
    double R_70 = ctkvptoupdate.R_70;
    double R_105 = ctkvptoupdate.R_105;
    double R_140 = ctkvptoupdate.R_140;
    double R_175 = ctkvptoupdate.R_175;
    double R_210 = ctkvptoupdate.R_210;
    double R_245 = ctkvptoupdate.R_245;
    double R_280 = ctkvptoupdate.R_280;
    double R_315 = ctkvptoupdate.R_315;
    double R_350 = ctkvptoupdate.R_350;
    double R_385 = ctkvptoupdate.R_385;
    double Y_35 = ctkvptoupdate.Y_35;
    double Y_70 = ctkvptoupdate.Y_70;
    double Y_105 = ctkvptoupdate.Y_105;
    double Y_140 = ctkvptoupdate.Y_140;
    double Y_175 = ctkvptoupdate.Y_175;
    double Y_210 = ctkvptoupdate.Y_210;
    double Y_245 = ctkvptoupdate.Y_245;
    double Y_280 = ctkvptoupdate.Y_280;
    double Y_315 = ctkvptoupdate.Y_315;
    double Y_350 = ctkvptoupdate.Y_350;
    double Y_385 = ctkvptoupdate.Y_385;
    double B_35 = ctkvptoupdate.B_35;
    double B_70 = ctkvptoupdate.B_70;
    double B_105 = ctkvptoupdate.B_105;
    double B_140 = ctkvptoupdate.B_140;
    double B_175 = ctkvptoupdate.B_175;
    double B_210 = ctkvptoupdate.B_210;
    double B_245 = ctkvptoupdate.B_245;
    double B_280 = ctkvptoupdate.B_280;
    double B_315 = ctkvptoupdate.B_315;
    double B_350 = ctkvptoupdate.B_350;
    double B_385 = ctkvptoupdate.B_385;
    DateTime updateDate = ctkvptoupdate.updateDate;

    return update(cTcoreKVPLocalDatasourceImpl).replace(CTcoreKVPLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      equipmentUsed: equipmentUsed,
      R_35: R_35,
      R_70: R_70,
      R_105: R_105,
      R_140: R_140,
      R_175: R_175,
      R_210: R_210,
      R_245: R_245,
      R_280: R_280,
      R_315: R_315,
      R_350: R_350,
      R_385: R_385,
      Y_35: Y_35,
      Y_70: Y_70,
      Y_105: Y_105,
      Y_140: Y_140,
      Y_175: Y_175,
      Y_210: Y_210,
      Y_245: Y_245,
      Y_280: Y_280,
      Y_315: Y_315,
      Y_350: Y_350,
      Y_385: Y_385,
      B_35: B_35,
      B_70: B_70,
      B_105: B_105,
      B_140: B_140,
      B_175: B_175,
      B_210: B_210,
      B_245: B_245,
      B_280: B_280,
      B_315: B_315,
      B_350: B_350,
      B_385: B_385,
      updateDate: updateDate,
    ));
  }

  Future<int> deleteCTcoreKVPById(int id) {
    return (delete(cTcoreKVPLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<CTcoreKVPLocalData> getCTcoreKVPLocalDataWithId(int id) {
    return (select(cTcoreKVPLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<CTcoreKVPLocalData>> getCTkvpEquipmentListwithAll() async {
    return await select(cTcoreKVPLocalDatasourceImpl).get();
  }

  //getCTcoreLocalDataWithSerialNo
  Future<List<CTcoreKVPLocalData>> getCTcoreKVPLocalDataWithSerialNo(
      String serialNo) {
    return (select(cTcoreKVPLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(serialNo)))
        .get();
  }

  ////////////////////////////////CT_tap_LocalDatasource/////////////////////////
  Future<int> createCT_tap(CT_tap_Model CT_taptoLocal) {
    return into(cTTapLocalDatasourceImpl)
        .insert(CT_tap_LocalDatasourceImplCompanion.insert(
      databaseID: CT_taptoLocal.databaseID,
      tapName: CT_taptoLocal.tapName,
      ratio: CT_taptoLocal.ratio,
      leakageCurrent: CT_taptoLocal.leakageCurrent,
      kneePointVoltage: CT_taptoLocal.kneePointVoltage,
      coreRef: CT_taptoLocal.coreRef,
    ));
  }

  Future<bool> updateCT_tap(CT_tap_Model ct_tap_update, int id) {
    int databaseID = ct_tap_update.databaseID;
    String tapName = ct_tap_update.tapName;
    int ratio = ct_tap_update.ratio;
    int leakageCurrent = ct_tap_update.leakageCurrent;
    int kneePointVoltage = ct_tap_update.kneePointVoltage;
    int coreRef = ct_tap_update.coreRef;

    return update(cTTapLocalDatasourceImpl).replace(CTtapLocalData(
      id: id,
      databaseID: databaseID,
      tapName: tapName,
      ratio: ratio,
      leakageCurrent: leakageCurrent,
      kneePointVoltage: kneePointVoltage,
      coreRef: coreRef,
    ));
  }

  Future<int> deleteCT_tapById(int id) {
    return (delete(cTTapLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<CTtapLocalData> getCT_tapLocalDataWithId(int id) {
    return (select(cTTapLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<CTtapLocalData>> getCTtapLocalDataWithctNoID(int ctNo) {
    return (select(cTTapLocalDatasourceImpl)
          ..where((u) => u.coreRef.equals(ctNo)))
        .get();
  }

  //////////////////////////////////POWER-TRANSFORMER//////////////////////////////////////
  Future<int> createPT(PTModel pttolocal, DateTime dateOfTesting) {
    return into(pTLocalDatasourceImpl)
        .insert(PTLocalDatasourceImplCompanion.insert(
      WitnessedBy: pttolocal.WitnessedBy,
      databaseID: pttolocal.databaseID,
      designation: pttolocal.designation,
      etype: pttolocal.etype,
      location: pttolocal.location,
      make: pttolocal.make,
      noOfCores: pttolocal.noOfCores,
      pRatio: pttolocal.pRatio,
      panel: pttolocal.panel,
      ratedVoltage: pttolocal.ratedVoltage,
      sRatio: pttolocal.sRatio,
      serialNo_Bph: pttolocal.serialNo_Bph,
      serialNo_Rph: pttolocal.serialNo_Rph,
      serialNo_Yph: pttolocal.serialNo_Yph,
      testedBy: pttolocal.testedBy,
      trNo: pttolocal.trNo,
      verifiedBy: pttolocal.verifiedBy,
      yom: pttolocal.yom,
      dateOfTesting: Value(dateOfTesting),
    ));
  }

  Future<bool> updatePT(PTModel pttoupdate, int id) {
    int databaseID = pttoupdate.databaseID;
    String etype = pttoupdate.etype;
    int trNo = pttoupdate.trNo;
    String designation = pttoupdate.designation;
    String location = pttoupdate.location;
    String make = pttoupdate.make;
    String panel = pttoupdate.panel;
    String serialNo_Rph = pttoupdate.serialNo_Rph;
    String serialNo_Yph = pttoupdate.serialNo_Yph;
    String serialNo_Bph = pttoupdate.serialNo_Bph;
    int pRatio = pttoupdate.pRatio;
    int sRatio = pttoupdate.sRatio;
    int noOfCores = pttoupdate.noOfCores;
    int yom = pttoupdate.yom;
    DateTime dateOfTesting = pttoupdate.dateOfTesting;
    DateTime updateDate = pttoupdate.updateDate;
    String testedBy = pttoupdate.testedBy;
    String verifiedBy = pttoupdate.verifiedBy;
    String WitnessedBy = pttoupdate.WitnessedBy;
    int ratedVoltage = pttoupdate.ratedVoltage;

    return update(pTLocalDatasourceImpl).replace(PTLocalData(
      WitnessedBy: WitnessedBy,
      databaseID: databaseID,
      dateOfTesting: dateOfTesting,
      designation: designation,
      etype: etype,
      id: id,
      location: location,
      make: make,
      noOfCores: noOfCores,
      pRatio: pRatio,
      panel: panel,
      ratedVoltage: ratedVoltage,
      sRatio: sRatio,
      serialNo_Bph: serialNo_Bph,
      serialNo_Rph: serialNo_Rph,
      serialNo_Yph: serialNo_Yph,
      testedBy: testedBy,
      trNo: trNo,
      updateDate: updateDate,
      verifiedBy: verifiedBy,
      yom: yom,
    ));
  }

  Future<List<PTLocalData>> getPTLocalDataList() async {
    return await select(pTLocalDatasourceImpl).get();
  }

  Future<int> deletePTById(int id) {
    return (delete(pTLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<PTLocalData>> getPTLocalDatasourceImplList() async {
    return await select(pTLocalDatasourceImpl).get();
  }

  Future<List<PTLocalData>> getPTLocalDataWithtrNo(int trNo) {
    return (select(pTLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //getCTLocalDataWithSerialNo
  Future<List<PTLocalData>> getPTLocalDataWithSerialNo(String sn) {
    return (select(pTLocalDatasourceImpl)
          ..where((u) => u.serialNo_Bph.equals(sn)))
        .get();
  }

  Future<PTLocalData> getPTLocalDataWithId(int id) {
    return (select(pTLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  ////////////////////////////////PT_core_LocalDatasource/////////////////////////
  Future<int> createPT_core(PT_core_Model ptcoretolocal) {
    return into(pTCoreLocalDatasourceImpl)
        .insert(PT_core_LocalDatasourceImplCompanion.insert(
      databaseID: ptcoretolocal.databaseID,
      burden: ptcoretolocal.burden,
      coreName: ptcoretolocal.coreName,
      ratio: ptcoretolocal.ratio,
      coreClass: ptcoretolocal.coreClass,
      coreNo: ptcoretolocal.coreNo,
      ptNo: ptcoretolocal.ptNo,
      // updateDate: PT_coretoLocal.updateDate,
    ));
  }

  Future<bool> updatePT_core(PT_core_Model ptcoretoupdate, int id) {
    int databaseID = ptcoretoupdate.databaseID;
    int burden = ptcoretoupdate.burden;
    String coreName = ptcoretoupdate.coreName;
    int ratio = ptcoretoupdate.ratio;
    String coreClass = ptcoretoupdate.coreClass;
    int coreNo = ptcoretoupdate.coreNo;
    int ptNo = ptcoretoupdate.ptNo;
    DateTime updateDate = ptcoretoupdate.updateDate;

    return update(pTCoreLocalDatasourceImpl).replace(PTcoreLocalData(
      id: id,
      databaseID: databaseID,
      burden: burden,
      coreName: coreName,
      ratio: ratio,
      coreClass: coreClass,
      coreNo: coreNo,
      ptNo: ptNo,
      updateDate: updateDate,
    ));
  }

  Future<List<PTcoreLocalData>> getPTcoreEquipmentListwithAll() async {
    return await select(pTCoreLocalDatasourceImpl).get();
  }

  Future<int> deletePT_coreById(int id) {
    return (delete(pTCoreLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<PTcoreLocalData> getPT_coreLocalDataWithId(int id) {
    return (select(pTCoreLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<PTcoreLocalData>> getPTcoreLocalDataWithptNoID(int ptNo) {
    return (select(pTCoreLocalDatasourceImpl)
          ..where((u) => u.ptNo.equals(ptNo)))
        .get();
  }

//---------------------------------------------------------------------------------------------------------------//
//////////////////////////////////////Isolator-LOCAL-DATA-START////////////////////////////
  Future<int> createIso(IsoModel isotolocal, DateTime dateOfTesting) {
    return into(isoLocalDatasourceImpl)
        .insert(IsoLocalDatasourceImplCompanion.insert(
      databaseID: isotolocal.databaseID,
      etype: isotolocal.etype,
      designation: isotolocal.designation,
      location: isotolocal.location,
      rating: isotolocal.rating,
      make: isotolocal.make,
      EquipmentType: isotolocal.equipType,
      serialNo: isotolocal.serialNo,
      yom: isotolocal.yom,
      trNo: isotolocal.trNo,
      TestedBy: isotolocal.TestedBy,
      VerifiedBy: isotolocal.VerifiedBy,
      WitnessedBy: isotolocal.WitnessedBy,
      dateOfTesting: Value(dateOfTesting),
    ));
  }

  Future<List<IsoLocalData>> getIsoLocalDataList() async {
    return await select(isoLocalDatasourceImpl).get();
  }

  Future<bool> updateIso(IsoModel isotoupdate, int id) {
    int databaseID = isotoupdate.databaseID;
    String etype = isotoupdate.etype;
    String designation = isotoupdate.designation;
    String location = isotoupdate.location;
    String rating = isotoupdate.rating;
    String serialNo = isotoupdate.serialNo;
    String make = isotoupdate.make;
    String equipType = isotoupdate.equipType;
    int yom = isotoupdate.yom;
    DateTime dateOfTesting = isotoupdate.dateOfTesting;
    int trNo = isotoupdate.trNo;
    String TestedBy = isotoupdate.TestedBy;
    String VerifiedBy = isotoupdate.VerifiedBy;
    String WitnessedBy = isotoupdate.WitnessedBy;
    DateTime lastUpdated = isotoupdate.updateDate;

    return update(isoLocalDatasourceImpl).replace(IsoLocalData(
      etype: etype,
      id: id,
      databaseID: databaseID,
      designation: designation,
      location: location,
      rating: rating,
      make: make,
      EquipmentType: equipType,
      serialNo: serialNo,
      yom: yom,
      trNo: trNo,
      dateOfTesting: dateOfTesting,
      TestedBy: TestedBy,
      VerifiedBy: VerifiedBy,
      WitnessedBy: WitnessedBy,
      lastUpdated: lastUpdated,
    ));
  }

  Future<int> deleteIsoById(int id) {
    return (delete(isoLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<IsoLocalData>> getIsoLocalDatasourceImplList() async {
    return await select(isoLocalDatasourceImpl).get();
  }

  Future<List<IsoLocalData>> getIsoLocalDataWithtrNo(int trNo) {
    return (select(isoLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<IsoLocalData> getIsoLocalDataWithId(int id) {
    return (select(isoLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }
  //////////////////////////////////////ISO-LOCAL-DATA-END////////////////////////////

//---------------------------------------------------------------------------------------------------------------//
  //////////////////////////////////////ISo-IR-START////////////////////////////

  //Get ISOIr by Serial No
  Future<List<IsoIrLocalData>> getIsoIrLocalDataWithSerialNo(String SerialNo) {
    return (select(isoIrLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Get ISoIr by id
  Future<IsoIrLocalData> getIsoIrLocalDataWithId(int id) {
    return (select(isoIrLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get ISoIr by trNo
  Future<List<IsoIrLocalData>> getIsoIrLocalDataWithTrNo(int trNo) {
    return (select(isoIrLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get IsoIr Equipment List
  Future<List<IsoIrLocalData>> getIsoIrEquipmentList() async {
    return await select(isoIrLocalDatasourceImpl).get();
  }

  // Create IsoIr and return id

  Future<int> createIsoIr(IsoIrTestModel isoirtolocal) {
    return into(isoIrLocalDatasourceImpl)
        .insert(IsoIrLocalDatasourceImplCompanion.insert(
      rr: isoirtolocal.rr,
      yy: isoirtolocal.yy,
      bb: isoirtolocal.bb,
      re: isoirtolocal.re,
      ye: isoirtolocal.ye,
      be: isoirtolocal.be,
      ry: isoirtolocal.ry,
      yb: isoirtolocal.yb,
      br: isoirtolocal.br,
      serialNo: isoirtolocal.serialNo,
      trNo: isoirtolocal.trNo,
      databaseID: isoirtolocal.databaseID,
      EquipmentType: isoirtolocal.EquipmentType,
    ));
  }

  //TODO: Update IsoIr by id
  Future<bool> updateIsoIr(IsoIrTestModel isoirtoupdate, int id) {
    String serialNo = isoirtoupdate.serialNo;
    int trNo = isoirtoupdate.trNo;
    int databaseID = isoirtoupdate.databaseID;
    String EquipmentType = isoirtoupdate.EquipmentType;
    double rr = isoirtoupdate.rr;
    double yy = isoirtoupdate.yy;
    double bb = isoirtoupdate.bb;
    double re = isoirtoupdate.re;
    double ye = isoirtoupdate.ye;
    double be = isoirtoupdate.be;
    double ry = isoirtoupdate.ry;
    double yb = isoirtoupdate.yb;
    double br = isoirtoupdate.br;
    DateTime lastUpdated = isoirtoupdate.lastUpdated;

    return update(isoIrLocalDatasourceImpl).replace(IsoIrLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      rr: rr,
      yy: yy,
      bb: bb,
      re: re,
      ye: ye,
      be: be,
      ry: ry,
      yb: yb,
      br: br,
      EquipmentType: EquipmentType,
      lastUpdated: lastUpdated,
    ));
  }

  //Delete IsoIr by id
  Future<int> deleteIsoIrById(int id) {
    return (delete(isoIrLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////ISO-IR-END/////////////////////////////////
//---------------------------------------------------------------------------------------------------------------//
  //////////////////////////////////////ISo-CR-START////////////////////////////

  //Get ISOCr by Serial No
  Future<List<IsoCrLocalData>> getIsoCrLocalDataWithSerialNo(String SerialNo) {
    return (select(isoCrLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Get ISoCr by id
  Future<IsoCrLocalData> getIsoCrLocalDataWithId(int id) {
    return (select(isoCrLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get ISoCr by trNo
  Future<List<IsoCrLocalData>> getIsoCrLocalDataWithTrNo(int trNo) {
    return (select(isoCrLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get IsoCr Equipment List
  Future<List<IsoCrLocalData>> getIsoCrEquipmentList() async {
    return await select(isoCrLocalDatasourceImpl).get();
  }

  // Create IsoCr and return id

  Future<int> createIsoCr(IsoCrTestModel isocrtolocal) {
    return into(isoCrLocalDatasourceImpl)
        .insert(IsoCrLocalDatasourceImplCompanion.insert(
      rr: isocrtolocal.rr,
      yy: isocrtolocal.yy,
      bb: isocrtolocal.bb,
      serialNo: isocrtolocal.serialNo,
      trNo: isocrtolocal.trNo,
      databaseID: isocrtolocal.databaseID,
      EquipmentType: isocrtolocal.EquipmentType,
    ));
  }

  //TODO: Update IsoCr by id
  Future<bool> updateIsoCr(IsoCrTestModel isocrtoupdate, int id) {
    String serialNo = isocrtoupdate.serialNo;
    int trNo = isocrtoupdate.trNo;
    int databaseID = isocrtoupdate.databaseID;
    String EquipmentType = isocrtoupdate.EquipmentType;
    double rr = isocrtoupdate.rr;
    double yy = isocrtoupdate.yy;
    double bb = isocrtoupdate.bb;
    DateTime lastUpdated = isocrtoupdate.lastUpdated;

    return update(isoCrLocalDatasourceImpl).replace(IsoCrLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      rr: rr,
      yy: yy,
      bb: bb,
      EquipmentType: EquipmentType,
      lastUpdated: lastUpdated,
    ));
  }

  //Delete IsoCr by id
  Future<int> deleteIsoCrById(int id) {
    return (delete(isoCrLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////ISO-CR-END/////////////////////////////////

//---------------------------------------------------------------------------------------------------------------//
//////////////////////////////////////Lightning Arrester-LOCAL-DATA-START////////////////////////////
  Future<int> createLa(LaModel latolocal, DateTime dateOfTesting) {
    return into(laLocalDatasourceImpl)
        .insert(LaLocalDatasourceImplCompanion.insert(
      databaseID: latolocal.databaseID,
      etype: latolocal.etype,
      designation: latolocal.designation,
      location: latolocal.location,
      rating: latolocal.rating,
      make: latolocal.make,
      EquipmentType: latolocal.equipType,
      serialNo: latolocal.serialNo,
      yom: latolocal.yom,
      trNo: latolocal.trNo,
      TestedBy: latolocal.TestedBy,
      VerifiedBy: latolocal.VerifiedBy,
      WitnessedBy: latolocal.WitnessedBy,
      dateOfTesting: Value(dateOfTesting),
    ));
  }

  Future<List<LaLocalData>> getLaLocalDataList() async {
    return await select(laLocalDatasourceImpl).get();
  }

  Future<bool> updateLa(LaModel latoupdate, int id) {
    int databaseID = latoupdate.databaseID;
    String etype = latoupdate.etype;
    String designation = latoupdate.designation;
    String location = latoupdate.location;
    String rating = latoupdate.rating;
    String serialNo = latoupdate.serialNo;
    String make = latoupdate.make;
    String equipType = latoupdate.equipType;
    int yom = latoupdate.yom;
    DateTime dateOfTesting = latoupdate.dateOfTesting;
    int trNo = latoupdate.trNo;
    String TestedBy = latoupdate.TestedBy;
    String VerifiedBy = latoupdate.VerifiedBy;
    String WitnessedBy = latoupdate.WitnessedBy;
    DateTime lastUpdated = latoupdate.updateDate;

    return update(laLocalDatasourceImpl).replace(LaLocalData(
      etype: etype,
      id: id,
      databaseID: databaseID,
      designation: designation,
      location: location,
      rating: rating,
      make: make,
      EquipmentType: equipType,
      serialNo: serialNo,
      yom: yom,
      trNo: trNo,
      dateOfTesting: dateOfTesting,
      TestedBy: TestedBy,
      VerifiedBy: VerifiedBy,
      WitnessedBy: WitnessedBy,
      lastUpdated: lastUpdated,
    ));
  }

  Future<int> deleteLaById(int id) {
    return (delete(laLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<LaLocalData>> getLaLocalDatasourceImplList() async {
    return await select(laLocalDatasourceImpl).get();
  }

  Future<List<LaLocalData>> getLaLocalDataWithtrNo(int trNo) {
    return (select(laLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<LaLocalData> getLaLocalDataWithId(int id) {
    return (select(laLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }
  //////////////////////////////////////La-LOCAL-DATA-END////////////////////////////

//---------------------------------------------------------------------------------------------------------------//
  //////////////////////////////////////Lightning arrester-IR-START////////////////////////////

  //Get LaIr by Serial No
  Future<List<LaIrLocalData>> getLaIrLocalDataWithSerialNo(String SerialNo) {
    return (select(laIrLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Get LaIr by id
  Future<LaIrLocalData> getLaIrLocalDataWithId(int id) {
    return (select(laIrLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get LaIr by trNo
  Future<List<LaIrLocalData>> getLaIrLocalDataWithTrNo(int trNo) {
    return (select(laIrLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get LaIr Equipment List
  Future<List<LaIrLocalData>> getLaIrEquipmentList() async {
    return await select(laIrLocalDatasourceImpl).get();
  }

  // Create LaIr and return id

  Future<int> createLaIr(LaIrTestModel lairtolocal) {
    return into(laIrLocalDatasourceImpl)
        .insert(LaIrLocalDatasourceImplCompanion.insert(
      seR: lairtolocal.seR,
      seY: lairtolocal.seY,
      seB: lairtolocal.seB,
      ssR: lairtolocal.ssR,
      ssY: lairtolocal.ssY,
      ssB: lairtolocal.ssB,
      serialNo: lairtolocal.serialNo,
      trNo: lairtolocal.trNo,
      databaseID: lairtolocal.databaseID,
      EquipmentType: lairtolocal.EquipmentType,
    ));
  }

  //TODO: Update LaIr by id
  Future<bool> updateLaIr(LaIrTestModel lairtolocal, int id) {
    String serialNo = lairtolocal.serialNo;
    int trNo = lairtolocal.trNo;
    int databaseID = lairtolocal.databaseID;
    String EquipmentType = lairtolocal.EquipmentType;
    double seR = lairtolocal.seR;
    double seY = lairtolocal.seY;
    double seB = lairtolocal.seB;
    double ssR = lairtolocal.ssR;
    double ssY = lairtolocal.ssY;
    double ssB = lairtolocal.ssB;
    DateTime lastUpdated = lairtolocal.lastUpdated;

    return update(laIrLocalDatasourceImpl).replace(LaIrLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      seR: seR,
      seY: seY,
      seB: seB,
      ssR: ssR,
      ssY: ssY,
      ssB: ssB,
      EquipmentType: EquipmentType,
      lastUpdated: lastUpdated,
    ));
  }

  //Delete LaIr by id
  Future<int> deleteLaIrById(int id) {
    return (delete(laIrLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////Lighting arrester-IR-END/////////////////////////////////

//---------------------------------------------------------------------------------------------------------------//
//////////////////////////////////////Surge Counter-LOCAL-DATA-START////////////////////////////
  Future<int> createSc(ScModel sctolocal, DateTime dateOfTesting) {
    return into(scLocalDatasourceImpl)
        .insert(ScLocalDatasourceImplCompanion.insert(
      databaseID: sctolocal.databaseID,
      etype: sctolocal.etype,
      designation: sctolocal.designation,
      location: sctolocal.location,
      make: sctolocal.make,
      EquipmentType: sctolocal.equipType,
      serialNo: sctolocal.serialNo,
      yom: sctolocal.yom,
      trNo: sctolocal.trNo,
      TestedBy: sctolocal.TestedBy,
      VerifiedBy: sctolocal.VerifiedBy,
      WitnessedBy: sctolocal.WitnessedBy,
      dateOfTesting: Value(dateOfTesting),
    ));
  }

  Future<List<ScLocalData>> getScLocalDataList() async {
    return await select(scLocalDatasourceImpl).get();
  }

  Future<bool> updateSc(ScModel sctoupdate, int id) {
    int databaseID = sctoupdate.databaseID;
    String etype = sctoupdate.etype;
    String designation = sctoupdate.designation;
    String location = sctoupdate.location;
    String serialNo = sctoupdate.serialNo;
    String make = sctoupdate.make;
    String equipType = sctoupdate.equipType;
    int yom = sctoupdate.yom;
    DateTime dateOfTesting = sctoupdate.dateOfTesting;
    int trNo = sctoupdate.trNo;
    String TestedBy = sctoupdate.TestedBy;
    String VerifiedBy = sctoupdate.VerifiedBy;
    String WitnessedBy = sctoupdate.WitnessedBy;
    DateTime lastUpdated = sctoupdate.updateDate;

    return update(scLocalDatasourceImpl).replace(ScLocalData(
      etype: etype,
      id: id,
      databaseID: databaseID,
      designation: designation,
      location: location,
      make: make,
      EquipmentType: equipType,
      serialNo: serialNo,
      yom: yom,
      trNo: trNo,
      dateOfTesting: dateOfTesting,
      TestedBy: TestedBy,
      VerifiedBy: VerifiedBy,
      WitnessedBy: WitnessedBy,
      lastUpdated: lastUpdated,
    ));
  }

  Future<int> deleteScById(int id) {
    return (delete(scLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<ScLocalData>> getScLocalDatasourceImplList() async {
    return await select(scLocalDatasourceImpl).get();
  }

  Future<List<ScLocalData>> getScLocalDataWithtrNo(int trNo) {
    return (select(scLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<ScLocalData> getScLocalDataWithId(int id) {
    return (select(scLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }
  //////////////////////////////////////La-LOCAL-DATA-END////////////////////////////
//---------------------------------------------------------------------------------------------------------------//
  //////////////////////////////////////Surge Counter-IR-START////////////////////////////

  //Get ScC by Serial No
  Future<List<ScCLocalData>> getScCLocalDataWithSerialNo(String SerialNo) {
    return (select(scCLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Get ScC by id
  Future<ScCLocalData> getScCLocalDataWithId(int id) {
    return (select(scCLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get ScC by trNo
  Future<List<ScCLocalData>> getScCLocalDataWithTrNo(int trNo) {
    return (select(scCLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get ScC Equipment List
  Future<List<ScCLocalData>> getScCEquipmentList() async {
    return await select(scCLocalDatasourceImpl).get();
  }

  // Create ScC and return id

  Future<int> createScC(ScCTestModel scCTestModel) {
    return into(scCLocalDatasourceImpl)
        .insert(ScCLocalDatasourceImplCompanion.insert(
      rB: scCTestModel.rB,
      rA: scCTestModel.rA,
      yB: scCTestModel.yB,
      yA: scCTestModel.yA,
      bB: scCTestModel.bB,
      bA: scCTestModel.bA,
      serialNo: scCTestModel.serialNo,
      trNo: scCTestModel.trNo,
      databaseID: scCTestModel.databaseID,
      EquipmentType: scCTestModel.EquipmentType,
    ));
  }

  //TODO: Update scC by id
  Future<bool> updateScC(ScCTestModel scCToUpdate, int id) {
    String serialNo = scCToUpdate.serialNo;
    int trNo = scCToUpdate.trNo;
    int databaseID = scCToUpdate.databaseID;
    String EquipmentType = scCToUpdate.EquipmentType;
    double rB = scCToUpdate.rB;
    double rA = scCToUpdate.rA;
    double yB = scCToUpdate.yB;
    double yA = scCToUpdate.yA;
    double bB = scCToUpdate.bB;
    double bA = scCToUpdate.bA;

    DateTime lastUpdated = scCToUpdate.lastUpdated;

    return update(scCLocalDatasourceImpl).replace(ScCLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      rB: rB,
      rA: rA,
      yB: yB,
      yA: yA,
      bB: bB,
      bA: bA,
      EquipmentType: EquipmentType,
      lastUpdated: lastUpdated,
    ));
  }

  //Delete ScC by id
  Future<int> deleteScCById(int id) {
    return (delete(scCLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////Surge counter-IR-END/////////////////////////////////
//---------------------------------------------------------------------------------------------------------------//
//////////////////////////////////////Power Cable-LOCAL-DATA-START////////////////////////////
  Future<int> createPc(PcModel pctolocal, DateTime dateOfTesting) {
    return into(pcLocalDatasourceImpl)
        .insert(PcLocalDatasourceImplCompanion.insert(
      databaseID: pctolocal.databaseID,
      etype: pctolocal.etype,
      designation: pctolocal.designation,
      location: pctolocal.location,
      rating: pctolocal.rating,
      panel: pctolocal.panel,
      make: pctolocal.make,
      size: pctolocal.size,
      length: pctolocal.length,
      trNo: pctolocal.trNo,
      TestedBy: pctolocal.TestedBy,
      VerifiedBy: pctolocal.VerifiedBy,
      WitnessedBy: pctolocal.WitnessedBy,
      dateOfTesting: Value(dateOfTesting),
    ));
  }

  Future<List<PcLocalData>> getPcLocalDataList() async {
    return await select(pcLocalDatasourceImpl).get();
  }

  Future<bool> updatePc(PcModel pctoupdate, int id) {
    int databaseID = pctoupdate.databaseID;
    String etype = pctoupdate.etype;
    String designation = pctoupdate.designation;
    String location = pctoupdate.location;
    String panel = pctoupdate.panel;
    String rating = pctoupdate.rating;
    String size = pctoupdate.size;
    String make = pctoupdate.make;
    String length = pctoupdate.length;
    DateTime dateOfTesting = pctoupdate.dateOfTesting;
    int trNo = pctoupdate.trNo;
    String TestedBy = pctoupdate.TestedBy;
    String VerifiedBy = pctoupdate.VerifiedBy;
    String WitnessedBy = pctoupdate.WitnessedBy;
    DateTime lastUpdated = pctoupdate.updateDate;

    return update(pcLocalDatasourceImpl).replace(PcLocalData(
      etype: etype,
      id: id,
      databaseID: databaseID,
      designation: designation,
      location: location,
      rating: rating,
      make: make,
      panel: panel,
      size: size,
      length: length,
      trNo: trNo,
      dateOfTesting: dateOfTesting,
      TestedBy: TestedBy,
      VerifiedBy: VerifiedBy,
      WitnessedBy: WitnessedBy,
      lastUpdated: lastUpdated,
    ));
  }

  Future<int> deletePcById(int id) {
    return (delete(pcLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<PcLocalData>> getPcLocalDatasourceImplList() async {
    return await select(pcLocalDatasourceImpl).get();
  }

  Future<List<PcLocalData>> getPcLocalDataWithtrNo(int trNo) {
    return (select(pcLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<PcLocalData> getPcLocalDataWithId(int id) {
    return (select(pcLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }
  //////////////////////////////////////Power Cable-LOCAL-DATA-END////////////////////////////
//---------------------------------------------------------------------------------------------------------------//
  //////////////////////////////////////Power Cable-IR-START////////////////////////////

  //Get Pc Ir by Serial No
  Future<List<PcIrLocalData>> getPcIrLocalDataWithPcRefId(int PcRefId) {
    return (select(pcIrLocalDatasourceImpl)
          ..where((u) => u.pcRefId.equals(PcRefId)))
        .get();
  }

  //Get PC Ir by id
  Future<PcIrLocalData> getPcIrLocalDataWithId(int id) {
    return (select(pcIrLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get PC Ir by trNo
  Future<List<PcIrLocalData>> getPcIrLocalDataWithTrNo(int trNo) {
    return (select(pcIrLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get PcIr Equipment List
  Future<List<PcIrLocalData>> getPcIrEquipmentList() async {
    return await select(pcIrLocalDatasourceImpl).get();
  }

  // Create PcIr and return id

  Future<int> createPcIr(PcIrTestModel pcirtolocal) {
    return into(pcIrLocalDatasourceImpl)
        .insert(PcIrLocalDatasourceImplCompanion.insert(
      rA: pcirtolocal.rA,
      rB: pcirtolocal.rB,
      yA: pcirtolocal.yA,
      yB: pcirtolocal.yB,
      bA: pcirtolocal.bA,
      bB: pcirtolocal.bB,
      ryA: pcirtolocal.ryA,
      ybA: pcirtolocal.ybA,
      brA: pcirtolocal.brA,
      ryB: pcirtolocal.ryB,
      ybB: pcirtolocal.ybB,
      brB: pcirtolocal.brB,
      pcRefId: pcirtolocal.pcRefId,
      trNo: pcirtolocal.trNo,
      databaseID: pcirtolocal.databaseID,
      EquipmentType: pcirtolocal.EquipmentType,
    ));
  }

  //TODO: Update PcIr by id
  Future<bool> updatePcIr(PcIrTestModel pcirtoupdate, int id) {
    int pcRefId = pcirtoupdate.pcRefId;
    int trNo = pcirtoupdate.trNo;
    int databaseID = pcirtoupdate.databaseID;
    String EquipmentType = pcirtoupdate.EquipmentType;
    double rA = pcirtoupdate.rA;
    double rB = pcirtoupdate.rB;
    double yA = pcirtoupdate.yA;
    double yB = pcirtoupdate.yB;
    double bA = pcirtoupdate.bA;
    double bB = pcirtoupdate.bB;
    double ryA = pcirtoupdate.ryA;
    double ybA = pcirtoupdate.ybA;
    double brA = pcirtoupdate.brA;
    double ryB = pcirtoupdate.ryB;
    double ybB = pcirtoupdate.ybB;
    double brB = pcirtoupdate.brB;
    DateTime lastUpdated = pcirtoupdate.lastUpdated;

    return update(pcIrLocalDatasourceImpl).replace(PcIrLocalData(
      id: id,
      databaseID: databaseID,
      pcRefId: pcRefId,
      trNo: trNo,
      rA: rA,
      rB: rB,
      yA: yA,
      yB: yB,
      bA: bA,
      bB: bB,
      ryA: ryA,
      ybA: ybA,
      brA: brA,
      ryB: ryB,
      ybB: ybB,
      brB: brB,
      EquipmentType: EquipmentType,
      lastUpdated: lastUpdated,
    ));
  }

  //Delete PcIr by id
  Future<int> deletePcIrById(int id) {
    return (delete(pcIrLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////Power Cable-IR-END/////////////////////////////////

//---------------------------------------------------------------------------------------------------------------//
  //////////////////////////////////////Power Cable-HV-START////////////////////////////

  //Get Pc Hv by pc ref
  Future<List<PcHvLocalData>> getPcHvLocalDataWithPcRefId(int PcRefId) {
    return (select(pcHvLocalDatasourceImpl)
          ..where((u) => u.pcRefId.equals(PcRefId)))
        .get();
  }

  //Get PC Hv by id
  Future<PcHvLocalData> getPcHvLocalDataWithId(int id) {
    return (select(pcHvLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get PC Hv by trNo
  Future<List<PcHvLocalData>> getPcHvLocalDataWithTrNo(int trNo) {
    return (select(pcHvLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get PcHv Equipment List
  Future<List<PcHvLocalData>> getPcHvEquipmentList() async {
    return await select(pcHvLocalDatasourceImpl).get();
  }

  // Create Pchv and return id

  Future<int> createPcHv(PcHvTestModel pchvtolocal) {
    return into(pcHvLocalDatasourceImpl)
        .insert(PcHvLocalDatasourceImplCompanion.insert(
      rVoltage: pchvtolocal.rVoltage,
      rCurrent: pchvtolocal.rCurrent,
      yVoltage: pchvtolocal.yVoltage,
      yCurrent: pchvtolocal.yCurrent,
      bVoltage: pchvtolocal.bVoltage,
      bCurrent: pchvtolocal.bCurrent,
      pcRefId: pchvtolocal.pcRefId,
      trNo: pchvtolocal.trNo,
      databaseID: pchvtolocal.databaseID,
      EquipmentType: pchvtolocal.EquipmentType,
    ));
  }

  //TODO: Update Pchv by id
  Future<bool> updatePcHv(PcHvTestModel pchvtoupdate, int id) {
    int pcRefId = pchvtoupdate.pcRefId;
    int trNo = pchvtoupdate.trNo;
    int databaseID = pchvtoupdate.databaseID;
    String EquipmentType = pchvtoupdate.EquipmentType;
    double rVoltage = pchvtoupdate.rVoltage;
    double rCurrent = pchvtoupdate.rCurrent;
    double yVoltage = pchvtoupdate.yVoltage;
    double yCurrent = pchvtoupdate.yCurrent;
    double bVoltage = pchvtoupdate.bVoltage;
    double bCurrent = pchvtoupdate.bCurrent;
    DateTime lastUpdated = pchvtoupdate.lastUpdated;

    return update(pcHvLocalDatasourceImpl).replace(PcHvLocalData(
      id: id,
      databaseID: databaseID,
      pcRefId: pcRefId,
      trNo: trNo,
      rVoltage: rVoltage,
      rCurrent: rCurrent,
      yVoltage: yVoltage,
      yCurrent: yCurrent,
      bVoltage: bVoltage,
      bCurrent: bCurrent,
      EquipmentType: EquipmentType,
      lastUpdated: lastUpdated,
    ));
  }

  //Delete PcHv by id
  Future<int> deletePcHvById(int id) {
    return (delete(pcHvLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////Power Cable-HV-END/////////////////////////////////

//---------------------------------------------------------------------------------------------------------------//
//////////////////////////////////////Earth Electrode-LOCAL-DATA-START////////////////////////////
  Future<int> createEE(EEModel eetolocal, DateTime dateOfTesting) {
    return into(eELocalDatasourceImpl)
        .insert(EELocalDatasourceImplCompanion.insert(
      databaseID: eetolocal.databaseID,
      etype: eetolocal.etype,
      trNo: eetolocal.trNo,
      TestedBy: eetolocal.TestedBy,
      VerifiedBy: eetolocal.VerifiedBy,
      WitnessedBy: eetolocal.WitnessedBy,
      dateOfTesting: Value(dateOfTesting),
    ));
  }

  Future<List<EELocalData>> getEELocalDataList() async {
    return await select(eELocalDatasourceImpl).get();
  }

  Future<bool> updateEE(EEModel eetoupdate, int id) {
    int databaseID = eetoupdate.databaseID;
    String etype = eetoupdate.etype;
    DateTime dateOfTesting = eetoupdate.dateOfTesting;
    int trNo = eetoupdate.trNo;
    String TestedBy = eetoupdate.TestedBy;
    String VerifiedBy = eetoupdate.VerifiedBy;
    String WitnessedBy = eetoupdate.WitnessedBy;
    DateTime lastUpdated = eetoupdate.updateDate;

    return update(eELocalDatasourceImpl).replace(EELocalData(
      etype: etype,
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      dateOfTesting: dateOfTesting,
      TestedBy: TestedBy,
      VerifiedBy: VerifiedBy,
      WitnessedBy: WitnessedBy,
      lastUpdated: lastUpdated,
    ));
  }

  Future<int> deleteEEById(int id) {
    return (delete(eELocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<EELocalData>> getEELocalDatasourceImplList() async {
    return await select(eELocalDatasourceImpl).get();
  }

  Future<List<EELocalData>> getEELocalDataWithtrNo(int trNo) {
    return (select(eELocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<EELocalData> getEELocalDataWithId(int id) {
    return (select(eELocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }
  //////////////////////////////////////Earth Electrode-LOCAL-DATA-END////////////////////////////

////////////////////////////////Ee_Location_LocalDatasource/////////////////////////
  Future<int> createEE_Loc(EELocModel eeLoctoLocal) {
    return into(eELocLocalDatasourceImpl)
        .insert(EE_Loc_LocalDatasourceImplCompanion.insert(
      databaseID: eeLoctoLocal.databaseID,
      location: eeLoctoLocal.location,
      eeRef: eeLoctoLocal.eeRef,
      //eeLoctoLocal.updateDate,
    ));
  }

  Future<bool> updateEE_Loc(EELocModel eeLoctoUpdate, int id) {
    int databaseID = eeLoctoUpdate.databaseID;
    String location = eeLoctoUpdate.location;
    int eeRef = eeLoctoUpdate.eeRef;
    DateTime updateDate = eeLoctoUpdate.updateDate;
    return update(eELocLocalDatasourceImpl).replace(EELocLocalData(
      id: id,
      databaseID: databaseID,
      location: location,
      eeRef: eeRef,
      updateDate: updateDate,
    ));
  }

  Future<int> deleteEE_LocById(int id) {
    return (delete(eELocLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<EELocLocalData> getEE_LocLocalDataWithId(int id) {
    return (select(eELocLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<EELocLocalData>> getEELocLocalDataWithEENoID(int eeId) {
    return (select(eELocLocalDatasourceImpl)
          ..where((u) => u.eeRef.equals(eeId)))
        .get();
  }

  Future<List<EELocLocalData>> getEElocEquipmentListwithAll() async {
    return await select(eELocLocalDatasourceImpl).get();
  }

  //---------------------------------------------------------------------------------------------------------------//
  //////////////////////////////////////EE -RTest-START////////////////////////////

  //Get EE-R Test by Serial No
  Future<List<EERTestLocalData>> getEERTestLocalDataWithLocNo(int locNo) {
    return (select(eERTestLocalDatasourceImpl)
          ..where((u) => u.locNo.equals(locNo)))
        .get();
  }

  //Get EE-RTest by id
  Future<EERTestLocalData> getEERTestLocalDataWithId(int id) {
    return (select(eERTestLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get EE-RTest  by trNo
  Future<List<EERTestLocalData>> getEERTestLocalDataWithTrNo(int trNo) {
    return (select(eERTestLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get EE-Test  Equipment List
  Future<List<EERTestLocalData>> getEERTestEquipmentList() async {
    return await select(eERTestLocalDatasourceImpl).get();
  }

  // Create EE-RTest  and return id

  Future<int> createEERTest(EERTestModel eeRTestModel) {
    return into(eERTestLocalDatasourceImpl)
        .insert(EERTestLocalDatasourceImplCompanion.insert(
      resistanceValue_AR: eeRTestModel.resistanceValue_AR,
      resistanceValue_BR: eeRTestModel.resistanceValue_BR,
      locNo: eeRTestModel.locNo,
      trNo: eeRTestModel.trNo,
      databaseID: eeRTestModel.databaseID,
      EquipmentType: eeRTestModel.EquipmentType,
      eeName: eeRTestModel.eeName,
    ));
  }

  //TODO: Update EE-RTest  by id
  Future<bool> updateEERTest(EERTestModel eeRTestToUpdate, int id) {
    String eeName = eeRTestToUpdate.eeName;
    int trNo = eeRTestToUpdate.trNo;
    int databaseID = eeRTestToUpdate.databaseID;
    String EquipmentType = eeRTestToUpdate.EquipmentType;
    DateTime lastUpdated = eeRTestToUpdate.lastUpdated;
    double resistanceValue_AR = eeRTestToUpdate.resistanceValue_AR;
    double resistanceValue_BR = eeRTestToUpdate.resistanceValue_BR;
    int locNo = eeRTestToUpdate.locNo;

    return update(eERTestLocalDatasourceImpl).replace(EERTestLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      eeName: eeName,
      locNo: locNo,
      EquipmentType: EquipmentType,
      lastUpdated: lastUpdated,
      resistanceValue_AR: resistanceValue_AR,
      resistanceValue_BR: resistanceValue_BR,
    ));
  }

  //Delete EE-Test by id
  Future<int> deleteEERTestById(int id) {
    return (delete(eERTestLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////EE-RTest-END/////////////////////////////////
  //////////////////////////////////////EE -Test-START////////////////////////////

  //Get EE-Test by Loc no
  Future<List<EETestLocalData>> getEETestLocalDataWithLocNo(int locNo) {
    return (select(eETestLocalDatasourceImpl)
          ..where((u) => u.locNo.equals(locNo)))
        .get();
  }

  //Get EE-Test by id
  Future<EETestLocalData> getEETestLocalDataWithId(int id) {
    return (select(eETestLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get EE-Test  by trNo
  Future<List<EETestLocalData>> getEETestLocalDataWithTrNo(int trNo) {
    return (select(eETestLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get EE-Test  Equipment List
  Future<List<EETestLocalData>> getEETestEquipmentList() async {
    return await select(eETestLocalDatasourceImpl).get();
  }

  // Create EE-Test  and return id

  Future<int> createEETest(EETestModel eeTestModel) {
    return into(eETestLocalDatasourceImpl)
        .insert(EETestLocalDatasourceImplCompanion.insert(
      resistanceValue: eeTestModel.resistanceValue,
      locNo: eeTestModel.locNo,
      trNo: eeTestModel.trNo,
      databaseID: eeTestModel.databaseID,
      EquipmentType: eeTestModel.EquipmentType,
      eeName: eeTestModel.eeName,
    ));
  }

  //Update EE-Test  by id
  Future<bool> updateEETest(EETestModel eeTestToUpdate, int id) {
    String eeName = eeTestToUpdate.eeName;
    int trNo = eeTestToUpdate.trNo;
    int databaseID = eeTestToUpdate.databaseID;
    String EquipmentType = eeTestToUpdate.EquipmentType;
    DateTime lastUpdated = eeTestToUpdate.lastUpdated;
    double resistanceValue = eeTestToUpdate.resistanceValue;
    int locNo = eeTestToUpdate.locNo;

    return update(eETestLocalDatasourceImpl).replace(EETestLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      eeName: eeName,
      locNo: locNo,
      EquipmentType: EquipmentType,
      lastUpdated: lastUpdated,
      resistanceValue: resistanceValue,
    ));
  }

  //Delete EE-Test by id
  Future<int> deleteEETestById(int id) {
    return (delete(eETestLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////EE-Test-END/////////////////////////////////
  //---------------------------------------------------------------------------------------------------------------//
//////////////////////////////////////Busbar-LOCAL-DATA-START////////////////////////////
  Future<int> createBb(BbModel bbtolocal, DateTime dateOfTesting) {
    return into(bbLocalDatasourceImpl)
        .insert(BbLocalDatasourceImplCompanion.insert(
      databaseID: bbtolocal.databaseID,
      etype: bbtolocal.etype,
      designation: bbtolocal.designation,
      location: bbtolocal.location,
      rating: bbtolocal.rating,
      panel: bbtolocal.panel,
      noOfBar: bbtolocal.noOfBar,
      trNo: bbtolocal.trNo,
      TestedBy: bbtolocal.TestedBy,
      VerifiedBy: bbtolocal.VerifiedBy,
      WitnessedBy: bbtolocal.WitnessedBy,
      dateOfTesting: Value(dateOfTesting),
    ));
  }

  Future<List<BbLocalData>> getBbLocalDataList() async {
    return await select(bbLocalDatasourceImpl).get();
  }

  Future<bool> updateBb(BbModel bbtoupdate, int id) {
    int databaseID = bbtoupdate.databaseID;
    String etype = bbtoupdate.etype;
    String designation = bbtoupdate.designation;
    String location = bbtoupdate.location;
    String panel = bbtoupdate.panel;
    String rating = bbtoupdate.rating;
    int noOfBar = bbtoupdate.noOfBar;
    DateTime dateOfTesting = bbtoupdate.dateOfTesting;
    int trNo = bbtoupdate.trNo;
    String TestedBy = bbtoupdate.TestedBy;
    String VerifiedBy = bbtoupdate.VerifiedBy;
    String WitnessedBy = bbtoupdate.WitnessedBy;
    DateTime lastUpdated = bbtoupdate.updateDate;

    return update(bbLocalDatasourceImpl).replace(BbLocalData(
      etype: etype,
      id: id,
      databaseID: databaseID,
      designation: designation,
      location: location,
      rating: rating,
      noOfBar: noOfBar,
      panel: panel,
      trNo: trNo,
      dateOfTesting: dateOfTesting,
      TestedBy: TestedBy,
      VerifiedBy: VerifiedBy,
      WitnessedBy: WitnessedBy,
      lastUpdated: lastUpdated,
    ));
  }

  Future<int> deleteBbById(int id) {
    return (delete(pcLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<BbLocalData>> getBbLocalDatasourceImplList() async {
    return await select(bbLocalDatasourceImpl).get();
  }

  Future<List<BbLocalData>> getBbLocalDataWithtrNo(int trNo) {
    return (select(bbLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<BbLocalData> getBbLocalDataWithId(int id) {
    return (select(bbLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }
  //////////////////////////////////////Busbar-LOCAL-DATA-END////////////////////////////
//---------------------------------------------------------------------------------------------------------------//
  //////////////////////////////////////BusBar-IR-START////////////////////////////

  //Get Bb Ir by Serial No
  Future<List<BbIrLocalData>> getBbIrLocalDataWithBbRefId(int bbRefId) {
    return (select(bbIrLocalDatasourceImpl)
          ..where((u) => u.bbRefId.equals(bbRefId)))
        .get();
  }

  //Get bb Ir by id
  Future<BbIrLocalData> getBbIrLocalDataWithId(int id) {
    return (select(bbIrLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get bb Ir by trNo
  Future<List<BbIrLocalData>> getBbIrLocalDataWithTrNo(int trNo) {
    return (select(bbIrLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get BbIr Equipment List
  Future<List<BbIrLocalData>> getBbIrEquipmentList() async {
    return await select(bbIrLocalDatasourceImpl).get();
  }

  // Create BbIr and return id

  Future<int> createBbIr(BbIrTestModel bbirtolocal) {
    return into(bbIrLocalDatasourceImpl)
        .insert(BbIrLocalDatasourceImplCompanion.insert(
      rA: bbirtolocal.rA,
      rB: bbirtolocal.rB,
      yA: bbirtolocal.yA,
      yB: bbirtolocal.yB,
      bA: bbirtolocal.bA,
      bB: bbirtolocal.bB,
      nA: bbirtolocal.nA,
      nB: bbirtolocal.nB,
      ryA: bbirtolocal.ryA,
      ybA: bbirtolocal.ybA,
      brA: bbirtolocal.brA,
      ryB: bbirtolocal.ryB,
      ybB: bbirtolocal.ybB,
      brB: bbirtolocal.brB,
      rnA: bbirtolocal.rnA,
      rnB: bbirtolocal.rnB,
      ynA: bbirtolocal.ynA,
      ynB: bbirtolocal.ynB,
      bnA: bbirtolocal.bnA,
      bnB: bbirtolocal.bnB,
      bbRefId: bbirtolocal.bbRefId,
      trNo: bbirtolocal.trNo,
      databaseID: bbirtolocal.databaseID,
      EquipmentType: bbirtolocal.EquipmentType,
    ));
  }

  //TODO: Update BbIr by id
  Future<bool> updateBbIr(BbIrTestModel bbirtoupdate, int id) {
    int bbRefId = bbirtoupdate.bbRefId;
    int trNo = bbirtoupdate.trNo;
    int databaseID = bbirtoupdate.databaseID;
    String EquipmentType = bbirtoupdate.EquipmentType;
    double rA = bbirtoupdate.rA;
    double rB = bbirtoupdate.rB;
    double yA = bbirtoupdate.yA;
    double yB = bbirtoupdate.yB;
    double bA = bbirtoupdate.bA;
    double bB = bbirtoupdate.bB;
    double nA = bbirtoupdate.nA;
    double nB = bbirtoupdate.nB;
    double ryA = bbirtoupdate.ryA;
    double ybA = bbirtoupdate.ybA;
    double brA = bbirtoupdate.brA;
    double ryB = bbirtoupdate.ryB;
    double ybB = bbirtoupdate.ybB;
    double brB = bbirtoupdate.brB;
    double rnA = bbirtoupdate.rnA;
    double rnB = bbirtoupdate.rnB;
    double ynA = bbirtoupdate.ynB;
    double ynB = bbirtoupdate.ynB;
    double bnA = bbirtoupdate.bnA;
    double bnB = bbirtoupdate.bnB;
    DateTime lastUpdated = bbirtoupdate.lastUpdated;

    return update(bbIrLocalDatasourceImpl).replace(BbIrLocalData(
      id: id,
      databaseID: databaseID,
      bbRefId: bbRefId,
      trNo: trNo,
      rA: rA,
      rB: rB,
      yA: yA,
      yB: yB,
      bA: bA,
      bB: bB,
      nA: nA,
      nB: nB,
      ryA: ryA,
      ybA: ybA,
      brA: brA,
      ryB: ryB,
      ybB: ybB,
      brB: brB,
      rnA: rnA,
      rnB: rnB,
      ynA: ynA,
      ynB: ynB,
      bnA: bnA,
      bnB: bnB,
      EquipmentType: EquipmentType,
      lastUpdated: lastUpdated,
    ));
  }

  //Delete BbIr by id
  Future<int> deleteBbIrById(int id) {
    return (delete(bbIrLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////busbar-IR-END/////////////////////////////////
  //////////////////////////////////////BusBar-HV-START////////////////////////////

  //Get Bb Hv by Serial No
  Future<List<BbHvLocalData>> getBbHvLocalDataWithBbRefId(int bbRefId) {
    return (select(bbHvLocalDatasourceImpl)
          ..where((u) => u.bbRefId.equals(bbRefId)))
        .get();
  }

  //Get bb Hv by id
  Future<BbHvLocalData> getBbHvLocalDataWithId(int id) {
    return (select(bbHvLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get bb Hv by trNo
  Future<List<BbHvLocalData>> getBbHvLocalDataWithTrNo(int trNo) {
    return (select(bbHvLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get BbHv Equipment List
  Future<List<BbHvLocalData>> getBbHvEquipmentList() async {
    return await select(bbHvLocalDatasourceImpl).get();
  }

  // Create BbHv and return id

  Future<int> createBbHv(BbHvTestModel pcHvTestModel) {
    return into(bbHvLocalDatasourceImpl)
        .insert(BbHvLocalDatasourceImplCompanion.insert(
      r: pcHvTestModel.r,
      y: pcHvTestModel.y,
      b: pcHvTestModel.b,
      n: pcHvTestModel.n,
      bbRefId: pcHvTestModel.bbRefId,
      trNo: pcHvTestModel.trNo,
      databaseID: pcHvTestModel.databaseID,
      EquipmentType: pcHvTestModel.EquipmentType,
    ));
  }

  //TODO: Update BbHv by id
  Future<bool> updateBbHv(BbHvTestModel bbHvToUpdate, int id) {
    int bbRefId = bbHvToUpdate.bbRefId;
    int trNo = bbHvToUpdate.trNo;
    int databaseID = bbHvToUpdate.databaseID;
    String EquipmentType = bbHvToUpdate.EquipmentType;
    double r = bbHvToUpdate.r;
    double y = bbHvToUpdate.y;
    double b = bbHvToUpdate.b;
    double n = bbHvToUpdate.n;

    DateTime lastUpdated = bbHvToUpdate.lastUpdated;

    return update(bbHvLocalDatasourceImpl).replace(BbHvLocalData(
      id: id,
      databaseID: databaseID,
      bbRefId: bbRefId,
      trNo: trNo,
      r: r,
      y: y,
      b: b,
      n: n,
      EquipmentType: EquipmentType,
      lastUpdated: lastUpdated,
    ));
  }

  //Delete BbHv by id
  Future<int> deleteBbHvById(int id) {
    return (delete(bbHvLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////Power Cable-HV-END/////////////////////////////////
//////////////////////////////////////BusBar-Cr-START////////////////////////////

  //Get Bb Cr by Serial No
  Future<List<BbCrLocalData>> getBbCrLocalDataWithBbRefId(int bbRefId) {
    return (select(bbCrLocalDatasourceImpl)
          ..where((u) => u.bbRefId.equals(bbRefId)))
        .get();
  }

  //Get bb Cr by id
  Future<BbCrLocalData> getBbCrLocalDataWithId(int id) {
    return (select(bbCrLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }
  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>swathi's code completed>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  // ///////////////////////////////////PT-coreIR//////////////////////////////////////////////
  Future<int> createPTcoreIR(PTcoreIRModel ptirtolocal) {
    return into(pTcoreIRLocalDatasourceImpl)
        .insert(PTcoreIRLocalDatasourceImplCompanion.insert(
      trNo: ptirtolocal.trNo,
      serialNo: ptirtolocal.serialNo,
      equipmentUsed: ptirtolocal.equipmentUsed,
      databaseID: ptirtolocal.databaseID,
      peR: ptirtolocal.peR,
      peY: ptirtolocal.peY,
      peB: ptirtolocal.peB,
      pc1R: ptirtolocal.pc1R,
      pc2R: ptirtolocal.pc2R,
      pc3R: ptirtolocal.pc3R,

      pc1Y: ptirtolocal.pc1Y,
      pc2Y: ptirtolocal.pc2Y,
      pc3Y: ptirtolocal.pc3Y,

      pc1B: ptirtolocal.pc1B,
      pc2B: ptirtolocal.pc2B,
      pc3B: ptirtolocal.pc3B,

      c1eR: ptirtolocal.c1eR,
      c2eR: ptirtolocal.c2eR,
      c3eR: ptirtolocal.c3eR,

      c1eY: ptirtolocal.c1eY,
      c2eY: ptirtolocal.c2eY,
      c3eY: ptirtolocal.c3eY,

      c1eB: ptirtolocal.c1eB,
      c2eB: ptirtolocal.c2eB,
      c3eB: ptirtolocal.c3eB,

      c1c2R: ptirtolocal.c1c2R,
      c1c2Y: ptirtolocal.c1c2Y,
      c1c2B: ptirtolocal.c1c2B,
      c2c3R: ptirtolocal.c2c3R,
      c2c3Y: ptirtolocal.c2c3Y,
      c2c3B: ptirtolocal.c2c3B,

      clc1R: ptirtolocal.clc1R,
      clc1Y: ptirtolocal.clc1Y,
      clc1B: ptirtolocal.clc1B,

      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePTcoreIR(PTcoreIRModel ptirtoupdate, int id) {
    int databaseID = ptirtoupdate.databaseID;
    int trNo = ptirtoupdate.trNo;
    String serialNo = ptirtoupdate.serialNo;
    String equipmentUsed = ptirtoupdate.equipmentUsed;
    double peR = ptirtoupdate.peR;
    double peY = ptirtoupdate.peY;
    double peB = ptirtoupdate.peB;
    double pc1R = ptirtoupdate.pc1R;
    double pc2R = ptirtoupdate.pc2R;
    double pc3R = ptirtoupdate.pc3R;

    double pc1Y = ptirtoupdate.pc1Y;
    double pc2Y = ptirtoupdate.pc2Y;
    double pc3Y = ptirtoupdate.pc3Y;

    double pc1B = ptirtoupdate.pc1B;
    double pc2B = ptirtoupdate.pc2B;
    double pc3B = ptirtoupdate.pc3B;

    double c1eR = ptirtoupdate.c1eR;
    double c2eR = ptirtoupdate.c2eR;
    double c3eR = ptirtoupdate.c3eR;

    double c1eY = ptirtoupdate.c1eY;
    double c2eY = ptirtoupdate.c2eY;
    double c3eY = ptirtoupdate.c3eY;

    double c1eB = ptirtoupdate.c1eB;
    double c2eB = ptirtoupdate.c2eB;
    double c3eB = ptirtoupdate.c3eB;

    double c1c2R = ptirtoupdate.c1c2R;
    double c1c2Y = ptirtoupdate.c1c2Y;
    double c1c2B = ptirtoupdate.c1c2B;
    double c2c3R = ptirtoupdate.c2c3R;
    double c2c3Y = ptirtoupdate.c2c3Y;
    double c2c3B = ptirtoupdate.c2c3B;

    double clc1R = ptirtoupdate.clc1R;
    double clc1Y = ptirtoupdate.clc1Y;
    double clc1B = ptirtoupdate.clc1B;
    DateTime updateDate = ptirtoupdate.updateDate;

    return update(pTcoreIRLocalDatasourceImpl).replace(PTcoreIRLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      equipmentUsed: equipmentUsed,
      peR: peR,
      peY: peY,
      peB: peB,
      pc1R: pc1R,
      pc2R: pc2R,
      pc3R: pc3R,
      pc1Y: pc1Y,
      pc2Y: pc2Y,
      pc3Y: pc3Y,
      pc1B: pc1B,
      pc2B: pc2B,
      pc3B: pc3B,
      c1eR: c1eR,
      c2eR: c2eR,
      c3eR: c3eR,
      c1eY: c1eY,
      c2eY: c2eY,
      c3eY: c3eY,
      c1eB: c1eB,
      c2eB: c2eB,
      c3eB: c3eB,
      c1c2R: c1c2R,
      c1c2Y: c1c2Y,
      c1c2B: c1c2B,
      c2c3R: c2c3R,
      c2c3Y: c2c3Y,
      c2c3B: c2c3B,
      clc1R: clc1R,
      clc1Y: clc1Y,
      clc1B: clc1B,
      updateDate: updateDate,
    ));
  }

  Future<int> deletePTcoreIRById(int id) {
    return (delete(pTcoreIRLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<PTcoreIRLocalData>> getPTirEquipmentListwithAll() async {
    return await select(pTcoreIRLocalDatasourceImpl).get();
  }

  Future<PTcoreIRLocalData> getPTcoreIRLocalDataWithId(int id) {
    return (select(pTcoreIRLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<PTcoreIRLocalData>> getPTcoreLocalDataWithSerialNo(
      String serialNo) {
    return (select(pTcoreIRLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(serialNo)))
        .get();
  }

  //////////////////////////////PTcoreWR////////////////////////////////

  Future<int> createPTcoreWR(PTcoreWRModel ptwrtolocal) {
    return into(pTcoreWRLocalDatasourceImpl)
        .insert(PTcoreWRLocalDatasourceImplCompanion.insert(
      trNo: ptwrtolocal.trNo,
      serialNo: ptwrtolocal.serialNo,
      equipmentUsed: ptwrtolocal.equipmentUsed,
      databaseID: ptwrtolocal.databaseID,
      R_1a_1n: ptwrtolocal.R_1a_1n,
      R_2a_2n: ptwrtolocal.R_2a_2n,
      R_3a_3n: ptwrtolocal.R_3a_3n,
      Y_1a_1n: ptwrtolocal.Y_1a_1n,
      Y_2a_2n: ptwrtolocal.Y_2a_2n,
      Y_3a_3n: ptwrtolocal.Y_3a_3n,
      B_1a_1n: ptwrtolocal.B_1a_1n,
      B_2a_2n: ptwrtolocal.B_2a_2n,
      B_3a_3n: ptwrtolocal.B_3a_3n,

      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePTcoreWR(PTcoreWRModel ptwrtoupdate, int id) {
    int databaseID = ptwrtoupdate.databaseID;
    int trNo = ptwrtoupdate.trNo;
    String serialNo = ptwrtoupdate.serialNo;
    String equipmentUsed = ptwrtoupdate.equipmentUsed;
    double R_1a_1n = ptwrtoupdate.R_1a_1n;
    double R_2a_2n = ptwrtoupdate.R_2a_2n;
    double R_3a_3n = ptwrtoupdate.R_3a_3n;
    double Y_1a_1n = ptwrtoupdate.Y_1a_1n;
    double Y_2a_2n = ptwrtoupdate.Y_2a_2n;
    double Y_3a_3n = ptwrtoupdate.Y_3a_3n;
    double B_1a_1n = ptwrtoupdate.B_1a_1n;
    double B_2a_2n = ptwrtoupdate.B_2a_2n;
    double B_3a_3n = ptwrtoupdate.B_3a_3n;
    DateTime updateDate = ptwrtoupdate.updateDate;

    return update(pTcoreWRLocalDatasourceImpl).replace(PTcoreWRLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      equipmentUsed: equipmentUsed,
      R_1a_1n: R_1a_1n,
      R_2a_2n: R_2a_2n,
      R_3a_3n: R_3a_3n,
      Y_1a_1n: Y_1a_1n,
      Y_2a_2n: Y_2a_2n,
      Y_3a_3n: Y_3a_3n,
      B_1a_1n: B_1a_1n,
      B_2a_2n: B_2a_2n,
      B_3a_3n: B_3a_3n,
      updateDate: updateDate,
    ));
  }

  Future<int> deletePTcoreWRById(int id) {
    return (delete(pTcoreWRLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<PTcoreWRLocalData>> getPTwrEquipmentListwithAll() async {
    return await select(pTcoreWRLocalDatasourceImpl).get();
  }

  Future<PTcoreWRLocalData> getPTcoreWRLocalDataWithId(int id) {
    return (select(pTcoreWRLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //getCTcoreLocalDataWithSerialNo
  Future<List<PTcoreWRLocalData>> getPTcoreWRLocalDataWithSerialNo(
      String serialNo) {
    return (select(pTcoreWRLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(serialNo)))
        .get();
  }

  ////////////////////////////////PTcoreR_LocalDatasource/////////////////////////
  Future<int> createPTcoreR(PTcoreRModel ptcorertolocal) {
    return into(pTcoreRLocalDatasourceImpl)
        .insert(PTcoreRLocalDatasourceImplCompanion.insert(
      trNo: ptcorertolocal.trNo,
      serialNo: ptcorertolocal.serialNo,
      equipmentUsed: ptcorertolocal.equipmentUsed,
      databaseID: ptcorertolocal.databaseID,
      R_1a_1n_1000: ptcorertolocal.R_1a_1n_1000,
      R_2a_2n_1000: ptcorertolocal.R_2a_2n_1000,
      R_3a_3n_1000: ptcorertolocal.R_3a_3n_1000,
      Y_1a_1n_1000: ptcorertolocal.Y_1a_1n_1000,
      Y_2a_2n_1000: ptcorertolocal.Y_2a_2n_1000,
      Y_3a_3n_1000: ptcorertolocal.Y_3a_3n_1000,
      B_1a_1n_1000: ptcorertolocal.B_1a_1n_1000,
      B_2a_2n_1000: ptcorertolocal.B_2a_2n_1000,
      B_3a_3n_1000: ptcorertolocal.B_3a_3n_1000,
      R_1a_1n_2000: ptcorertolocal.R_1a_1n_2000,
      R_2a_2n_2000: ptcorertolocal.R_2a_2n_2000,
      R_3a_3n_2000: ptcorertolocal.R_3a_3n_2000,
      Y_1a_1n_2000: ptcorertolocal.Y_1a_1n_2000,
      Y_2a_2n_2000: ptcorertolocal.Y_2a_2n_2000,
      Y_3a_3n_2000: ptcorertolocal.Y_3a_3n_2000,
      B_1a_1n_2000: ptcorertolocal.B_1a_1n_2000,
      B_2a_2n_2000: ptcorertolocal.B_2a_2n_2000,
      B_3a_3n_2000: ptcorertolocal.B_3a_3n_2000,
      R_1a_1n_3000: ptcorertolocal.R_1a_1n_3000,
      R_2a_2n_3000: ptcorertolocal.R_2a_2n_3000,
      R_3a_3n_3000: ptcorertolocal.R_3a_3n_3000,
      Y_1a_1n_3000: ptcorertolocal.Y_1a_1n_3000,
      Y_2a_2n_3000: ptcorertolocal.Y_2a_2n_3000,
      Y_3a_3n_3000: ptcorertolocal.Y_3a_3n_3000,
      B_1a_1n_3000: ptcorertolocal.B_1a_1n_3000,
      B_2a_2n_3000: ptcorertolocal.B_2a_2n_3000,
      B_3a_3n_3000: ptcorertolocal.B_3a_3n_3000,
      R_1a_1n_4000: ptcorertolocal.R_1a_1n_4000,
      R_2a_2n_4000: ptcorertolocal.R_2a_2n_4000,
      R_3a_3n_4000: ptcorertolocal.R_3a_3n_4000,
      Y_1a_1n_4000: ptcorertolocal.Y_1a_1n_4000,
      Y_2a_2n_4000: ptcorertolocal.Y_2a_2n_4000,
      Y_3a_3n_4000: ptcorertolocal.Y_3a_3n_4000,
      B_1a_1n_4000: ptcorertolocal.B_1a_1n_4000,
      B_2a_2n_4000: ptcorertolocal.B_2a_2n_4000,
      B_3a_3n_4000: ptcorertolocal.B_3a_3n_4000,

      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePTcoreR(PTcoreRModel ptcorertoupdate, int id) {
    int databaseID = ptcorertoupdate.databaseID;
    int trNo = ptcorertoupdate.trNo;
    String serialNo = ptcorertoupdate.serialNo;
    String equipmentUsed = ptcorertoupdate.equipmentUsed;
    double R_1a_1n_1000 = ptcorertoupdate.R_1a_1n_1000;
    double R_2a_2n_1000 = ptcorertoupdate.R_2a_2n_1000;
    double R_3a_3n_1000 = ptcorertoupdate.R_3a_3n_1000;
    double Y_1a_1n_1000 = ptcorertoupdate.Y_1a_1n_1000;
    double Y_2a_2n_1000 = ptcorertoupdate.Y_2a_2n_1000;
    double Y_3a_3n_1000 = ptcorertoupdate.Y_3a_3n_1000;
    double B_1a_1n_1000 = ptcorertoupdate.B_1a_1n_1000;
    double B_2a_2n_1000 = ptcorertoupdate.B_2a_2n_1000;
    double B_3a_3n_1000 = ptcorertoupdate.B_3a_3n_1000;
    double R_1a_1n_2000 = ptcorertoupdate.R_1a_1n_2000;
    double R_2a_2n_2000 = ptcorertoupdate.R_2a_2n_2000;
    double R_3a_3n_2000 = ptcorertoupdate.R_3a_3n_2000;
    double Y_1a_1n_2000 = ptcorertoupdate.Y_1a_1n_2000;
    double Y_2a_2n_2000 = ptcorertoupdate.Y_2a_2n_2000;
    double Y_3a_3n_2000 = ptcorertoupdate.Y_3a_3n_2000;
    double B_1a_1n_2000 = ptcorertoupdate.B_1a_1n_2000;
    double B_2a_2n_2000 = ptcorertoupdate.B_2a_2n_2000;
    double B_3a_3n_2000 = ptcorertoupdate.B_3a_3n_2000;
    double R_1a_1n_3000 = ptcorertoupdate.R_1a_1n_3000;
    double R_2a_2n_3000 = ptcorertoupdate.R_2a_2n_3000;
    double R_3a_3n_3000 = ptcorertoupdate.R_3a_3n_3000;
    double Y_1a_1n_3000 = ptcorertoupdate.Y_1a_1n_3000;
    double Y_2a_2n_3000 = ptcorertoupdate.Y_2a_2n_3000;
    double Y_3a_3n_3000 = ptcorertoupdate.Y_3a_3n_3000;
    double B_1a_1n_3000 = ptcorertoupdate.B_1a_1n_3000;
    double B_2a_2n_3000 = ptcorertoupdate.B_2a_2n_3000;
    double B_3a_3n_3000 = ptcorertoupdate.B_3a_3n_3000;
    double R_1a_1n_4000 = ptcorertoupdate.R_1a_1n_4000;
    double R_2a_2n_4000 = ptcorertoupdate.R_2a_2n_4000;
    double R_3a_3n_4000 = ptcorertoupdate.R_3a_3n_4000;
    double Y_1a_1n_4000 = ptcorertoupdate.Y_1a_1n_4000;
    double Y_2a_2n_4000 = ptcorertoupdate.Y_2a_2n_4000;
    double Y_3a_3n_4000 = ptcorertoupdate.Y_3a_3n_4000;
    double B_1a_1n_4000 = ptcorertoupdate.B_1a_1n_4000;
    double B_2a_2n_4000 = ptcorertoupdate.B_2a_2n_4000;
    double B_3a_3n_4000 = ptcorertoupdate.B_3a_3n_4000;
    DateTime updateDate = ptcorertoupdate.updateDate;

    return update(pTcoreRLocalDatasourceImpl).replace(PTcoreRLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      equipmentUsed: equipmentUsed,
      R_1a_1n_1000: R_1a_1n_1000,
      R_2a_2n_1000: R_2a_2n_1000,
      R_3a_3n_1000: R_3a_3n_1000,
      Y_1a_1n_1000: Y_1a_1n_1000,
      Y_2a_2n_1000: Y_2a_2n_1000,
      Y_3a_3n_1000: Y_3a_3n_1000,
      B_1a_1n_1000: B_1a_1n_1000,
      B_2a_2n_1000: B_2a_2n_1000,
      B_3a_3n_1000: B_3a_3n_1000,
      R_1a_1n_2000: R_1a_1n_2000,
      R_2a_2n_2000: R_2a_2n_2000,
      R_3a_3n_2000: R_3a_3n_2000,
      Y_1a_1n_2000: Y_1a_1n_2000,
      Y_2a_2n_2000: Y_2a_2n_2000,
      Y_3a_3n_2000: Y_3a_3n_2000,
      B_1a_1n_2000: B_1a_1n_2000,
      B_2a_2n_2000: B_2a_2n_2000,
      B_3a_3n_2000: B_3a_3n_2000,
      R_1a_1n_3000: R_1a_1n_3000,
      R_2a_2n_3000: R_2a_2n_3000,
      R_3a_3n_3000: R_3a_3n_3000,
      Y_1a_1n_3000: Y_1a_1n_3000,
      Y_2a_2n_3000: Y_2a_2n_3000,
      Y_3a_3n_3000: Y_3a_3n_3000,
      B_1a_1n_3000: B_1a_1n_3000,
      B_2a_2n_3000: B_2a_2n_3000,
      B_3a_3n_3000: B_3a_3n_3000,
      R_1a_1n_4000: R_1a_1n_4000,
      R_2a_2n_4000: R_2a_2n_4000,
      R_3a_3n_4000: R_3a_3n_4000,
      Y_1a_1n_4000: Y_1a_1n_4000,
      Y_2a_2n_4000: Y_2a_2n_4000,
      Y_3a_3n_4000: Y_3a_3n_4000,
      B_1a_1n_4000: B_1a_1n_4000,
      B_2a_2n_4000: B_2a_2n_4000,
      B_3a_3n_4000: B_3a_3n_4000,
      updateDate: updateDate,
    ));
  }

  Future<int> deletePTcoreRById(int id) {
    return (delete(pTcoreRLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<PTcoreRLocalData>> getPTcoreREquipmentListwithAll() async {
    return await select(pTcoreRLocalDatasourceImpl).get();
  }

  Future<PTcoreRLocalData> getPTcoreRLocalDataWithId(int id) {
    return (select(pTcoreRLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<PTcoreRLocalData>> getPTcoreRLocalDataWithSerialNo(
      String serialNo) {
    return (select(pTcoreRLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(serialNo)))
        .get();
  }

  // >>>>>>>>>>>>>>>>>>>>>>>>>BUSBUR-Equipment>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  //Get bb Cr by trNo
  Future<List<BbCrLocalData>> getBbCrLocalDataWithTrNo(int trNo) {
    return (select(bbCrLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get BbCr Equipment List
  Future<List<BbCrLocalData>> getBbCrEquipmentList() async {
    return await select(bbCrLocalDatasourceImpl).get();
  }

  // Create BbCr and return id

  Future<int> createBbCr(BbCrTestModel bbcrtolocal) {
    return into(bbCrLocalDatasourceImpl)
        .insert(BbCrLocalDatasourceImplCompanion.insert(
      r: bbcrtolocal.r,
      y: bbcrtolocal.y,
      b: bbcrtolocal.b,
      n: bbcrtolocal.n,
      bbRefId: bbcrtolocal.bbRefId,
      trNo: bbcrtolocal.trNo,
      databaseID: bbcrtolocal.databaseID,
      EquipmentType: bbcrtolocal.EquipmentType,
    ));
  }

  //TODO: Update BbCr by id
  Future<bool> updateBbCr(BbCrTestModel bbcrtoupdate, int id) {
    int bbRefId = bbcrtoupdate.bbRefId;
    int trNo = bbcrtoupdate.trNo;
    int databaseID = bbcrtoupdate.databaseID;
    String EquipmentType = bbcrtoupdate.EquipmentType;
    double r = bbcrtoupdate.r;
    double y = bbcrtoupdate.y;
    double b = bbcrtoupdate.b;
    double n = bbcrtoupdate.n;
    DateTime lastUpdated = bbcrtoupdate.lastUpdated;

    return update(bbCrLocalDatasourceImpl).replace(BbCrLocalData(
      id: id,
      databaseID: databaseID,
      bbRefId: bbRefId,
      trNo: trNo,
      r: r,
      y: y,
      b: b,
      n: n,
      EquipmentType: EquipmentType,
      lastUpdated: lastUpdated,
    ));
  }

  //Delete BbCr by id
  Future<int> deleteBbCrById(int id) {
    return (delete(bbCrLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////Power Cable-HV-END/////////////////////////////////

  /////////////////////////////////////////Auxiliary-Transformer-Starts////////////////////
  Future<int> createAT(ATModel attolocal, DateTime dateOfTesting) {
    return into(aTLocalDatasourceImpl)
        .insert(ATLocalDatasourceImplCompanion.insert(
      databaseID: attolocal.databaseID,
      etype: attolocal.etype,
      trNo: attolocal.trNo,
      designation: attolocal.designation,
      location: attolocal.location,
      serialNo: attolocal.serialNo,
      rating: attolocal.rating,
      ratedVoltage_HV: attolocal.ratedVoltage_HV,
      ratedVoltage_LV: attolocal.ratedVoltage_LV,
      ratedCurrent_HV: attolocal.ratedCurrent_HV,
      ratedCurrent_LV: attolocal.ratedCurrent_LV,
      vectorGroup: attolocal.vectorGroup,
      impedanceVoltage: attolocal.impedanceVoltage,
      frequency: attolocal.frequency,
      typeOfCooling: attolocal.typeOfCooling,
      noOfPhases: attolocal.noOfPhases,
      noOfTaps: attolocal.noOfTaps,
      onOfNominalTaps: attolocal.onOfNominalTaps,
      yom: attolocal.yom,
      make: attolocal.make,
      dateOfTesting: Value(dateOfTesting),
      testedBy: attolocal.testedBy,
      verifiedBy: attolocal.verifiedBy,
      WitnessedBy: attolocal.WitnessedBy,
      // updateDate: AtModel.updateDate,
    ));
  }

  Future<bool> updateAT(ATModel attoupdate, int id) {
    int databaseID = attoupdate.databaseID;
    String etype = attoupdate.etype;
    int trNo = attoupdate.trNo;
    String designation = attoupdate.designation;
    String location = attoupdate.location;
    String serialNo = attoupdate.serialNo;
    int rating = attoupdate.rating;
    int ratedVoltage_HV = attoupdate.ratedVoltage_HV;
    int ratedVoltage_LV = attoupdate.ratedVoltage_LV;
    double ratedCurrent_HV = attoupdate.ratedCurrent_HV;
    double ratedCurrent_LV = attoupdate.ratedCurrent_LV;
    String vectorGroup = attoupdate.vectorGroup;
    double impedanceVoltage = attoupdate.impedanceVoltage;
    int frequency = attoupdate.frequency;
    String typeOfCooling = attoupdate.typeOfCooling;
    int noOfPhases = attoupdate.noOfPhases;
    int noOfTaps = attoupdate.noOfTaps;
    int onOfNominalTaps = attoupdate.onOfNominalTaps;
    int yom = attoupdate.yom;
    String make = attoupdate.make;
    DateTime dateOfTesting = attoupdate.dateOfTesting;
    DateTime updateDate = attoupdate.updateDate;
    String testedBy = attoupdate.testedBy;
    String verifiedBy = attoupdate.verifiedBy;
    String WitnessedBy = attoupdate.WitnessedBy;

    return update(aTLocalDatasourceImpl).replace(ATLocalData(
      id: id,
      databaseID: databaseID,
      etype: etype,
      trNo: trNo,
      designation: designation,
      location: location,
      serialNo: serialNo,
      rating: rating,
      ratedVoltage_HV: ratedVoltage_HV,
      ratedVoltage_LV: ratedVoltage_LV,
      ratedCurrent_HV: ratedCurrent_HV,
      ratedCurrent_LV: ratedCurrent_LV,
      vectorGroup: vectorGroup,
      impedanceVoltage: impedanceVoltage,
      frequency: frequency,
      typeOfCooling: typeOfCooling,
      noOfPhases: noOfPhases,
      noOfTaps: noOfTaps,
      onOfNominalTaps: onOfNominalTaps,
      yom: yom,
      make: make,
      dateOfTesting: dateOfTesting,
      updateDate: updateDate,
      testedBy: testedBy,
      verifiedBy: verifiedBy,
      WitnessedBy: WitnessedBy,
    ));
  }

  Future<int> deleteATById(int id) {
    return (delete(aTLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<ATLocalData>> getATLocalDatadourceImpleList() async {
    return await select(aTLocalDatasourceImpl).get();
  }

  Future<List<ATLocalData>> getATLocalDataWithtrNo(int trNo) {
    return (select(aTLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //getCTLocalDataWithSerialNo
  Future<List<ATLocalData>> getATLocalDataWithSerialNo(String sn) {
    return (select(aTLocalDatasourceImpl)..where((u) => u.serialNo.equals(sn)))
        .get();
  }

  Future<ATLocalData> getATLocalDataWithId(int id) {
    return (select(aTLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  ////////////////////////////////ATcoreIR_LocalDatasource/////////////////////////
  Future<int> createATcoreIR(ATcoreIRModel atirtolocal) {
    return into(aTcoreIRLocalDatasourceImpl)
        .insert(ATcoreIRLocalDatasourceImplCompanion.insert(
      trNo: atirtolocal.trNo,
      serialNo: atirtolocal.serialNo,
      equipmentUsed: atirtolocal.equipmentUsed,
      databaseID: atirtolocal.databaseID,
      hvE_1min: atirtolocal.hvE_1min,
      hvE_10min: atirtolocal.hvE_10min,
      hvE_PImin: atirtolocal.hvE_PImin,
      hvLV_1min: atirtolocal.hvLV_1min,
      hvLV_10min: atirtolocal.hvLV_10min,
      hvLV_PImin: atirtolocal.hvLV_PImin,
      lvE_1min: atirtolocal.lvE_1min,
      lvE_10min: atirtolocal.lvE_10min,
      lvE_PImin: atirtolocal.lvE_PImin,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateATcoreIR(ATcoreIRModel atirtoupdate, int id) {
    int databaseID = atirtoupdate.databaseID;
    int trNo = atirtoupdate.trNo;
    String serialNo = atirtoupdate.serialNo;
    String equipmentUsed = atirtoupdate.equipmentUsed;
    double hvE_1min = atirtoupdate.hvE_1min;
    double hvE_10min = atirtoupdate.hvE_10min;
    double hvE_PImin = atirtoupdate.hvE_PImin;
    double hvLV_1min = atirtoupdate.hvLV_1min;
    double hvLV_10min = atirtoupdate.hvLV_10min;
    double hvLV_PImin = atirtoupdate.hvLV_PImin;
    double lvE_1min = atirtoupdate.lvE_1min;
    double lvE_10min = atirtoupdate.lvE_10min;
    double lvE_PImin = atirtoupdate.lvE_PImin;
    DateTime updateDate = atirtoupdate.updateDate;

    return update(aTcoreIRLocalDatasourceImpl).replace(ATcoreIRLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      equipmentUsed: equipmentUsed,
      hvE_1min: hvE_1min,
      hvE_10min: hvE_10min,
      hvE_PImin: hvE_PImin,
      hvLV_1min: hvLV_1min,
      hvLV_10min: hvLV_10min,
      hvLV_PImin: hvLV_PImin,
      lvE_1min: lvE_1min,
      lvE_10min: lvE_10min,
      lvE_PImin: lvE_PImin,
      updateDate: updateDate,
    ));
  }

  Future<int> deleteATcoreIRById(int id) {
    return (delete(aTcoreIRLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<ATcoreIRLocalData> getATcoreIRLocalDataWithId(int id) {
    return (select(aTcoreIRLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get AcbCrm Equipment List
  Future<List<ATcoreIRLocalData>> getATirEquipmentListwithAll() async {
    return await select(aTcoreIRLocalDatasourceImpl).get();
  }

  //getCTcoreLocalDataWithSerialNo
  Future<List<ATcoreIRLocalData>> getATcoreLocalDataWithSerialNo(
      String serialNo) {
    return (select(aTcoreIRLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(serialNo)))
        .get();
  }

  ////////////////////////////////ATwrHv_LocalDatasource/////////////////////////
  Future<int> createATwrHv(ATwrHv_Model atwrHvtolocal) {
    return into(aTwrHvLocalDatasourceImpl)
        .insert(ATwrHv_LocalDatasourceImplCompanion.insert(
      databaseID: atwrHvtolocal.databaseID,
      trNo: atwrHvtolocal.trNo,
      serialNo: atwrHvtolocal.serialNo,
      hv_1u_1n: atwrHvtolocal.hv_1u_1n,
      hv_1v_1n: atwrHvtolocal.hv_1v_1n,
      hv_1w_1n: atwrHvtolocal.hv_1w_1n,
      tapPosition: atwrHvtolocal.tapPosition,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateATwrHv(ATwrHv_Model atwrHvtoupdate, int id) {
    int databaseID = atwrHvtoupdate.databaseID;
    int trNo = atwrHvtoupdate.trNo;
    String serialNo = atwrHvtoupdate.serialNo;
    double hv_1u_1n = atwrHvtoupdate.hv_1u_1n;
    double hv_1v_1n = atwrHvtoupdate.hv_1v_1n;
    double hv_1w_1n = atwrHvtoupdate.hv_1w_1n;
    int tapPosition = atwrHvtoupdate.tapPosition;

    return update(aTwrHvLocalDatasourceImpl).replace(ATwrHvLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      hv_1u_1n: hv_1u_1n,
      hv_1v_1n: hv_1v_1n,
      hv_1w_1n: hv_1w_1n,
      tapPosition: tapPosition,
    ));
  }

  Future<int> deleteATwrHvById(int id) {
    return (delete(aTwrHvLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //Get AcbCrm Equipment List
  Future<List<ATwrHvLocalData>> getATwrHvEquipmentListwithAll() async {
    return await select(aTwrHvLocalDatasourceImpl).get();
  }

  Future<ATwrHvLocalData> getATwrHvLocalDataWithId(int id) {
    return (select(aTwrHvLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<ATwrHvLocalData>> getATwrHvLocalDataWithtrNoID(int trNo) {
    return (select(aTwrHvLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<ATwrHvLocalData>> getATwrHvLocalDataWithSerialNo(
      String serialNo) {
    return (select(aTwrHvLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(serialNo)))
        .get();
  }

  ////////////////////////////////ATwrLv_LocalDatasource/////////////////////////
  Future<int> createATwrLv(ATwrLv_Model atwrLvtolocal) {
    return into(aTwrLvLocalDatasourceImpl)
        .insert(ATwrLv_LocalDatasourceImplCompanion.insert(
      databaseID: atwrLvtolocal.databaseID,
      trNo: atwrLvtolocal.trNo,
      serialNo: atwrLvtolocal.serialNo,
      equipmentUsed: atwrLvtolocal.equipmentUsed,
      lv_2u_2v: atwrLvtolocal.lv_2u_2v,
      lv_2v_2w: atwrLvtolocal.lv_2v_2w,
      lv_2w_2u: atwrLvtolocal.lv_2w_2u,
      tapPosition: atwrLvtolocal.tapPosition,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateATwrLv(ATwrLv_Model atwrLvtoupdate, int id) {
    int databaseID = atwrLvtoupdate.databaseID;
    int trNo = atwrLvtoupdate.trNo;
    String serialNo = atwrLvtoupdate.serialNo;
    double lv_2u_2v = atwrLvtoupdate.lv_2u_2v;
    double lv_2v_2w = atwrLvtoupdate.lv_2v_2w;
    double lv_2w_2u = atwrLvtoupdate.lv_2w_2u;
    int tapPosition = atwrLvtoupdate.tapPosition;
    String equipmentUsed = atwrLvtoupdate.equipmentUsed;
    DateTime updateDate = atwrLvtoupdate.updateDate;

    return update(aTwrLvLocalDatasourceImpl).replace(ATwrLvLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      lv_2u_2v: lv_2u_2v,
      lv_2v_2w: lv_2v_2w,
      lv_2w_2u: lv_2w_2u,
      tapPosition: tapPosition,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<int> deleteATwrLvById(int id) {
    return (delete(aTwrLvLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<ATwrLvLocalData> getATwrLvLocalDataWithId(int id) {
    return (select(aTwrLvLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<ATwrLvLocalData>> getATwrLvLocalDataWithtrNoID(int trNo) {
    return (select(aTwrLvLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get ATwrLv Equipment List
  Future<List<ATwrLvLocalData>> getATwrLvEquipmentListwithAll() async {
    return await select(aTwrLvLocalDatasourceImpl).get();
  }

  //getATwrHvLocalDataWithSerialNo
  Future<List<ATwrLvLocalData>> getATwrLvLocalDataWithSerialNo(String sNo) {
    return (select(aTwrLvLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////AT_R_LocalDatasource/////////////////////////
  Future<int> createAT_R(AT_R_Model atrtolocal) {
    return into(aTRLocalDatasourceImpl)
        .insert(AT_R_LocalDatasourceImplCompanion.insert(
      databaseID: atrtolocal.databaseID,
      trNo: atrtolocal.trNo,
      serialNo: atrtolocal.serialNo,
      equipmentUsed: atrtolocal.equipmentUsed,
      hv_1u_1v: atrtolocal.hv_1u_1v,
      hv_1v_1w: atrtolocal.hv_1v_1w,
      hv_1w_1u: atrtolocal.hv_1w_1u,
      hv_1u_1n: atrtolocal.hv_1u_1n,
      hv_1v_1n: atrtolocal.hv_1v_1n,
      hv_1w_1n: atrtolocal.hv_1w_1n,
      lv_2u_2v: atrtolocal.lv_2u_2v,
      lv_2v_2w: atrtolocal.lv_2v_2w,
      lv_2w_2u: atrtolocal.lv_2w_2u,
      lv_2u_2n: atrtolocal.lv_2u_2n,
      lv_2v_2n: atrtolocal.lv_2v_2n,
      lv_2w_2n: atrtolocal.lv_2w_2n,
      tapPosition: atrtolocal.tapPosition,

      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateAT_R(AT_R_Model atrtoupdate, int id) {
    int databaseID = atrtoupdate.databaseID;
    int trNo = atrtoupdate.trNo;
    String serialNo = atrtoupdate.serialNo;
    double hv_1u_1v = atrtoupdate.hv_1u_1v;
    double hv_1v_1w = atrtoupdate.hv_1v_1w;
    double hv_1w_1u = atrtoupdate.hv_1w_1u;
    double hv_1u_1n = atrtoupdate.hv_1u_1n;
    double hv_1v_1n = atrtoupdate.hv_1v_1n;
    double hv_1w_1n = atrtoupdate.hv_1w_1n;
    double lv_2u_2v = atrtoupdate.lv_2u_2v;
    double lv_2v_2w = atrtoupdate.lv_2v_2w;
    double lv_2w_2u = atrtoupdate.lv_2w_2u;
    double lv_2u_2n = atrtoupdate.lv_2u_2n;
    double lv_2v_2n = atrtoupdate.lv_2v_2n;
    double lv_2w_2n = atrtoupdate.lv_2w_2n;
    int tapPosition = atrtoupdate.tapPosition;
    String equipmentUsed = atrtoupdate.equipmentUsed;
    DateTime updateDate = atrtoupdate.updateDate;

    return update(aTRLocalDatasourceImpl).replace(ATrLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      hv_1u_1v: hv_1u_1v,
      hv_1v_1w: hv_1v_1w,
      hv_1w_1u: hv_1w_1u,
      hv_1u_1n: hv_1u_1n,
      hv_1v_1n: hv_1v_1n,
      hv_1w_1n: hv_1w_1n,
      lv_2u_2v: lv_2u_2v,
      lv_2v_2w: lv_2v_2w,
      lv_2w_2u: lv_2w_2u,
      lv_2u_2n: lv_2u_2n,
      lv_2v_2n: lv_2v_2n,
      lv_2w_2n: lv_2w_2n,
      tapPosition: tapPosition,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<int> deleteAT_RById(int id) {
    return (delete(aTRLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<ATrLocalData> getAT_RLocalDataWithId(int id) {
    return (select(aTRLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<ATrLocalData>> getAT_RLocalDataWithtrNoID(int trNo) {
    return (select(aTRLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //getATwrHvLocalDataWithSerialNo
  Future<List<ATrLocalData>> getAT_RLocalDataWithSerialNo(String sNo) {
    return (select(aTRLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  //Get ATrLocalData Equipment List
  Future<List<ATrLocalData>> getATrEquipmentListwithAll() async {
    return await select(aTRLocalDatasourceImpl).get();
  }

  ////////////////////////////////AT_mc_LocalDatasource/////////////////////////
  Future<int> createAT_mc(AT_mc_Model atmctolocal) {
    return into(aTMcLocalDatasourceImpl)
        .insert(AT_mc_LocalDatasourceImplCompanion.insert(
      databaseID: atmctolocal.databaseID,
      trNo: atmctolocal.trNo,
      serialNo: atmctolocal.serialNo,
      equipmentUsed: atmctolocal.equipmentUsed,
      hv_1u_1n: atmctolocal.hv_1u_1n,
      hv_1v_1n: atmctolocal.hv_1v_1n,
      hv_1w_1n: atmctolocal.hv_1w_1n,
      hv_1u: atmctolocal.hv_1u,
      hv_1v: atmctolocal.hv_1v,
      hv_1w: atmctolocal.hv_1w,
      hv_1n: atmctolocal.hv_1n,
      tapPosition: atmctolocal.tapPosition,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateAT_mc(AT_mc_Model atmctoupdate, int id) {
    int databaseID = atmctoupdate.databaseID;
    int trNo = atmctoupdate.trNo;
    String serialNo = atmctoupdate.serialNo;
    double hv_1u_1n = atmctoupdate.hv_1u_1n;
    double hv_1v_1n = atmctoupdate.hv_1v_1n;
    double hv_1w_1n = atmctoupdate.hv_1w_1n;
    double hv_1u = atmctoupdate.hv_1u;
    double hv_1v = atmctoupdate.hv_1v;
    double hv_1w = atmctoupdate.hv_1w;
    double hv_1n = atmctoupdate.hv_1n;
    int tapPosition = atmctoupdate.tapPosition;
    String equipmentUsed = atmctoupdate.equipmentUsed;
    DateTime updateDate = atmctoupdate.updateDate;

    return update(aTMcLocalDatasourceImpl).replace(ATmcLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      hv_1u_1n: hv_1u_1n,
      hv_1v_1n: hv_1v_1n,
      hv_1w_1n: hv_1w_1n,
      hv_1u: hv_1u,
      hv_1v: hv_1v,
      hv_1w: hv_1w,
      hv_1n: hv_1n,
      tapPosition: tapPosition,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<int> deleteAT_mcById(int id) {
    return (delete(aTMcLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<ATmcLocalData> getAT_mcLocalDataWithId(int id) {
    return (select(aTMcLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<ATmcLocalData>> getAT_mcLocalDataWithtrNoID(int trNo) {
    return (select(aTMcLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get ATmcLocalData Equipment List
  Future<List<ATmcLocalData>> getATmcEquipmentListwithAll() async {
    return await select(aTMcLocalDatasourceImpl).get();
  }

  Future<List<ATmcLocalData>> getAT_mcLocalDataWithSerialNo(String sNo) {
    return (select(aTMcLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////AT_mb_LocalDatasource/////////////////////////
  Future<int> createAT_mb(AT_mb_Model atmbtolocal) {
    return into(aTMbLocalDatasourceImpl)
        .insert(AT_mb_LocalDatasourceImplCompanion.insert(
      databaseID: atmbtolocal.databaseID,
      trNo: atmbtolocal.trNo,
      serialNo: atmbtolocal.serialNo,
      equipmentUsed: atmbtolocal.equipmentUsed,
      ry_hv_1u_1v: atmbtolocal.ry_hv_1u_1v,
      ry_hv_1v_1w: atmbtolocal.ry_hv_1v_1w,
      ry_hv_1w_1u: atmbtolocal.ry_hv_1w_1u,
      ry_hv_1u_1n: atmbtolocal.ry_hv_1u_1n,
      ry_hv_1v_1n: atmbtolocal.ry_hv_1v_1n,
      ry_hv_1w_1n: atmbtolocal.ry_hv_1w_1n,
      ry_lv_2u_2v: atmbtolocal.ry_lv_2u_2v,
      ry_lv_2v_2w: atmbtolocal.ry_lv_2v_2w,
      ry_lv_2w_2u: atmbtolocal.ry_lv_2w_2u,
      ry_lv_2u_2n: atmbtolocal.ry_lv_2u_2n,
      ry_lv_2v_2n: atmbtolocal.ry_lv_2v_2n,
      ry_lv_2w_2n: atmbtolocal.ry_lv_2w_2n,
      yb_hv_1u_1v: atmbtolocal.yb_hv_1u_1v,
      yb_hv_1v_1w: atmbtolocal.yb_hv_1v_1w,
      yb_hv_1w_1u: atmbtolocal.yb_hv_1w_1u,
      yb_hv_1u_1n: atmbtolocal.yb_hv_1u_1n,
      yb_hv_1v_1n: atmbtolocal.yb_hv_1v_1n,
      yb_hv_1w_1n: atmbtolocal.yb_hv_1w_1n,
      yb_lv_2u_2v: atmbtolocal.yb_lv_2u_2v,
      yb_lv_2v_2w: atmbtolocal.yb_lv_2v_2w,
      yb_lv_2w_2u: atmbtolocal.yb_lv_2w_2u,
      yb_lv_2u_2n: atmbtolocal.yb_lv_2u_2n,
      yb_lv_2v_2n: atmbtolocal.yb_lv_2v_2n,
      yb_lv_2w_2n: atmbtolocal.yb_lv_2w_2n,
      br_hv_1u_1v: atmbtolocal.br_hv_1u_1v,
      br_hv_1v_1w: atmbtolocal.br_hv_1v_1w,
      br_hv_1w_1u: atmbtolocal.br_hv_1w_1u,
      br_hv_1u_1n: atmbtolocal.br_hv_1u_1n,
      br_hv_1v_1n: atmbtolocal.br_hv_1v_1n,
      br_hv_1w_1n: atmbtolocal.br_hv_1w_1n,
      br_lv_2u_2v: atmbtolocal.br_lv_2u_2v,
      br_lv_2v_2w: atmbtolocal.br_lv_2v_2w,
      br_lv_2w_2u: atmbtolocal.br_lv_2w_2u,
      br_lv_2u_2n: atmbtolocal.br_lv_2u_2n,
      br_lv_2v_2n: atmbtolocal.br_lv_2v_2n,
      br_lv_2w_2n: atmbtolocal.br_lv_2w_2n,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateAT_mb(AT_mb_Model atmbtoupdate, int id) {
    int databaseID = atmbtoupdate.databaseID;
    int trNo = atmbtoupdate.trNo;
    String serialNo = atmbtoupdate.serialNo;
    double ry_hv_1u_1v = atmbtoupdate.ry_hv_1u_1v;
    double ry_hv_1v_1w = atmbtoupdate.ry_hv_1v_1w;
    double ry_hv_1w_1u = atmbtoupdate.ry_hv_1w_1u;
    double ry_hv_1u_1n = atmbtoupdate.ry_hv_1u_1n;
    double ry_hv_1v_1n = atmbtoupdate.ry_hv_1v_1n;
    double ry_hv_1w_1n = atmbtoupdate.ry_hv_1w_1n;
    double ry_lv_2u_2v = atmbtoupdate.ry_lv_2u_2v;
    double ry_lv_2v_2w = atmbtoupdate.ry_lv_2v_2w;
    double ry_lv_2w_2u = atmbtoupdate.ry_lv_2w_2u;
    double ry_lv_2u_2n = atmbtoupdate.ry_lv_2u_2n;
    double ry_lv_2v_2n = atmbtoupdate.ry_lv_2v_2n;
    double ry_lv_2w_2n = atmbtoupdate.ry_lv_2w_2n;
    double yb_hv_1u_1v = atmbtoupdate.yb_hv_1u_1v;
    double yb_hv_1v_1w = atmbtoupdate.yb_hv_1v_1w;
    double yb_hv_1w_1u = atmbtoupdate.yb_hv_1w_1u;
    double yb_hv_1u_1n = atmbtoupdate.yb_hv_1u_1n;
    double yb_hv_1v_1n = atmbtoupdate.yb_hv_1v_1n;
    double yb_hv_1w_1n = atmbtoupdate.yb_hv_1w_1n;
    double yb_lv_2u_2v = atmbtoupdate.yb_lv_2u_2v;
    double yb_lv_2v_2w = atmbtoupdate.yb_lv_2v_2w;
    double yb_lv_2w_2u = atmbtoupdate.yb_lv_2w_2u;
    double yb_lv_2u_2n = atmbtoupdate.yb_lv_2u_2n;
    double yb_lv_2v_2n = atmbtoupdate.yb_lv_2v_2n;
    double yb_lv_2w_2n = atmbtoupdate.yb_lv_2w_2n;
    double br_hv_1u_1v = atmbtoupdate.br_hv_1u_1v;
    double br_hv_1v_1w = atmbtoupdate.br_hv_1v_1w;
    double br_hv_1w_1u = atmbtoupdate.br_hv_1w_1u;
    double br_hv_1u_1n = atmbtoupdate.br_hv_1u_1n;
    double br_hv_1v_1n = atmbtoupdate.br_hv_1v_1n;
    double br_hv_1w_1n = atmbtoupdate.br_hv_1w_1n;
    double br_lv_2u_2v = atmbtoupdate.br_lv_2u_2v;
    double br_lv_2v_2w = atmbtoupdate.br_lv_2v_2w;
    double br_lv_2w_2u = atmbtoupdate.br_lv_2w_2u;
    double br_lv_2u_2n = atmbtoupdate.br_lv_2u_2n;
    double br_lv_2v_2n = atmbtoupdate.br_lv_2v_2n;
    double br_lv_2w_2n = atmbtoupdate.br_lv_2w_2n;
    String equipmentUsed = atmbtoupdate.equipmentUsed;
    DateTime updateDate = atmbtoupdate.updateDate;

    return update(aTMbLocalDatasourceImpl).replace(ATmbLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      ry_hv_1u_1v: ry_hv_1u_1v,
      ry_hv_1v_1w: ry_hv_1v_1w,
      ry_hv_1w_1u: ry_hv_1w_1u,
      ry_hv_1u_1n: ry_hv_1u_1n,
      ry_hv_1v_1n: ry_hv_1v_1n,
      ry_hv_1w_1n: ry_hv_1w_1n,
      ry_lv_2u_2v: ry_lv_2u_2v,
      ry_lv_2v_2w: ry_lv_2v_2w,
      ry_lv_2w_2u: ry_lv_2w_2u,
      ry_lv_2u_2n: ry_lv_2u_2n,
      ry_lv_2v_2n: ry_lv_2v_2n,
      ry_lv_2w_2n: ry_lv_2w_2n,
      yb_hv_1u_1v: yb_hv_1u_1v,
      yb_hv_1v_1w: yb_hv_1v_1w,
      yb_hv_1w_1u: yb_hv_1w_1u,
      yb_hv_1u_1n: yb_hv_1u_1n,
      yb_hv_1v_1n: yb_hv_1v_1n,
      yb_hv_1w_1n: yb_hv_1w_1n,
      yb_lv_2u_2v: yb_lv_2u_2v,
      yb_lv_2v_2w: yb_lv_2v_2w,
      yb_lv_2w_2u: yb_lv_2w_2u,
      yb_lv_2u_2n: yb_lv_2u_2n,
      yb_lv_2v_2n: yb_lv_2v_2n,
      yb_lv_2w_2n: yb_lv_2w_2n,
      br_hv_1u_1v: br_hv_1u_1v,
      br_hv_1v_1w: br_hv_1v_1w,
      br_hv_1w_1u: br_hv_1w_1u,
      br_hv_1u_1n: br_hv_1u_1n,
      br_hv_1v_1n: br_hv_1v_1n,
      br_hv_1w_1n: br_hv_1w_1n,
      br_lv_2u_2v: br_lv_2u_2v,
      br_lv_2v_2w: br_lv_2v_2w,
      br_lv_2w_2u: br_lv_2w_2u,
      br_lv_2u_2n: br_lv_2u_2n,
      br_lv_2v_2n: br_lv_2v_2n,
      br_lv_2w_2n: br_lv_2w_2n,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<int> deleteAT_mbById(int id) {
    return (delete(aTMbLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<ATmbLocalData> getAT_mbLocalDataWithId(int id) {
    return (select(aTMbLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<ATmbLocalData>> getAT_mbLocalDataWithtrNoID(int trNo) {
    return (select(aTMbLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get ATmb Equipment List
  Future<List<ATmbLocalData>> getATmbEquipmentListwithAll() async {
    return await select(aTMbLocalDatasourceImpl).get();
  }

  Future<List<ATmbLocalData>> getAT_mbLocalDataWithSerialNo(String sNo) {
    return (select(aTMbLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  //////////////////////////////////POWER-TRANSFORMER//////////////////////////////////////
  Future<int> createPowt(PowtModel powttolocal, DateTime dateOfTesting) {
    return into(powtLocalDatasourceImpl)
        .insert(PowtLocalDatasourceImplCompanion.insert(
      databaseID: powttolocal.databaseID,
      etype: powttolocal.etype,
      trNo: powttolocal.trNo,
      designation: powttolocal.designation,
      location: powttolocal.location,
      serialNo: powttolocal.serialNo,
      rating: powttolocal.rating,
      ratedVoltage_HV: powttolocal.ratedVoltage_HV,
      ratedVoltage_LV: powttolocal.ratedVoltage_LV,
      ratedCurrent_HV: powttolocal.ratedCurrent_HV,
      ratedCurrent_LV: powttolocal.ratedCurrent_LV,
      vectorGroup: powttolocal.vectorGroup,
      impedanceVoltageLTap: powttolocal.impedanceVoltageLTap,
      impedanceVoltageRTap: powttolocal.impedanceVoltageRTap,
      impedanceVoltageHTap: powttolocal.impedanceVoltageHTap,
      frequency: powttolocal.frequency,
      typeOfCooling: powttolocal.typeOfCooling,
      noOfPhases: powttolocal.noOfPhases,
      make: powttolocal.make,
      yom: powttolocal.yom,
      noOfTaps: powttolocal.noOfTaps,
      onOfNominalTaps: powttolocal.onOfNominalTaps,
      oilTemp: powttolocal.oilTemp,
      windingTemp: powttolocal.windingTemp,
      ambientTemp: powttolocal.ambientTemp,
      dateOfTesting: Value(dateOfTesting),
      testedBy: powttolocal.testedBy,
      verifiedBy: powttolocal.verifiedBy,
      WitnessedBy: powttolocal.WitnessedBy,
      //updateDate: Value(updateDate),
    ));
  }

  Future<bool> updatePowt(PowtModel powttoupdate, int id) {
    int databaseID = powttoupdate.databaseID;
    String etype = powttoupdate.etype;
    int trNo = powttoupdate.trNo;
    String designation = powttoupdate.designation;
    String location = powttoupdate.location;
    String serialNo = powttoupdate.serialNo;
    String rating = powttoupdate.rating;
    int ratedVoltage_HV = powttoupdate.ratedVoltage_HV;
    int ratedVoltage_LV = powttoupdate.ratedVoltage_LV;
    String ratedCurrent_HV = powttoupdate.ratedCurrent_HV;
    String ratedCurrent_LV = powttoupdate.ratedCurrent_LV;
    String vectorGroup = powttoupdate.vectorGroup;
    double impedanceVoltageLTap = powttoupdate.impedanceVoltageLTap;
    double impedanceVoltageRTap = powttoupdate.impedanceVoltageRTap;
    double impedanceVoltageHTap = powttoupdate.impedanceVoltageHTap;
    int frequency = powttoupdate.frequency;
    String typeOfCooling = powttoupdate.typeOfCooling;
    int noOfPhases = powttoupdate.noOfPhases;
    String make = powttoupdate.make;
    int yom = powttoupdate.yom;
    int noOfTaps = powttoupdate.noOfTaps;
    int onOfNominalTaps = powttoupdate.onOfNominalTaps;
    int oilTemp = powttoupdate.oilTemp;
    int windingTemp = powttoupdate.windingTemp;
    int ambientTemp = powttoupdate.ambientTemp;
    DateTime dateOfTesting = powttoupdate.dateOfTesting;
    DateTime updateDate = powttoupdate.updateDate;
    String testedBy = powttoupdate.testedBy;
    String verifiedBy = powttoupdate.verifiedBy;
    String WitnessedBy = powttoupdate.WitnessedBy;

    return update(powtLocalDatasourceImpl).replace(PowtLocalData(
      id: id,
      databaseID: databaseID,
      etype: etype,
      trNo: trNo,
      designation: designation,
      location: location,
      serialNo: serialNo,
      rating: rating,
      ratedVoltage_HV: ratedVoltage_HV,
      ratedVoltage_LV: ratedVoltage_LV,
      ratedCurrent_HV: ratedCurrent_HV,
      ratedCurrent_LV: ratedCurrent_LV,
      vectorGroup: vectorGroup,
      impedanceVoltageLTap: impedanceVoltageLTap,
      impedanceVoltageRTap: impedanceVoltageRTap,
      impedanceVoltageHTap: impedanceVoltageHTap,
      frequency: frequency,
      typeOfCooling: typeOfCooling,
      noOfPhases: noOfPhases,
      make: make,
      yom: yom,
      noOfTaps: noOfTaps,
      onOfNominalTaps: onOfNominalTaps,
      oilTemp: oilTemp,
      windingTemp: windingTemp,
      ambientTemp: ambientTemp,
      dateOfTesting: dateOfTesting,
      updateDate: updateDate,
      testedBy: testedBy,
      verifiedBy: verifiedBy,
      WitnessedBy: WitnessedBy,
    ));
  }

  Future<List<PowtLocalData>> getPowtLocalDataList() async {
    return await select(powtLocalDatasourceImpl).get();
  }

  Future<int> deletePowtById(int id) {
    return (delete(powtLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<PowtLocalData>> getPowtLocalDatasourceImplList() async {
    return await select(powtLocalDatasourceImpl).get();
  }

  Future<List<PowtLocalData>> getPowtLocalDataWithtrNo(int trNo) {
    return (select(powtLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //getCTLocalDataWithSerialNo
  Future<List<PowtLocalData>> getPowtLocalDataWithSerialNo(String sn) {
    return (select(powtLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sn)))
        .get();
  }

  Future<PowtLocalData> getPowtLocalDataWithId(int id) {
    return (select(powtLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  ////////////////////////////////PowtcoreIR_LocalDatasource/////////////////////////
  Future<int> createPowtcoreIR(PowtcoreIRModel powtirtolocal) {
    return into(powtcoreIRLocalDatasourceImpl)
        .insert(PowtcoreIRLocalDatasourceImplCompanion.insert(
      trNo: powtirtolocal.trNo,
      serialNo: powtirtolocal.serialNo,
      equipmentUsed: powtirtolocal.equipmentUsed,
      databaseID: powtirtolocal.databaseID,
      hvE_60: powtirtolocal.hvE_60,
      hvE_600: powtirtolocal.hvE_600,
      hvLV_60: powtirtolocal.hvLV_60,
      hvLV_600: powtirtolocal.hvLV_600,
      lvE_60: powtirtolocal.lvE_60,
      lvE_600: powtirtolocal.lvE_600,
      cE_60: powtirtolocal.cE_60,
      cT_60: powtirtolocal.cT_60,
      tE_60: powtirtolocal.tE_60,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowtcoreIR(PowtcoreIRModel powtirtoupdate, int id) {
    int databaseID = powtirtoupdate.databaseID;
    int trNo = powtirtoupdate.trNo;
    String serialNo = powtirtoupdate.serialNo;
    String equipmentUsed = powtirtoupdate.equipmentUsed;
    double hvE_60 = powtirtoupdate.hvE_60;
    double hvE_600 = powtirtoupdate.hvE_600;
    double hvLV_60 = powtirtoupdate.hvLV_60;
    double hvLV_600 = powtirtoupdate.hvLV_600;
    double lvE_60 = powtirtoupdate.lvE_60;
    double lvE_600 = powtirtoupdate.lvE_600;
    double cE_60 = powtirtoupdate.cE_60;
    double cT_60 = powtirtoupdate.cT_60;
    double tE_60 = powtirtoupdate.tE_60;
    DateTime updateDate = powtirtoupdate.updateDate;

    return update(powtcoreIRLocalDatasourceImpl).replace(PowtcoreIRLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      equipmentUsed: equipmentUsed,
      hvE_60: hvE_60,
      hvE_600: hvE_600,
      hvLV_60: hvLV_60,
      hvLV_600: hvLV_600,
      lvE_60: lvE_60,
      lvE_600: lvE_600,
      cE_60: cE_60,
      cT_60: cT_60,
      tE_60: tE_60,
      updateDate: DateTime.now(),
    ));
  }

  //getPowtIREquipmentListwithAll

  Future<int> deletePowtcoreIRById(int id) {
    return (delete(powtcoreIRLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<PowtcoreIRLocalData>> getPowtIREquipmentListwithAll() async {
    return await select(powtcoreIRLocalDatasourceImpl).get();
  }

  Future<PowtcoreIRLocalData> getPowtcoreIRLocalDataWithId(int id) {
    return (select(powtcoreIRLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<PowtcoreIRLocalData>> getPowtcoreLocalDataWithSerialNo(
      String serialNo) {
    return (select(powtcoreIRLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(serialNo)))
        .get();
  }

  ////////////////////////////////Powt_TSC_test_LocalDatasource/////////////////////////
  Future<int> createPowttsc(PowttscModel powttsctolocal) {
    return into(powttscLocalDatasourceImpl)
        .insert(PowttscLocalDatasourceImplCompanion.insert(
      databaseID: powttsctolocal.databaseID,
      trNo: powttsctolocal.trNo,
      serialNo: powttsctolocal.serialNo,
      equipmentUsed: powttsctolocal.equipmentUsed,
      hv_voltage: powttsctolocal.hv_voltage,
      hv_current: powttsctolocal.hv_current,
      tapPosition: powttsctolocal.tapPosition,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowttsc(PowttscModel powttsctoupdate, int id) {
    int databaseID = powttsctoupdate.databaseID;
    int trNo = powttsctoupdate.trNo;
    String serialNo = powttsctoupdate.serialNo;
    int hv_voltage = powttsctoupdate.hv_voltage;
    double hv_current = powttsctoupdate.hv_current;
    int tapPosition = powttsctoupdate.tapPosition;
    String equipmentUsed = powttsctoupdate.equipmentUsed;
    DateTime updateDate = powttsctoupdate.updateDate;

    return update(powttscLocalDatasourceImpl).replace(PowttscLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      hv_voltage: hv_voltage,
      hv_current: hv_current,
      tapPosition: tapPosition,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<List<PowttscLocalData>> getPowttscEquipmentListwithAll() async {
    return await select(powttscLocalDatasourceImpl).get();
  }

  Future<int> deletePowttscById(int id) {
    return (delete(powttscLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<PowttscLocalData> getPowttscLocalDataWithId(int id) {
    return (select(powttscLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<PowttscLocalData>> getPowttscLocalDataWithtrNoID(int trNo) {
    return (select(powttscLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<PowttscLocalData>> getPowttscLocalDataWithSerialNo(String sNo) {
    return (select(powttscLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////PowtwrHv_LocalDatasource/////////////////////////
  Future<int> createPowtwrHv(PowtwrHvModel powtwrhvtolocal) {
    return into(powtwrHvLocalDatasourceImpl)
        .insert(PowtwrHvLocalDatasourceImplCompanion.insert(
      databaseID: powtwrhvtolocal.databaseID,
      trNo: powtwrhvtolocal.trNo,
      serialNo: powtwrhvtolocal.serialNo,
      hv_r_1u_1vn: powtwrhvtolocal.hv_r_1u_1vn,
      hv_r_1v_1wn: powtwrhvtolocal.hv_r_1v_1wn,
      hv_r_1w_1un: powtwrhvtolocal.hv_r_1w_1un,
      tapPosition: powtwrhvtolocal.tapPosition,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowtwrHv(PowtwrHvModel powtwrhvtoupdate, int id) {
    int databaseID = powtwrhvtoupdate.databaseID;
    int trNo = powtwrhvtoupdate.trNo;
    String serialNo = powtwrhvtoupdate.serialNo;
    double hv_r_1u_1vn = powtwrhvtoupdate.hv_r_1u_1vn;
    double hv_r_1v_1wn = powtwrhvtoupdate.hv_r_1v_1wn;
    double hv_r_1w_1un = powtwrhvtoupdate.hv_r_1w_1un;
    int tapPosition = powtwrhvtoupdate.tapPosition;

    return update(powtwrHvLocalDatasourceImpl).replace(PowtwrHvLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      hv_r_1u_1vn: hv_r_1u_1vn,
      hv_r_1v_1wn: hv_r_1v_1wn,
      hv_r_1w_1un: hv_r_1w_1un,
      tapPosition: tapPosition,
    ));
  }

  Future<List<PowtwrHvLocalData>> getPowtwrHvEquipmentListwithAll() async {
    return await select(powtwrHvLocalDatasourceImpl).get();
  }

  Future<int> deletePowtwrHvById(int id) {
    return (delete(powtwrHvLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<PowtwrHvLocalData> getPowtwrHvLocalDataWithId(int id) {
    return (select(powtwrHvLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<PowtwrHvLocalData>> getPowtwrHvLocalDataWithtrNoID(int trNo) {
    return (select(powtwrHvLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<PowtwrHvLocalData>> getPowtwrHvLocalDataWithSerialNo(
      String serialNo) {
    return (select(powtwrHvLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(serialNo)))
        .get();
  }

  ////////////////////////////////PowtwrLv_LocalDatasource/////////////////////////
  Future<int> createPowtwrLv(PowtwrLvModel powtwrlvtolocal) {
    return into(powtwrLvLocalDatasourceImpl)
        .insert(PowtwrLvLocalDatasourceImplCompanion.insert(
      databaseID: powtwrlvtolocal.databaseID,
      trNo: powtwrlvtolocal.trNo,
      serialNo: powtwrlvtolocal.serialNo,
      equipmentUsed: powtwrlvtolocal.equipmentUsed,
      lv_r_2u_2vn: powtwrlvtolocal.lv_r_2u_2vn,
      lv_r_2v_2wn: powtwrlvtolocal.lv_r_2v_2wn,
      lv_r_2w_2un: powtwrlvtolocal.lv_r_2w_2un,
      tapPosition: powtwrlvtolocal.tapPosition,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowtwrLv(PowtwrLvModel powtwrlvtoupdate, int id) {
    int databaseID = powtwrlvtoupdate.databaseID;
    int trNo = powtwrlvtoupdate.trNo;
    String serialNo = powtwrlvtoupdate.serialNo;
    double lv_r_2u_2vn = powtwrlvtoupdate.lv_r_2u_2vn;
    double lv_r_2v_2wn = powtwrlvtoupdate.lv_r_2v_2wn;
    double lv_r_2w_2un = powtwrlvtoupdate.lv_r_2w_2un;
    int tapPosition = powtwrlvtoupdate.tapPosition;
    String equipmentUsed = powtwrlvtoupdate.equipmentUsed;
    DateTime updateDate = powtwrlvtoupdate.updateDate;

    return update(powtwrLvLocalDatasourceImpl).replace(PowtwrLvLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      lv_r_2u_2vn: lv_r_2u_2vn,
      lv_r_2v_2wn: lv_r_2v_2wn,
      lv_r_2w_2un: lv_r_2w_2un,
      tapPosition: tapPosition,
      equipmentUsed: equipmentUsed,
      updateDate: DateTime.now(),
    ));
  }

  Future<List<PowtwrLvLocalData>> getWrLvEquipmentListwithAll() async {
    return await select(powtwrLvLocalDatasourceImpl).get();
  }

  Future<int> deletePowtwrLvById(int id) {
    return (delete(powtwrLvLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<PowtwrLvLocalData> getPowtwrLvLocalDataWithId(int id) {
    return (select(powtwrLvLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<PowtwrLvLocalData>> getPowtwrLvLocalDataWithtrNoID(int trNo) {
    return (select(powtwrLvLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<PowtwrLvLocalData>> getPowtwrLvLocalDataWithSerialNo(String sNo) {
    return (select(powtwrLvLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////Powt_R_LocalDatasource/////////////////////////
  Future<int> createPowt_R(Powt_R_Model powtrtolocal) {
    return into(powtRLocalDatasourceImpl)
        .insert(Powt_R_LocalDatasourceImplCompanion.insert(
      databaseID: powtrtolocal.databaseID,
      trNo: powtrtolocal.trNo,
      serialNo: powtrtolocal.serialNo,
      equipmentUsed: powtrtolocal.equipmentUsed,
      hv_1u_1v: powtrtolocal.hv_1u_1v,
      hv_1v_1w: powtrtolocal.hv_1v_1w,
      hv_1w_1u: powtrtolocal.hv_1w_1u,
      hv_1u_1n: powtrtolocal.hv_1u_1n,
      hv_1v_1n: powtrtolocal.hv_1v_1n,
      hv_1w_1n: powtrtolocal.hv_1w_1n,
      lv_2u_2v: powtrtolocal.lv_2u_2v,
      lv_2v_2w: powtrtolocal.lv_2v_2w,
      lv_2w_2u: powtrtolocal.lv_2w_2u,
      lv_2u_2n: powtrtolocal.lv_2u_2n,
      lv_2v_2n: powtrtolocal.lv_2v_2n,
      lv_2w_2n: powtrtolocal.lv_2w_2n,
      tapPosition: powtrtolocal.tapPosition,

      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowt_R(Powt_R_Model powtrtoupdate, int id) {
    int databaseID = powtrtoupdate.databaseID;
    int trNo = powtrtoupdate.trNo;
    String serialNo = powtrtoupdate.serialNo;
    double hv_1u_1v = powtrtoupdate.hv_1u_1v;
    double hv_1v_1w = powtrtoupdate.hv_1v_1w;
    double hv_1w_1u = powtrtoupdate.hv_1w_1u;
    double hv_1u_1n = powtrtoupdate.hv_1u_1n;
    double hv_1v_1n = powtrtoupdate.hv_1v_1n;
    double hv_1w_1n = powtrtoupdate.hv_1w_1n;
    double lv_2u_2v = powtrtoupdate.lv_2u_2v;
    double lv_2v_2w = powtrtoupdate.lv_2v_2w;
    double lv_2w_2u = powtrtoupdate.lv_2w_2u;
    double lv_2u_2n = powtrtoupdate.lv_2u_2n;
    double lv_2v_2n = powtrtoupdate.lv_2v_2n;
    double lv_2w_2n = powtrtoupdate.lv_2w_2n;
    int tapPosition = powtrtoupdate.tapPosition;
    String equipmentUsed = powtrtoupdate.equipmentUsed;
    DateTime updateDate = powtrtoupdate.updateDate;

    return update(powtRLocalDatasourceImpl).replace(PowtrLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      hv_1u_1v: hv_1u_1v,
      hv_1v_1w: hv_1v_1w,
      hv_1w_1u: hv_1w_1u,
      hv_1u_1n: hv_1u_1n,
      hv_1v_1n: hv_1v_1n,
      hv_1w_1n: hv_1w_1n,
      lv_2u_2v: lv_2u_2v,
      lv_2v_2w: lv_2v_2w,
      lv_2w_2u: lv_2w_2u,
      lv_2u_2n: lv_2u_2n,
      lv_2v_2n: lv_2v_2n,
      lv_2w_2n: lv_2w_2n,
      tapPosition: tapPosition,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<List<PowtrLocalData>> getPowtREquipmentListwithAll() async {
    return await select(powtRLocalDatasourceImpl).get();
  }

  Future<int> deletePowt_RById(int id) {
    return (delete(powtRLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<PowtrLocalData> getPowt_RLocalDataWithId(int id) {
    return (select(powtRLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<PowtrLocalData>> getPowt_RLocalDataWithtrNoID(int trNo) {
    return (select(powtRLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<PowtrLocalData>> getPowt_RLocalDataWithSerialNo(String sNo) {
    return (select(powtRLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////Powt_mc_LocalDatasource/////////////////////////
  Future<int> createPowt_mc(Powt_mc_Model powtmctolocal) {
    return into(powtMcLocalDatasourceImpl)
        .insert(Powt_mc_LocalDatasourceImplCompanion.insert(
      databaseID: powtmctolocal.databaseID,
      trNo: powtmctolocal.trNo,
      serialNo: powtmctolocal.serialNo,
      equipmentUsed: powtmctolocal.equipmentUsed,
      hv_1u_1n: powtmctolocal.hv_1u_1n,
      hv_1v_1n: powtmctolocal.hv_1v_1n,
      hv_1w_1n: powtmctolocal.hv_1w_1n,
      hv_1u: powtmctolocal.hv_1u,
      hv_1v: powtmctolocal.hv_1v,
      hv_1w: powtmctolocal.hv_1w,
      hv_1n: powtmctolocal.hv_1n,
      tapPosition: powtmctolocal.tapPosition,

      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowt_mc(Powt_mc_Model powtmctoupdate, int id) {
    int databaseID = powtmctoupdate.databaseID;
    int trNo = powtmctoupdate.trNo;
    String serialNo = powtmctoupdate.serialNo;
    double hv_1u_1n = powtmctoupdate.hv_1u_1n;
    double hv_1v_1n = powtmctoupdate.hv_1v_1n;
    double hv_1w_1n = powtmctoupdate.hv_1w_1n;
    double hv_1u = powtmctoupdate.hv_1u;
    double hv_1v = powtmctoupdate.hv_1v;
    double hv_1w = powtmctoupdate.hv_1w;
    double hv_1n = powtmctoupdate.hv_1n;
    int tapPosition = powtmctoupdate.tapPosition;
    String equipmentUsed = powtmctoupdate.equipmentUsed;
    DateTime updateDate = powtmctoupdate.updateDate;

    return update(powtMcLocalDatasourceImpl).replace(PowtmcLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      hv_1u_1n: hv_1u_1n,
      hv_1v_1n: hv_1v_1n,
      hv_1w_1n: hv_1w_1n,
      hv_1u: hv_1u,
      hv_1v: hv_1v,
      hv_1w: hv_1w,
      hv_1n: hv_1n,
      tapPosition: tapPosition,
      equipmentUsed: equipmentUsed,
      updateDate: DateTime.now(),
    ));
  }

  Future<List<PowtmcLocalData>> getPowtmcEquipmentListwithAll() async {
    return await select(powtMcLocalDatasourceImpl).get();
  }

  Future<int> deletePowt_mcById(int id) {
    return (delete(powtMcLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<PowtmcLocalData> getPowt_mcLocalDataWithId(int id) {
    return (select(powtMcLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<PowtmcLocalData>> getPowt_mcLocalDataWithtrNoID(int trNo) {
    return (select(powtMcLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<PowtmcLocalData>> getPowt_mcLocalDataWithSerialNo(String sNo) {
    return (select(powtMcLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////Powt_mb_LocalDatasource/////////////////////////
  Future<int> createPowt_mb(Powt_mb_Model powtmbtolocal) {
    return into(powtMbLocalDatasourceImpl)
        .insert(Powt_mb_LocalDatasourceImplCompanion.insert(
      databaseID: powtmbtolocal.databaseID,
      trNo: powtmbtolocal.trNo,
      serialNo: powtmbtolocal.serialNo,
      equipmentUsed: powtmbtolocal.equipmentUsed,
      ry_hv_1u_1v: powtmbtolocal.ry_hv_1u_1v,
      ry_hv_1v_1w: powtmbtolocal.ry_hv_1v_1w,
      ry_hv_1w_1u: powtmbtolocal.ry_hv_1w_1u,
      ry_hv_1u_1n: powtmbtolocal.ry_hv_1u_1n,
      ry_hv_1v_1n: powtmbtolocal.ry_hv_1v_1n,
      ry_hv_1w_1n: powtmbtolocal.ry_hv_1w_1n,
      ry_lv_2u_2v: powtmbtolocal.ry_lv_2u_2v,
      ry_lv_2v_2w: powtmbtolocal.ry_lv_2v_2w,
      ry_lv_2w_2u: powtmbtolocal.ry_lv_2w_2u,
      ry_lv_2u_2n: powtmbtolocal.ry_lv_2u_2n,
      ry_lv_2v_2n: powtmbtolocal.ry_lv_2v_2n,
      ry_lv_2w_2n: powtmbtolocal.ry_lv_2w_2n,
      yb_hv_1u_1v: powtmbtolocal.yb_hv_1u_1v,
      yb_hv_1v_1w: powtmbtolocal.yb_hv_1v_1w,
      yb_hv_1w_1u: powtmbtolocal.yb_hv_1w_1u,
      yb_hv_1u_1n: powtmbtolocal.yb_hv_1u_1n,
      yb_hv_1v_1n: powtmbtolocal.yb_hv_1v_1n,
      yb_hv_1w_1n: powtmbtolocal.yb_hv_1w_1n,
      yb_lv_2u_2v: powtmbtolocal.yb_lv_2u_2v,
      yb_lv_2v_2w: powtmbtolocal.yb_lv_2v_2w,
      yb_lv_2w_2u: powtmbtolocal.yb_lv_2w_2u,
      yb_lv_2u_2n: powtmbtolocal.yb_lv_2u_2n,
      yb_lv_2v_2n: powtmbtolocal.yb_lv_2v_2n,
      yb_lv_2w_2n: powtmbtolocal.yb_lv_2w_2n,
      br_hv_1u_1v: powtmbtolocal.br_hv_1u_1v,
      br_hv_1v_1w: powtmbtolocal.br_hv_1v_1w,
      br_hv_1w_1u: powtmbtolocal.br_hv_1w_1u,
      br_hv_1u_1n: powtmbtolocal.br_hv_1u_1n,
      br_hv_1v_1n: powtmbtolocal.br_hv_1v_1n,
      br_hv_1w_1n: powtmbtolocal.br_hv_1w_1n,
      br_lv_2u_2v: powtmbtolocal.br_lv_2u_2v,
      br_lv_2v_2w: powtmbtolocal.br_lv_2v_2w,
      br_lv_2w_2u: powtmbtolocal.br_lv_2w_2u,
      br_lv_2u_2n: powtmbtolocal.br_lv_2u_2n,
      br_lv_2v_2n: powtmbtolocal.br_lv_2v_2n,
      br_lv_2w_2n: powtmbtolocal.br_lv_2w_2n,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowt_mb(Powt_mb_Model powtmbtoupdate, int id) {
    int databaseID = powtmbtoupdate.databaseID;
    int trNo = powtmbtoupdate.trNo;
    String serialNo = powtmbtoupdate.serialNo;
    double ry_hv_1u_1v = powtmbtoupdate.ry_hv_1u_1v;
    double ry_hv_1v_1w = powtmbtoupdate.ry_hv_1v_1w;
    double ry_hv_1w_1u = powtmbtoupdate.ry_hv_1w_1u;
    double ry_hv_1u_1n = powtmbtoupdate.ry_hv_1u_1n;
    double ry_hv_1v_1n = powtmbtoupdate.ry_hv_1v_1n;
    double ry_hv_1w_1n = powtmbtoupdate.ry_hv_1w_1n;
    double ry_lv_2u_2v = powtmbtoupdate.ry_lv_2u_2v;
    double ry_lv_2v_2w = powtmbtoupdate.ry_lv_2v_2w;
    double ry_lv_2w_2u = powtmbtoupdate.ry_lv_2w_2u;
    double ry_lv_2u_2n = powtmbtoupdate.ry_lv_2u_2n;
    double ry_lv_2v_2n = powtmbtoupdate.ry_lv_2v_2n;
    double ry_lv_2w_2n = powtmbtoupdate.ry_lv_2w_2n;
    double yb_hv_1u_1v = powtmbtoupdate.yb_hv_1u_1v;
    double yb_hv_1v_1w = powtmbtoupdate.yb_hv_1v_1w;
    double yb_hv_1w_1u = powtmbtoupdate.yb_hv_1w_1u;
    double yb_hv_1u_1n = powtmbtoupdate.yb_hv_1u_1n;
    double yb_hv_1v_1n = powtmbtoupdate.yb_hv_1v_1n;
    double yb_hv_1w_1n = powtmbtoupdate.yb_hv_1w_1n;
    double yb_lv_2u_2v = powtmbtoupdate.yb_lv_2u_2v;
    double yb_lv_2v_2w = powtmbtoupdate.yb_lv_2v_2w;
    double yb_lv_2w_2u = powtmbtoupdate.yb_lv_2w_2u;
    double yb_lv_2u_2n = powtmbtoupdate.yb_lv_2u_2n;
    double yb_lv_2v_2n = powtmbtoupdate.yb_lv_2v_2n;
    double yb_lv_2w_2n = powtmbtoupdate.yb_lv_2w_2n;
    double br_hv_1u_1v = powtmbtoupdate.br_hv_1u_1v;
    double br_hv_1v_1w = powtmbtoupdate.br_hv_1v_1w;
    double br_hv_1w_1u = powtmbtoupdate.br_hv_1w_1u;
    double br_hv_1u_1n = powtmbtoupdate.br_hv_1u_1n;
    double br_hv_1v_1n = powtmbtoupdate.br_hv_1v_1n;
    double br_hv_1w_1n = powtmbtoupdate.br_hv_1w_1n;
    double br_lv_2u_2v = powtmbtoupdate.br_lv_2u_2v;
    double br_lv_2v_2w = powtmbtoupdate.br_lv_2v_2w;
    double br_lv_2w_2u = powtmbtoupdate.br_lv_2w_2u;
    double br_lv_2u_2n = powtmbtoupdate.br_lv_2u_2n;
    double br_lv_2v_2n = powtmbtoupdate.br_lv_2v_2n;
    double br_lv_2w_2n = powtmbtoupdate.br_lv_2w_2n;
    String equipmentUsed = powtmbtoupdate.equipmentUsed;
    DateTime updateDate = powtmbtoupdate.updateDate;

    return update(powtMbLocalDatasourceImpl).replace(PowtmbLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      ry_hv_1u_1v: ry_hv_1u_1v,
      ry_hv_1v_1w: ry_hv_1v_1w,
      ry_hv_1w_1u: ry_hv_1w_1u,
      ry_hv_1u_1n: ry_hv_1u_1n,
      ry_hv_1v_1n: ry_hv_1v_1n,
      ry_hv_1w_1n: ry_hv_1w_1n,
      ry_lv_2u_2v: ry_lv_2u_2v,
      ry_lv_2v_2w: ry_lv_2v_2w,
      ry_lv_2w_2u: ry_lv_2w_2u,
      ry_lv_2u_2n: ry_lv_2u_2n,
      ry_lv_2v_2n: ry_lv_2v_2n,
      ry_lv_2w_2n: ry_lv_2w_2n,
      yb_hv_1u_1v: yb_hv_1u_1v,
      yb_hv_1v_1w: yb_hv_1v_1w,
      yb_hv_1w_1u: yb_hv_1w_1u,
      yb_hv_1u_1n: yb_hv_1u_1n,
      yb_hv_1v_1n: yb_hv_1v_1n,
      yb_hv_1w_1n: yb_hv_1w_1n,
      yb_lv_2u_2v: yb_lv_2u_2v,
      yb_lv_2v_2w: yb_lv_2v_2w,
      yb_lv_2w_2u: yb_lv_2w_2u,
      yb_lv_2u_2n: yb_lv_2u_2n,
      yb_lv_2v_2n: yb_lv_2v_2n,
      yb_lv_2w_2n: yb_lv_2w_2n,
      br_hv_1u_1v: br_hv_1u_1v,
      br_hv_1v_1w: br_hv_1v_1w,
      br_hv_1w_1u: br_hv_1w_1u,
      br_hv_1u_1n: br_hv_1u_1n,
      br_hv_1v_1n: br_hv_1v_1n,
      br_hv_1w_1n: br_hv_1w_1n,
      br_lv_2u_2v: br_lv_2u_2v,
      br_lv_2v_2w: br_lv_2v_2w,
      br_lv_2w_2u: br_lv_2w_2u,
      br_lv_2u_2n: br_lv_2u_2n,
      br_lv_2v_2n: br_lv_2v_2n,
      br_lv_2w_2n: br_lv_2w_2n,
      equipmentUsed: equipmentUsed,
      updateDate: DateTime.now(),
    ));
  }

  Future<List<PowtmbLocalData>> getPowtmbEquipmentListwithAll() async {
    return await select(powtMbLocalDatasourceImpl).get();
  }

  Future<int> deletePowt_mbById(int id) {
    return (delete(powtMbLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<PowtmbLocalData> getPowt_mbLocalDataWithId(int id) {
    return (select(powtMbLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<PowtmbLocalData>> getPowt_mbLocalDataWithtrNoID(int trNo) {
    return (select(powtMbLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<PowtmbLocalData>> getPowt_mbLocalDataWithSerialNo(String sNo) {
    return (select(powtMbLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////Powtsc_LocalDatasource/////////////////////////
  Future<int> createPowtsc(PowtscModel powtsctolocal) {
    return into(powtscLocalDatasourceImpl)
        .insert(PowtscLocalDatasourceImplCompanion.insert(
      databaseID: powtsctolocal.databaseID,
      trNo: powtsctolocal.trNo,
      serialNo: powtsctolocal.serialNo,
      equipmentUsed: powtsctolocal.equipmentUsed,
      hv_1u: powtsctolocal.hv_1u,
      hv_1v: powtsctolocal.hv_1v,
      hv_1w: powtsctolocal.hv_1w,
      hv_1n: powtsctolocal.hv_1n,
      lv_2u: powtsctolocal.lv_2u,
      lv_2v: powtsctolocal.lv_2v,
      lv_2w: powtsctolocal.lv_2w,
      lv_2n: powtsctolocal.lv_2n,
      tapPosition: powtsctolocal.tapPosition,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowtsc(PowtscModel powtsctoupdate, int id) {
    int databaseID = powtsctoupdate.databaseID;
    int trNo = powtsctoupdate.trNo;
    String serialNo = powtsctoupdate.serialNo;
    double hv_1u = powtsctoupdate.hv_1u;
    double hv_1v = powtsctoupdate.hv_1v;
    double hv_1w = powtsctoupdate.hv_1w;
    double hv_1n = powtsctoupdate.hv_1n;
    double lv_2u = powtsctoupdate.lv_2u;
    double lv_2v = powtsctoupdate.lv_2v;
    double lv_2w = powtsctoupdate.lv_2w;
    double lv_2n = powtsctoupdate.lv_2n;
    int tapPosition = powtsctoupdate.tapPosition;
    String equipmentUsed = powtsctoupdate.equipmentUsed;
    DateTime updateDate = powtsctoupdate.updateDate;

    return update(powtscLocalDatasourceImpl).replace(PowtscLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      hv_1u: hv_1u,
      hv_1v: hv_1v,
      hv_1w: hv_1w,
      hv_1n: hv_1n,
      lv_2u: lv_2u,
      lv_2v: lv_2v,
      lv_2w: lv_2w,
      lv_2n: lv_2n,
      tapPosition: tapPosition,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<int> deletePowtscById(int id) {
    return (delete(powtscLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<PowtscLocalData>> getPowtscEquipmentListwithAll() async {
    return await select(powtscLocalDatasourceImpl).get();
  }

  Future<PowtscLocalData> getPowtscLocalDataWithId(int id) {
    return (select(powtscLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<PowtscLocalData>> getPowtscLocalDataWithtrNoID(int trNo) {
    return (select(powtscLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //getATwrHvLocalDataWithSerialNo
  Future<List<PowtscLocalData>> getPowtscLocalDataWithSerialNo(String sNo) {
    return (select(powtscLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////PowtbNamePlate_LocalDatasource/////////////////////////
  Future<int> createPowtbNamePlate(PowtbNamePlateModel powtbnameplatetolocal) {
    return into(powtbNamePlateLocalDatasourceImpl)
        .insert(PowtbNamePlateLocalDatasourceImplCompanion.insert(
      databaseID: powtbnameplatetolocal.databaseID,
      trNo: powtbnameplatetolocal.trNo,
      serialNo: powtbnameplatetolocal.serialNo,
      R_serialNo: powtbnameplatetolocal.R_serialNo,
      R_ratedVoltage: powtbnameplatetolocal.R_ratedVoltage,
      R_ratedCurrent: powtbnameplatetolocal.R_ratedCurrent,
      R_Make: powtbnameplatetolocal.R_Make,
      Y_serialNo: powtbnameplatetolocal.Y_serialNo,
      Y_ratedVoltage: powtbnameplatetolocal.Y_ratedVoltage,
      Y_ratedCurrent: powtbnameplatetolocal.Y_ratedCurrent,
      Y_Make: powtbnameplatetolocal.Y_Make,
      B_serialNo: powtbnameplatetolocal.B_serialNo,
      B_ratedVoltage: powtbnameplatetolocal.B_ratedVoltage,
      B_ratedCurrent: powtbnameplatetolocal.B_ratedCurrent,
      B_Make: powtbnameplatetolocal.B_Make,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowtbNamePlate(
      PowtbNamePlateModel powtbnameplatetoupdate, int id) {
    int databaseID = powtbnameplatetoupdate.databaseID;
    int trNo = powtbnameplatetoupdate.trNo;
    String serialNo = powtbnameplatetoupdate.serialNo;
    String R_serialNo = powtbnameplatetoupdate.R_serialNo;
    int R_ratedVoltage = powtbnameplatetoupdate.R_ratedVoltage;
    int R_ratedCurrent = powtbnameplatetoupdate.R_ratedCurrent;
    String R_Make = powtbnameplatetoupdate.R_Make;
    String Y_serialNo = powtbnameplatetoupdate.Y_serialNo;
    int Y_ratedVoltage = powtbnameplatetoupdate.Y_ratedVoltage;
    int Y_ratedCurrent = powtbnameplatetoupdate.Y_ratedCurrent;
    String Y_Make = powtbnameplatetoupdate.Y_Make;
    String B_serialNo = powtbnameplatetoupdate.B_serialNo;
    int B_ratedVoltage = powtbnameplatetoupdate.B_ratedVoltage;
    int B_ratedCurrent = powtbnameplatetoupdate.B_ratedCurrent;
    String B_Make = powtbnameplatetoupdate.B_Make;

    return update(powtbNamePlateLocalDatasourceImpl)
        .replace(PowtbNamePlateLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      R_serialNo: R_serialNo,
      R_ratedVoltage: R_ratedVoltage,
      R_ratedCurrent: R_ratedCurrent,
      R_Make: R_Make,
      Y_serialNo: Y_serialNo,
      Y_ratedVoltage: Y_ratedVoltage,
      Y_ratedCurrent: Y_ratedCurrent,
      Y_Make: Y_Make,
      B_serialNo: B_serialNo,
      B_ratedVoltage: B_ratedVoltage,
      B_ratedCurrent: B_ratedCurrent,
      B_Make: B_Make,
    ));
  }

  Future<List<PowtbNamePlateLocalData>>
      getPowtbNameplateEquipmentListwithAll() async {
    return await select(powtbNamePlateLocalDatasourceImpl).get();
  }

  Future<int> deletePowtbNamePlateById(int id) {
    return (delete(powtbNamePlateLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<PowtbNamePlateLocalData> getPowtbNamePlateLocalDataWithId(int id) {
    return (select(powtbNamePlateLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<PowtbNamePlateLocalData>> getPowtbNamePlateLocalDataWithtrNoID(
      int trNo) {
    return (select(powtbNamePlateLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<PowtbNamePlateLocalData>> getPowtbNamePlateLocalDataWithSerialNo(
      String serialNo) {
    return (select(powtbNamePlateLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(serialNo)))
        .get();
  }

  ////////////////////////////////Powttd_LocalDatasource/////////////////////////
  Future<int> createPowttd(PowttdModel powttdtolocal) {
    return into(powttdLocalDatasourceImpl)
        .insert(PowttdLocalDatasourceImplCompanion.insert(
      trNo: powttdtolocal.trNo,
      serialNo: powttdtolocal.serialNo,
      equipmentUsed: powttdtolocal.equipmentUsed,
      databaseID: powttdtolocal.databaseID,
      ru1: powttdtolocal.ru1,
      ru2: powttdtolocal.ru2,
      ru3: powttdtolocal.ru3,
      ri1: powttdtolocal.ri1,
      ri2: powttdtolocal.ri2,
      ri3: powttdtolocal.ri3,
      rc1: powttdtolocal.rc1,
      rc2: powttdtolocal.rc2,
      rc3: powttdtolocal.rc3,
      rtanD1: powttdtolocal.rtanD1,
      rtanD2: powttdtolocal.rtanD2,
      rtanD3: powttdtolocal.rtanD3,
      rp1: powttdtolocal.rp1,
      rp2: powttdtolocal.rp2,
      rp3: powttdtolocal.rp3,
      rVdf1: powttdtolocal.rVdf1,
      rVdf2: powttdtolocal.rVdf2,
      rVdf3: powttdtolocal.rVdf3,
      yu1: powttdtolocal.yu1,
      yu2: powttdtolocal.yu2,
      yu3: powttdtolocal.yu3,
      yi1: powttdtolocal.yi1,
      yi2: powttdtolocal.yi2,
      yi3: powttdtolocal.yi3,
      yc1: powttdtolocal.yc1,
      yc2: powttdtolocal.yc2,
      yc3: powttdtolocal.yc3,
      ytanD1: powttdtolocal.ytanD1,
      ytanD2: powttdtolocal.ytanD2,
      ytanD3: powttdtolocal.ytanD3,
      yp1: powttdtolocal.yp1,
      yp2: powttdtolocal.yp2,
      yp3: powttdtolocal.yp3,
      yVdf1: powttdtolocal.yVdf1,
      yVdf2: powttdtolocal.yVdf2,
      yVdf3: powttdtolocal.yVdf3,
      bu1: powttdtolocal.bu1,
      bu2: powttdtolocal.bu2,
      bu3: powttdtolocal.bu3,
      bi1: powttdtolocal.bi1,
      bi2: powttdtolocal.bi2,
      bi3: powttdtolocal.bi3,
      bc1: powttdtolocal.bc1,
      bc2: powttdtolocal.bc2,
      bc3: powttdtolocal.bc3,
      btanD1: powttdtolocal.btanD1,
      btanD2: powttdtolocal.btanD2,
      btanD3: powttdtolocal.btanD3,
      bp1: powttdtolocal.bp1,
      bp2: powttdtolocal.bp2,
      bp3: powttdtolocal.bp3,
      bVdf1: powttdtolocal.bVdf1,
      bVdf2: powttdtolocal.bVdf2,
      bVdf3: powttdtolocal.bVdf3,
      hv_lv_u1: powttdtolocal.hv_lv_u1,
      hv_lv_u2: powttdtolocal.hv_lv_u2,
      hv_lv_u3: powttdtolocal.hv_lv_u3,
      hv_lv_i1: powttdtolocal.hv_lv_i1,
      hv_lv_i2: powttdtolocal.hv_lv_i2,
      hv_lv_i3: powttdtolocal.hv_lv_i3,
      hv_lv_c1: powttdtolocal.hv_lv_c1,
      hv_lv_c2: powttdtolocal.hv_lv_c2,
      hv_lv_c3: powttdtolocal.hv_lv_c3,
      hv_lv_tanD1: powttdtolocal.hv_lv_tanD1,
      hv_lv_tanD2: powttdtolocal.hv_lv_tanD2,
      hv_lv_tanD3: powttdtolocal.hv_lv_tanD3,
      hv_lv_p1: powttdtolocal.hv_lv_p1,
      hv_lv_p2: powttdtolocal.hv_lv_p2,
      hv_lv_p3: powttdtolocal.hv_lv_p3,
      hv_lv_Vdf1: powttdtolocal.hv_lv_Vdf1,
      hv_lv_Vdf2: powttdtolocal.hv_lv_Vdf2,
      hv_lv_Vdf3: powttdtolocal.hv_lv_Vdf3,
      hvE_G_u1: powttdtolocal.hvE_G_u1,
      hvE_G_u2: powttdtolocal.hvE_G_u2,
      hvE_G_u3: powttdtolocal.hvE_G_u3,
      hvE_G_i1: powttdtolocal.hvE_G_i1,
      hvE_G_i2: powttdtolocal.hvE_G_i2,
      hvE_G_i3: powttdtolocal.hvE_G_i3,
      hvE_G_c1: powttdtolocal.hvE_G_c1,
      hvE_G_c2: powttdtolocal.hvE_G_c2,
      hvE_G_c3: powttdtolocal.hvE_G_c3,
      hvE_G_tanD1: powttdtolocal.hvE_G_tanD1,
      hvE_G_tanD2: powttdtolocal.hvE_G_tanD2,
      hvE_G_tanD3: powttdtolocal.hvE_G_tanD3,
      hvE_G_p1: powttdtolocal.hvE_G_p1,
      hvE_G_p2: powttdtolocal.hvE_G_p2,
      hvE_G_p3: powttdtolocal.hvE_G_p3,
      hvE_G_Vdf1: powttdtolocal.hvE_G_Vdf1,
      hvE_G_Vdf2: powttdtolocal.hvE_G_Vdf2,
      hvE_G_Vdf3: powttdtolocal.hvE_G_Vdf3,
      hvE_Grnd_u1: powttdtolocal.hvE_Grnd_u1,
      hvE_Grnd_u2: powttdtolocal.hvE_Grnd_u2,
      hvE_Grnd_u3: powttdtolocal.hvE_Grnd_u3,
      hvE_Grnd_i1: powttdtolocal.hvE_Grnd_i1,
      hvE_Grnd_i2: powttdtolocal.hvE_Grnd_i2,
      hvE_Grnd_i3: powttdtolocal.hvE_Grnd_i3,
      hvE_Grnd_c1: powttdtolocal.hvE_Grnd_c1,
      hvE_Grnd_c2: powttdtolocal.hvE_Grnd_c2,
      hvE_Grnd_c3: powttdtolocal.hvE_Grnd_c3,
      hvE_Grnd_tanD1: powttdtolocal.hvE_Grnd_tanD1,
      hvE_Grnd_tanD2: powttdtolocal.hvE_Grnd_tanD2,
      hvE_Grnd_tanD3: powttdtolocal.hvE_Grnd_tanD3,
      hvE_Grnd_p1: powttdtolocal.hvE_Grnd_p1,
      hvE_Grnd_p2: powttdtolocal.hvE_Grnd_p2,
      hvE_Grnd_p3: powttdtolocal.hvE_Grnd_p3,
      hvE_Grnd_Vdf1: powttdtolocal.hvE_Grnd_Vdf1,
      hvE_Grnd_Vdf2: powttdtolocal.hvE_Grnd_Vdf2,
      hvE_Grnd_Vdf3: powttdtolocal.hvE_Grnd_Vdf3,
      lvEu1: powttdtolocal.lvEu1,
      lvEu2: powttdtolocal.lvEu2,
      lvEu3: powttdtolocal.lvEu3,
      lvEi1: powttdtolocal.lvEi1,
      lvEi2: powttdtolocal.lvEi2,
      lvEi3: powttdtolocal.lvEi3,
      lvEc1: powttdtolocal.lvEc1,
      lvEc2: powttdtolocal.lvEc2,
      lvEc3: powttdtolocal.lvEc3,
      lvEtanD1: powttdtolocal.lvEtanD1,
      lvEtanD2: powttdtolocal.lvEtanD2,
      lvEtanD3: powttdtolocal.lvEtanD3,
      lvEp1: powttdtolocal.lvEp1,
      lvEp2: powttdtolocal.lvEp2,
      lvEp3: powttdtolocal.lvEp3,
      lvEVdf1: powttdtolocal.lvEVdf1,
      lvEVdf2: powttdtolocal.lvEVdf2,
      lvEVdf3: powttdtolocal.lvEVdf3,
      lvE_G_u1: powttdtolocal.lvE_G_u1,
      lvE_G_u2: powttdtolocal.lvE_G_u2,
      lvE_G_u3: powttdtolocal.lvE_G_u3,
      lvE_G_i1: powttdtolocal.lvE_G_i1,
      lvE_G_i2: powttdtolocal.lvE_G_i2,
      lvE_G_i3: powttdtolocal.lvE_G_i3,
      lvE_G_c1: powttdtolocal.lvE_G_c1,
      lvE_G_c2: powttdtolocal.lvE_G_c2,
      lvE_G_c3: powttdtolocal.lvE_G_c3,
      lvE_G_tanD1: powttdtolocal.lvE_G_tanD1,
      lvE_G_tanD2: powttdtolocal.lvE_G_tanD2,
      lvE_G_tanD3: powttdtolocal.lvE_G_tanD3,
      lvE_G_p1: powttdtolocal.lvE_G_p1,
      lvE_G_p2: powttdtolocal.lvE_G_p2,
      lvE_G_p3: powttdtolocal.lvE_G_p3,
      lvE_G_Vdf1: powttdtolocal.lvE_G_Vdf1,
      lvE_G_Vdf2: powttdtolocal.lvE_G_Vdf2,
      lvE_G_Vdf3: powttdtolocal.lvE_G_Vdf3,
      lvE_Grnd_u1: powttdtolocal.lvE_Grnd_u1,
      lvE_Grnd_u2: powttdtolocal.lvE_Grnd_u2,
      lvE_Grnd_u3: powttdtolocal.lvE_Grnd_u3,
      lvE_Grnd_i1: powttdtolocal.lvE_Grnd_i1,
      lvE_Grnd_i2: powttdtolocal.lvE_Grnd_i2,
      lvE_Grnd_i3: powttdtolocal.lvE_Grnd_i3,
      lvE_Grnd_c1: powttdtolocal.lvE_Grnd_c1,
      lvE_Grnd_c2: powttdtolocal.lvE_Grnd_c2,
      lvE_Grnd_c3: powttdtolocal.lvE_Grnd_c3,
      lvE_Grnd_tanD1: powttdtolocal.lvE_Grnd_tanD1,
      lvE_Grnd_tanD2: powttdtolocal.lvE_Grnd_tanD2,
      lvE_Grnd_tanD3: powttdtolocal.lvE_Grnd_tanD3,
      lvE_Grnd_p1: powttdtolocal.lvE_Grnd_p1,
      lvE_Grnd_p2: powttdtolocal.lvE_Grnd_p2,
      lvE_Grnd_p3: powttdtolocal.lvE_Grnd_p3,
      lvE_Grnd_Vdf1: powttdtolocal.lvE_Grnd_Vdf1,
      lvE_Grnd_Vdf2: powttdtolocal.lvE_Grnd_Vdf2,
      lvE_Grnd_Vdf3: powttdtolocal.lvE_Grnd_Vdf3,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowttd(PowttdModel powttdtoupdate, int id) {
    int databaseID = powttdtoupdate.databaseID;
    int trNo = powttdtoupdate.trNo;
    String serialNo = powttdtoupdate.serialNo;
    String equipmentUsed = powttdtoupdate.equipmentUsed;
    double ru1 = powttdtoupdate.ru1;
    double ru2 = powttdtoupdate.ru2;
    double ru3 = powttdtoupdate.ru3;
    double ri1 = powttdtoupdate.ri1;
    double ri2 = powttdtoupdate.ri2;
    double ri3 = powttdtoupdate.ri3;
    double rc1 = powttdtoupdate.rc1;
    double rc2 = powttdtoupdate.rc2;
    double rc3 = powttdtoupdate.rc3;
    double rtanD1 = powttdtoupdate.rtanD1;
    double rtanD2 = powttdtoupdate.rtanD2;
    double rtanD3 = powttdtoupdate.rtanD3;
    double rp1 = powttdtoupdate.rp1;
    double rp2 = powttdtoupdate.rp2;
    double rp3 = powttdtoupdate.rp3;
    double rVdf1 = powttdtoupdate.rVdf1;
    double rVdf2 = powttdtoupdate.rVdf2;
    double rVdf3 = powttdtoupdate.rVdf3;
    double yu1 = powttdtoupdate.yu1;
    double yu2 = powttdtoupdate.yu2;
    double yu3 = powttdtoupdate.yu3;
    double yi1 = powttdtoupdate.yi1;
    double yi2 = powttdtoupdate.yi2;
    double yi3 = powttdtoupdate.yi3;
    double yc1 = powttdtoupdate.yc1;
    double yc2 = powttdtoupdate.yc2;
    double yc3 = powttdtoupdate.yc3;
    double ytanD1 = powttdtoupdate.ytanD1;
    double ytanD2 = powttdtoupdate.ytanD2;
    double ytanD3 = powttdtoupdate.ytanD3;
    double yp1 = powttdtoupdate.yp1;
    double yp2 = powttdtoupdate.yp2;
    double yp3 = powttdtoupdate.yp3;
    double yVdf1 = powttdtoupdate.yVdf1;
    double yVdf2 = powttdtoupdate.yVdf2;
    double yVdf3 = powttdtoupdate.yVdf3;
    double bu1 = powttdtoupdate.bu1;
    double bu2 = powttdtoupdate.bu2;
    double bu3 = powttdtoupdate.bu3;
    double bi1 = powttdtoupdate.bi1;
    double bi2 = powttdtoupdate.bi2;
    double bi3 = powttdtoupdate.bi3;
    double bc1 = powttdtoupdate.bc1;
    double bc2 = powttdtoupdate.bc2;
    double bc3 = powttdtoupdate.bc3;
    double btanD1 = powttdtoupdate.btanD1;
    double btanD2 = powttdtoupdate.btanD2;
    double btanD3 = powttdtoupdate.btanD3;
    double bp1 = powttdtoupdate.bp1;
    double bp2 = powttdtoupdate.bp2;
    double bp3 = powttdtoupdate.bp3;
    double bVdf1 = powttdtoupdate.bVdf1;
    double bVdf2 = powttdtoupdate.bVdf2;
    double bVdf3 = powttdtoupdate.bVdf3;
    double hv_lv_u1 = powttdtoupdate.hv_lv_u1;
    double hv_lv_u2 = powttdtoupdate.hv_lv_u2;
    double hv_lv_u3 = powttdtoupdate.hv_lv_u3;
    double hv_lv_i1 = powttdtoupdate.hv_lv_i1;
    double hv_lv_i2 = powttdtoupdate.hv_lv_i2;
    double hv_lv_i3 = powttdtoupdate.hv_lv_i3;
    double hv_lv_c1 = powttdtoupdate.hv_lv_c1;
    double hv_lv_c2 = powttdtoupdate.hv_lv_c2;
    double hv_lv_c3 = powttdtoupdate.hv_lv_c3;
    double hv_lv_tanD1 = powttdtoupdate.hv_lv_tanD1;
    double hv_lv_tanD2 = powttdtoupdate.hv_lv_tanD2;
    double hv_lv_tanD3 = powttdtoupdate.hv_lv_tanD3;
    double hv_lv_p1 = powttdtoupdate.hv_lv_p1;
    double hv_lv_p2 = powttdtoupdate.hv_lv_p2;
    double hv_lv_p3 = powttdtoupdate.hv_lv_p3;
    double hv_lv_Vdf1 = powttdtoupdate.hv_lv_Vdf1;
    double hv_lv_Vdf2 = powttdtoupdate.hv_lv_Vdf2;
    double hv_lv_Vdf3 = powttdtoupdate.hv_lv_Vdf3;
    double hvE_G_u1 = powttdtoupdate.hvE_G_u1;
    double hvE_G_u2 = powttdtoupdate.hvE_G_u2;
    double hvE_G_u3 = powttdtoupdate.hvE_G_u3;
    double hvE_G_i1 = powttdtoupdate.hvE_G_i1;
    double hvE_G_i2 = powttdtoupdate.hvE_G_i2;
    double hvE_G_i3 = powttdtoupdate.hvE_G_i3;
    double hvE_G_c1 = powttdtoupdate.hvE_G_c1;
    double hvE_G_c2 = powttdtoupdate.hvE_G_c2;
    double hvE_G_c3 = powttdtoupdate.hvE_G_c3;
    double hvE_G_tanD1 = powttdtoupdate.hvE_G_tanD1;
    double hvE_G_tanD2 = powttdtoupdate.hvE_G_tanD2;
    double hvE_G_tanD3 = powttdtoupdate.hvE_G_tanD3;
    double hvE_G_p1 = powttdtoupdate.hvE_G_p1;
    double hvE_G_p2 = powttdtoupdate.hvE_G_p2;
    double hvE_G_p3 = powttdtoupdate.hvE_G_p3;
    double hvE_G_Vdf1 = powttdtoupdate.hvE_G_Vdf1;
    double hvE_G_Vdf2 = powttdtoupdate.hvE_G_Vdf2;
    double hvE_G_Vdf3 = powttdtoupdate.hvE_G_Vdf3;
    double hvE_Grnd_u1 = powttdtoupdate.hvE_Grnd_u1;
    double hvE_Grnd_u2 = powttdtoupdate.hvE_Grnd_u2;
    double hvE_Grnd_u3 = powttdtoupdate.hvE_Grnd_u3;
    double hvE_Grnd_i1 = powttdtoupdate.hvE_Grnd_i1;
    double hvE_Grnd_i2 = powttdtoupdate.hvE_Grnd_i2;
    double hvE_Grnd_i3 = powttdtoupdate.hvE_Grnd_i3;
    double hvE_Grnd_c1 = powttdtoupdate.hvE_Grnd_c1;
    double hvE_Grnd_c2 = powttdtoupdate.hvE_Grnd_c2;
    double hvE_Grnd_c3 = powttdtoupdate.hvE_Grnd_c3;
    double hvE_Grnd_tanD1 = powttdtoupdate.hvE_Grnd_tanD1;
    double hvE_Grnd_tanD2 = powttdtoupdate.hvE_Grnd_tanD2;
    double hvE_Grnd_tanD3 = powttdtoupdate.hvE_Grnd_tanD3;
    double hvE_Grnd_p1 = powttdtoupdate.hvE_Grnd_p1;
    double hvE_Grnd_p2 = powttdtoupdate.hvE_Grnd_p2;
    double hvE_Grnd_p3 = powttdtoupdate.hvE_Grnd_p3;
    double hvE_Grnd_Vdf1 = powttdtoupdate.hvE_Grnd_Vdf1;
    double hvE_Grnd_Vdf2 = powttdtoupdate.hvE_Grnd_Vdf2;
    double hvE_Grnd_Vdf3 = powttdtoupdate.hvE_Grnd_Vdf3;
    double lvEu1 = powttdtoupdate.lvEu1;
    double lvEu2 = powttdtoupdate.lvEu2;
    double lvEu3 = powttdtoupdate.lvEu3;
    double lvEi1 = powttdtoupdate.lvEi1;
    double lvEi2 = powttdtoupdate.lvEi2;
    double lvEi3 = powttdtoupdate.lvEi3;
    double lvEc1 = powttdtoupdate.lvEc1;
    double lvEc2 = powttdtoupdate.lvEc2;
    double lvEc3 = powttdtoupdate.lvEc3;
    double lvEtanD1 = powttdtoupdate.lvEtanD1;
    double lvEtanD2 = powttdtoupdate.lvEtanD2;
    double lvEtanD3 = powttdtoupdate.lvEtanD3;
    double lvEp1 = powttdtoupdate.lvEp1;
    double lvEp2 = powttdtoupdate.lvEp2;
    double lvEp3 = powttdtoupdate.lvEp3;
    double lvEVdf1 = powttdtoupdate.lvEVdf1;
    double lvEVdf2 = powttdtoupdate.lvEVdf2;
    double lvEVdf3 = powttdtoupdate.lvEVdf3;
    double lvE_G_u1 = powttdtoupdate.lvE_G_u1;
    double lvE_G_u2 = powttdtoupdate.lvE_G_u2;
    double lvE_G_u3 = powttdtoupdate.lvE_G_u3;
    double lvE_G_i1 = powttdtoupdate.lvE_G_i1;
    double lvE_G_i2 = powttdtoupdate.lvE_G_i2;
    double lvE_G_i3 = powttdtoupdate.lvE_G_i3;
    double lvE_G_c1 = powttdtoupdate.lvE_G_c1;
    double lvE_G_c2 = powttdtoupdate.lvE_G_c2;
    double lvE_G_c3 = powttdtoupdate.lvE_G_c3;
    double lvE_G_tanD1 = powttdtoupdate.lvE_G_tanD1;
    double lvE_G_tanD2 = powttdtoupdate.lvE_G_tanD2;
    double lvE_G_tanD3 = powttdtoupdate.lvE_G_tanD3;
    double lvE_G_p1 = powttdtoupdate.lvE_G_p1;
    double lvE_G_p2 = powttdtoupdate.lvE_G_p2;
    double lvE_G_p3 = powttdtoupdate.lvE_G_p3;
    double lvE_G_Vdf1 = powttdtoupdate.lvE_G_Vdf1;
    double lvE_G_Vdf2 = powttdtoupdate.lvE_G_Vdf2;
    double lvE_G_Vdf3 = powttdtoupdate.lvE_G_Vdf3;
    double lvE_Grnd_u1 = powttdtoupdate.lvE_Grnd_u1;
    double lvE_Grnd_u2 = powttdtoupdate.lvE_Grnd_u2;
    double lvE_Grnd_u3 = powttdtoupdate.lvE_Grnd_u3;
    double lvE_Grnd_i1 = powttdtoupdate.lvE_Grnd_i1;
    double lvE_Grnd_i2 = powttdtoupdate.lvE_Grnd_i2;
    double lvE_Grnd_i3 = powttdtoupdate.lvE_Grnd_i3;
    double lvE_Grnd_c1 = powttdtoupdate.lvE_Grnd_c1;
    double lvE_Grnd_c2 = powttdtoupdate.lvE_Grnd_c2;
    double lvE_Grnd_c3 = powttdtoupdate.lvE_Grnd_c3;
    double lvE_Grnd_tanD1 = powttdtoupdate.lvE_Grnd_tanD1;
    double lvE_Grnd_tanD2 = powttdtoupdate.lvE_Grnd_tanD2;
    double lvE_Grnd_tanD3 = powttdtoupdate.lvE_Grnd_tanD3;
    double lvE_Grnd_p1 = powttdtoupdate.lvE_Grnd_p1;
    double lvE_Grnd_p2 = powttdtoupdate.lvE_Grnd_p2;
    double lvE_Grnd_p3 = powttdtoupdate.lvE_Grnd_p3;
    double lvE_Grnd_Vdf1 = powttdtoupdate.lvE_Grnd_Vdf1;
    double lvE_Grnd_Vdf2 = powttdtoupdate.lvE_Grnd_Vdf2;
    double lvE_Grnd_Vdf3 = powttdtoupdate.lvE_Grnd_Vdf3;
    DateTime updateDate = powttdtoupdate.updateDate;

    return update(powttdLocalDatasourceImpl).replace(PowttdLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      equipmentUsed: equipmentUsed,
      ru1: ru1,
      ru2: ru2,
      ru3: ru3,
      ri1: ri1,
      ri2: ri2,
      ri3: ri3,
      rc1: rc1,
      rc2: rc2,
      rc3: rc3,
      rtanD1: rtanD1,
      rtanD2: rtanD2,
      rtanD3: rtanD3,
      rp1: rp1,
      rp2: rp2,
      rp3: rp3,
      rVdf1: rVdf1,
      rVdf2: rVdf2,
      rVdf3: rVdf3,
      yu1: yu1,
      yu2: yu2,
      yu3: yu3,
      yi1: yi1,
      yi2: yi2,
      yi3: yi3,
      yc1: yc1,
      yc2: yc2,
      yc3: yc3,
      ytanD1: ytanD1,
      ytanD2: ytanD2,
      ytanD3: ytanD3,
      yp1: yp1,
      yp2: yp2,
      yp3: yp3,
      yVdf1: yVdf1,
      yVdf2: yVdf2,
      yVdf3: yVdf3,
      bu1: bu1,
      bu2: bu2,
      bu3: bu3,
      bi1: bi1,
      bi2: bi2,
      bi3: bi3,
      bc1: bc1,
      bc2: bc2,
      bc3: bc3,
      btanD1: btanD1,
      btanD2: btanD2,
      btanD3: btanD3,
      bp1: bp1,
      bp2: bp2,
      bp3: bp3,
      bVdf1: bVdf1,
      bVdf2: bVdf2,
      bVdf3: bVdf3,
      hv_lv_u1: hv_lv_u1,
      hv_lv_u2: hv_lv_u2,
      hv_lv_u3: hv_lv_u3,
      hv_lv_i1: hv_lv_i1,
      hv_lv_i2: hv_lv_i2,
      hv_lv_i3: hv_lv_i3,
      hv_lv_c1: hv_lv_c1,
      hv_lv_c2: hv_lv_c2,
      hv_lv_c3: hv_lv_c3,
      hv_lv_tanD1: hv_lv_tanD1,
      hv_lv_tanD2: hv_lv_tanD2,
      hv_lv_tanD3: hv_lv_tanD3,
      hv_lv_p1: hv_lv_p1,
      hv_lv_p2: hv_lv_p2,
      hv_lv_p3: hv_lv_p3,
      hv_lv_Vdf1: hv_lv_Vdf1,
      hv_lv_Vdf2: hv_lv_Vdf2,
      hv_lv_Vdf3: hv_lv_Vdf3,
      hvE_G_u1: hvE_G_u1,
      hvE_G_u2: hvE_G_u2,
      hvE_G_u3: hvE_G_u3,
      hvE_G_i1: hvE_G_i1,
      hvE_G_i2: hvE_G_i2,
      hvE_G_i3: hvE_G_i3,
      hvE_G_c1: hvE_G_c1,
      hvE_G_c2: hvE_G_c2,
      hvE_G_c3: hvE_G_c3,
      hvE_G_tanD1: hvE_G_tanD1,
      hvE_G_tanD2: hvE_G_tanD2,
      hvE_G_tanD3: hvE_G_tanD3,
      hvE_G_p1: hvE_G_p1,
      hvE_G_p2: hvE_G_p2,
      hvE_G_p3: hvE_G_p3,
      hvE_G_Vdf1: hvE_G_Vdf1,
      hvE_G_Vdf2: hvE_G_Vdf2,
      hvE_G_Vdf3: hvE_G_Vdf3,
      hvE_Grnd_u1: hvE_Grnd_u1,
      hvE_Grnd_u2: hvE_Grnd_u2,
      hvE_Grnd_u3: hvE_Grnd_u3,
      hvE_Grnd_i1: hvE_Grnd_i1,
      hvE_Grnd_i2: hvE_Grnd_i2,
      hvE_Grnd_i3: hvE_Grnd_i3,
      hvE_Grnd_c1: hvE_Grnd_c1,
      hvE_Grnd_c2: hvE_Grnd_c2,
      hvE_Grnd_c3: hvE_Grnd_c3,
      hvE_Grnd_tanD1: hvE_Grnd_tanD1,
      hvE_Grnd_tanD2: hvE_Grnd_tanD2,
      hvE_Grnd_tanD3: hvE_Grnd_tanD3,
      hvE_Grnd_p1: hvE_Grnd_p1,
      hvE_Grnd_p2: hvE_Grnd_p2,
      hvE_Grnd_p3: hvE_Grnd_p3,
      hvE_Grnd_Vdf1: hvE_Grnd_Vdf1,
      hvE_Grnd_Vdf2: hvE_Grnd_Vdf2,
      hvE_Grnd_Vdf3: hvE_Grnd_Vdf3,
      lvEu1: lvEu1,
      lvEu2: lvEu2,
      lvEu3: lvEu3,
      lvEi1: lvEi1,
      lvEi2: lvEi2,
      lvEi3: lvEi3,
      lvEc1: lvEc1,
      lvEc2: lvEc2,
      lvEc3: lvEc3,
      lvEtanD1: lvEtanD1,
      lvEtanD2: lvEtanD2,
      lvEtanD3: lvEtanD3,
      lvEp1: lvEp1,
      lvEp2: lvEp2,
      lvEp3: lvEp3,
      lvEVdf1: lvEVdf1,
      lvEVdf2: lvEVdf2,
      lvEVdf3: lvEVdf3,
      lvE_G_u1: lvE_G_u1,
      lvE_G_u2: lvE_G_u2,
      lvE_G_u3: lvE_G_u3,
      lvE_G_i1: lvE_G_i1,
      lvE_G_i2: lvE_G_i2,
      lvE_G_i3: lvE_G_i3,
      lvE_G_c1: lvE_G_c1,
      lvE_G_c2: lvE_G_c2,
      lvE_G_c3: lvE_G_c3,
      lvE_G_tanD1: lvE_G_tanD1,
      lvE_G_tanD2: lvE_G_tanD2,
      lvE_G_tanD3: lvE_G_tanD3,
      lvE_G_p1: lvE_G_p1,
      lvE_G_p2: lvE_G_p2,
      lvE_G_p3: lvE_G_p3,
      lvE_G_Vdf1: lvE_G_Vdf1,
      lvE_G_Vdf2: lvE_G_Vdf2,
      lvE_G_Vdf3: lvE_G_Vdf3,
      lvE_Grnd_u1: lvE_Grnd_u1,
      lvE_Grnd_u2: lvE_Grnd_u2,
      lvE_Grnd_u3: lvE_Grnd_u3,
      lvE_Grnd_i1: lvE_Grnd_i1,
      lvE_Grnd_i2: lvE_Grnd_i2,
      lvE_Grnd_i3: lvE_Grnd_i3,
      lvE_Grnd_c1: lvE_Grnd_c1,
      lvE_Grnd_c2: lvE_Grnd_c2,
      lvE_Grnd_c3: lvE_Grnd_c3,
      lvE_Grnd_tanD1: lvE_Grnd_tanD1,
      lvE_Grnd_tanD2: lvE_Grnd_tanD2,
      lvE_Grnd_tanD3: lvE_Grnd_tanD3,
      lvE_Grnd_p1: lvE_Grnd_p1,
      lvE_Grnd_p2: lvE_Grnd_p2,
      lvE_Grnd_p3: lvE_Grnd_p3,
      lvE_Grnd_Vdf1: lvE_Grnd_Vdf1,
      lvE_Grnd_Vdf2: lvE_Grnd_Vdf2,
      lvE_Grnd_Vdf3: lvE_Grnd_Vdf3,
      updateDate: updateDate,
    ));
  }

  Future<List<PowttdLocalData>> getPowttdEquipmentListwithAll() async {
    return await select(powttdLocalDatasourceImpl).get();
  }

  Future<int> deletePowttdById(int id) {
    return (delete(powttdLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<PowttdLocalData> getPowttdLocalDataWithId(int id) {
    return (select(powttdLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<PowttdLocalData>> getPowttdLocalDataWithSerialNo(
      String serialNo) {
    return (select(powttdLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(serialNo)))
        .get();
  }

  //////////////////////////////////POWER-3-WINDING-TRANSFORMER//////////////////////////////////////
  Future<int> createPowt3Winding(
      Powt3WindingModel p3wtolocal, DateTime dateOfTesting) {
    return into(powt3WindingLocalDatasourceImpl)
        .insert(Powt3WindingLocalDatasourceImplCompanion.insert(
      databaseID: p3wtolocal.databaseID,
      etype: p3wtolocal.etype,
      trNo: p3wtolocal.trNo,
      designation: p3wtolocal.designation,
      location: p3wtolocal.location,
      serialNo: p3wtolocal.serialNo,
      rating: p3wtolocal.rating,
      ratedVoltage_HV: p3wtolocal.ratedVoltage_HV,
      ratedVoltage_LV: p3wtolocal.ratedVoltage_LV,
      ratedCurrent_HV: p3wtolocal.ratedCurrent_HV,
      ratedCurrent_LV: p3wtolocal.ratedCurrent_LV,
      ratedCurrent_TS: p3wtolocal.ratedCurrent_TS,
      ratedVoltage_TS: p3wtolocal.ratedVoltage_TS,
      vectorGroup: p3wtolocal.vectorGroup,
      impedanceVoltageLTap: p3wtolocal.impedanceVoltageLTap,
      impedanceVoltageRTap: p3wtolocal.impedanceVoltageRTap,
      impedanceVoltageHTap: p3wtolocal.impedanceVoltageHTap,
      frequency: p3wtolocal.frequency,
      typeOfCooling: p3wtolocal.typeOfCooling,
      noOfPhases: p3wtolocal.noOfPhases,
      make: p3wtolocal.make,
      yom: p3wtolocal.yom,
      noOfTaps: p3wtolocal.noOfTaps,
      onOfNominalTaps: p3wtolocal.onOfNominalTaps,
      oilTemp: p3wtolocal.oilTemp,
      windingTemp: p3wtolocal.windingTemp,
      ambientTemp: p3wtolocal.ambientTemp,
      dateOfTesting: Value(dateOfTesting),
      testedBy: p3wtolocal.testedBy,
      verifiedBy: p3wtolocal.verifiedBy,
      WitnessedBy: p3wtolocal.WitnessedBy,
      //updateDate: Value(updateDate),
    ));
  }

  Future<bool> updatePowt3Winding(Powt3WindingModel p3wtoupdate, int id) {
    int databaseID = p3wtoupdate.databaseID;
    String etype = p3wtoupdate.etype;
    int trNo = p3wtoupdate.trNo;
    String designation = p3wtoupdate.designation;
    String location = p3wtoupdate.location;
    String serialNo = p3wtoupdate.serialNo;
    String rating = p3wtoupdate.rating;
    int ratedVoltage_HV = p3wtoupdate.ratedVoltage_HV;
    int ratedVoltage_LV = p3wtoupdate.ratedVoltage_LV;
    String ratedCurrent_HV = p3wtoupdate.ratedCurrent_HV;
    String ratedCurrent_LV = p3wtoupdate.ratedCurrent_LV;
    String vectorGroup = p3wtoupdate.vectorGroup;
    double impedanceVoltageLTap = p3wtoupdate.impedanceVoltageLTap;
    double impedanceVoltageRTap = p3wtoupdate.impedanceVoltageRTap;
    double impedanceVoltageHTap = p3wtoupdate.impedanceVoltageHTap;
    String ratedCurrent_TS = p3wtoupdate.ratedCurrent_TS;
    int ratedVoltage_TS = p3wtoupdate.ratedVoltage_TS;
    int frequency = p3wtoupdate.frequency;
    String typeOfCooling = p3wtoupdate.typeOfCooling;
    int noOfPhases = p3wtoupdate.noOfPhases;
    String make = p3wtoupdate.make;
    int yom = p3wtoupdate.yom;
    int noOfTaps = p3wtoupdate.noOfTaps;
    int onOfNominalTaps = p3wtoupdate.onOfNominalTaps;
    int oilTemp = p3wtoupdate.oilTemp;
    int windingTemp = p3wtoupdate.windingTemp;
    int ambientTemp = p3wtoupdate.ambientTemp;
    DateTime dateOfTesting = p3wtoupdate.dateOfTesting;
    DateTime updateDate = p3wtoupdate.updateDate;
    String testedBy = p3wtoupdate.testedBy;
    String verifiedBy = p3wtoupdate.verifiedBy;
    String WitnessedBy = p3wtoupdate.WitnessedBy;

    return update(powt3WindingLocalDatasourceImpl)
        .replace(Powt3WindingLocalData(
      id: id,
      databaseID: databaseID,
      etype: etype,
      trNo: trNo,
      designation: designation,
      location: location,
      serialNo: serialNo,
      rating: rating,
      ratedVoltage_HV: ratedVoltage_HV,
      ratedVoltage_LV: ratedVoltage_LV,
      ratedCurrent_HV: ratedCurrent_HV,
      ratedCurrent_LV: ratedCurrent_LV,
      ratedCurrent_TS: ratedCurrent_TS,
      ratedVoltage_TS: ratedVoltage_TS,
      vectorGroup: vectorGroup,
      impedanceVoltageLTap: impedanceVoltageLTap,
      impedanceVoltageRTap: impedanceVoltageRTap,
      impedanceVoltageHTap: impedanceVoltageHTap,
      frequency: frequency,
      typeOfCooling: typeOfCooling,
      noOfPhases: noOfPhases,
      make: make,
      yom: yom,
      noOfTaps: noOfTaps,
      onOfNominalTaps: onOfNominalTaps,
      oilTemp: oilTemp,
      windingTemp: windingTemp,
      ambientTemp: ambientTemp,
      dateOfTesting: dateOfTesting,
      updateDate: updateDate,
      testedBy: testedBy,
      verifiedBy: verifiedBy,
      WitnessedBy: WitnessedBy,
    ));
  }

  // Future<List<CTLocalData>> getCTLocalDataList() async {
  //   return await select(cTLocalDatasourceImpl).get();
  // }

  Future<int> deletePowt3WindingById(int id) {
    return (delete(powt3WindingLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<Powt3WindingLocalData>>
      getPowt3WindingLocalDatasourceImplList() async {
    return await select(powt3WindingLocalDatasourceImpl).get();
  }

  Future<List<Powt3WindingLocalData>> getPowt3WindingLocalDataWithtrNo(
      int trNo) {
    return (select(powt3WindingLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<Powt3WindingLocalData>> getPowt3WinLocalDataList() async {
    return await select(powt3WindingLocalDatasourceImpl).get();
  }

  //getCTLocalDataWithSerialNo
  Future<List<Powt3WindingLocalData>> getPowt3WindingLocalDataWithSerialNo(
      String sn) {
    return (select(powt3WindingLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sn)))
        .get();
  }

  Future<Powt3WindingLocalData> getPowt3WindingLocalDataWithId(int id) {
    return (select(powt3WindingLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  ////////////////////////////////Powt3windingIR_LocalDatasource/////////////////////////
  Future<int> createPowt3winIR(Powt3winIRModel Powt3winIR_toLocal) {
    return into(powt3winIRLocalDatasourceImpl)
        .insert(Powt3winIRLocalDatasourceImplCompanion.insert(
      trNo: Powt3winIR_toLocal.trNo,
      serialNo: Powt3winIR_toLocal.serialNo,
      equipmentUsed: Powt3winIR_toLocal.equipmentUsed,
      databaseID: Powt3winIR_toLocal.databaseID,
      hvE_60: Powt3winIR_toLocal.hvE_60,
      hvE_600: Powt3winIR_toLocal.hvE_600,
      hvLv_60: Powt3winIR_toLocal.hvLv_60,
      hvLv_600: Powt3winIR_toLocal.hvLv_600,
      hvT_60: Powt3winIR_toLocal.hvT_60,
      hvT_600: Powt3winIR_toLocal.hvT_600,
      lvE_60: Powt3winIR_toLocal.lvE_60,
      lvE_600: Powt3winIR_toLocal.lvE_600,
      lvT_60: Powt3winIR_toLocal.lvT_60,
      lvT_600: Powt3winIR_toLocal.lvT_600,
      tE_60: Powt3winIR_toLocal.tE_60,
      tE_600: Powt3winIR_toLocal.tE_600,
      cF_60: Powt3winIR_toLocal.cF_60,
      cT_60: Powt3winIR_toLocal.cT_60,
      fT_60: Powt3winIR_toLocal.fT_60,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowt3winIR(
      Powt3winIRModel powt3winIR_Model_update, int id) {
    int databaseID = powt3winIR_Model_update.databaseID;
    int trNo = powt3winIR_Model_update.trNo;
    String serialNo = powt3winIR_Model_update.serialNo;
    String equipmentUsed = powt3winIR_Model_update.equipmentUsed;
    double hvE_60 = powt3winIR_Model_update.hvE_60;
    double hvE_600 = powt3winIR_Model_update.hvE_600;
    double hvLv_60 = powt3winIR_Model_update.hvLv_60;
    double hvLv_600 = powt3winIR_Model_update.hvLv_600;
    double hvT_60 = powt3winIR_Model_update.hvT_60;
    double hvT_600 = powt3winIR_Model_update.hvT_600;
    double lvE_60 = powt3winIR_Model_update.lvE_60;
    double lvE_600 = powt3winIR_Model_update.lvE_600;
    double lvT_60 = powt3winIR_Model_update.lvT_60;
    double lvT_600 = powt3winIR_Model_update.lvT_600;
    double tE_60 = powt3winIR_Model_update.tE_60;
    double tE_600 = powt3winIR_Model_update.tE_600;
    double cF_60 = powt3winIR_Model_update.cF_60;
    double cT_60 = powt3winIR_Model_update.cT_60;
    double fT_60 = powt3winIR_Model_update.fT_60;
    DateTime updateDate = powt3winIR_Model_update.updateDate;

    return update(powt3winIRLocalDatasourceImpl).replace(Powt3winIRLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      equipmentUsed: equipmentUsed,
      hvE_60: hvE_60,
      hvE_600: hvE_600,
      hvLv_60: hvLv_60,
      hvLv_600: hvLv_600,
      hvT_60: hvT_60,
      hvT_600: hvT_600,
      lvE_60: lvE_60,
      lvE_600: lvE_600,
      lvT_60: lvT_60,
      lvT_600: lvT_600,
      tE_60: tE_60,
      tE_600: tE_600,
      cF_60: cF_60,
      cT_60: cT_60,
      fT_60: fT_60,
      updateDate: updateDate,
    ));
  }

  Future<List<Powt3winIRLocalData>> getPowt3winEquipmentListwithAll() async {
    return await select(powt3winIRLocalDatasourceImpl).get();
  }

  Future<int> deletePowt3winIRById(int id) {
    return (delete(powt3winIRLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<Powt3winIRLocalData> getPowt3winIRLocalDataWithId(int id) {
    return (select(powt3winIRLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<Powt3winIRLocalData>> getPowt3winIRLocalDataWithSerialNo(
      String serialNo) {
    return (select(powt3winIRLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(serialNo)))
        .get();
  }

  ////////////////////////////////Powt_3_win_TSC_test_LocalDatasource/////////////////////////
  Future<int> createPowt3wintsc(Powt3wintscModel p3wtsctolocal) {
    return into(powt3wintscLocalDatasourceImpl)
        .insert(Powt3wintscLocalDatasourceImplCompanion.insert(
      databaseID: p3wtsctolocal.databaseID,
      trNo: p3wtsctolocal.trNo,
      serialNo: p3wtsctolocal.serialNo,
      equipmentUsed: p3wtsctolocal.equipmentUsed,
      hv_voltage: p3wtsctolocal.hv_voltage,
      hv_current_Onan: p3wtsctolocal.hv_current_Onan,
      hv_current_Onaf: p3wtsctolocal.hv_current_Onaf,
      hv_current_Ofaf: p3wtsctolocal.hv_current_Ofaf,
      tapPosition: p3wtsctolocal.tapPosition,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowt3wintsc(Powt3wintscModel p3wtsctoupdate, int id) {
    int databaseID = p3wtsctoupdate.databaseID;
    int trNo = p3wtsctoupdate.trNo;
    String serialNo = p3wtsctoupdate.serialNo;
    int hv_voltage = p3wtsctoupdate.hv_voltage;
    double hv_current_Onan = p3wtsctoupdate.hv_current_Onan;
    double hv_current_Onaf = p3wtsctoupdate.hv_current_Onaf;
    double hv_current_Ofaf = p3wtsctoupdate.hv_current_Ofaf;
    int tapPosition = p3wtsctoupdate.tapPosition;
    String equipmentUsed = p3wtsctoupdate.equipmentUsed;
    DateTime updateDate = p3wtsctoupdate.updateDate;

    return update(powt3wintscLocalDatasourceImpl).replace(Powt3wintscLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      hv_voltage: hv_voltage,
      hv_current_Onan: hv_current_Onan,
      hv_current_Onaf: hv_current_Onaf,
      hv_current_Ofaf: hv_current_Ofaf,
      tapPosition: tapPosition,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<int> deletePowt3wintscById(int id) {
    return (delete(powt3wintscLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //getpowt3wintscEquipmentListwithAll
  Future<List<Powt3wintscLocalData>>
      getpowt3wintscEquipmentListwithAll() async {
    return await select(powt3wintscLocalDatasourceImpl).get();
  }

  Future<Powt3wintscLocalData> getPowt3wintscLocalDataWithId(int id) {
    return (select(powt3wintscLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<Powt3wintscLocalData>> getPowt3wintscLocalDataWithtrNoID(
      int trNo) {
    return (select(powt3wintscLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<Powt3wintscLocalData>> getPowt3wintscLocalDataWithSerialNo(
      String sNo) {
    return (select(powt3wintscLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////Powt3winwrHv_LocalDatasource/////////////////////////
  Future<int> createPowt3winwrHv(Powt3winwrHvModel Powt3winwrHvtoLocal) {
    return into(powt3winwrHvLocalDatasourceImpl)
        .insert(Powt3winwrHvLocalDatasourceImplCompanion.insert(
      databaseID: Powt3winwrHvtoLocal.databaseID,
      trNo: Powt3winwrHvtoLocal.trNo,
      serialNo: Powt3winwrHvtoLocal.serialNo,
      hv_r_1u_1n: Powt3winwrHvtoLocal.hv_r_1u_1n,
      hv_r_1v_1n: Powt3winwrHvtoLocal.hv_r_1v_1n,
      hv_r_1w_1n: Powt3winwrHvtoLocal.hv_r_1w_1n,
      tapPosition: Powt3winwrHvtoLocal.tapPosition,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowt3winwrHv(
      Powt3winwrHvModel powt3winwrHvupdate, int id) {
    int databaseID = powt3winwrHvupdate.databaseID;
    int trNo = powt3winwrHvupdate.trNo;
    String serialNo = powt3winwrHvupdate.serialNo;
    double hv_r_1u_1n = powt3winwrHvupdate.hv_r_1u_1n;
    double hv_r_1v_1n = powt3winwrHvupdate.hv_r_1v_1n;
    double hv_r_1w_1n = powt3winwrHvupdate.hv_r_1w_1n;
    int tapPosition = powt3winwrHvupdate.tapPosition;

    return update(powt3winwrHvLocalDatasourceImpl)
        .replace(Powt3winwrHvLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      hv_r_1u_1n: hv_r_1u_1n,
      hv_r_1v_1n: hv_r_1v_1n,
      hv_r_1w_1n: hv_r_1w_1n,
      tapPosition: tapPosition,
    ));
  }

  Future<List<Powt3winwrHvLocalData>>
      getpowt3winwrHvEquipmentListwithAll() async {
    return await select(powt3winwrHvLocalDatasourceImpl).get();
  }

  Future<int> deletePowt3winwrHvById(int id) {
    return (delete(powt3winwrHvLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<Powt3winwrHvLocalData> getPowt3winwrHvLocalDataWithId(int id) {
    return (select(powt3winwrHvLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<Powt3winwrHvLocalData>> getPowt3winwrHvLocalDataWithtrNoID(
      int trNo) {
    return (select(powt3winwrHvLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<Powt3winwrHvLocalData>> getPowt3winwrHvLocalDataWithSerialNo(
      String serialNo) {
    return (select(powt3winwrHvLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(serialNo)))
        .get();
  }

  ////////////////////////////////Powt3winwrLv_LocalDatasource/////////////////////////
  Future<int> createPowt3winwrLv(Powt3winwrLvModel p3wwrlvtolocal) {
    return into(powt3winwrLvLocalDatasourceImpl)
        .insert(Powt3winwrLvLocalDatasourceImplCompanion.insert(
      databaseID: p3wwrlvtolocal.databaseID,
      trNo: p3wwrlvtolocal.trNo,
      serialNo: p3wwrlvtolocal.serialNo,
      equipmentUsed: p3wwrlvtolocal.equipmentUsed,
      lv_r_uv: p3wwrlvtolocal.lv_r_uv,
      lv_r_vw: p3wwrlvtolocal.lv_r_vw,
      lv_r_wu: p3wwrlvtolocal.lv_r_wu,
      tapPosition: p3wwrlvtolocal.tapPosition,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowt3winwrLv(Powt3winwrLvModel p3wwrlvtoupdate, int id) {
    int databaseID = p3wwrlvtoupdate.databaseID;
    int trNo = p3wwrlvtoupdate.trNo;
    String serialNo = p3wwrlvtoupdate.serialNo;
    double lv_r_uv = p3wwrlvtoupdate.lv_r_uv;
    double lv_r_vw = p3wwrlvtoupdate.lv_r_vw;
    double lv_r_wu = p3wwrlvtoupdate.lv_r_wu;
    int tapPosition = p3wwrlvtoupdate.tapPosition;
    String equipmentUsed = p3wwrlvtoupdate.equipmentUsed;
    DateTime updateDate = p3wwrlvtoupdate.updateDate;

    return update(powt3winwrLvLocalDatasourceImpl)
        .replace(Powt3winwrLvLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      lv_r_uv: lv_r_uv,
      lv_r_vw: lv_r_vw,
      lv_r_wu: lv_r_wu,
      tapPosition: tapPosition,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<int> deletePowt3winwrLvById(int id) {
    return (delete(powt3winwrLvLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<Powt3winwrLvLocalData>>
      getpowt3winwrLvEquipmentListwithAll() async {
    return await select(powt3winwrLvLocalDatasourceImpl).get();
  }

  Future<Powt3winwrLvLocalData> getPowt3winwrLvLocalDataWithId(int id) {
    return (select(powt3winwrLvLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<Powt3winwrLvLocalData>> getPowt3winwrLvLocalDataWithtrNoID(
      int trNo) {
    return (select(powt3winwrLvLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<Powt3winwrLvLocalData>> getPowt3winwrLvLocalDataWithSerialNo(
      String sNo) {
    return (select(powt3winwrLvLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////Powt3winwrIvT_LocalDatasource/////////////////////////
  Future<int> createPowt3winwrIvT(Powt3winwrIvTModel p3wwrIvittolocal) {
    return into(powt3winwrIvTLocalDatasourceImpl)
        .insert(Powt3winwrIvTLocalDatasourceImplCompanion.insert(
      databaseID: p3wwrIvittolocal.databaseID,
      trNo: p3wwrIvittolocal.trNo,
      serialNo: p3wwrIvittolocal.serialNo,
      ivt_r_uvn: p3wwrIvittolocal.ivt_r_uvn,
      ivt_r_vwn: p3wwrIvittolocal.ivt_r_vwn,
      ivt_r_wun: p3wwrIvittolocal.ivt_r_wun,
      tapPosition: p3wwrIvittolocal.tapPosition,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowt3winwrIvT(
      Powt3winwrIvTModel p3wwrIvittoupdate, int id) {
    int databaseID = p3wwrIvittoupdate.databaseID;
    int trNo = p3wwrIvittoupdate.trNo;
    String serialNo = p3wwrIvittoupdate.serialNo;
    double ivt_r_uvn = p3wwrIvittoupdate.ivt_r_uvn;
    double ivt_r_vwn = p3wwrIvittoupdate.ivt_r_vwn;
    double ivt_r_wun = p3wwrIvittoupdate.ivt_r_wun;
    int tapPosition = p3wwrIvittoupdate.tapPosition;

    return update(powt3winwrIvTLocalDatasourceImpl)
        .replace(Powt3winwrIvTLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      ivt_r_uvn: ivt_r_uvn,
      ivt_r_vwn: ivt_r_vwn,
      ivt_r_wun: ivt_r_wun,
      tapPosition: tapPosition,
    ));
  }

  Future<List<Powt3winwrIvTLocalData>>
      getPowt3winwrIvtEquipmentListwithAll() async {
    return await select(powt3winwrIvTLocalDatasourceImpl).get();
  }

  Future<int> deletePowt3winwrIvTById(int id) {
    return (delete(powt3winwrIvTLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<Powt3winwrIvTLocalData> getPowt3winwrIvTLocalDataWithId(int id) {
    return (select(powt3winwrIvTLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<Powt3winwrIvTLocalData>> getPowt3winwrIvTLocalDataWithtrNoID(
      int trNo) {
    return (select(powt3winwrIvTLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<Powt3winwrIvTLocalData>> getPowt3winwrIvTLocalDataWithSerialNo(
      String sNo) {
    return (select(powt3winwrIvTLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////Powt3win_R_LocalDatasource/////////////////////////
  Future<int> createPowt3win_R(Powt3win_R_Model p3wRtolocal) {
    return into(powt3winRLocalDatasourceImpl)
        .insert(Powt3win_R_LocalDatasourceImplCompanion.insert(
      databaseID: p3wRtolocal.databaseID,
      trNo: p3wRtolocal.trNo,
      serialNo: p3wRtolocal.serialNo,
      equipmentUsed: p3wRtolocal.equipmentUsed,
      hv_1u_1vn: p3wRtolocal.hv_1u_1vn,
      hv_1v_1wn: p3wRtolocal.hv_1v_1wn,
      hv_1w_1un: p3wRtolocal.hv_1w_1un,
      lv_uvn: p3wRtolocal.lv_uvn,
      lv_vwn: p3wRtolocal.lv_vwn,
      lv_wun: p3wRtolocal.lv_wun,
      ivt_uvn: p3wRtolocal.ivt_uvn,
      ivt_vwn: p3wRtolocal.ivt_vwn,
      ivt_wun: p3wRtolocal.ivt_wun,
      tapPosition: p3wRtolocal.tapPosition,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowt3win_R(Powt3win_R_Model p3wRtoupdate, int id) {
    int databaseID = p3wRtoupdate.databaseID;
    int trNo = p3wRtoupdate.trNo;
    String serialNo = p3wRtoupdate.serialNo;
    double hv_1u_1vn = p3wRtoupdate.hv_1u_1vn;
    double hv_1v_1wn = p3wRtoupdate.hv_1v_1wn;
    double hv_1w_1un = p3wRtoupdate.hv_1w_1un;
    double lv_uvn = p3wRtoupdate.lv_uvn;
    double lv_vwn = p3wRtoupdate.lv_vwn;
    double lv_wun = p3wRtoupdate.lv_wun;
    double ivt_uvn = p3wRtoupdate.ivt_uvn;
    double ivt_vwn = p3wRtoupdate.ivt_vwn;
    double ivt_wun = p3wRtoupdate.ivt_wun;
    int tapPosition = p3wRtoupdate.tapPosition;
    String equipmentUsed = p3wRtoupdate.equipmentUsed;
    DateTime updateDate = p3wRtoupdate.updateDate;

    return update(powt3winRLocalDatasourceImpl).replace(Powt3winrLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      hv_1u_1vn: hv_1u_1vn,
      hv_1v_1wn: hv_1v_1wn,
      hv_1w_1un: hv_1w_1un,
      lv_uvn: lv_uvn,
      lv_vwn: lv_vwn,
      lv_wun: lv_wun,
      ivt_uvn: ivt_uvn,
      ivt_vwn: ivt_vwn,
      ivt_wun: ivt_wun,
      tapPosition: tapPosition,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<List<Powt3winrLocalData>> getpowt3winREquipmentListwithAll() async {
    return await select(powt3winRLocalDatasourceImpl).get();
  }

  Future<int> deletePowt3win_RById(int id) {
    return (delete(powt3winRLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  // return (select(powt3winRLocalDatasourceImpl)..where((u) => u.id.equals(id)))
  Future<List<Powt3winrLocalData>> getPowt3win_RLocalDataWithtrNoID(int trNo) {
    return (select(powt3winRLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<Powt3winrLocalData>> getPowt3win_RLocalDataWithSerialNo(
      String sNo) {
    return (select(powt3winRLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  Future<Powt3winrLocalData> getPowt3win_RLocalDataWithId(int id) {
    return (select(powt3winRLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  ////////////////////////////////Powt3win_mcHv_LocalDatasource/////////////////////////
  Future<int> createPowt3win_mcHv(Powt3win_mcHv_Model p3wmchvtolocal) {
    return into(powt3winMcHvLocalDatasourceImpl)
        .insert(Powt3win_mcHv_LocalDatasourceImplCompanion.insert(
      databaseID: p3wmchvtolocal.databaseID,
      trNo: p3wmchvtolocal.trNo,
      serialNo: p3wmchvtolocal.serialNo,
      hv_1u_1vn: p3wmchvtolocal.hv_1u_1vn,
      hv_1v_1wn: p3wmchvtolocal.hv_1v_1wn,
      hv_1w_1un: p3wmchvtolocal.hv_1w_1un,
      hv_1u: p3wmchvtolocal.hv_1u,
      hv_1v: p3wmchvtolocal.hv_1v,
      hv_1w: p3wmchvtolocal.hv_1w,
      hv_1n: p3wmchvtolocal.hv_1n,
      tapPosition: p3wmchvtolocal.tapPosition,

      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowt3win_mcHv(
      Powt3win_mcHv_Model p3wmchvtoupdate, int id) {
    int databaseID = p3wmchvtoupdate.databaseID;
    int trNo = p3wmchvtoupdate.trNo;
    String serialNo = p3wmchvtoupdate.serialNo;
    double hv_1u_1vn = p3wmchvtoupdate.hv_1u_1vn;
    double hv_1v_1wn = p3wmchvtoupdate.hv_1v_1wn;
    double hv_1w_1un = p3wmchvtoupdate.hv_1w_1un;
    double hv_1u = p3wmchvtoupdate.hv_1u;
    double hv_1v = p3wmchvtoupdate.hv_1v;
    double hv_1w = p3wmchvtoupdate.hv_1w;
    double hv_1n = p3wmchvtoupdate.hv_1n;
    int tapPosition = p3wmchvtoupdate.tapPosition;

    return update(powt3winMcHvLocalDatasourceImpl)
        .replace(Powt3winmcHvLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      hv_1u_1vn: hv_1u_1vn,
      hv_1v_1wn: hv_1v_1wn,
      hv_1w_1un: hv_1w_1un,
      hv_1u: hv_1u,
      hv_1v: hv_1v,
      hv_1w: hv_1w,
      hv_1n: hv_1n,
      tapPosition: tapPosition,
    ));
  }

  Future<List<Powt3winmcHvLocalData>>
      getpowt3winmchvEquipmentListwithAll() async {
    return await select(powt3winMcHvLocalDatasourceImpl).get();
  }

  Future<int> deletePowt3win_mcHvById(int id) {
    return (delete(powt3winMcHvLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<Powt3winmcHvLocalData> getPowt3win_mcHvLocalDataWithId(int id) {
    return (select(powt3winMcHvLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<Powt3winmcHvLocalData>> getPowt3win_mcHvLocalDataWithtrNoID(
      int trNo) {
    return (select(powt3winMcHvLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<Powt3winmcHvLocalData>> getPowt3win_mcHvLocalDataWithSerialNo(
      String sNo) {
    return (select(powt3winMcHvLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////Powt3win_mcLv_LocalDatasource/////////////////////////
  Future<int> createPowt3win_mcLv(Powt3win_mcLv_Model p3wmclvtolocal) {
    return into(powt3winMcLvLocalDatasourceImpl)
        .insert(Powt3win_mcLv_LocalDatasourceImplCompanion.insert(
      databaseID: p3wmclvtolocal.databaseID,
      trNo: p3wmclvtolocal.trNo,
      serialNo: p3wmclvtolocal.serialNo,
      lv_u_vn: p3wmclvtolocal.lv_u_vn,
      lv_v_wn: p3wmclvtolocal.lv_v_wn,
      lv_w_un: p3wmclvtolocal.lv_w_un,
      lv_u: p3wmclvtolocal.lv_u,
      lv_v: p3wmclvtolocal.lv_v,
      lv_w: p3wmclvtolocal.lv_w,
      lv_n: p3wmclvtolocal.lv_n,
      tapPosition: p3wmclvtolocal.tapPosition,

      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowt3win_mcLv(
      Powt3win_mcLv_Model p3wmclvtoupdate, int id) {
    int databaseID = p3wmclvtoupdate.databaseID;
    int trNo = p3wmclvtoupdate.trNo;
    String serialNo = p3wmclvtoupdate.serialNo;
    double lv_u_vn = p3wmclvtoupdate.lv_u_vn;
    double lv_v_wn = p3wmclvtoupdate.lv_v_wn;
    double lv_w_un = p3wmclvtoupdate.lv_w_un;
    double lv_u = p3wmclvtoupdate.lv_u;
    double lv_v = p3wmclvtoupdate.lv_v;
    double lv_w = p3wmclvtoupdate.lv_w;
    double lv_n = p3wmclvtoupdate.lv_n;
    int tapPosition = p3wmclvtoupdate.tapPosition;

    return update(powt3winMcLvLocalDatasourceImpl)
        .replace(Powt3winmcLvLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      lv_u_vn: lv_u_vn,
      lv_v_wn: lv_v_wn,
      lv_w_un: lv_w_un,
      lv_u: lv_u,
      lv_v: lv_v,
      lv_w: lv_w,
      lv_n: lv_n,
      tapPosition: tapPosition,
    ));
  }

  Future<List<Powt3winmcLvLocalData>>
      getpowt3winmclvEquipmentListwithAll() async {
    return await select(powt3winMcLvLocalDatasourceImpl).get();
  }

  Future<int> deletePowt3win_mcLvById(int id) {
    return (delete(powt3winMcLvLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<Powt3winmcLvLocalData> getPowt3win_mcLvLocalDataWithId(int id) {
    return (select(powt3winMcLvLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<Powt3winmcLvLocalData>> getPowt3win_mcLvLocalDataWithtrNoID(
      int trNo) {
    return (select(powt3winMcLvLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<Powt3winmcLvLocalData>> getPowt3win_mcLvLocalDataWithSerialNo(
      String sNo) {
    return (select(powt3winMcLvLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////Powt3winmcIvTLocalDatasource/////////////////////////
  Future<int> createPowt3winmcIvT(Powt3winmcIvTModel p3wmcIvttolocal) {
    return into(powt3winmcIvTLocalDatasourceImpl)
        .insert(Powt3winmcIvTLocalDatasourceImplCompanion.insert(
      databaseID: p3wmcIvttolocal.databaseID,
      trNo: p3wmcIvttolocal.trNo,
      serialNo: p3wmcIvttolocal.serialNo,
      equipmentUsed: p3wmcIvttolocal.equipmentUsed,
      ivt_u_vn: p3wmcIvttolocal.ivt_u_vn,
      ivt_v_wn: p3wmcIvttolocal.ivt_v_wn,
      ivt_w_un: p3wmcIvttolocal.ivt_w_un,
      ivt_u: p3wmcIvttolocal.ivt_u,
      ivt_v: p3wmcIvttolocal.ivt_v,
      ivt_w: p3wmcIvttolocal.ivt_w,
      ivt_n: p3wmcIvttolocal.ivt_n,
      tapPosition: p3wmcIvttolocal.tapPosition,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowt3winmcIvT(
      Powt3winmcIvTModel p3wmcIvttoupdate, int id) {
    int databaseID = p3wmcIvttoupdate.databaseID;
    int trNo = p3wmcIvttoupdate.trNo;
    String serialNo = p3wmcIvttoupdate.serialNo;
    double ivt_u_vn = p3wmcIvttoupdate.ivt_u_vn;
    double ivt_v_wn = p3wmcIvttoupdate.ivt_v_wn;
    double ivt_w_un = p3wmcIvttoupdate.ivt_w_un;
    double ivt_u = p3wmcIvttoupdate.ivt_u;
    double ivt_v = p3wmcIvttoupdate.ivt_v;
    double ivt_w = p3wmcIvttoupdate.ivt_w;
    double ivt_n = p3wmcIvttoupdate.ivt_n;
    int tapPosition = p3wmcIvttoupdate.tapPosition;
    String equipmentUsed = p3wmcIvttoupdate.equipmentUsed;
    DateTime updateDate = p3wmcIvttoupdate.updateDate;

    return update(powt3winmcIvTLocalDatasourceImpl)
        .replace(Powt3winmcIvTLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      ivt_u_vn: ivt_u_vn,
      ivt_v_wn: ivt_v_wn,
      ivt_w_un: ivt_w_un,
      ivt_u: ivt_u,
      ivt_v: ivt_v,
      ivt_w: ivt_w,
      ivt_n: ivt_n,
      tapPosition: tapPosition,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<int> deletePowt3winmcIvTById(int id) {
    return (delete(powt3winmcIvTLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<Powt3winmcIvTLocalData> getPowt3winmcIvTLocalDataWithId(int id) {
    return (select(powt3winmcIvTLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<Powt3winmcIvTLocalData>> getPowt3winmcIvTLocalDataWithtrNoID(
      int trNo) {
    return (select(powt3winmcIvTLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<Powt3winmcIvTLocalData>> getPowt3winmcIvTLocalDataWithSerialNo(
      String sNo) {
    return (select(powt3winmcIvTLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  Future<List<Powt3winmcIvTLocalData>>
      getpowt3winmcIvtEquipmentListwithAll() async {
    return await select(powt3winmcIvTLocalDatasourceImpl).get();
  }

  ////////////////////////////////Powt3win_mb_LocalDatasource/////////////////////////
  Future<int> createPowt3win_mb(Powt3win_mb_Model Powt3win_mbtoLocal) {
    return into(powt3winMbLocalDatasourceImpl)
        .insert(Powt3win_mb_LocalDatasourceImplCompanion.insert(
      databaseID: Powt3win_mbtoLocal.databaseID,
      trNo: Powt3win_mbtoLocal.trNo,
      serialNo: Powt3win_mbtoLocal.serialNo,
      r_hv_un: Powt3win_mbtoLocal.r_hv_un,
      r_hv_vn: Powt3win_mbtoLocal.r_hv_vn,
      r_hv_wn: Powt3win_mbtoLocal.r_hv_wn,
      y_hv_un: Powt3win_mbtoLocal.y_hv_un,
      y_hv_vn: Powt3win_mbtoLocal.y_hv_vn,
      y_hv_wn: Powt3win_mbtoLocal.y_hv_wn,
      b_hv_un: Powt3win_mbtoLocal.b_hv_un,
      b_hv_vn: Powt3win_mbtoLocal.b_hv_vn,
      b_hv_wn: Powt3win_mbtoLocal.b_hv_wn,
      r_lv_un: Powt3win_mbtoLocal.r_lv_un,
      r_lv_vn: Powt3win_mbtoLocal.r_lv_vn,
      r_lv_wn: Powt3win_mbtoLocal.r_lv_wn,
      y_lv_un: Powt3win_mbtoLocal.y_lv_un,
      y_lv_vn: Powt3win_mbtoLocal.y_lv_vn,
      y_lv_wn: Powt3win_mbtoLocal.y_lv_wn,
      b_lv_un: Powt3win_mbtoLocal.b_lv_un,
      b_lv_vn: Powt3win_mbtoLocal.b_lv_vn,
      b_lv_wn: Powt3win_mbtoLocal.b_lv_wn,
      equipmentUsed: Powt3win_mbtoLocal.equipmentUsed,
      r_ivt_un: Powt3win_mbtoLocal.r_ivt_un,
      r_ivt_vn: Powt3win_mbtoLocal.r_ivt_vn,
      r_ivt_wn: Powt3win_mbtoLocal.r_ivt_wn,
      y_ivt_un: Powt3win_mbtoLocal.y_ivt_un,
      y_ivt_vn: Powt3win_mbtoLocal.y_ivt_vn,
      y_ivt_wn: Powt3win_mbtoLocal.y_ivt_wn,
      b_ivt_un: Powt3win_mbtoLocal.b_ivt_un,
      b_ivt_vn: Powt3win_mbtoLocal.b_ivt_vn,
      b_ivt_wn: Powt3win_mbtoLocal.b_ivt_wn,

      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowt3win_mb(Powt3win_mb_Model powtwin_mbupdate, int id) {
    int databaseID = powtwin_mbupdate.databaseID;
    int trNo = powtwin_mbupdate.trNo;
    String serialNo = powtwin_mbupdate.serialNo;
    double r_hv_un = powtwin_mbupdate.r_hv_un;
    double r_hv_vn = powtwin_mbupdate.r_hv_vn;
    double r_hv_wn = powtwin_mbupdate.r_hv_wn;
    double y_hv_un = powtwin_mbupdate.y_hv_un;
    double y_hv_vn = powtwin_mbupdate.y_hv_vn;
    double y_hv_wn = powtwin_mbupdate.y_hv_wn;
    double b_hv_un = powtwin_mbupdate.b_hv_un;
    double b_hv_vn = powtwin_mbupdate.b_hv_vn;
    double b_hv_wn = powtwin_mbupdate.b_hv_wn;
    double r_lv_un = powtwin_mbupdate.r_lv_un;
    double r_lv_vn = powtwin_mbupdate.r_lv_vn;
    double r_lv_wn = powtwin_mbupdate.r_lv_wn;
    double y_lv_un = powtwin_mbupdate.y_lv_un;
    double y_lv_vn = powtwin_mbupdate.y_lv_vn;
    double y_lv_wn = powtwin_mbupdate.y_lv_wn;
    double b_lv_un = powtwin_mbupdate.b_lv_un;
    double b_lv_vn = powtwin_mbupdate.b_lv_vn;
    double b_lv_wn = powtwin_mbupdate.b_lv_wn;
    double r_ivt_un = powtwin_mbupdate.r_ivt_un;
    double r_ivt_vn = powtwin_mbupdate.r_ivt_vn;
    double r_ivt_wn = powtwin_mbupdate.r_ivt_wn;
    double y_ivt_un = powtwin_mbupdate.y_ivt_un;
    double y_ivt_vn = powtwin_mbupdate.y_ivt_vn;
    double y_ivt_wn = powtwin_mbupdate.y_ivt_wn;
    double b_ivt_un = powtwin_mbupdate.b_ivt_un;
    double b_ivt_vn = powtwin_mbupdate.b_ivt_vn;
    double b_ivt_wn = powtwin_mbupdate.b_ivt_wn;
    String equipmentUsed = powtwin_mbupdate.equipmentUsed;

    return update(powt3winMbLocalDatasourceImpl).replace(Powt3winmbLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      r_hv_un: r_hv_un,
      r_hv_vn: r_hv_vn,
      r_hv_wn: r_hv_wn,
      y_hv_un: y_hv_un,
      y_hv_vn: y_hv_vn,
      y_hv_wn: y_hv_wn,
      b_hv_un: b_hv_un,
      b_hv_vn: b_hv_vn,
      b_hv_wn: b_hv_wn,
      r_lv_un: r_lv_un,
      r_lv_vn: r_lv_vn,
      r_lv_wn: r_lv_wn,
      y_lv_un: y_lv_un,
      y_lv_vn: y_lv_vn,
      y_lv_wn: y_lv_wn,
      b_lv_un: b_lv_un,
      b_lv_vn: b_lv_vn,
      b_lv_wn: b_lv_wn,
      r_ivt_un: r_ivt_un,
      r_ivt_vn: r_ivt_vn,
      r_ivt_wn: r_ivt_wn,
      y_ivt_un: y_ivt_un,
      y_ivt_vn: y_ivt_vn,
      y_ivt_wn: y_ivt_wn,
      b_ivt_un: b_ivt_un,
      b_ivt_vn: b_ivt_vn,
      b_ivt_wn: b_ivt_wn,
      equipmentUsed: equipmentUsed,
      updateDate: DateTime.now(),
    ));
  }

  Future<int> deletePowt3win_mbById(int id) {
    return (delete(powt3winMbLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<Powt3winmbLocalData> getPowt3win_mbLocalDataWithId(int id) {
    return (select(powt3winMbLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<Powt3winmbLocalData>> getPowt3win_mbLocalDataWithtrNoID(
      int trNo) {
    return (select(powt3winMbLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<Powt3winmbLocalData>> getPowt3win_mbLocalDataWithSerialNo(
      String sNo) {
    return (select(powt3winMbLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  Future<List<Powt3winmbLocalData>> getPowt3winMBEquipmentListwithAll() async {
    return await select(powt3winMbLocalDatasourceImpl).get();
  }

  ////////////////////////////////Powt3win_mbLv_LocalDatasource/////////////////////////
  // Future<int> createPowt3win_mbLv(Powt3win_mbLv_Model Powt3win_mbLvtoLocal) {
  //   return into(powt3winMbLvLocalDatasourceImpl)
  //       .insert(Powt3win_mbLv_LocalDatasourceImplCompanion.insert(
  //     databaseID: Powt3win_mbLvtoLocal.databaseID,
  //     trNo: Powt3win_mbLvtoLocal.trNo,
  //     serialNo: Powt3win_mbLvtoLocal.serialNo,
  //     r_lv_un: Powt3win_mbLvtoLocal.r_lv_un,
  //     r_lv_vn: Powt3win_mbLvtoLocal.r_lv_vn,
  //     r_lv_wn: Powt3win_mbLvtoLocal.r_lv_wn,
  //     y_lv_un: Powt3win_mbLvtoLocal.y_lv_un,
  //     y_lv_vn: Powt3win_mbLvtoLocal.y_lv_vn,
  //     y_lv_wn: Powt3win_mbLvtoLocal.y_lv_wn,
  //     b_lv_un: Powt3win_mbLvtoLocal.b_lv_un,
  //     b_lv_vn: Powt3win_mbLvtoLocal.b_lv_vn,
  //     b_lv_wn: Powt3win_mbLvtoLocal.b_lv_wn,
  //     //updateDate: ct_core_Model.updateDate,
  //   ));
  // }

  // Future<bool> updatePowt3win_mbLv(
  //     Powt3win_mbLv_Model powtwin_mbLvupdate, int id) {
  //   int databaseID = powtwin_mbLvupdate.databaseID;
  //   int trNo = powtwin_mbLvupdate.trNo;
  //   String serialNo = powtwin_mbLvupdate.serialNo;
  //   double r_lv_un = powtwin_mbLvupdate.r_lv_un;
  //   double r_lv_vn = powtwin_mbLvupdate.r_lv_vn;
  //   double r_lv_wn = powtwin_mbLvupdate.r_lv_wn;
  //   double y_lv_un = powtwin_mbLvupdate.y_lv_un;
  //   double y_lv_vn = powtwin_mbLvupdate.y_lv_vn;
  //   double y_lv_wn = powtwin_mbLvupdate.y_lv_wn;
  //   double b_lv_un = powtwin_mbLvupdate.b_lv_un;
  //   double b_lv_vn = powtwin_mbLvupdate.b_lv_vn;
  //   double b_lv_wn = powtwin_mbLvupdate.b_lv_wn;

  //   return update(powt3winMbLvLocalDatasourceImpl)
  //       .replace(Powt3winmbLvLocalData(
  //   ));
  // }

  // Future<int> deletePowt3win_mbLvById(int id) {
  //   return (delete(powt3winMbLvLocalDatasourceImpl)
  //         ..where((tbl) => tbl.id.equals(id)))
  // }

  // Future<Powt3winmbLvLocalData> getPowt3win_mbLvLocalDataWithId(int id) {
  //   return (select(powt3winMbLvLocalDatasourceImpl)
  //         ..where((u) => u.id.equals(id)))
  //       .getSingle();
  // }

  // Future<List<Powt3winmbLvLocalData>> getPowt3win_mbLvLocalDataWithtrNoID(
  //     int trNo) {
  //   return (select(powt3winMbLvLocalDatasourceImpl)
  //         ..where((u) => u.trNo.equals(trNo)))
  //       .get();
  // }

  // Future<List<Powt3winmbLvLocalData>> getPowt3win_mbLvLocalDataWithSerialNo(
  //     String sNo) {
  //   return (select(powt3winMbLvLocalDatasourceImpl)
  //         ..where((u) => u.serialNo.equals(sNo)))
  //       .get();
  // }

  // ////////////////////////////////Powt3winmbIvTLocalDatasource/////////////////////////
  // Future<int> createPowt3winmbIvT(Powt3winmbIvTModel Powt3winmbIvTtoLocal) {
  //   return into(powt3winmbIvTLocalDatasourceImpl)
  //       .insert(Powt3winmbIvTLocalDatasourceImplCompanion.insert(
  //     databaseID: Powt3winmbIvTtoLocal.databaseID,
  //     trNo: Powt3winmbIvTtoLocal.trNo,
  //     serialNo: Powt3winmbIvTtoLocal.serialNo,
  //     equipmentUsed: Powt3winmbIvTtoLocal.equipmentUsed,
  //     r_ivt_un: Powt3winmbIvTtoLocal.r_ivt_un,
  //     r_ivt_vn: Powt3winmbIvTtoLocal.r_ivt_vn,
  //     r_ivt_wn: Powt3winmbIvTtoLocal.r_ivt_wn,
  //     y_ivt_un: Powt3winmbIvTtoLocal.y_ivt_un,
  //     y_ivt_vn: Powt3winmbIvTtoLocal.y_ivt_vn,
  //     y_ivt_wn: Powt3winmbIvTtoLocal.y_ivt_wn,
  //     b_ivt_un: Powt3winmbIvTtoLocal.b_ivt_un,
  //     b_ivt_vn: Powt3winmbIvTtoLocal.b_ivt_vn,
  //     b_ivt_wn: Powt3winmbIvTtoLocal.b_ivt_wn,
  //     //updateDate: ct_core_Model.updateDate,
  //   ));
  // }

  // Future<bool> updatePowt3winmbIvT(
  //     Powt3winmbIvTModel powt3winmbIvTupdate, int id) {
  //   int databaseID = powt3winmbIvTupdate.databaseID;
  //   int trNo = powt3winmbIvTupdate.trNo;
  //   String serialNo = powt3winmbIvTupdate.serialNo;
  //   double r_ivt_un = powt3winmbIvTupdate.r_ivt_un;
  //   double r_ivt_vn = powt3winmbIvTupdate.r_ivt_vn;
  //   double r_ivt_wn = powt3winmbIvTupdate.r_ivt_wn;
  //   double y_ivt_un = powt3winmbIvTupdate.y_ivt_un;
  //   double y_ivt_vn = powt3winmbIvTupdate.y_ivt_vn;
  //   double y_ivt_wn = powt3winmbIvTupdate.y_ivt_wn;
  //   double b_ivt_un = powt3winmbIvTupdate.b_ivt_un;
  //   double b_ivt_vn = powt3winmbIvTupdate.b_ivt_vn;
  //   double b_ivt_wn = powt3winmbIvTupdate.b_ivt_wn;

  //   return update(powt3winmbIvTLocalDatasourceImpl)
  //       .replace(Powt3winmbIvTLocalData(
  //     id: id,
  //     databaseID: databaseID,
  //     trNo: trNo,
  //     serialNo: serialNo,
  //     r_ivt_un: r_ivt_un,
  //     r_ivt_vn: r_ivt_vn,
  //     r_ivt_wn: r_ivt_wn,
  //     y_ivt_un: y_ivt_un,
  //     y_ivt_vn: y_ivt_vn,
  //     y_ivt_wn: y_ivt_wn,
  //     b_ivt_un: b_ivt_un,
  //     b_ivt_vn: b_ivt_vn,
  //     b_ivt_wn: b_ivt_wn,
  //   ));
  // }

  // Future<int> deletePowt3winmbIvTById(int id) {
  //   return (delete(powt3winmbIvTLocalDatasourceImpl)
  //         ..where((tbl) => tbl.id.equals(id)))
  //       .go();
  // }

  // Future<Powt3winmbIvTLocalData> getPowt3winmbIvTLocalDataWithId(int id) {
  //   return (select(powt3winmbIvTLocalDatasourceImpl)
  //         ..where((u) => u.id.equals(id)))
  //       .getSingle();
  // }

  // Future<List<Powt3winmbIvTLocalData>> getPowt3winmbIvTLocalDataWithtrNoID(
  //     int trNo) {
  //   return (select(powt3winmbIvTLocalDatasourceImpl)
  //         ..where((u) => u.trNo.equals(trNo)))
  //       .get();
  // }

  // Future<List<Powt3winmbIvTLocalData>> getPowt3winmbIvTLocalDataWithSerialNo(
  //     String sNo) {
  //   return (select(powt3winmbIvTLocalDatasourceImpl)
  //         ..where((u) => u.serialNo.equals(sNo)))
  //       .get();
  // }

  ////////////////////////////////Powt3winschvlvLocalDatasource/////////////////////////
  Future<int> createPowt3winschvlv(Powt3winschvlvModel p3wschvlvtolocal) {
    return into(powt3winschvlvLocalDatasourceImpl)
        .insert(Powt3winschvlvLocalDatasourceImplCompanion.insert(
      databaseID: p3wschvlvtolocal.databaseID,
      trNo: p3wschvlvtolocal.trNo,
      serialNo: p3wschvlvtolocal.serialNo,
      hv_u: p3wschvlvtolocal.hv_u,
      hv_v: p3wschvlvtolocal.hv_v,
      hv_w: p3wschvlvtolocal.hv_w,
      hv_n: p3wschvlvtolocal.hv_n,
      lv_u: p3wschvlvtolocal.lv_u,
      lv_v: p3wschvlvtolocal.lv_v,
      lv_w: p3wschvlvtolocal.lv_w,
      lv_n: p3wschvlvtolocal.lv_n,
      tapPosition: p3wschvlvtolocal.tapPosition,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowt3winschvlv(
      Powt3winschvlvModel p3wschvlvtoupdate, int id) {
    int databaseID = p3wschvlvtoupdate.databaseID;
    int trNo = p3wschvlvtoupdate.trNo;
    String serialNo = p3wschvlvtoupdate.serialNo;
    double hv_u = p3wschvlvtoupdate.hv_u;
    double hv_v = p3wschvlvtoupdate.hv_v;
    double hv_w = p3wschvlvtoupdate.hv_w;
    double hv_n = p3wschvlvtoupdate.hv_n;
    double lv_u = p3wschvlvtoupdate.lv_u;
    double lv_v = p3wschvlvtoupdate.lv_v;
    double lv_w = p3wschvlvtoupdate.lv_w;
    double lv_n = p3wschvlvtoupdate.lv_n;
    int tapPosition = p3wschvlvtoupdate.tapPosition;

    return update(powt3winschvlvLocalDatasourceImpl)
        .replace(Powt3winschvlvLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      hv_u: hv_u,
      hv_v: hv_v,
      hv_w: hv_w,
      hv_n: hv_n,
      lv_u: lv_u,
      lv_v: lv_v,
      lv_w: lv_w,
      lv_n: lv_n,
      tapPosition: tapPosition,
    ));
  }

  Future<List<Powt3winschvlvLocalData>>
      getpowt3winschvlvEquipmentListwithAll() async {
    return await select(powt3winschvlvLocalDatasourceImpl).get();
  }

  Future<int> deletePowt3winschvlvById(int id) {
    return (delete(powt3winschvlvLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<Powt3winschvlvLocalData> getPowt3winschvlvLocalDataWithId(int id) {
    return (select(powt3winschvlvLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<Powt3winschvlvLocalData>> getPowt3winschvlvLocalDataWithtrNoID(
      int trNo) {
    return (select(powt3winschvlvLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<Powt3winschvlvLocalData>> getPowt3winschvlvLocalDataWithSerialNo(
      String sNo) {
    return (select(powt3winschvlvLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////Powt3winschvlvtLocalDatasource/////////////////////////
  Future<int> createPowt3winschvivt(Powt3winschvivtModel p3wschvivttolocal) {
    return into(powt3winschvivtLocalDatasourceImpl)
        .insert(Powt3winschvivtLocalDatasourceImplCompanion.insert(
      databaseID: p3wschvivttolocal.databaseID,
      trNo: p3wschvivttolocal.trNo,
      serialNo: p3wschvivttolocal.serialNo,
      hv_u: p3wschvivttolocal.hv_u,
      hv_v: p3wschvivttolocal.hv_v,
      hv_w: p3wschvivttolocal.hv_w,
      hv_n: p3wschvivttolocal.hv_n,
      ivt_u: p3wschvivttolocal.ivt_u,
      ivt_v: p3wschvivttolocal.ivt_v,
      ivt_w: p3wschvivttolocal.ivt_w,
      ivt_n: p3wschvivttolocal.ivt_n,
      tapPosition: p3wschvivttolocal.tapPosition,
      equipmentUsed: p3wschvivttolocal.equipmentUsed,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updatePowt3winschvivt(
      Powt3winschvivtModel powt3winschvivtupdate, int id) {
    int databaseID = powt3winschvivtupdate.databaseID;
    int trNo = powt3winschvivtupdate.trNo;
    String serialNo = powt3winschvivtupdate.serialNo;
    double hv_u = powt3winschvivtupdate.hv_u;
    double hv_v = powt3winschvivtupdate.hv_v;
    double hv_w = powt3winschvivtupdate.hv_w;
    double hv_n = powt3winschvivtupdate.hv_n;
    double ivt_u = powt3winschvivtupdate.ivt_u;
    double ivt_v = powt3winschvivtupdate.ivt_v;
    double ivt_w = powt3winschvivtupdate.ivt_w;
    double ivt_n = powt3winschvivtupdate.ivt_n;
    int tapPosition = powt3winschvivtupdate.tapPosition;
    String equipmentUsed = powt3winschvivtupdate.equipmentUsed;

    return update(powt3winschvivtLocalDatasourceImpl)
        .replace(Powt3winschvivtLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      hv_u: hv_u,
      hv_v: hv_v,
      hv_w: hv_w,
      hv_n: hv_n,
      ivt_u: ivt_u,
      ivt_v: ivt_v,
      ivt_w: ivt_w,
      ivt_n: ivt_n,
      tapPosition: tapPosition,
      equipmentUsed: equipmentUsed,
      updateDate: DateTime.now(),
    ));
  }

  Future<int> deletePowt3winschvivtById(int id) {
    return (delete(powt3winschvivtLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<Powt3winschvivtLocalData>>
      getpowt3winschvivtEquipmentListwithAll() async {
    return await select(powt3winschvivtLocalDatasourceImpl).get();
  }

  Future<Powt3winschvivtLocalData> getPowt3winschvivtLocalDataWithId(int id) {
    return (select(powt3winschvivtLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<Powt3winschvivtLocalData>> getPowt3winschvivtLocalDataWithtrNoID(
      int trNo) {
    return (select(powt3winschvivtLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<Powt3winschvivtLocalData>>
      getPowt3winschvivtLocalDataWithSerialNo(String sNo) {
    return (select(powt3winschvivtLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  //////////////////////////////////Inverter -TRANSFORMER//////////////////////////////////////
  Future<int> createIt(ItModel itToLocal, DateTime dateOfTesting) {
    return into(itLocalDatasourceImpl)
        .insert(ItLocalDatasourceImplCompanion.insert(
      databaseID: itToLocal.databaseID,
      etype: itToLocal.etype,
      trNo: itToLocal.trNo,
      designation: itToLocal.designation,
      location: itToLocal.location,
      serialNo: itToLocal.serialNo,
      rating: itToLocal.rating,
      ratedVoltage_HV: itToLocal.ratedVoltage_HV,
      ratedVoltage_LV: itToLocal.ratedVoltage_LV,
      ratedCurrent_HV: itToLocal.ratedCurrent_HV,
      ratedCurrent_LV: itToLocal.ratedCurrent_LV,
      vectorGroup: itToLocal.vectorGroup,
      impedanceVoltage_HV_LV1: itToLocal.impedanceVoltage_HV_LV1,
      impedanceVoltage_HV_LV2: itToLocal.impedanceVoltage_HV_LV2,
      impedanceVoltage_HV_LV3: itToLocal.impedanceVoltage_HV_LV3,
      impedanceVoltage_HV_LV4: itToLocal.impedanceVoltage_HV_LV4,
      impedanceVoltage_Lv_LV: itToLocal.impedanceVoltage_LV_LV,
      frequency: itToLocal.frequency,
      typeOfCooling: itToLocal.typeOfCooling,
      noOfPhases: itToLocal.noOfPhases,
      make: itToLocal.make,
      yom: itToLocal.yom,
      noOfTaps: itToLocal.noOfTaps,
      noOfNominalTaps: itToLocal.noOfNominalTaps,
      oilTemp: itToLocal.oilTemp,
      windingTemp: itToLocal.windingTemp,
      ambientTemp: itToLocal.ambientTemp,
      dateOfTesting: Value(dateOfTesting),
      testedBy: itToLocal.testedBy,
      verifiedBy: itToLocal.verifiedBy,
      WitnessedBy: itToLocal.WitnessedBy,
      //updateDate: Value(updateDate),
    ));
  }

  Future<bool> updateIt(ItModel ittoUpdate, int id) {
    int databaseID = ittoUpdate.databaseID;
    String etype = ittoUpdate.etype;
    int trNo = ittoUpdate.trNo;
    String designation = ittoUpdate.designation;
    String location = ittoUpdate.location;
    String serialNo = ittoUpdate.serialNo;
    String rating = ittoUpdate.rating;
    int ratedVoltage_HV = ittoUpdate.ratedVoltage_HV;
    int ratedVoltage_LV = ittoUpdate.ratedVoltage_LV;
    double ratedCurrent_HV = ittoUpdate.ratedCurrent_HV;
    double ratedCurrent_LV = ittoUpdate.ratedCurrent_LV;
    String vectorGroup = ittoUpdate.vectorGroup;
    double impedanceVoltage_HV_LV1 = ittoUpdate.impedanceVoltage_HV_LV1;
    double impedanceVoltage_HV_LV2 = ittoUpdate.impedanceVoltage_HV_LV2;
    double impedanceVoltage_HV_LV3 = ittoUpdate.impedanceVoltage_HV_LV3;
    double impedanceVoltage_HV_LV4 = ittoUpdate.impedanceVoltage_HV_LV4;
    double impedanceVoltage_Lv_LV = ittoUpdate.impedanceVoltage_LV_LV;
    int frequency = ittoUpdate.frequency;
    String typeOfCooling = ittoUpdate.typeOfCooling;
    int noOfPhases = ittoUpdate.noOfPhases;
    String make = ittoUpdate.make;
    int yom = ittoUpdate.yom;
    int noOfTaps = ittoUpdate.noOfTaps;
    int noOfNominalTaps = ittoUpdate.noOfNominalTaps;
    int oilTemp = ittoUpdate.oilTemp;
    int windingTemp = ittoUpdate.windingTemp;
    int ambientTemp = ittoUpdate.ambientTemp;
    DateTime dateOfTesting = ittoUpdate.dateOfTesting;
    DateTime updateDate = ittoUpdate.updateDate;
    String testedBy = ittoUpdate.testedBy;
    String verifiedBy = ittoUpdate.verifiedBy;
    String WitnessedBy = ittoUpdate.WitnessedBy;

    return update(itLocalDatasourceImpl).replace(ItLocalData(
      id: id,
      databaseID: databaseID,
      etype: etype,
      trNo: trNo,
      designation: designation,
      location: location,
      serialNo: serialNo,
      rating: rating,
      ratedVoltage_HV: ratedVoltage_HV,
      ratedVoltage_LV: ratedVoltage_LV,
      ratedCurrent_HV: ratedCurrent_HV,
      ratedCurrent_LV: ratedCurrent_LV,
      vectorGroup: vectorGroup,
      impedanceVoltage_HV_LV1: impedanceVoltage_HV_LV1,
      impedanceVoltage_HV_LV2: impedanceVoltage_HV_LV2,
      impedanceVoltage_HV_LV3: impedanceVoltage_HV_LV3,
      impedanceVoltage_HV_LV4: impedanceVoltage_HV_LV4,
      impedanceVoltage_Lv_LV: impedanceVoltage_Lv_LV,
      frequency: frequency,
      typeOfCooling: typeOfCooling,
      noOfPhases: noOfPhases,
      make: make,
      yom: yom,
      noOfTaps: noOfTaps,
      noOfNominalTaps: noOfNominalTaps,
      oilTemp: oilTemp,
      windingTemp: windingTemp,
      ambientTemp: ambientTemp,
      dateOfTesting: dateOfTesting,
      updateDate: updateDate,
      testedBy: testedBy,
      verifiedBy: verifiedBy,
      WitnessedBy: WitnessedBy,
    ));
  }

  Future<List<ItLocalData>> getItLocalDataWithLists() async {
    return await select(itLocalDatasourceImpl).get();
  }

  Future<int> deleteItById(int id) {
    return (delete(itLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<ItLocalData>> getItLocalDatasourceImplList() async {
    return await select(itLocalDatasourceImpl).get();
  }

  Future<List<ItLocalData>> getItLocalDataWithtrNo(int trNo) {
    return (select(itLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //getCTLocalDataWithSerialNo
  Future<List<ItLocalData>> getItLocalDataWithSerialNo(String sn) {
    return (select(itLocalDatasourceImpl)..where((u) => u.serialNo.equals(sn)))
        .get();
  }

  Future<ItLocalData> getItLocalDataWithId(int id) {
    return (select(itLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //////////////////////////Inverter Transformer end//////////////////////////
  //////////////////////////////////////Inverter Transformer-IR-START////////////////////////////
  //Get IT Ir by Serial No
  Future<List<ItIrLocalData>> getItIrLocalDataWithSerialNo(String SerialNo) {
    return (select(itIrLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Get ITIr by id
  Future<ItIrLocalData> getItIrLocalDataWithId(int id) {
    return (select(itIrLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get ITIr by trNo
  Future<List<ItIrLocalData>> getItIrLocalDataWithTrNo(int trNo) {
    return (select(itIrLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get ITIr Equipment List
  Future<List<ItIrLocalData>> getItIrEquipmentListAll() async {
    return await select(itIrLocalDatasourceImpl).get();
  }

  // Create IT Ir and return id

  Future<int> createItIr(ItIrTestModel itIrTestModel) {
    return into(itIrLocalDatasourceImpl)
        .insert(ItIrLocalDatasourceImplCompanion.insert(
      hvE_60: itIrTestModel.hvE_60,
      hvE_600: itIrTestModel.hvE_600,
      hvLv1_60: itIrTestModel.hvLv1_60,
      hvLv1_600: itIrTestModel.hvLv1_600,
      hvLv2_60: itIrTestModel.hvLv2_60,
      hvLv2_600: itIrTestModel.hvLv2_600,
      hvLv3_60: itIrTestModel.hvLv3_60,
      hvLv3_600: itIrTestModel.hvLv3_600,
      hvLv4_60: itIrTestModel.hvLv4_60,
      hvLv4_600: itIrTestModel.hvLv4_600,
      lv1E: itIrTestModel.lv1E,
      lv2E: itIrTestModel.lv2E,
      lv3E: itIrTestModel.lv3E,
      lv4E: itIrTestModel.lv4E,
      lv1Lv2: itIrTestModel.lv1Lv2,
      lv1Lv3: itIrTestModel.lv1Lv3,
      lv1Lv4: itIrTestModel.lv1Lv4,
      lv2Lv3: itIrTestModel.lv2Lv3,
      lv2Lv4: itIrTestModel.lv2Lv4,
      lv3Lv4: itIrTestModel.lv3Lv4,
      lv4Lv1: itIrTestModel.lv4Lv1,
      serialNo: itIrTestModel.serialNo,
      trNo: itIrTestModel.trNo,
      databaseID: itIrTestModel.databaseID,
      equipmentUsed: itIrTestModel.equipmentUsed,
    ));
  }

  //Update IT Ir by id
  Future<bool> updateItIr(ItIrTestModel itIrToUpdate, int id) {
    String serialNo = itIrToUpdate.serialNo;
    int trNo = itIrToUpdate.trNo;
    int databaseID = itIrToUpdate.databaseID;
    String EquipmentType = itIrToUpdate.equipmentUsed;
    DateTime lastUpdated = itIrToUpdate.updateDate;
    double hvE_60 = itIrToUpdate.hvE_60;
    double hvE_600 = itIrToUpdate.hvE_600;
    double hvLv1_60 = itIrToUpdate.hvLv1_60;
    double hvLv1_600 = itIrToUpdate.hvLv1_600;
    double hvLv2_60 = itIrToUpdate.hvLv2_60;
    double hvLv2_600 = itIrToUpdate.hvLv2_600;
    double hvLv3_60 = itIrToUpdate.hvLv3_60;
    double hvLv3_600 = itIrToUpdate.hvLv3_600;
    double hvLv4_60 = itIrToUpdate.hvLv4_60;
    double hvLv4_600 = itIrToUpdate.hvLv4_600;
    double lv1E = itIrToUpdate.lv1E;
    double lv2E = itIrToUpdate.lv2E;
    double lv3E = itIrToUpdate.lv3E;
    double lv4E = itIrToUpdate.lv4E;
    double lv1Lv2 = itIrToUpdate.lv1Lv2;
    double lv1Lv3 = itIrToUpdate.lv1Lv3;
    double lv1Lv4 = itIrToUpdate.lv1Lv4;
    double lv2Lv3 = itIrToUpdate.lv2Lv3;
    double lv2Lv4 = itIrToUpdate.lv2Lv4;
    double lv3Lv4 = itIrToUpdate.lv3Lv4;
    double lv4Lv1 = itIrToUpdate.lv4Lv1;

    return update(itIrLocalDatasourceImpl).replace(ItIrLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      hvE_60: hvE_60,
      hvE_600: hvE_600,
      hvLv1_60: hvLv1_60,
      hvLv1_600: hvLv1_600,
      hvLv2_60: hvLv2_60,
      hvLv2_600: hvLv2_600,
      hvLv3_60: hvLv3_60,
      hvLv3_600: hvLv3_600,
      hvLv4_60: hvLv4_60,
      hvLv4_600: hvLv4_600,
      lv1E: lv1E,
      lv2E: lv2E,
      lv3E: lv3E,
      lv4E: lv4E,
      lv1Lv2: lv1Lv2,
      lv1Lv3: lv1Lv3,
      lv1Lv4: lv1Lv4,
      lv2Lv3: lv2Lv3,
      lv2Lv4: lv2Lv4,
      lv3Lv4: lv3Lv4,
      lv4Lv1: lv4Lv1,
      equipmentUsed: EquipmentType,
      updateDate: lastUpdated,
    ));
  }

  //Delete ITIr by id
  Future<int> deleteItIrById(int id) {
    return (delete(itIrLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////Inverter Transformer-IR-END/////////////////////////////////
  //////////////////////////////////////Inverter Transformer-WR-START////////////////////////////
  //Get IT Wr by Serial No
  Future<List<ItWrLocalData>> getItWrLocalDataWithSerialNo(String SerialNo) {
    return (select(itWrLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Get ITWr by id
  Future<ItWrLocalData> getItWrLocalDataWithId(int id) {
    return (select(itWrLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get ITWr by trNo
  Future<List<ItWrLocalData>> getItWrLocalDataWithTrNo(int trNo) {
    return (select(itWrLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<ItWrLocalData>> getItWrEquipmentListAll() async {
    return await select(itWrLocalDatasourceImpl).get();
  }

  // Create IT Wr and return id

  Future<int> createItWr(ItWrTestModel itWrTestModel) {
    return into(itWrLocalDatasourceImpl)
        .insert(ItWrLocalDatasourceImplCompanion.insert(
      uV: itWrTestModel.uV,
      vW: itWrTestModel.vW,
      wU: itWrTestModel.wU,
      tapPosition: itWrTestModel.tapPosition,
      hvLvOpt: itWrTestModel.hvLVOpt,
      serialNo: itWrTestModel.serialNo,
      trNo: itWrTestModel.trNo,
      databaseID: itWrTestModel.databaseID,
      equipmentUsed: itWrTestModel.equipmentUsed,
    ));
  }

  //Update IT Wr by id
  Future<bool> updateItWr(ItWrTestModel itWrToUpdate, int id) {
    String serialNo = itWrToUpdate.serialNo;
    int trNo = itWrToUpdate.trNo;
    int databaseID = itWrToUpdate.databaseID;
    String EquipmentType = itWrToUpdate.equipmentUsed;
    DateTime lastUpdated = itWrToUpdate.updateDate;
    double uV = itWrToUpdate.uV;
    double vW = itWrToUpdate.vW;
    double wU = itWrToUpdate.wU;
    String tapPosition = itWrToUpdate.tapPosition;
    String hvLvOpt = itWrToUpdate.hvLVOpt;

    return update(itWrLocalDatasourceImpl).replace(ItWrLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      uV: uV,
      vW: vW,
      wU: wU,
      tapPosition: tapPosition,
      hvLvOpt: hvLvOpt,
      equipmentUsed: EquipmentType,
      updateDate: lastUpdated,
    ));
  }

  //Delete ITWr by id
  Future<int> deleteItWrById(int id) {
    return (delete(itWrLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////Inverter Transformer-WR-END/////////////////////////////////
  //////////////////////////////////////Inverter Transformer-R-START////////////////////////////
  //Get IT R by Serial No
  Future<List<ItRLocalData>> getItRLocalDataWithSerialNo(String SerialNo) {
    return (select(itRLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Get IT R by id
  Future<ItRLocalData> getItRLocalDataWithId(int id) {
    return (select(itRLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get IT R by trNo
  Future<List<ItRLocalData>> getItRLocalDataWithTrNo(int trNo) {
    return (select(itRLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get IT R Equipment List
  Future<List<ItRLocalData>> getItREquipmentListAll() async {
    return await select(itRLocalDatasourceImpl).get();
  }

  // Create IT R and return id

  Future<int> createItR(ItRTestModel itRTestModel) {
    return into(itRLocalDatasourceImpl)
        .insert(ItRLocalDatasourceImplCompanion.insert(
      hv_uv: itRTestModel.hv_uv,
      hv_vw: itRTestModel.hv_vw,
      hv_wu: itRTestModel.hv_wu,
      lv1_uv: itRTestModel.lv1_uv,
      lv1_vw: itRTestModel.lv1_vw,
      lv1_wu: itRTestModel.lv1_wu,
      lv2_uv: itRTestModel.lv2_uv,
      lv2_vw: itRTestModel.lv2_vw,
      lv2_wu: itRTestModel.lv2_wu,
      lv3_uv: itRTestModel.lv3_uv,
      lv3_vw: itRTestModel.lv3_vw,
      lv3_wu: itRTestModel.lv3_wu,
      lv4_uv: itRTestModel.lv4_uv,
      lv4_vw: itRTestModel.lv4_vw,
      lv4_wu: itRTestModel.lv4_wu,
      tapPosition: itRTestModel.tapPosition,
      serialNo: itRTestModel.serialNo,
      trNo: itRTestModel.trNo,
      databaseID: itRTestModel.databaseID,
      equipmentUsed: itRTestModel.equipmentUsed,
    ));
  }

  //Update IT Wr by id
  Future<bool> updateItR(ItRTestModel itRToUpdate, int id) {
    String serialNo = itRToUpdate.serialNo;
    int trNo = itRToUpdate.trNo;
    int databaseID = itRToUpdate.databaseID;
    String EquipmentType = itRToUpdate.equipmentUsed;
    DateTime lastUpdated = itRToUpdate.updateDate;
    double hv_uv = itRToUpdate.hv_uv;
    double hv_vw = itRToUpdate.hv_vw;
    double hv_wu = itRToUpdate.hv_wu;
    double lv1_uv = itRToUpdate.lv1_uv;
    double lv1_vw = itRToUpdate.lv1_vw;
    double lv1_wu = itRToUpdate.lv1_wu;
    double lv2_uv = itRToUpdate.lv2_uv;
    double lv2_vw = itRToUpdate.lv2_vw;
    double lv2_wu = itRToUpdate.lv2_wu;
    double lv3_uv = itRToUpdate.lv3_uv;
    double lv3_vw = itRToUpdate.lv3_vw;
    double lv3_wu = itRToUpdate.lv3_wu;
    double lv4_uv = itRToUpdate.lv4_uv;
    double lv4_vw = itRToUpdate.lv4_vw;
    double lv4_wu = itRToUpdate.lv4_wu;
    String tapPosition = itRToUpdate.tapPosition;

    return update(itRLocalDatasourceImpl).replace(ItRLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      hv_uv: hv_uv,
      hv_vw: hv_vw,
      hv_wu: hv_wu,
      lv1_uv: lv1_uv,
      lv1_vw: lv1_vw,
      lv1_wu: lv1_wu,
      lv2_uv: lv2_uv,
      lv2_vw: lv2_vw,
      lv2_wu: lv2_wu,
      lv3_uv: lv3_uv,
      lv3_vw: lv3_vw,
      lv3_wu: lv3_wu,
      lv4_uv: lv4_uv,
      lv4_vw: lv4_vw,
      lv4_wu: lv4_wu,
      tapPosition: tapPosition,
      equipmentUsed: EquipmentType,
      updateDate: lastUpdated,
    ));
  }

  //Delete IT R by id
  Future<int> deleteItRById(int id) {
    return (delete(itRLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////Inverter Transformer-R-END/////////////////////////////////
  //////////////////////////////////////Inverter Transformer-MC-START////////////////////////////
  //Get IT Mc by Serial No
  Future<List<ItMcLocalData>> getItMcLocalDataWithSerialNo(String SerialNo) {
    return (select(itMcLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Get ITMc by id
  Future<ItMcLocalData> getItMcLocalDataWithId(int id) {
    return (select(itMcLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get ITMc by trNo
  Future<List<ItMcLocalData>> getItMcLocalDataWithTrNo(int trNo) {
    return (select(itMcLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get ITMc Equipment List
  Future<List<ItMcLocalData>> getItMcEquipmentListAll() async {
    return await select(itMcLocalDatasourceImpl).get();
  }

  // Create IT Mc and return id

  Future<int> createItMc(ItMcTestModel itMcTestModel) {
    return into(itMcLocalDatasourceImpl)
        .insert(ItMcLocalDatasourceImplCompanion.insert(
      uv: itMcTestModel.uv,
      vw: itMcTestModel.vw,
      wu: itMcTestModel.wu,
      u: itMcTestModel.u,
      v: itMcTestModel.v,
      w: itMcTestModel.w,
      tapPosition: itMcTestModel.tapPosition,
      serialNo: itMcTestModel.serialNo,
      trNo: itMcTestModel.trNo,
      databaseID: itMcTestModel.databaseID,
      equipmentUsed: itMcTestModel.equipmentUsed,
    ));
  }

  //Update IT Mc by id
  Future<bool> updateItMc(ItMcTestModel itMcToUpdate, int id) {
    String serialNo = itMcToUpdate.serialNo;
    int trNo = itMcToUpdate.trNo;
    int databaseID = itMcToUpdate.databaseID;
    String EquipmentType = itMcToUpdate.equipmentUsed;
    DateTime lastUpdated = itMcToUpdate.updateDate;
    double uv = itMcToUpdate.uv;
    double vw = itMcToUpdate.vw;
    double wu = itMcToUpdate.wu;
    double u = itMcToUpdate.u;
    double v = itMcToUpdate.v;
    double w = itMcToUpdate.w;
    String tapPosition = itMcToUpdate.tapPosition;

    return update(itMcLocalDatasourceImpl).replace(ItMcLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      uv: uv,
      vw: vw,
      wu: wu,
      u: u,
      v: v,
      w: w,
      tapPosition: tapPosition,
      equipmentUsed: EquipmentType,
      updateDate: lastUpdated,
    ));
  }

  //Delete ITMc by id
  Future<int> deleteItMcById(int id) {
    return (delete(itMcLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////Inverter Transformer-Mc-END/////////////////////////////////
  //////////////////////////////////////Inverter Transformer-MB-START////////////////////////////
  //Get IT Mb by Serial No
  Future<List<ItMbLocalData>> getItMbLocalDataWithSerialNo(String SerialNo) {
    return (select(itMbLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Get IT Mb by id
  Future<ItMbLocalData> getItMbLocalDataWithId(int id) {
    return (select(itMbLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get IT Mb by trNo
  Future<List<ItMbLocalData>> getItMbLocalDataWithTrNo(int trNo) {
    return (select(itMbLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get IT Mb Equipment List
  Future<List<ItMbLocalData>> getItMbEquipmentListALL() async {
    return await select(itMbLocalDatasourceImpl).get();
  }

  // Create IT Mb and return id

  Future<int> createItMb(ItMbTestModel itMbTestModel) {
    return into(itMbLocalDatasourceImpl)
        .insert(ItMbLocalDatasourceImplCompanion.insert(
      r_hv_uv: itMbTestModel.r_hv_uv,
      r_hv_wu: itMbTestModel.r_hv_wu,
      r_hv_vw: itMbTestModel.r_hv_vw,
      r_lv1_uv: itMbTestModel.r_lv1_uv,
      r_lv1_vw: itMbTestModel.r_lv1_vw,
      r_lv1_wu: itMbTestModel.r_lv1_wu,
      r_lv2_uv: itMbTestModel.r_lv2_uv,
      r_lv2_vw: itMbTestModel.r_lv2_vw,
      r_lv2_wu: itMbTestModel.r_lv2_wu,
      r_lv3_uv: itMbTestModel.r_lv3_uv,
      r_lv3_vw: itMbTestModel.r_lv3_vw,
      r_lv3_wu: itMbTestModel.r_lv3_wu,
      r_lv4_uv: itMbTestModel.r_lv4_uv,
      r_lv4_vw: itMbTestModel.r_lv4_vw,
      r_lv4_wu: itMbTestModel.r_lv4_wu,
      y_hv_uv: itMbTestModel.y_hv_uv,
      y_hv_vw: itMbTestModel.y_hv_vw,
      y_hv_wu: itMbTestModel.y_hv_wu,
      y_lv1_uv: itMbTestModel.y_lv1_uv,
      y_lv1_vw: itMbTestModel.y_lv1_vw,
      y_lv1_wu: itMbTestModel.y_lv1_wu,
      y_lv2_uv: itMbTestModel.y_lv2_uv,
      y_lv2_vw: itMbTestModel.y_lv2_vw,
      y_lv2_wu: itMbTestModel.y_lv2_wu,
      y_lv3_uv: itMbTestModel.y_lv3_uv,
      y_lv3_vw: itMbTestModel.y_lv3_vw,
      y_lv3_wu: itMbTestModel.y_lv3_wu,
      y_lv4_uv: itMbTestModel.y_lv4_uv,
      y_lv4_vw: itMbTestModel.y_lv4_vw,
      y_lv4_wu: itMbTestModel.y_lv4_wu,
      b_hv_uv: itMbTestModel.b_hv_uv,
      b_hv_vw: itMbTestModel.b_hv_vw,
      b_hv_wu: itMbTestModel.b_hv_wu,
      b_lv1_uv: itMbTestModel.b_lv1_uv,
      b_lv1_vw: itMbTestModel.b_lv1_vw,
      b_lv1_wu: itMbTestModel.b_lv1_wu,
      b_lv2_uv: itMbTestModel.b_lv2_uv,
      b_lv2_vw: itMbTestModel.b_lv2_vw,
      b_lv2_wu: itMbTestModel.b_lv2_wu,
      b_lv3_uv: itMbTestModel.b_lv3_uv,
      b_lv3_vw: itMbTestModel.b_lv3_vw,
      b_lv3_wu: itMbTestModel.b_lv3_wu,
      b_lv4_uv: itMbTestModel.b_lv4_uv,
      b_lv4_vw: itMbTestModel.b_lv4_vw,
      b_lv4_wu: itMbTestModel.b_lv4_wu,
      serialNo: itMbTestModel.serialNo,
      trNo: itMbTestModel.trNo,
      databaseID: itMbTestModel.databaseID,
      equipmentUsed: itMbTestModel.equipmentUsed,
    ));
  }

  //Update IT Wr by id
  Future<bool> updateItMb(ItMbTestModel itMbToUpdate, int id) {
    String serialNo = itMbToUpdate.serialNo;
    int trNo = itMbToUpdate.trNo;
    int databaseID = itMbToUpdate.databaseID;
    String EquipmentType = itMbToUpdate.equipmentUsed;
    DateTime lastUpdated = itMbToUpdate.updateDate;
    double r_hv_uv = itMbToUpdate.r_hv_uv;
    double r_hv_vw = itMbToUpdate.r_hv_vw;
    double r_hv_wu = itMbToUpdate.r_hv_wu;
    double r_lv1_uv = itMbToUpdate.r_lv1_uv;
    double r_lv1_vw = itMbToUpdate.r_lv1_vw;
    double r_lv1_wu = itMbToUpdate.r_lv1_wu;
    double r_lv2_uv = itMbToUpdate.r_lv2_uv;
    double r_lv2_vw = itMbToUpdate.r_lv2_vw;
    double r_lv2_wu = itMbToUpdate.r_lv2_wu;
    double r_lv3_uv = itMbToUpdate.r_lv3_uv;
    double r_lv3_vw = itMbToUpdate.r_lv3_vw;
    double r_lv3_wu = itMbToUpdate.r_lv3_wu;
    double r_lv4_uv = itMbToUpdate.r_lv4_uv;
    double r_lv4_vw = itMbToUpdate.r_lv4_vw;
    double r_lv4_wu = itMbToUpdate.r_lv4_wu;

    double y_hv_uv = itMbToUpdate.y_hv_uv;
    double y_hv_vw = itMbToUpdate.y_hv_vw;
    double y_hv_wu = itMbToUpdate.y_hv_wu;
    double y_lv1_uv = itMbToUpdate.y_lv1_uv;
    double y_lv1_vw = itMbToUpdate.y_lv1_vw;
    double y_lv1_wu = itMbToUpdate.y_lv1_wu;
    double y_lv2_uv = itMbToUpdate.y_lv2_uv;
    double y_lv2_vw = itMbToUpdate.y_lv2_vw;
    double y_lv2_wu = itMbToUpdate.y_lv2_wu;
    double y_lv3_uv = itMbToUpdate.y_lv3_uv;
    double y_lv3_vw = itMbToUpdate.y_lv3_vw;
    double y_lv3_wu = itMbToUpdate.y_lv3_wu;
    double y_lv4_uv = itMbToUpdate.y_lv4_uv;
    double y_lv4_vw = itMbToUpdate.y_lv4_vw;
    double y_lv4_wu = itMbToUpdate.y_lv4_wu;

    double b_hv_uv = itMbToUpdate.b_hv_uv;
    double b_hv_vw = itMbToUpdate.b_hv_vw;
    double b_hv_wu = itMbToUpdate.b_hv_wu;
    double b_lv1_uv = itMbToUpdate.b_lv1_uv;
    double b_lv1_vw = itMbToUpdate.b_lv1_vw;
    double b_lv1_wu = itMbToUpdate.b_lv1_wu;
    double b_lv2_uv = itMbToUpdate.b_lv2_uv;
    double b_lv2_vw = itMbToUpdate.b_lv2_vw;
    double b_lv2_wu = itMbToUpdate.b_lv2_wu;
    double b_lv3_uv = itMbToUpdate.b_lv3_uv;
    double b_lv3_vw = itMbToUpdate.b_lv3_vw;
    double b_lv3_wu = itMbToUpdate.b_lv3_wu;
    double b_lv4_uv = itMbToUpdate.b_lv4_uv;
    double b_lv4_vw = itMbToUpdate.b_lv4_vw;
    double b_lv4_wu = itMbToUpdate.b_lv4_wu;

    return update(itMbLocalDatasourceImpl).replace(ItMbLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      r_hv_uv: r_hv_uv,
      r_hv_wu: r_hv_wu,
      r_hv_vw: r_hv_vw,
      r_lv1_uv: r_lv1_uv,
      r_lv1_vw: r_lv1_vw,
      r_lv1_wu: r_lv1_wu,
      r_lv2_uv: r_lv2_uv,
      r_lv2_vw: r_lv2_vw,
      r_lv2_wu: r_lv2_wu,
      r_lv3_uv: r_lv3_uv,
      r_lv3_vw: r_lv3_vw,
      r_lv3_wu: r_lv3_wu,
      r_lv4_uv: r_lv4_uv,
      r_lv4_vw: r_lv4_vw,
      r_lv4_wu: r_lv4_wu,
      y_hv_uv: y_hv_uv,
      y_hv_vw: y_hv_vw,
      y_hv_wu: y_hv_wu,
      y_lv1_uv: y_lv1_uv,
      y_lv1_vw: y_lv1_vw,
      y_lv1_wu: y_lv1_wu,
      y_lv2_uv: y_lv2_uv,
      y_lv2_vw: y_lv2_vw,
      y_lv2_wu: y_lv2_wu,
      y_lv3_uv: y_lv3_uv,
      y_lv3_vw: y_lv3_vw,
      y_lv3_wu: y_lv3_wu,
      y_lv4_uv: y_lv4_uv,
      y_lv4_vw: y_lv4_vw,
      y_lv4_wu: y_lv4_wu,
      b_hv_uv: b_hv_uv,
      b_hv_vw: b_hv_vw,
      b_hv_wu: b_hv_wu,
      b_lv1_uv: b_lv1_uv,
      b_lv1_vw: b_lv1_vw,
      b_lv1_wu: b_lv1_wu,
      b_lv2_uv: b_lv2_uv,
      b_lv2_vw: b_lv2_vw,
      b_lv2_wu: b_lv2_wu,
      b_lv3_uv: b_lv3_uv,
      b_lv3_vw: b_lv3_vw,
      b_lv3_wu: b_lv3_wu,
      b_lv4_uv: b_lv4_uv,
      b_lv4_vw: b_lv4_vw,
      b_lv4_wu: b_lv4_wu,
      equipmentUsed: EquipmentType,
      updateDate: lastUpdated,
    ));
  }

  //Delete IT Mb by id
  Future<int> deleteItMbById(int id) {
    return (delete(itMbLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////Inverter Transformer MB-END/////////////////////////////////
  //////////////////////////////////////Inverter Transformer-Vg-START////////////////////////////
  //Get IT Vg by Serial No
  Future<List<ItVgLocalData>> getItVgLocalDataWithSerialNo(String SerialNo) {
    return (select(itVgLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Get IT Vg by id
  Future<ItVgLocalData> getItVgLocalDataWithId(int id) {
    return (select(itVgLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get IT Vg by trNo
  Future<List<ItVgLocalData>> getItVgLocalDataWithTrNo(int trNo) {
    return (select(itVgLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get IT Vg Equipment List
  Future<List<ItVgLocalData>> getItVgEquipmentListAll() async {
    return await select(itVgLocalDatasourceImpl).get();
  }

  // Create IT Vg and return id

  Future<int> createItVg(ItVgTestModel itVgTestModel) {
    return into(itVgLocalDatasourceImpl)
        .insert(ItVgLocalDatasourceImplCompanion.insert(
      lv1_v1: itVgTestModel.lv1_v1,
      lv1_v2: itVgTestModel.lv1_v2,
      lv1_v3: itVgTestModel.lv1_v3,
      lv1_v4: itVgTestModel.lv1_v4,
      lv2_v1: itVgTestModel.lv2_v1,
      lv2_v2: itVgTestModel.lv2_v2,
      lv2_v3: itVgTestModel.lv2_v3,
      lv2_v4: itVgTestModel.lv2_v4,
      lv3_v1: itVgTestModel.lv3_v1,
      lv3_v2: itVgTestModel.lv3_v2,
      lv3_v3: itVgTestModel.lv3_v3,
      lv3_v4: itVgTestModel.lv3_v4,
      lv4_v1: itVgTestModel.lv4_v1,
      lv4_v2: itVgTestModel.lv4_v2,
      lv4_v3: itVgTestModel.lv4_v3,
      lv4_v4: itVgTestModel.lv4_v4,
      serialNo: itVgTestModel.serialNo,
      trNo: itVgTestModel.trNo,
      databaseID: itVgTestModel.databaseID,
      equipmentUsed: itVgTestModel.equipmentUsed,
    ));
  }

  //Update IT Vg by id
  Future<bool> updateItVg(ItVgTestModel itVgToUpdate, int id) {
    String serialNo = itVgToUpdate.serialNo;
    int trNo = itVgToUpdate.trNo;
    int databaseID = itVgToUpdate.databaseID;
    String EquipmentType = itVgToUpdate.equipmentUsed;
    DateTime lastUpdated = itVgToUpdate.updateDate;
    double lv1_v1 = itVgToUpdate.lv1_v1;
    double lv1_v2 = itVgToUpdate.lv1_v2;
    double lv1_v3 = itVgToUpdate.lv1_v3;
    double lv1_v4 = itVgToUpdate.lv1_v4;
    double lv2_v1 = itVgToUpdate.lv2_v1;
    double lv2_v2 = itVgToUpdate.lv2_v2;
    double lv2_v3 = itVgToUpdate.lv2_v3;
    double lv2_v4 = itVgToUpdate.lv2_v4;
    double lv3_v1 = itVgToUpdate.lv3_v1;
    double lv3_v2 = itVgToUpdate.lv3_v2;
    double lv3_v3 = itVgToUpdate.lv3_v3;
    double lv3_v4 = itVgToUpdate.lv3_v4;
    double lv4_v1 = itVgToUpdate.lv4_v1;
    double lv4_v2 = itVgToUpdate.lv4_v2;
    double lv4_v3 = itVgToUpdate.lv4_v3;
    double lv4_v4 = itVgToUpdate.lv4_v4;

    return update(itVgLocalDatasourceImpl).replace(ItVgLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      lv1_v1: lv1_v1,
      lv1_v2: lv1_v2,
      lv1_v3: lv1_v3,
      lv1_v4: lv1_v4,
      lv2_v1: lv2_v1,
      lv2_v2: lv2_v2,
      lv2_v3: lv2_v3,
      lv2_v4: lv2_v4,
      lv3_v1: lv3_v1,
      lv3_v2: lv3_v2,
      lv3_v3: lv3_v3,
      lv3_v4: lv3_v4,
      lv4_v1: lv4_v1,
      lv4_v2: lv4_v2,
      lv4_v3: lv4_v3,
      lv4_v4: lv4_v4,
      equipmentUsed: EquipmentType,
      updateDate: lastUpdated,
    ));
  }

  //Delete IT Vg by id
  Future<int> deleteItVgById(int id) {
    return (delete(itVgLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////Inverter Transformer-Vg-END/////////////////////////////////

  /////////////////////////////////////////FPRrelay-Starts////////////////////
  Future<int> createFPrelay(FPrelayModel fprtolocal, DateTime dateOfTesting) {
    return into(fPrelayLocalDatasourceImpl)
        .insert(FPrelayLocalDatasourceImplCompanion.insert(
      databaseID: fprtolocal.databaseID,
      etype: fprtolocal.etype,
      trNo: fprtolocal.trNo,
      designation: fprtolocal.designation,
      location: fprtolocal.location,
      serialNo: fprtolocal.serialNo,
      panel: fprtolocal.panel,
      make: fprtolocal.make,
      rtype: fprtolocal.rtype,
      auxVoltage: fprtolocal.auxVoltage,
      ctRatioPri: fprtolocal.ctRatioPri,
      ctRatioSec: fprtolocal.ctRatioSec,
      ptRatio: fprtolocal.ptRatio,
      dateOfTesting: Value(dateOfTesting),
      testedBy: fprtolocal.testedBy,
      verifiedBy: fprtolocal.verifiedBy,
      WitnessedBy: fprtolocal.WitnessedBy,

      // updateDate: AtModel.updateDate,
    ));
  }

  Future<bool> updateFPrelay(FPrelayModel fprtoupdate, int id) {
    int databaseID = fprtoupdate.databaseID;
    String etype = fprtoupdate.etype;
    int trNo = fprtoupdate.trNo;
    String designation = fprtoupdate.designation;
    String location = fprtoupdate.location;
    String serialNo = fprtoupdate.serialNo;
    String make = fprtoupdate.make;
    String rtype = fprtoupdate.rtype;
    String auxVoltage = fprtoupdate.auxVoltage;
    int ctRatioPri = fprtoupdate.ctRatioPri;
    int ctRatioSec = fprtoupdate.ctRatioSec;
    int ptRatio = fprtoupdate.ptRatio;
    DateTime dateOfTesting = fprtoupdate.dateOfTesting;
    DateTime updateDate = fprtoupdate.updateDate;
    String testedBy = fprtoupdate.testedBy;
    String verifiedBy = fprtoupdate.verifiedBy;
    String WitnessedBy = fprtoupdate.WitnessedBy;
    String panel = fprtoupdate.panel;

    return update(fPrelayLocalDatasourceImpl).replace(FPrelayLocalData(
      id: id,
      databaseID: databaseID,
      etype: etype,
      trNo: trNo,
      designation: designation,
      location: location,
      serialNo: serialNo,
      make: make,
      rtype: rtype,
      auxVoltage: auxVoltage,
      ctRatioPri: ctRatioPri,
      ctRatioSec: ctRatioSec,
      ptRatio: ptRatio,
      dateOfTesting: dateOfTesting,
      updateDate: updateDate,
      testedBy: testedBy,
      verifiedBy: verifiedBy,
      WitnessedBy: WitnessedBy,
      panel: panel,
    ));
  }

  Future<List<FPrelayLocalData>> getFPrelayfromLocalDataList() async {
    return await select(fPrelayLocalDatasourceImpl).get();
  }

  Future<int> deleteFPrelayById(int id) {
    return (delete(fPrelayLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<FPrelayLocalData>> getFPrelayLocalDataWithtrNo(int trNo) {
    return (select(fPrelayLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //getCTLocalDataWithSerialNo
  Future<List<FPrelayLocalData>> getFPrelayLocalDataWithSerialNo(String sn) {
    return (select(fPrelayLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sn)))
        .get();
  }

  Future<FPrelayLocalData> getFPrelayLocalDataWithId(int id) {
    return (select(fPrelayLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  ////////////////////////////////FPRcurrentMgmt_LocalDatasource/////////////////////////
  Future<int> createFPRcurrentMgmt(FPRcurrentMgmtModel fprcurrentMgmttoLocal) {
    return into(fPRcurrentMgmtLocalDatasourceImpl)
        .insert(FPRcurrentMgmtLocalDatasourceImplCompanion.insert(
      databaseID: fprcurrentMgmttoLocal.databaseID,
      trNo: fprcurrentMgmttoLocal.trNo,
      serialNo: fprcurrentMgmttoLocal.serialNo,
      equipmentUsed: fprcurrentMgmttoLocal.equipmentUsed,
      rn_measurePrimCurrent: fprcurrentMgmttoLocal.rn_measurePrimCurrent,
      yn_measurePrimCurrent: fprcurrentMgmttoLocal.yn_measurePrimCurrent,
      bn_measurePrimCurrent: fprcurrentMgmttoLocal.bn_measurePrimCurrent,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateFPRcurrentMgmt(
      FPRcurrentMgmtModel fprcurrentMgmtUpdate, int id) {
    int databaseID = fprcurrentMgmtUpdate.databaseID;
    int trNo = fprcurrentMgmtUpdate.trNo;
    String serialNo = fprcurrentMgmtUpdate.serialNo;
    double rn_measurePrimCurrent = fprcurrentMgmtUpdate.rn_measurePrimCurrent;
    double yn_measurePrimCurrent = fprcurrentMgmtUpdate.yn_measurePrimCurrent;
    double bn_measurePrimCurrent = fprcurrentMgmtUpdate.bn_measurePrimCurrent;
    String equipmentUsed = fprcurrentMgmtUpdate.equipmentUsed;
    DateTime updateDate = fprcurrentMgmtUpdate.updateDate;

    return update(fPRcurrentMgmtLocalDatasourceImpl)
        .replace(FPRcurrentMgmtLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      rn_measurePrimCurrent: rn_measurePrimCurrent,
      yn_measurePrimCurrent: yn_measurePrimCurrent,
      bn_measurePrimCurrent: bn_measurePrimCurrent,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<List<FPRcurrentMgmtLocalData>>
      getFPRcurrentmgmtEquipmentListwithAll() async {
    return await select(fPRcurrentMgmtLocalDatasourceImpl).get();
  }

  Future<int> deleteFPRcurrentMgmtById(int id) {
    return (delete(fPRcurrentMgmtLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<FPRcurrentMgmtLocalData> getFPRcurrentMgmtLocalDataWithId(int id) {
    return (select(fPRcurrentMgmtLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<FPRcurrentMgmtLocalData>> getFPRcurrentMgmtLocalDataWithtrNoID(
      int trNo) {
    return (select(fPRcurrentMgmtLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<FPRcurrentMgmtLocalData>> getFPRcurrentMgmtLocalDataWithSerialNo(
      String sNo) {
    return (select(fPRcurrentMgmtLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////FPRvoltageMgmt_LocalDatasource/////////////////////////
  Future<int> createFPRvoltageMgmt(FPRvoltageMgmtModel fprvoltageMgmttoLocal) {
    return into(fPRvoltageMgmtLocalDatasourceImpl)
        .insert(FPRvoltageMgmtLocalDatasourceImplCompanion.insert(
      databaseID: fprvoltageMgmttoLocal.databaseID,
      trNo: fprvoltageMgmttoLocal.trNo,
      serialNo: fprvoltageMgmttoLocal.serialNo,
      equipmentUsed: fprvoltageMgmttoLocal.equipmentUsed,
      rn_applSecVoltage: fprvoltageMgmttoLocal.rn_applSecVoltage,
      rn_measurePrimVoltage: fprvoltageMgmttoLocal.rn_measurePrimVoltage,
      yn_applSecVoltage: fprvoltageMgmttoLocal.yn_applSecVoltage,
      yn_measurePrimVoltage: fprvoltageMgmttoLocal.yn_measurePrimVoltage,
      bn_applSecVoltage: fprvoltageMgmttoLocal.bn_applSecVoltage,
      bn_measurePrimVoltage: fprvoltageMgmttoLocal.bn_measurePrimVoltage,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateFPRvoltageMgmt(
      FPRvoltageMgmtModel fprvoltageMgmtUpdate, int id) {
    int databaseID = fprvoltageMgmtUpdate.databaseID;
    int trNo = fprvoltageMgmtUpdate.trNo;
    String serialNo = fprvoltageMgmtUpdate.serialNo;
    double rn_applSecVoltage = fprvoltageMgmtUpdate.rn_applSecVoltage;
    double rn_measurePrimVoltage = fprvoltageMgmtUpdate.rn_measurePrimVoltage;
    double yn_applSecVoltage = fprvoltageMgmtUpdate.yn_applSecVoltage;
    double yn_measurePrimVoltage = fprvoltageMgmtUpdate.yn_measurePrimVoltage;
    double bn_applSecVoltage = fprvoltageMgmtUpdate.bn_applSecVoltage;
    double bn_measurePrimVoltage = fprvoltageMgmtUpdate.bn_measurePrimVoltage;
    String equipmentUsed = fprvoltageMgmtUpdate.equipmentUsed;
    DateTime updateDate = fprvoltageMgmtUpdate.updateDate;

    return update(fPRvoltageMgmtLocalDatasourceImpl)
        .replace(FPRvoltageMgmtLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      rn_applSecVoltage: rn_applSecVoltage,
      rn_measurePrimVoltage: rn_measurePrimVoltage,
      yn_applSecVoltage: yn_applSecVoltage,
      yn_measurePrimVoltage: yn_measurePrimVoltage,
      bn_applSecVoltage: bn_applSecVoltage,
      bn_measurePrimVoltage: bn_measurePrimVoltage,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<int> deleteFPRvoltageMgmtById(int id) {
    return (delete(fPRvoltageMgmtLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<FPRvoltageMgmtLocalData>>
      getFPRvoltmgmtEquipmentListwithAll() async {
    return await select(fPRvoltageMgmtLocalDatasourceImpl).get();
  }

  Future<FPRvoltageMgmtLocalData> getFPRvoltageMgmtLocalDataWithId(int id) {
    return (select(fPRvoltageMgmtLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<FPRvoltageMgmtLocalData>> getFPRvoltageMgmtLocalDataWithtrNoID(
      int trNo) {
    return (select(fPRvoltageMgmtLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<FPRvoltageMgmtLocalData>> getFPRvoltageMgmtLocalDataWithSerialNo(
      String sNo) {
    return (select(fPRvoltageMgmtLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////FPRovercurrent_LocalDatasource/////////////////////////
  Future<int> createFPRovercurrent(FPRovercurrentModel fprovercurrenttoLocal) {
    return into(fPRovercurrentLocalDatasourceImpl)
        .insert(FPRovercurrentLocalDatasourceImplCompanion.insert(
      databaseID: fprovercurrenttoLocal.databaseID,
      trNo: fprovercurrenttoLocal.trNo,
      serialNo: fprovercurrenttoLocal.serialNo,
      equipmentUsed: fprovercurrenttoLocal.equipmentUsed,
      CurrentSet: fprovercurrenttoLocal.CurrentSet,
      TMS: fprovercurrenttoLocal.TMS,
      delay: fprovercurrenttoLocal.delay,
      rn_pickupCurrent: fprovercurrenttoLocal.rn_pickupCurrent,
      rn_relayOprTime_2x: fprovercurrenttoLocal.rn_relayOprTime_2x,
      rn_relayOprTime_5x: fprovercurrenttoLocal.rn_relayOprTime_5x,
      yn_pickupCurrent: fprovercurrenttoLocal.yn_pickupCurrent,
      yn_relayOprTime_2x: fprovercurrenttoLocal.yn_relayOprTime_2x,
      yn_relayOprTime_5x: fprovercurrenttoLocal.yn_relayOprTime_5x,
      bn_pickupCurrent: fprovercurrenttoLocal.bn_pickupCurrent,
      bn_relayOprTime_2x: fprovercurrenttoLocal.bn_relayOprTime_2x,
      bn_relayOprTime_5x: fprovercurrenttoLocal.bn_relayOprTime_5x,
      stageNo: fprovercurrenttoLocal.stageNo,
      curve: fprovercurrenttoLocal.curve,
      function: fprovercurrenttoLocal.function,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateFPRovercurrent(
      FPRovercurrentModel fprovercurrentUpdate, int id) {
    int databaseID = fprovercurrentUpdate.databaseID;
    int trNo = fprovercurrentUpdate.trNo;
    String serialNo = fprovercurrentUpdate.serialNo;
    double CurrentSet = fprovercurrentUpdate.CurrentSet;
    double TMS = fprovercurrentUpdate.TMS;
    double delay = fprovercurrentUpdate.delay;
    double rn_pickupCurrent = fprovercurrentUpdate.rn_pickupCurrent;
    double rn_relayOprTime_2x = fprovercurrentUpdate.rn_relayOprTime_2x;
    double rn_relayOprTime_5x = fprovercurrentUpdate.rn_relayOprTime_5x;
    double yn_pickupCurrent = fprovercurrentUpdate.yn_pickupCurrent;
    double yn_relayOprTime_2x = fprovercurrentUpdate.yn_relayOprTime_2x;
    double yn_relayOprTime_5x = fprovercurrentUpdate.yn_relayOprTime_5x;
    double bn_pickupCurrent = fprovercurrentUpdate.bn_pickupCurrent;
    double bn_relayOprTime_2x = fprovercurrentUpdate.bn_relayOprTime_2x;
    double bn_relayOprTime_5x = fprovercurrentUpdate.bn_relayOprTime_5x;
    int stageNo = fprovercurrentUpdate.stageNo;
    String curve = fprovercurrentUpdate.curve;
    String function = fprovercurrentUpdate.function;
    String equipmentUsed = fprovercurrentUpdate.equipmentUsed;
    DateTime updateDate = fprovercurrentUpdate.updateDate;

    return update(fPRovercurrentLocalDatasourceImpl)
        .replace(FPRovercurrentLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      CurrentSet: CurrentSet,
      TMS: TMS,
      delay: delay,
      rn_pickupCurrent: rn_pickupCurrent,
      rn_relayOprTime_2x: rn_relayOprTime_2x,
      rn_relayOprTime_5x: rn_relayOprTime_5x,
      yn_pickupCurrent: yn_pickupCurrent,
      yn_relayOprTime_2x: yn_relayOprTime_2x,
      yn_relayOprTime_5x: yn_relayOprTime_5x,
      bn_pickupCurrent: bn_pickupCurrent,
      bn_relayOprTime_2x: bn_relayOprTime_2x,
      bn_relayOprTime_5x: bn_relayOprTime_5x,
      stageNo: stageNo,
      curve: curve,
      function: function,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<int> deleteFPRovercurrentById(int id) {
    return (delete(fPRovercurrentLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<FPRovercurrentLocalData>>
      getFPRovercurrentEquipmentListwithAll() async {
    return await select(fPRovercurrentLocalDatasourceImpl).get();
  }

  Future<FPRovercurrentLocalData> getFPRovercurrentLocalDataWithId(int id) {
    return (select(fPRovercurrentLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<FPRovercurrentLocalData>> getFPRovercurrentLocalDataWithtrNoID(
      int trNo) {
    return (select(fPRovercurrentLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<FPRovercurrentLocalData>> getFPRovercurrentLocalDataWithSerialNo(
      String sNo) {
    return (select(fPRovercurrentLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////FPRearthfault_LocalDatasource/////////////////////////
  Future<int> createFPRearthfault(FPRearthfaultModel fprearthfaulttoLocal) {
    return into(fPRearthfaultLocalDatasourceImpl)
        .insert(FPRearthfaultLocalDatasourceImplCompanion.insert(
      databaseID: fprearthfaulttoLocal.databaseID,
      trNo: fprearthfaulttoLocal.trNo,
      serialNo: fprearthfaulttoLocal.serialNo,
      equipmentUsed: fprearthfaulttoLocal.equipmentUsed,
      currentSet: fprearthfaulttoLocal.currentSet,
      TMS: fprearthfaulttoLocal.TMS,
      delay: fprearthfaulttoLocal.delay,
      pickupCurrent: fprearthfaulttoLocal.pickupCurrent,
      relayOprTime_2x: fprearthfaulttoLocal.relayOprTime_2x,
      relayOprTime_5x: fprearthfaulttoLocal.relayOprTime_5x,
      stageNo: fprearthfaulttoLocal.stageNo,
      curve: fprearthfaulttoLocal.curve,
      function: fprearthfaulttoLocal.function,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateFPRearthfault(
      FPRearthfaultModel fprearthfaultUpdate, int id) {
    int databaseID = fprearthfaultUpdate.databaseID;
    int trNo = fprearthfaultUpdate.trNo;
    String serialNo = fprearthfaultUpdate.serialNo;
    double currentSet = fprearthfaultUpdate.currentSet;
    double TMS = fprearthfaultUpdate.TMS;
    double delay = fprearthfaultUpdate.delay;
    double pickupCurrent = fprearthfaultUpdate.pickupCurrent;
    double relayOprTime_2x = fprearthfaultUpdate.relayOprTime_2x;
    double relayOprTime_5x = fprearthfaultUpdate.relayOprTime_5x;
    int stageNo = fprearthfaultUpdate.stageNo;
    String curve = fprearthfaultUpdate.curve;
    String function = fprearthfaultUpdate.function;
    String equipmentUsed = fprearthfaultUpdate.equipmentUsed;
    DateTime updateDate = fprearthfaultUpdate.updateDate;

    return update(fPRearthfaultLocalDatasourceImpl)
        .replace(FPRearthfaultLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      currentSet: currentSet,
      TMS: TMS,
      delay: delay,
      pickupCurrent: pickupCurrent,
      relayOprTime_2x: relayOprTime_2x,
      relayOprTime_5x: relayOprTime_5x,
      stageNo: stageNo,
      curve: curve,
      function: function,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<List<FPRearthfaultLocalData>>
      getFPRearthfaultEquipmentListwithAll() async {
    return await select(fPRearthfaultLocalDatasourceImpl).get();
  }

  Future<int> deleteFPRearthfaultById(int id) {
    return (delete(fPRearthfaultLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<FPRearthfaultLocalData> getFPRearthfaultLocalDataWithId(int id) {
    return (select(fPRearthfaultLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<FPRearthfaultLocalData>> getFPRearthfaultLocalDataWithtrNoID(
      int trNo) {
    return (select(fPRearthfaultLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<FPRearthfaultLocalData>> getFPRearthfaultLocalDataWithSerialNo(
      String sNo) {
    return (select(fPRearthfaultLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////FPRovervoltage_LocalDatasource/////////////////////////
  Future<int> createFPRovervoltage(FPRovervoltageModel fprovervoltagetoLocal) {
    return into(fPRovervoltageLocalDatasourceImpl)
        .insert(FPRovervoltageLocalDatasourceImplCompanion.insert(
      databaseID: fprovervoltagetoLocal.databaseID,
      trNo: fprovervoltagetoLocal.trNo,
      serialNo: fprovervoltagetoLocal.serialNo,
      equipmentUsed: fprovervoltagetoLocal.equipmentUsed,
      voltageSet: fprovervoltagetoLocal.voltageSet,
      delay: fprovervoltagetoLocal.delay,
      rn_secVoltageSet: fprovervoltagetoLocal.rn_secVoltageSet,
      rn_appliedSecVoltage: fprovervoltagetoLocal.rn_appliedSecVoltage,
      rn_relayOprTime: fprovervoltagetoLocal.rn_relayOprTime,
      yn_secVoltageSet: fprovervoltagetoLocal.yn_secVoltageSet,
      yn_appliedSecVoltage: fprovervoltagetoLocal.yn_appliedSecVoltage,
      yn_relayOprTime: fprovervoltagetoLocal.yn_relayOprTime,
      bn_secVoltageSet: fprovervoltagetoLocal.bn_secVoltageSet,
      bn_appliedSecVoltage: fprovervoltagetoLocal.bn_appliedSecVoltage,
      bn_relayOprTime: fprovervoltagetoLocal.bn_relayOprTime,
      stageNo: fprovervoltagetoLocal.stageNo,
      function: fprovervoltagetoLocal.function,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateFPRovervoltage(
      FPRovervoltageModel fprovervoltageUpdate, int id) {
    int databaseID = fprovervoltageUpdate.databaseID;
    int trNo = fprovervoltageUpdate.trNo;
    String serialNo = fprovervoltageUpdate.serialNo;
    double voltageSet = fprovervoltageUpdate.voltageSet;
    double delay = fprovervoltageUpdate.delay;
    double rn_secVoltageSet = fprovervoltageUpdate.rn_secVoltageSet;
    double rn_appliedSecVoltage = fprovervoltageUpdate.rn_appliedSecVoltage;
    double rn_relayOprTime = fprovervoltageUpdate.rn_relayOprTime;
    double yn_secVoltageSet = fprovervoltageUpdate.yn_secVoltageSet;
    double yn_appliedSecVoltage = fprovervoltageUpdate.yn_appliedSecVoltage;
    double yn_relayOprTime = fprovervoltageUpdate.yn_relayOprTime;
    double bn_secVoltageSet = fprovervoltageUpdate.bn_secVoltageSet;
    double bn_appliedSecVoltage = fprovervoltageUpdate.bn_appliedSecVoltage;
    double bn_relayOprTime = fprovervoltageUpdate.bn_relayOprTime;
    int stageNo = fprovervoltageUpdate.stageNo;
    String function = fprovervoltageUpdate.function;
    String equipmentUsed = fprovervoltageUpdate.equipmentUsed;
    DateTime updateDate = fprovervoltageUpdate.updateDate;

    return update(fPRovervoltageLocalDatasourceImpl)
        .replace(FPRovervoltageLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      voltageSet: voltageSet,
      delay: delay,
      rn_secVoltageSet: rn_secVoltageSet,
      rn_appliedSecVoltage: rn_appliedSecVoltage,
      rn_relayOprTime: rn_relayOprTime,
      yn_secVoltageSet: yn_secVoltageSet,
      yn_appliedSecVoltage: yn_appliedSecVoltage,
      yn_relayOprTime: yn_relayOprTime,
      bn_secVoltageSet: bn_secVoltageSet,
      bn_appliedSecVoltage: bn_appliedSecVoltage,
      bn_relayOprTime: bn_relayOprTime,
      stageNo: stageNo,
      function: function,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<List<FPRovervoltageLocalData>>
      getfprovervoltEquipmentListwithAll() async {
    return await select(fPRovervoltageLocalDatasourceImpl).get();
  }

  Future<int> deleteFPRovervoltageById(int id) {
    return (delete(fPRovervoltageLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<FPRovervoltageLocalData> getFPRovervoltageLocalDataWithId(int id) {
    return (select(fPRovervoltageLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<FPRovervoltageLocalData>> getFPRovervoltageLocalDataWithtrNoID(
      int trNo) {
    return (select(fPRovervoltageLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<FPRovervoltageLocalData>> getFPRovervoltageLocalDataWithSerialNo(
      String sNo) {
    return (select(fPRovervoltageLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////FPRundervoltage_LocalDatasource/////////////////////////
  Future<int> createFPRundervoltage(
      FPRundervoltageModel fprundervoltagetoLocal) {
    return into(fPRundervoltageLocalDatasourceImpl)
        .insert(FPRundervoltageLocalDatasourceImplCompanion.insert(
      databaseID: fprundervoltagetoLocal.databaseID,
      trNo: fprundervoltagetoLocal.trNo,
      serialNo: fprundervoltagetoLocal.serialNo,
      equipmentUsed: fprundervoltagetoLocal.equipmentUsed,
      voltageSet: fprundervoltagetoLocal.voltageSet,
      delay: fprundervoltagetoLocal.delay,
      rn_secVoltageSet: fprundervoltagetoLocal.rn_secVoltageSet,
      rn_appliedSecVoltage: fprundervoltagetoLocal.rn_appliedSecVoltage,
      rn_relayOprTime: fprundervoltagetoLocal.rn_relayOprTime,
      yn_secVoltageSet: fprundervoltagetoLocal.yn_secVoltageSet,
      yn_appliedSecVoltage: fprundervoltagetoLocal.yn_appliedSecVoltage,
      yn_relayOprTime: fprundervoltagetoLocal.yn_relayOprTime,
      bn_secVoltageSet: fprundervoltagetoLocal.bn_secVoltageSet,
      bn_appliedSecVoltage: fprundervoltagetoLocal.bn_appliedSecVoltage,
      bn_relayOprTime: fprundervoltagetoLocal.bn_relayOprTime,
      stageNo: fprundervoltagetoLocal.stageNo,
      function: fprundervoltagetoLocal.function,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateFPRundervoltage(
      FPRundervoltageModel fprundervoltageUpdate, int id) {
    int databaseID = fprundervoltageUpdate.databaseID;
    int trNo = fprundervoltageUpdate.trNo;
    String serialNo = fprundervoltageUpdate.serialNo;
    double voltageSet = fprundervoltageUpdate.voltageSet;
    double delay = fprundervoltageUpdate.delay;
    double rn_secVoltageSet = fprundervoltageUpdate.rn_secVoltageSet;
    double rn_appliedSecVoltage = fprundervoltageUpdate.rn_appliedSecVoltage;
    double rn_relayOprTime = fprundervoltageUpdate.rn_relayOprTime;
    double yn_secVoltageSet = fprundervoltageUpdate.yn_secVoltageSet;
    double yn_appliedSecVoltage = fprundervoltageUpdate.yn_appliedSecVoltage;
    double yn_relayOprTime = fprundervoltageUpdate.yn_relayOprTime;
    double bn_secVoltageSet = fprundervoltageUpdate.bn_secVoltageSet;
    double bn_appliedSecVoltage = fprundervoltageUpdate.bn_appliedSecVoltage;
    double bn_relayOprTime = fprundervoltageUpdate.bn_relayOprTime;
    int stageNo = fprundervoltageUpdate.stageNo;
    String function = fprundervoltageUpdate.function;
    String equipmentUsed = fprundervoltageUpdate.equipmentUsed;
    DateTime updateDate = fprundervoltageUpdate.updateDate;

    return update(fPRundervoltageLocalDatasourceImpl)
        .replace(FPRundervoltageLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      voltageSet: voltageSet,
      delay: delay,
      rn_secVoltageSet: rn_secVoltageSet,
      rn_appliedSecVoltage: rn_appliedSecVoltage,
      rn_relayOprTime: rn_relayOprTime,
      yn_secVoltageSet: yn_secVoltageSet,
      yn_appliedSecVoltage: yn_appliedSecVoltage,
      yn_relayOprTime: yn_relayOprTime,
      bn_secVoltageSet: bn_secVoltageSet,
      bn_appliedSecVoltage: bn_appliedSecVoltage,
      bn_relayOprTime: bn_relayOprTime,
      stageNo: stageNo,
      function: function,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<List<FPRundervoltageLocalData>>
      getFPRundervoltEquipmentListwithAll() async {
    return await select(fPRundervoltageLocalDatasourceImpl).get();
  }

  Future<int> deleteFPRundervoltageById(int id) {
    return (delete(fPRundervoltageLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<FPRundervoltageLocalData> getFPRundervoltageLocalDataWithId(int id) {
    return (select(fPRundervoltageLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<FPRundervoltageLocalData>> getFPRundervoltageLocalDataWithtrNoID(
      int trNo) {
    return (select(fPRundervoltageLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<FPRundervoltageLocalData>>
      getFPRundervoltageLocalDataWithSerialNo(String sNo) {
    return (select(fPRundervoltageLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////FPRoverfreq_LocalDatasource/////////////////////////
  Future<int> createFPRoverfreq(FPRoverfreqModel fproverfreqtoLocal) {
    return into(fPRoverfreqLocalDatasourceImpl)
        .insert(FPRoverfreqLocalDatasourceImplCompanion.insert(
      databaseID: fproverfreqtoLocal.databaseID,
      trNo: fproverfreqtoLocal.trNo,
      serialNo: fproverfreqtoLocal.serialNo,
      equipmentUsed: fproverfreqtoLocal.equipmentUsed,
      frequencySet: fproverfreqtoLocal.frequencySet,
      delay: fproverfreqtoLocal.delay,
      rn_relayOprTime: fproverfreqtoLocal.rn_relayOprTime,
      yn_relayOprTime: fproverfreqtoLocal.yn_relayOprTime,
      bn_relayOprTime: fproverfreqtoLocal.bn_relayOprTime,
      stageNo: fproverfreqtoLocal.stageNo,
      function: fproverfreqtoLocal.function,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateFPRoverfreq(FPRoverfreqModel fproverfreqUpdate, int id) {
    int databaseID = fproverfreqUpdate.databaseID;
    int trNo = fproverfreqUpdate.trNo;
    String serialNo = fproverfreqUpdate.serialNo;
    double frequencySet = fproverfreqUpdate.frequencySet;
    double delay = fproverfreqUpdate.delay;
    double rn_relayOprTime = fproverfreqUpdate.rn_relayOprTime;
    double yn_relayOprTime = fproverfreqUpdate.yn_relayOprTime;
    double bn_relayOprTime = fproverfreqUpdate.bn_relayOprTime;
    int stageNo = fproverfreqUpdate.stageNo;
    String function = fproverfreqUpdate.function;
    String equipmentUsed = fproverfreqUpdate.equipmentUsed;
    DateTime updateDate = fproverfreqUpdate.updateDate;

    return update(fPRoverfreqLocalDatasourceImpl).replace(FPRoverfreqLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      frequencySet: frequencySet,
      delay: delay,
      rn_relayOprTime: rn_relayOprTime,
      yn_relayOprTime: yn_relayOprTime,
      bn_relayOprTime: bn_relayOprTime,
      stageNo: stageNo,
      function: function,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<List<FPRoverfreqLocalData>>
      getFPRoverfreqEquipmentListwithAll() async {
    return await select(fPRoverfreqLocalDatasourceImpl).get();
  }

  Future<int> deleteFPRoverfreqById(int id) {
    return (delete(fPRoverfreqLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<FPRoverfreqLocalData> getFPRoverfreqLocalDataWithId(int id) {
    return (select(fPRoverfreqLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<FPRoverfreqLocalData>> getFPRoverfreqLocalDataWithtrNoID(
      int trNo) {
    return (select(fPRoverfreqLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<FPRoverfreqLocalData>> getFPRoverfreqLocalDataWithSerialNo(
      String sNo) {
    return (select(fPRoverfreqLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  ////////////////////////////////FPRunderfreq_LocalDatasource/////////////////////////
  Future<int> createFPRunderfreq(FPRunderfreqModel fprunderfreqtoLocal) {
    return into(fPRunderfreqLocalDatasourceImpl)
        .insert(FPRunderfreqLocalDatasourceImplCompanion.insert(
      databaseID: fprunderfreqtoLocal.databaseID,
      trNo: fprunderfreqtoLocal.trNo,
      serialNo: fprunderfreqtoLocal.serialNo,
      equipmentUsed: fprunderfreqtoLocal.equipmentUsed,
      frequencySet: fprunderfreqtoLocal.frequencySet,
      delay: fprunderfreqtoLocal.delay,
      rn_relayOprTime: fprunderfreqtoLocal.rn_relayOprTime,
      yn_relayOprTime: fprunderfreqtoLocal.yn_relayOprTime,
      bn_relayOprTime: fprunderfreqtoLocal.bn_relayOprTime,
      stageNo: fprunderfreqtoLocal.stageNo,
      function: fprunderfreqtoLocal.function,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateFPRunderfreq(
      FPRunderfreqModel fprunderfreqUpdate, int id) {
    int databaseID = fprunderfreqUpdate.databaseID;
    int trNo = fprunderfreqUpdate.trNo;
    String serialNo = fprunderfreqUpdate.serialNo;
    double frequencySet = fprunderfreqUpdate.frequencySet;
    double delay = fprunderfreqUpdate.delay;
    double rn_relayOprTime = fprunderfreqUpdate.rn_relayOprTime;
    double yn_relayOprTime = fprunderfreqUpdate.yn_relayOprTime;
    double bn_relayOprTime = fprunderfreqUpdate.bn_relayOprTime;
    int stageNo = fprunderfreqUpdate.stageNo;
    String function = fprunderfreqUpdate.function;
    String equipmentUsed = fprunderfreqUpdate.equipmentUsed;
    DateTime updateDate = fprunderfreqUpdate.updateDate;

    return update(fPRunderfreqLocalDatasourceImpl)
        .replace(FPRunderfreqLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      frequencySet: frequencySet,
      delay: delay,
      rn_relayOprTime: rn_relayOprTime,
      yn_relayOprTime: yn_relayOprTime,
      bn_relayOprTime: bn_relayOprTime,
      stageNo: stageNo,
      function: function,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<int> deleteFPRunderfreqById(int id) {
    return (delete(fPRunderfreqLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<FPRunderfreqLocalData>>
      getFPRunderfreqEquipmentListwithAll() async {
    return await select(fPRunderfreqLocalDatasourceImpl).get();
  }

  Future<FPRunderfreqLocalData> getFPRunderfreqLocalDataWithId(int id) {
    return (select(fPRunderfreqLocalDatasourceImpl)
          ..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<FPRunderfreqLocalData>> getFPRunderfreqLocalDataWithtrNoID(
      int trNo) {
    return (select(fPRunderfreqLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<FPRunderfreqLocalData>> getFPRunderfreqLocalDataWithSerialNo(
      String sNo) {
    return (select(fPRunderfreqLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  /////////////////////////////////////////Auxiliary-Relay-Starts////////////////////
  Future<int> createAR(ARModel artolocal, DateTime dateOfTesting) {
    return into(aRLocalDatasourceImpl)
        .insert(ARLocalDatasourceImplCompanion.insert(
      databaseID: artolocal.databaseID,
      etype: artolocal.etype,
      trNo: artolocal.trNo,
      designation: artolocal.designation,
      location: artolocal.location,
      noOfCoil: artolocal.noOfCoil,
      panel: artolocal.panel,
      make: artolocal.make,
      rtype: artolocal.rtype,
      auxVoltage: artolocal.auxVoltage,
      dateOfTesting: Value(dateOfTesting),
      testedBy: artolocal.testedBy,
      verifiedBy: artolocal.verifiedBy,
      WitnessedBy: artolocal.WitnessedBy,
    ));
  }

  Future<bool> updateAR(ARModel artoupdate, int id) {
    int databaseID = artoupdate.databaseID;
    String etype = artoupdate.etype;
    int trNo = artoupdate.trNo;
    String designation = artoupdate.designation;
    String location = artoupdate.location;
    int noOfCoil = artoupdate.noOfCoil;
    String make = artoupdate.make;
    String rtype = artoupdate.rtype;
    String auxVoltage = artoupdate.auxVoltage;
    DateTime dateOfTesting = artoupdate.dateOfTesting;
    DateTime updateDate = artoupdate.updateDate;
    String testedBy = artoupdate.testedBy;
    String verifiedBy = artoupdate.verifiedBy;
    String WitnessedBy = artoupdate.WitnessedBy;
    String panel = artoupdate.panel;

    return update(aRLocalDatasourceImpl).replace(ARLocalData(
      id: id,
      databaseID: databaseID,
      etype: etype,
      trNo: trNo,
      designation: designation,
      location: location,
      noOfCoil: noOfCoil,
      make: make,
      rtype: rtype,
      auxVoltage: auxVoltage,
      dateOfTesting: dateOfTesting,
      updateDate: updateDate,
      testedBy: testedBy,
      verifiedBy: verifiedBy,
      WitnessedBy: WitnessedBy,
      panel: panel,
    ));
  }

  Future<int> deleteARById(int id) {
    return (delete(aRLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<ARLocalData>> getARLocalDataWithtrNo(int trNo) {
    return (select(aRLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<ARLocalData>> getARfromLocalDataList() async {
    return await select(aRLocalDatasourceImpl).get();
  }

  //getCTLocalDataWithSerialNo
  Future<List<ARLocalData>> getARLocalDataWithSerialNo(String sn) {
    return (select(aRLocalDatasourceImpl)..where((u) => u.make.equals(sn)))
        .get();
  }

  Future<ARLocalData> getARLocalDataWithId(int id) {
    return (select(aRLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  ////////////////////////////////AR-PUDO Test/////////////////////////
  Future<int> createARpudo(ARpudoModel arpudotoLocal) {
    return into(aRpudoLocalDatasourceImpl)
        .insert(ARpudoLocalDatasourceImplCompanion.insert(
      databaseID: arpudotoLocal.databaseID,
      trNo: arpudotoLocal.trNo,
      arRef: arpudotoLocal.arRef,
      coilRef: arpudotoLocal.coilRef,
      equipmentUsed: arpudotoLocal.equipmentUsed,
      coilResistenace: arpudotoLocal.coilResistenace,
      pickUp: arpudotoLocal.pickUp,
      dropOff: arpudotoLocal.dropOff,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateARpudo(ARpudoModel arpudoUpdate, int id) {
    int databaseID = arpudoUpdate.databaseID;
    int trNo = arpudoUpdate.trNo;
    int arRef = arpudoUpdate.arRef;
    String coilRef = arpudoUpdate.coilRef;
    double coilResistenace = arpudoUpdate.coilResistenace;
    int pickUp = arpudoUpdate.pickUp;
    String dropOff = arpudoUpdate.dropOff;
    String equipmentUsed = arpudoUpdate.equipmentUsed;
    DateTime updateDate = arpudoUpdate.updateDate;

    return update(aRpudoLocalDatasourceImpl).replace(ARpudoLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      arRef: arRef,
      coilRef: coilRef,
      coilResistenace: coilResistenace,
      pickUp: pickUp,
      dropOff: dropOff,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<int> deleteARpudoById(int id) {
    return (delete(aRpudoLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<ARpudoLocalData> getARpudoLocalDataWithId(int id) {
    return (select(aRpudoLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<ARpudoLocalData>> getARpudoLocalDataWithtrNoID(int trNo) {
    return (select(aRpudoLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<ARpudoLocalData>> getARpudoLocalDataWithSerialNo(String sNo) {
    return (select(aRpudoLocalDatasourceImpl)
          ..where((u) => u.coilRef.equals(sNo)))
        .get();
  }

  Future<List<ARpudoLocalData>> getARpudoEquipmentListwithAll() async {
    return await select(aRpudoLocalDatasourceImpl).get();
  }

  // //////////////////////////////////////Diesel Engine-LOCAL-DATA-START////////////////////////////
  Future<int> createDg(DgModel dgModel, DateTime dateOfTesting) {
    return into(dgLocalDatasourceImpl)
        .insert(DgLocalDatasourceImplCompanion.insert(
      databaseID: dgModel.databaseID,
      etype: dgModel.etype,
      design: dgModel.design,
      location: dgModel.location,
      rating: dgModel.rating,
      make: dgModel.make,
      model: dgModel.model,
      voltage: dgModel.voltage,
      speed: dgModel.speed,
      powerFactor: dgModel.powerFactor,
      serialNo: dgModel.serialNo,
      yom: dgModel.yom,
      trNo: dgModel.trNo,
      TestedBy: dgModel.TestedBy,
      VerifiedBy: dgModel.VerifiedBy,
      WitnessedBy: dgModel.WitnessedBy,
      dateOfTesting: Value(dateOfTesting),
    ));
  }

  Future<List<DgLocalData>> getDgLocalDataList() async {
    return await select(dgLocalDatasourceImpl).get();
  }

  Future<bool> updateDg(DgModel dgToUpdate, int id) {
    int databaseID = dgToUpdate.databaseID;
    String etype = dgToUpdate.etype;
    String design = dgToUpdate.design;
    String location = dgToUpdate.location;
    int rating = dgToUpdate.rating;
    String serialNo = dgToUpdate.serialNo;
    String make = dgToUpdate.make;
    String model = dgToUpdate.model;
    int voltage = dgToUpdate.voltage;
    double powerFactor = dgToUpdate.powerFactor;
    int speed = dgToUpdate.speed;
    int yom = dgToUpdate.yom;
    DateTime dateOfTesting = dgToUpdate.dateOfTesting;
    int trNo = dgToUpdate.trNo;
    String TestedBy = dgToUpdate.TestedBy;
    String VerifiedBy = dgToUpdate.VerifiedBy;
    String WitnessedBy = dgToUpdate.WitnessedBy;
    DateTime lastUpdated = dgToUpdate.updateDate;

    return update(dgLocalDatasourceImpl).replace(DgLocalData(
      etype: etype,
      id: id,
      databaseID: databaseID,
      design: design,
      location: location,
      rating: rating,
      make: make,
      model: model,
      voltage: voltage,
      speed: speed,
      powerFactor: powerFactor,
      serialNo: serialNo,
      yom: yom,
      trNo: trNo,
      dateOfTesting: dateOfTesting,
      TestedBy: TestedBy,
      VerifiedBy: VerifiedBy,
      WitnessedBy: WitnessedBy,
      lastUpdated: lastUpdated,
    ));
  }

  Future<int> deleteDgById(int id) {
    return (delete(dgLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<DgLocalData>> getDgLocalDatasourceImplList() async {
    return await select(dgLocalDatasourceImpl).get();
  }

  Future<List<DgLocalData>> getDgLocalDataWithtrNo(int trNo) {
    return (select(dgLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<DgLocalData> getDgLocalDataWithId(int id) {
    return (select(dgLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }
  //////////////////////////////////////Diesel Engine-LOCAL-DATA-END////////////////////////////
  ///////////////////////////////////// Diesel Engine-IR-START////////////////////////////

  //Get Gg Ir by Serial No
  Future<List<DgIrLocalData>> getDgIrLocalDataWithSerialNo(String SerialNo) {
    return (select(dgIrLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Get Dg Ir by id
  Future<DgIrLocalData> getDgIrLocalDataWithId(int id) {
    return (select(dgIrLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get DgIr by trNo
  Future<List<DgIrLocalData>> getDgIrLocalDataWithTrNo(int trNo) {
    return (select(dgIrLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get Dg Ir Equipment List
  Future<List<DgIrLocalData>> getDgIrEquipmentList() async {
    return await select(dgIrLocalDatasourceImpl).get();
  }

  // Create Dg Ir and return id

  Future<int> createDgIr(DgIrTestModel dgIrTestModel) {
    return into(dgIrLocalDatasourceImpl)
        .insert(DgIrLocalDatasourceImplCompanion.insert(
      re_mResistance: dgIrTestModel.re_mResistance,
      ye_mResistance: dgIrTestModel.ye_mResistance,
      be_mResistance: dgIrTestModel.be_mResistance,
      serialNo: dgIrTestModel.serialNo,
      trNo: dgIrTestModel.trNo,
      databaseID: dgIrTestModel.databaseID,
      EquipmentType: dgIrTestModel.EquipmentType,
    ));
  }

  //TODO: Update DgIr by id
  Future<bool> updateDgIr(DgIrTestModel dgIrToUpdate, int id) {
    String serialNo = dgIrToUpdate.serialNo;
    int trNo = dgIrToUpdate.trNo;
    int databaseID = dgIrToUpdate.databaseID;
    String EquipmentType = dgIrToUpdate.EquipmentType;
    double re_mResistance = dgIrToUpdate.re_mResistance;
    double ye_mResistance = dgIrToUpdate.ye_mResistance;
    double be_mResistance = dgIrToUpdate.be_mResistance;

    DateTime lastUpdated = dgIrToUpdate.lastUpdated;

    return update(dgIrLocalDatasourceImpl).replace(DgIrLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      re_mResistance: re_mResistance,
      ye_mResistance: ye_mResistance,
      be_mResistance: be_mResistance,
      EquipmentType: EquipmentType,
      lastUpdated: lastUpdated,
    ));
  }

  //Delete Dg Ir by id
  Future<int> deleteDgIrById(int id) {
    return (delete(dgIrLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////Diesel EngineIR-END/////////////////////////////////

  ///////////////////////////////////// Diesel Engine-WR-START////////////////////////////

  //Get Gg Wr by Serial No
  Future<List<DgWrLocalData>> getDgWrLocalDataWithSerialNo(String SerialNo) {
    return (select(dgWrLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(SerialNo)))
        .get();
  }

  //Get Dg Wr by id
  Future<DgWrLocalData> getDgWrLocalDataWithId(int id) {
    return (select(dgWrLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  //Get DgWr by trNo
  Future<List<DgWrLocalData>> getDgWrLocalDataWithTrNo(int trNo) {
    return (select(dgWrLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //Get Dg Wr Equipment List
  Future<List<DgWrLocalData>> getDgWrEquipmentList() async {
    return await select(dgWrLocalDatasourceImpl).get();
  }

  // Create Dg Wr and return id

  Future<int> createDgWr(DgWrTestModel dgWrTestModel) {
    return into(dgWrLocalDatasourceImpl)
        .insert(DgWrLocalDatasourceImplCompanion.insert(
      uv: dgWrTestModel.uv,
      vw: dgWrTestModel.vw,
      wu: dgWrTestModel.wu,
      serialNo: dgWrTestModel.serialNo,
      trNo: dgWrTestModel.trNo,
      databaseID: dgWrTestModel.databaseID,
      EquipmentType: dgWrTestModel.EquipmentType,
    ));
  }

  //TODO: Update DgWr by id
  Future<bool> updateDgWr(DgWrTestModel dgWrToUpdate, int id) {
    String serialNo = dgWrToUpdate.serialNo;
    int trNo = dgWrToUpdate.trNo;
    int databaseID = dgWrToUpdate.databaseID;
    String EquipmentType = dgWrToUpdate.EquipmentType;
    double uv = dgWrToUpdate.uv;
    double vw = dgWrToUpdate.vw;
    double wu = dgWrToUpdate.wu;

    DateTime lastUpdated = dgWrToUpdate.lastUpdated;

    return update(dgWrLocalDatasourceImpl).replace(DgWrLocalData(
      id: id,
      databaseID: databaseID,
      serialNo: serialNo,
      trNo: trNo,
      uv: uv,
      vw: vw,
      wu: wu,
      EquipmentType: EquipmentType,
      lastUpdated: lastUpdated,
    ));
  }

  //Delete Dg Wr by id
  Future<int> deleteDgWrById(int id) {
    return (delete(dgWrLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //////////////////////////////////////Diesel Engine  WR-END/////////////////////////////////
  ////////////////////////////////////////////Timer-Relay-Starts////////////////////
  Future<int> createTr(TrModel trModel, DateTime dateOfTesting) {
    return into(trLocalDatasourceImpl)
        .insert(TrLocalDatasourceImplCompanion.insert(
      databaseID: trModel.databaseID,
      etype: trModel.etype,
      trNo: trModel.trNo,
      designation: trModel.designation,
      location: trModel.location,
      serialNo: trModel.serialNo,
      panel: trModel.panel,
      make: trModel.make,
      rtype: trModel.rtype,
      auxVoltage: trModel.auxVoltage,
      dateOfTesting: Value(dateOfTesting),
      testedBy: trModel.testedBy,
      verifiedBy: trModel.verifiedBy,
      WitnessedBy: trModel.WitnessedBy,

      // updateDate: AtModel.updateDate,
    ));
  }

  Future<bool> updateTr(TrModel arUpdate, int id) {
    int databaseID = arUpdate.databaseID;
    String etype = arUpdate.etype;
    int trNo = arUpdate.trNo;
    String designation = arUpdate.designation;
    String location = arUpdate.location;
    String serialNo = arUpdate.serialNo;
    String make = arUpdate.make;
    String panel = arUpdate.panel;
    String rtype = arUpdate.rtype;
    String auxVoltage = arUpdate.auxVoltage;
    DateTime dateOfTesting = arUpdate.dateOfTesting;
    DateTime updateDate = arUpdate.updateDate;
    String testedBy = arUpdate.testedBy;
    String verifiedBy = arUpdate.verifiedBy;
    String WitnessedBy = arUpdate.WitnessedBy;

    return update(trLocalDatasourceImpl).replace(TrLocalData(
      id: id,
      databaseID: databaseID,
      etype: etype,
      trNo: trNo,
      designation: designation,
      location: location,
      serialNo: serialNo,
      panel: panel,
      make: make,
      rtype: rtype,
      auxVoltage: auxVoltage,
      dateOfTesting: dateOfTesting,
      updateDate: updateDate,
      testedBy: testedBy,
      verifiedBy: verifiedBy,
      WitnessedBy: WitnessedBy,
    ));
  }

  Future<int> deleteTrById(int id) {
    return (delete(trLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<TrLocalData>> getTrLocalDataWithtrNo(int trNo) {
    return (select(trLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  //getCTLocalDataWithSerialNo
  Future<List<TrLocalData>> getTrLocalDataWithSerialNo(String sn) {
    return (select(trLocalDatasourceImpl)..where((u) => u.make.equals(sn)))
        .get();
  }

  Future<TrLocalData> getTrLocalDataWithId(int id) {
    return (select(trLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<TrLocalData>> getTrLocalDatadourceImpleList() async {
    return await select(trLocalDatasourceImpl).get();
  }

/////////////////////////////////Timer Relay End///////////////////////////////////////////////

  ////////////////////////////////TR-PAC Test/////////////////////////
  Future<int> createTrPac(TrPacModel trPactoLocal) {
    return into(trPacLocalDatasourceImpl)
        .insert(TrPacLocalDatasourceImplCompanion.insert(
      databaseID: trPactoLocal.databaseID,
      trNo: trPactoLocal.trNo,
      serialNo: trPactoLocal.serialNo,
      time: trPactoLocal.time,
      equipmentUsed: trPactoLocal.equipmentUsed,
      coilResistenace: trPactoLocal.coilResistenace,
      relayOprTime: trPactoLocal.relayOprTime,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateTrPac(TrPacModel trPacToUpdate, int id) {
    int databaseID = trPacToUpdate.databaseID;
    int trNo = trPacToUpdate.trNo;
    String serialNo = trPacToUpdate.serialNo;
    double coilResistenace = trPacToUpdate.coilResistenace;
    double time = trPacToUpdate.time;
    double relayOprTime = trPacToUpdate.relayOprTime;
    String equipmentUsed = trPacToUpdate.equipmentUsed;
    DateTime updateDate = trPacToUpdate.updateDate;

    return update(trPacLocalDatasourceImpl).replace(TrPacLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      time: time,
      coilResistenace: coilResistenace,
      relayOprTime: relayOprTime,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<int> deleteTrPacById(int id) {
    return (delete(trPacLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<TrPacLocalData> getTrPacLocalDataWithId(int id) {
    return (select(trPacLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<TrPacLocalData>> getTrPacLocalDataWithtrNoID(int trNo) {
    return (select(trPacLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<TrPacLocalData>> getTrPacLocalDataWithSerialNo(String sNo) {
    return (select(trPacLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  Future<List<TrPacLocalData>> getTrpacEquipmentListwithAll() async {
    return await select(trPacLocalDatasourceImpl).get();
  }

//////////////////////////////TR-PAC End ////////////////////////////////////
  ////////////////////////Voltage -Relay-Starts////////////////////
  Future<int> createVr(VrModel vrModel, DateTime dateOfTesting) {
    return into(vrLocalDatasourceImpl)
        .insert(VrLocalDatasourceImplCompanion.insert(
      databaseID: vrModel.databaseID,
      etype: vrModel.etype,
      trNo: vrModel.trNo,
      designation: vrModel.designation,
      location: vrModel.location,
      serialNo: vrModel.serialNo,
      panel: vrModel.panel,
      make: vrModel.make,
      rtype: vrModel.rtype,
      auxVoltage: vrModel.auxVoltage,
      ptRatio: vrModel.ptRatio,
      Vn: vrModel.Vn,
      dateOfTesting: Value(dateOfTesting),
      testedBy: vrModel.testedBy,
      verifiedBy: vrModel.verifiedBy,
      WitnessedBy: vrModel.WitnessedBy,

      // updateDate: AtModel.updateDate,
    ));
  }

  Future<bool> updateVr(VrModel vrUpdate, int id) {
    int databaseID = vrUpdate.databaseID;
    String etype = vrUpdate.etype;
    int trNo = vrUpdate.trNo;
    String designation = vrUpdate.designation;
    String location = vrUpdate.location;
    String serialNo = vrUpdate.serialNo;
    String make = vrUpdate.make;
    String panel = vrUpdate.panel;
    String rtype = vrUpdate.rtype;
    String auxVoltage = vrUpdate.auxVoltage;
    String ptRatio = vrUpdate.ptRatio;
    String Vn = vrUpdate.Vn;
    DateTime dateOfTesting = vrUpdate.dateOfTesting;
    DateTime updateDate = vrUpdate.updateDate;
    String testedBy = vrUpdate.testedBy;
    String verifiedBy = vrUpdate.verifiedBy;
    String WitnessedBy = vrUpdate.WitnessedBy;

    return update(vrLocalDatasourceImpl).replace(VrLocalData(
      id: id,
      databaseID: databaseID,
      etype: etype,
      trNo: trNo,
      designation: designation,
      location: location,
      serialNo: serialNo,
      panel: panel,
      make: make,
      rtype: rtype,
      auxVoltage: auxVoltage,
      ptRatio: ptRatio,
      Vn: Vn,
      dateOfTesting: dateOfTesting,
      updateDate: updateDate,
      testedBy: testedBy,
      verifiedBy: verifiedBy,
      WitnessedBy: WitnessedBy,
    ));
  }

  Future<int> deleteVrById(int id) {
    return (delete(vrLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<VrLocalData>> getVrLocalDataWithtrNo(int trNo) {
    return (select(vrLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<VrLocalData>> getVrLocalDataWithSerialNo(String sn) {
    return (select(vrLocalDatasourceImpl)..where((u) => u.make.equals(sn)))
        .get();
  }

  Future<VrLocalData> getVrLocalDataWithId(int id) {
    return (select(vrLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<VrLocalData>> getVrLocalDatadourceImpleList() async {
    return await select(vrLocalDatasourceImpl).get();
  }

/////////////////////////////////Voltage Relay End///////////////////////////////////////////////

  ////////////////////////////////VR-PAC Test/////////////////////////
  Future<int> createVrPac(VrPacModel vrPactoLocal) {
    return into(vrPacLocalDatasourceImpl)
        .insert(VrPacLocalDatasourceImplCompanion.insert(
      databaseID: vrPactoLocal.databaseID,
      trNo: vrPactoLocal.trNo,
      serialNo: vrPactoLocal.serialNo,
      plugSetting: vrPactoLocal.plugSetting,
      TMS: vrPactoLocal.TMS,
      equipmentUsed: vrPactoLocal.equipmentUsed,
      coilResistanace: vrPactoLocal.coilResistanace,
      plugSettingMul1: vrPactoLocal.plugSettingMul1,
      plugSettingMul2: vrPactoLocal.plugSettingMul2,
      relayOprTime_1x: vrPactoLocal.relayOprTime_1x,
      relayOprTime_3x: vrPactoLocal.relayOprTime_3x,
      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateVrPac(VrPacModel vrPacToUpdate, int id) {
    int databaseID = vrPacToUpdate.databaseID;
    int trNo = vrPacToUpdate.trNo;
    String serialNo = vrPacToUpdate.serialNo;
    double plugSetting = vrPacToUpdate.plugSetting;
    double TMS = vrPacToUpdate.TMS;
    double plugSettingMul1 = vrPacToUpdate.plugSettingMul1;
    double plugSettingMul2 = vrPacToUpdate.plugSettingMul2;
    double coilResistanace = vrPacToUpdate.coilResistanace;
    double relayOprTime_1x = vrPacToUpdate.relayOprTime_1x;
    double relayOprTime_3x = vrPacToUpdate.relayOprTime_3x;
    String equipmentUsed = vrPacToUpdate.equipmentUsed;
    DateTime updateDate = vrPacToUpdate.updateDate;

    return update(vrPacLocalDatasourceImpl).replace(VrPacLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      plugSetting: plugSetting,
      TMS: TMS,
      coilResistanace: coilResistanace,
      plugSettingMul1: plugSettingMul1,
      plugSettingMul2: plugSettingMul2,
      relayOprTime_1x: relayOprTime_1x,
      relayOprTime_3x: relayOprTime_3x,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<int> deleteVrPacById(int id) {
    return (delete(vrPacLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<VrPacLocalData> getVrPacLocalDataWithId(int id) {
    return (select(vrPacLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<VrPacLocalData>> getVrPacLocalDataWithtrNoID(int trNo) {
    return (select(vrPacLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<VrPacLocalData>> getVrPacLocalDataWithSerialNo(String sNo) {
    return (select(vrPacLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  Future<List<VrPacLocalData>> getVrPacEquipmentListwithAll() async {
    return await select(vrPacLocalDatasourceImpl).get();
  }

  //////////////////////////// VR-PAC End ///////////////////////////////
  ////////////////////////Earth Fault earth leakage -Relay-Starts////////////////////
  Future<int> createEfElr(EfElrModel efelrModel, DateTime dateOfTesting) {
    return into(efElrLocalDatasourceImpl)
        .insert(EfElrLocalDatasourceImplCompanion.insert(
      databaseID: efelrModel.databaseID,
      etype: efelrModel.etype,
      trNo: efelrModel.trNo,
      designation: efelrModel.designation,
      location: efelrModel.location,
      serialNo: efelrModel.serialNo,
      panel: efelrModel.panel,
      make: efelrModel.make,
      rtype: efelrModel.rtype,
      auxVoltage: efelrModel.auxVoltage,
      ctRatio: efelrModel.ctRatio,
      dateOfTesting: Value(dateOfTesting),
      testedBy: efelrModel.testedBy,
      verifiedBy: efelrModel.verifiedBy,
      WitnessedBy: efelrModel.WitnessedBy,

      // updateDate: AtModel.updateDate,
    ));
  }

  Future<bool> updateEfElr(EfElrModel efelrUpdate, int id) {
    int databaseID = efelrUpdate.databaseID;
    String etype = efelrUpdate.etype;
    int trNo = efelrUpdate.trNo;
    String designation = efelrUpdate.designation;
    String location = efelrUpdate.location;
    String serialNo = efelrUpdate.serialNo;
    String make = efelrUpdate.make;
    String panel = efelrUpdate.panel;
    String rtype = efelrUpdate.rtype;
    String auxVoltage = efelrUpdate.auxVoltage;
    String ctRatio = efelrUpdate.ctRatio;
    DateTime dateOfTesting = efelrUpdate.dateOfTesting;
    DateTime updateDate = efelrUpdate.updateDate;
    String testedBy = efelrUpdate.testedBy;
    String verifiedBy = efelrUpdate.verifiedBy;
    String WitnessedBy = efelrUpdate.WitnessedBy;

    return update(efElrLocalDatasourceImpl).replace(EfElrLocalData(
      id: id,
      databaseID: databaseID,
      etype: etype,
      trNo: trNo,
      designation: designation,
      location: location,
      serialNo: serialNo,
      panel: panel,
      make: make,
      rtype: rtype,
      auxVoltage: auxVoltage,
      ctRatio: ctRatio,
      dateOfTesting: dateOfTesting,
      updateDate: updateDate,
      testedBy: testedBy,
      verifiedBy: verifiedBy,
      WitnessedBy: WitnessedBy,
    ));
  }

  Future<int> deleteEfElrById(int id) {
    return (delete(efElrLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<EfElrLocalData>> getEfElrLocalDataWithtrNo(int trNo) {
    return (select(efElrLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<EfElrLocalData>> getEfElrLocalDataWithSerialNo(String sn) {
    return (select(efElrLocalDatasourceImpl)..where((u) => u.make.equals(sn)))
        .get();
  }

  Future<EfElrLocalData> getEfElrLocalDataWithId(int id) {
    return (select(efElrLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<EfElrLocalData>> getEFELRLocalDatadourceImpleList() async {
    return await select(efElrLocalDatasourceImpl).get();
  }

/////////////////////////////////Earth Fault earth leakage -Relay End///////////////////////////////////////////////
  ////////////////////////////////EfElR-PAC Test/////////////////////////
  Future<int> createEfElrPac(EfElrPacModel efelrPactoLocal) {
    return into(efElrPacLocalDatasourceImpl)
        .insert(EfElrPacLocalDatasourceImplCompanion.insert(
      databaseID: efelrPactoLocal.databaseID,
      trNo: efelrPactoLocal.trNo,
      serialNo: efelrPactoLocal.serialNo,
      plugSetting: efelrPactoLocal.plugSetting,
      TMS: efelrPactoLocal.TMS,
      plugSetting_Hi: efelrPactoLocal.plugSetting_Hi,
      time: efelrPactoLocal.time,
      plugSettingMul_2x: efelrPactoLocal.plugSettingMul_2x,
      plugSettingMul_5x: efelrPactoLocal.plugSettingMul_5x,
      coilResistanace: efelrPactoLocal.coilResistanace,
      pickupCurrent: efelrPactoLocal.pickupCurrent,
      relayOprTime_2x: efelrPactoLocal.relayOprTime_2x,
      relayOprTime_5x: efelrPactoLocal.relayOprTime_5x,
      relayOprTime_Hi: efelrPactoLocal.relayOprTime_Hi,
      equipmentUsed: efelrPactoLocal.equipmentUsed,

      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateEfElrPac(EfElrPacModel efelrPacUpdate, int id) {
    int databaseID = efelrPacUpdate.databaseID;
    int trNo = efelrPacUpdate.trNo;
    String serialNo = efelrPacUpdate.serialNo;
    double plugSetting = efelrPacUpdate.plugSetting;
    double TMS = efelrPacUpdate.TMS;
    double plugSetting_Hi = efelrPacUpdate.plugSetting_Hi;
    double time = efelrPacUpdate.time;
    double plugSettingMul_2x = efelrPacUpdate.plugSettingMul_2x;
    double plugSettingMul_5x = efelrPacUpdate.plugSettingMul_5x;
    double coilResistanace = efelrPacUpdate.coilResistanace;
    double pickupCurrent = efelrPacUpdate.pickupCurrent;
    double relayOprTime_2x = efelrPacUpdate.relayOprTime_2x;
    double relayOprTime_5x = efelrPacUpdate.relayOprTime_5x;
    double relayOprTime_Hi = efelrPacUpdate.relayOprTime_Hi;
    String equipmentUsed = efelrPacUpdate.equipmentUsed;
    DateTime updateDate = efelrPacUpdate.updateDate;

    return update(efElrPacLocalDatasourceImpl).replace(EfElrPacLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      plugSetting: plugSetting,
      TMS: TMS,
      coilResistanace: coilResistanace,
      plugSetting_Hi: plugSetting_Hi,
      time: time,
      plugSettingMul_2x: plugSettingMul_2x,
      plugSettingMul_5x: plugSettingMul_5x,
      pickupCurrent: pickupCurrent,
      relayOprTime_2x: relayOprTime_2x,
      relayOprTime_5x: relayOprTime_5x,
      relayOprTime_Hi: relayOprTime_Hi,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<int> deleteEfElrPacById(int id) {
    return (delete(efElrPacLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<EfElrPacLocalData> getEfElrPacLocalDataWithId(int id) {
    return (select(efElrPacLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<EfElrPacLocalData>> getEfElrPacLocalDataWithtrNoID(int trNo) {
    return (select(efElrPacLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<EfElrPacLocalData>> getEfElrPacLocalDataWithSerialNo(String sNo) {
    return (select(efElrPacLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  Future<List<EfElrPacLocalData>> getEfElrPacEquipmentListwithAll() async {
    return await select(efElrPacLocalDatasourceImpl).get();
  }

  //////////////////////////// EfEl-PAC End ///////////////////////////////

////////////////////////Over Current Earth Fault-Relay-Starts////////////////////
  Future<int> createOcEfr(OcEfrModel ocefrModel, DateTime dateOfTesting) {
    return into(ocEfrLocalDatasourceImpl)
        .insert(OcEfrLocalDatasourceImplCompanion.insert(
      databaseID: ocefrModel.databaseID,
      etype: ocefrModel.etype,
      trNo: ocefrModel.trNo,
      designation: ocefrModel.designation,
      location: ocefrModel.location,
      serialNo_Rph: ocefrModel.serialNo_Rph,
      serialNo_Yph: ocefrModel.serialNo_Yph,
      serialNo_Bph: ocefrModel.serialNo_Bph,
      panel: ocefrModel.panel,
      make: ocefrModel.make,
      rtype: ocefrModel.rtype,
      auxVoltage: ocefrModel.auxVoltage,
      ctRatio: ocefrModel.ctRatio,
      dateOfTesting: Value(dateOfTesting),
      testedBy: ocefrModel.testedBy,
      verifiedBy: ocefrModel.verifiedBy,
      WitnessedBy: ocefrModel.WitnessedBy,

      // updateDate: AtModel.updateDate,
    ));
  }

  Future<bool> updateOcEfr(OcEfrModel ocefrUpdate, int id) {
    int databaseID = ocefrUpdate.databaseID;
    String etype = ocefrUpdate.etype;
    int trNo = ocefrUpdate.trNo;
    String designation = ocefrUpdate.designation;
    String location = ocefrUpdate.location;
    String serialNo_Rph = ocefrUpdate.serialNo_Rph;
    String serialNo_Yph = ocefrUpdate.serialNo_Yph;
    String serialNo_Bph = ocefrUpdate.serialNo_Bph;
    String make = ocefrUpdate.make;
    String panel = ocefrUpdate.panel;
    String rtype = ocefrUpdate.rtype;
    String auxVoltage = ocefrUpdate.auxVoltage;
    String ctRatio = ocefrUpdate.ctRatio;
    DateTime dateOfTesting = ocefrUpdate.dateOfTesting;
    DateTime updateDate = ocefrUpdate.updateDate;
    String testedBy = ocefrUpdate.testedBy;
    String verifiedBy = ocefrUpdate.verifiedBy;
    String WitnessedBy = ocefrUpdate.WitnessedBy;

    return update(ocEfrLocalDatasourceImpl).replace(OcEfrLocalData(
      id: id,
      databaseID: databaseID,
      etype: etype,
      trNo: trNo,
      designation: designation,
      location: location,
      serialNo_Rph: serialNo_Rph,
      serialNo_Yph: serialNo_Yph,
      serialNo_Bph: serialNo_Bph,
      panel: panel,
      make: make,
      rtype: rtype,
      auxVoltage: auxVoltage,
      ctRatio: ctRatio,
      dateOfTesting: dateOfTesting,
      updateDate: updateDate,
      testedBy: testedBy,
      verifiedBy: verifiedBy,
      WitnessedBy: WitnessedBy,
    ));
  }

  Future<int> deleteOcEfrById(int id) {
    return (delete(ocEfrLocalDatasourceImpl)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<OcEfrLocalData>> getOcEfrLocalDataWithtrNo(int trNo) {
    return (select(ocEfrLocalDatasourceImpl)..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<OcEfrLocalData>> getOcEfrLocalDataWithSerialNo(String sn) {
    return (select(ocEfrLocalDatasourceImpl)..where((u) => u.make.equals(sn)))
        .get();
  }

  Future<OcEfrLocalData> getOcEfrLocalDataWithId(int id) {
    return (select(ocEfrLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<OcEfrLocalData>> getOcEfrLocalDatadourceImpleList() async {
    return await select(ocEfrLocalDatasourceImpl).get();
  }

/////////////////////////////////Over Current Earth Fault -Relay End///////////////////////////////////////////////
  ////////////////////////////////OcEfR-PAC Test/////////////////////////
  Future<int> createOcEfrPac(OcEfrPacModel ocefrPactoLocal) {
    return into(ocEfrPacLocalDatasourceImpl)
        .insert(OcEfrPacLocalDatasourceImplCompanion.insert(
      databaseID: ocefrPactoLocal.databaseID,
      trNo: ocefrPactoLocal.trNo,
      serialNo: ocefrPactoLocal.serialNo,
      r_plugSetting: ocefrPactoLocal.r_plugSetting,
      r_TMS: ocefrPactoLocal.r_TMS,
      r_plugSetting_Hi: ocefrPactoLocal.r_plugSetting_Hi,
      r_time: ocefrPactoLocal.r_time,
      y_plugSetting: ocefrPactoLocal.y_plugSetting,
      y_TMS: ocefrPactoLocal.y_TMS,
      y_plugSetting_Hi: ocefrPactoLocal.y_plugSetting_Hi,
      y_time: ocefrPactoLocal.y_time,
      b_plugSetting: ocefrPactoLocal.b_plugSetting,
      b_TMS: ocefrPactoLocal.b_TMS,
      b_plugSetting_Hi: ocefrPactoLocal.b_plugSetting_Hi,
      b_time: ocefrPactoLocal.b_time,
      plugSettingMul_2x: ocefrPactoLocal.plugSettingMul_2x,
      plugSettingMul_5x: ocefrPactoLocal.plugSettingMul_5x,
      r_coilResistanace: ocefrPactoLocal.r_coilResistanace,
      y_coilResistanace: ocefrPactoLocal.y_coilResistanace,
      b_coilResistanace: ocefrPactoLocal.b_coilResistanace,
      r_pickupCurrent: ocefrPactoLocal.r_pickupCurrent,
      y_pickupCurrent: ocefrPactoLocal.y_pickupCurrent,
      b_pickupCurrent: ocefrPactoLocal.b_pickupCurrent,
      r_relayOprTime_2x: ocefrPactoLocal.r_relayOprTime_2x,
      r_relayOprTime_5x: ocefrPactoLocal.r_relayOprTime_5x,
      r_relayOprTime_Hi: ocefrPactoLocal.r_relayOprTime_Hi,
      y_relayOprTime_2x: ocefrPactoLocal.y_relayOprTime_2x,
      y_relayOprTime_5x: ocefrPactoLocal.y_relayOprTime_5x,
      y_relayOprTime_Hi: ocefrPactoLocal.y_relayOprTime_Hi,
      b_relayOprTime_2x: ocefrPactoLocal.b_relayOprTime_2x,
      b_relayOprTime_5x: ocefrPactoLocal.b_relayOprTime_5x,
      b_relayOprTime_Hi: ocefrPactoLocal.b_relayOprTime_Hi,
      equipmentUsed: ocefrPactoLocal.equipmentUsed,

      //updateDate: ct_core_Model.updateDate,
    ));
  }

  Future<bool> updateOcEfrPac(OcEfrPacModel ocefrPacToUpdate, int id) {
    int databaseID = ocefrPacToUpdate.databaseID;
    int trNo = ocefrPacToUpdate.trNo;
    String serialNo = ocefrPacToUpdate.serialNo;
    double r_plugSetting = ocefrPacToUpdate.r_plugSetting;
    double r_TMS = ocefrPacToUpdate.r_TMS;
    double r_plugSetting_Hi = ocefrPacToUpdate.r_plugSetting_Hi;
    double r_time = ocefrPacToUpdate.r_time;
    double y_plugSetting = ocefrPacToUpdate.y_plugSetting;
    double y_TMS = ocefrPacToUpdate.y_TMS;
    double y_plugSetting_Hi = ocefrPacToUpdate.y_plugSetting_Hi;
    double y_time = ocefrPacToUpdate.y_time;
    double b_plugSetting = ocefrPacToUpdate.b_plugSetting;
    double b_TMS = ocefrPacToUpdate.b_TMS;
    double b_plugSetting_Hi = ocefrPacToUpdate.b_plugSetting_Hi;
    double b_time = ocefrPacToUpdate.b_time;
    double plugSettingMul_2x = ocefrPacToUpdate.plugSettingMul_2x;
    double plugSettingMul_5x = ocefrPacToUpdate.plugSettingMul_5x;
    double r_coilResistanace = ocefrPacToUpdate.r_coilResistanace;
    double y_coilResistanace = ocefrPacToUpdate.y_coilResistanace;
    double b_coilResistanace = ocefrPacToUpdate.b_coilResistanace;
    double r_pickupCurrent = ocefrPacToUpdate.r_pickupCurrent;
    double y_pickupCurrent = ocefrPacToUpdate.y_pickupCurrent;
    double b_pickupCurrent = ocefrPacToUpdate.b_pickupCurrent;
    double r_relayOprTime_2x = ocefrPacToUpdate.r_relayOprTime_2x;
    double r_relayOprTime_5x = ocefrPacToUpdate.r_relayOprTime_5x;
    double r_relayOprTime_Hi = ocefrPacToUpdate.r_relayOprTime_Hi;
    double y_relayOprTime_2x = ocefrPacToUpdate.y_relayOprTime_2x;
    double y_relayOprTime_5x = ocefrPacToUpdate.y_relayOprTime_5x;
    double y_relayOprTime_Hi = ocefrPacToUpdate.y_relayOprTime_Hi;
    double b_relayOprTime_2x = ocefrPacToUpdate.b_relayOprTime_2x;
    double b_relayOprTime_5x = ocefrPacToUpdate.b_relayOprTime_5x;
    double b_relayOprTime_Hi = ocefrPacToUpdate.b_relayOprTime_Hi;
    String equipmentUsed = ocefrPacToUpdate.equipmentUsed;
    DateTime updateDate = ocefrPacToUpdate.updateDate;

    return update(ocEfrPacLocalDatasourceImpl).replace(OcEfrPacLocalData(
      id: id,
      databaseID: databaseID,
      trNo: trNo,
      serialNo: serialNo,
      r_plugSetting: r_plugSetting,
      r_TMS: r_TMS,
      r_plugSetting_Hi: r_plugSetting_Hi,
      r_time: r_time,
      y_plugSetting: y_plugSetting,
      y_TMS: y_TMS,
      y_plugSetting_Hi: y_plugSetting_Hi,
      y_time: y_time,
      b_plugSetting: b_plugSetting,
      b_TMS: b_TMS,
      b_plugSetting_Hi: b_plugSetting_Hi,
      b_time: b_time,
      plugSettingMul_2x: plugSettingMul_2x,
      plugSettingMul_5x: plugSettingMul_5x,
      r_coilResistanace: r_coilResistanace,
      y_coilResistanace: y_coilResistanace,
      b_coilResistanace: b_coilResistanace,
      r_pickupCurrent: r_pickupCurrent,
      y_pickupCurrent: y_pickupCurrent,
      b_pickupCurrent: b_pickupCurrent,
      r_relayOprTime_2x: r_relayOprTime_2x,
      r_relayOprTime_5x: r_relayOprTime_5x,
      r_relayOprTime_Hi: r_relayOprTime_Hi,
      y_relayOprTime_2x: y_relayOprTime_2x,
      y_relayOprTime_5x: y_relayOprTime_5x,
      y_relayOprTime_Hi: y_relayOprTime_Hi,
      b_relayOprTime_2x: b_relayOprTime_2x,
      b_relayOprTime_5x: b_relayOprTime_5x,
      b_relayOprTime_Hi: b_relayOprTime_Hi,
      equipmentUsed: equipmentUsed,
      updateDate: updateDate,
    ));
  }

  Future<int> deleteOcEfrPacById(int id) {
    return (delete(ocEfrPacLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<OcEfrPacLocalData> getOcEfrPacLocalDataWithId(int id) {
    return (select(ocEfrPacLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  Future<List<OcEfrPacLocalData>> getOcEfrPacLocalDataWithtrNoID(int trNo) {
    return (select(ocEfrPacLocalDatasourceImpl)
          ..where((u) => u.trNo.equals(trNo)))
        .get();
  }

  Future<List<OcEfrPacLocalData>> getOcEfrPacLocalDataWithSerialNo(String sNo) {
    return (select(ocEfrPacLocalDatasourceImpl)
          ..where((u) => u.serialNo.equals(sNo)))
        .get();
  }

  Future<List<OcEfrPacLocalData>> getOcEfrPacEquipmentListwithAll() async {
    return await select(ocEfrPacLocalDatasourceImpl).get();
  }

  //////////////////////////// OCEFR-PAC End ///////////////////////////////
}

////////////////////////////////////////////////////////////////////////////////

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db21.sqlite'));
    return NativeDatabase(file);
  });
}

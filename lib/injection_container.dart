import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_testreports/core/platform/network_info.dart';
import 'package:flutter_testreports/core/util/input_converter.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/CT/ct_core_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/EE/ee_loc_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/EE/ee_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/EE/ee_rtest_local_datasource%20copy.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/EE/ee_test_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/LA/la_ir_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/LA/la_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/SC/sc_c_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/acb/acb_cr_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/acb/acb_crm_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/acb/acb_ir_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/acb/acb_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/busbar/bb_cr_local_datasource%20copy.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/busbar/bb_hv_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/busbar/bb_ir_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/busbar/bb_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/isolator/iso_cr_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/isolator/iso_ir_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/power_cable/pc_hv_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/power_cable/pc_ir_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/equipment/power_cable/pc_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/inventory_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_remote_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/users_table_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/repositories/test_report_repository_impl.dart';
import 'package:flutter_testreports/features/testreport/domain/repositories/test_report_repository.dart';
import 'package:flutter_testreports/features/testreport/domain/usecases/get_test_report.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/Relays_providers/EFELRelay_provider/efelr_pac_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/Relays_providers/EFELRelay_provider/efelr_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/Relays_providers/OCEFRelay_provider/ocefr_pac_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/Relays_providers/OCEFRelay_provider/ocefr_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/busbar_provider/bb_cr_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/busbar_provider/bb_hv_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/busbar_provider/bb_ir_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/dg_provider/dg_wr_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/ee_provider/ee_loc_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/ee_provider/ee_test_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/equipment_acb_provider/acb_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/energy_meter_provider/energy_meter_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/energy_meter_provider/energy_meter_vi_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/equipment_acb_provider/inventory_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/equipment_acb_provider/test_report_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/la_provider/la_ir_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/la_provider/la_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/pc_provider/pc_hv_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/pc_provider/pc_ir_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/pc_provider/pc_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/sc_provider/sc_c_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/sc_provider/sc_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/user_table_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/vcb_timing_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/testreport/data/datasources/equipment/Auxiliary_transformer/at_ir_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Auxiliary_transformer/at_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Auxiliary_transformer/at_mb_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Auxiliary_transformer/at_mc_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Auxiliary_transformer/at_r_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Auxiliary_transformer/at_wrHv_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Auxiliary_transformer/at_wrLv_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/CT/ct_core_ir_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/CT/ct_core_kvp_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/CT/ct_core_p_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/CT/ct_core_r_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/CT/ct_core_wr_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/CT/ct_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/CT/ct_tap_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/DG/dg_ir_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/DG/dg_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/DG/dg_wr_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/IT/it_ir_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/IT/it_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/IT/it_mb_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/IT/it_mc_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/IT/it_r_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/IT/it_vg_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/IT/it_wr_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Potential_Tranformer/pt_core_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Potential_Tranformer/pt_core_r_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Potential_Tranformer/pt_core_wr_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Potential_Tranformer/pt_ir_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Potential_Tranformer/pt_local_datasource.dart';

import 'features/testreport/data/datasources/equipment/Power_transformer/powt_bNamePlate_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Power_transformer/powt_ir_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Power_transformer/powt_local_datasource.dart';

import 'features/testreport/data/datasources/equipment/Power_transformer/powt_mb_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Power_transformer/powt_mc_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Power_transformer/powt_r_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Power_transformer/powt_sc_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Power_transformer/powt_td_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Power_transformer/powt_tsc_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Power_transformer/powt_wrHv_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Power_transformer/powt_wrLv_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/AuxiliaryRelay/AR_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/AuxiliaryRelay/AR_pudo_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/EFELRelay/efelr_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/EFELRelay/efelr_pac_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/FPrelay/FPR_currentMgmt_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/FPrelay/FPR_earthfault_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/FPrelay/FPR_overcurrent_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/FPrelay/FPR_overfreq_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/FPrelay/FPR_overvoltage_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/FPrelay/FPR_underfreq_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/FPrelay/FPR_undervoltage_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/FPrelay/FPR_voltageMgmt_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/FPrelay/FPrelay_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/OCEFRelay/ocefr_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/OCEFRelay/ocefr_pac_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/TimerRelay/tr_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/TimerRelay/tr_pac_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/VoltageRelay/vr_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/Relays/VoltageRelay/vr_pac_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/SC/sc_local_datasource.dart';

import 'features/testreport/data/datasources/equipment/acb/vcb_timing_local_datasource.dart';

import 'features/testreport/data/datasources/equipment/energy_meter/energy_meter_ap_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/energy_meter/energy_meter_aprp_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/energy_meter/energy_meter_ci_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/energy_meter/energy_meter_fi_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/energy_meter/energy_meter_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/energy_meter/energy_meter_pfi_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/energy_meter/energy_meter_rp_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/energy_meter/energy_meter_vi_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/isolator/iso_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/powt_3_winding/powt3win_ir_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/powt_3_winding/powt3win_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/powt_3_winding/powt3win_mb_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/powt_3_winding/powt3win_mcHv_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/powt_3_winding/powt3win_mcIvT_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/powt_3_winding/powt3win_mcLv_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/powt_3_winding/powt3win_r_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/powt_3_winding/powt3win_schvivt_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/powt_3_winding/powt3win_schvlv_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/powt_3_winding/powt3win_tsc_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/powt_3_winding/powt3win_wrHv_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/powt_3_winding/powt3win_wrIvT_local_datasource.dart';
import 'features/testreport/data/datasources/equipment/powt_3_winding/powt3win_wrLv_local_datasource.dart';
import 'features/testreport/data/datasources/inventory_remote_database.dart';

import 'features/testreport/data/datasources/user_remote_database.dart';
import 'features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'features/testreport/presentation/providers/Relays_providers/AuxiliaryRelay_providers/AR_provider.dart';
import 'features/testreport/presentation/providers/Relays_providers/AuxiliaryRelay_providers/AR_pudo_provider.dart';
import 'features/testreport/presentation/providers/Relays_providers/FPrelay_providers/FPR_currentMgmt_provider.dart';
import 'features/testreport/presentation/providers/Relays_providers/FPrelay_providers/FPR_earthfault_provider.dart';
import 'features/testreport/presentation/providers/Relays_providers/FPrelay_providers/FPR_overcurrent_provider.dart';
import 'features/testreport/presentation/providers/Relays_providers/FPrelay_providers/FPR_overfreq_provider.dart';
import 'features/testreport/presentation/providers/Relays_providers/FPrelay_providers/FPR_overvoltage_provider.dart';
import 'features/testreport/presentation/providers/Relays_providers/FPrelay_providers/FPR_underfreq_provider.dart';
import 'features/testreport/presentation/providers/Relays_providers/FPrelay_providers/FPR_undervoltage_provider.dart';
import 'features/testreport/presentation/providers/Relays_providers/FPrelay_providers/FPR_voltageMgmt_provider.dart';
import 'features/testreport/presentation/providers/Relays_providers/FPrelay_providers/FPrelay_providers.dart';
import 'features/testreport/presentation/providers/Relays_providers/TimerRelay_provider/tr_pac_provider.dart';
import 'features/testreport/presentation/providers/Relays_providers/TimerRelay_provider/tr_provider.dart';
import 'features/testreport/presentation/providers/Relays_providers/voltageRelay_provider/vr_pac_provider.dart';
import 'features/testreport/presentation/providers/Relays_providers/voltageRelay_provider/vr_provider.dart';
import 'features/testreport/presentation/providers/at_provider/at_ir_provider.dart';
import 'features/testreport/presentation/providers/at_provider/at_mb_provider.dart';
import 'features/testreport/presentation/providers/at_provider/at_mc_provider.dart';
import 'features/testreport/presentation/providers/at_provider/at_provider.dart';
import 'features/testreport/presentation/providers/at_provider/at_r_provider.dart';
import 'features/testreport/presentation/providers/at_provider/at_wrHv_provider.dart';
import 'features/testreport/presentation/providers/at_provider/at_wrLv_provider.dart';
import 'features/testreport/presentation/providers/busbar_provider/bb_provider.dart';
import 'features/testreport/presentation/providers/ct_provider/ct_core_ir_provider.dart';
import 'features/testreport/presentation/providers/ct_provider/ct_core_kvp_provider.dart';
import 'features/testreport/presentation/providers/ct_provider/ct_core_p_provider.dart';
import 'features/testreport/presentation/providers/ct_provider/ct_core_provider.dart';
import 'features/testreport/presentation/providers/ct_provider/ct_core_r_provider.dart';
import 'features/testreport/presentation/providers/ct_provider/ct_core_wr_provider.dart';
import 'features/testreport/presentation/providers/ct_provider/ct_provider.dart';
import 'features/testreport/presentation/providers/ct_provider/ct_tap_provider.dart';
import 'features/testreport/presentation/providers/dg_provider/dg_ir_provider.dart';
import 'features/testreport/presentation/providers/dg_provider/dg_provider.dart';
import 'features/testreport/presentation/providers/ee_provider/ee_provider.dart';
import 'features/testreport/presentation/providers/ee_provider/ee_rtest_provider.dart';
import 'features/testreport/presentation/providers/equipment_acb_provider/acb_cr_provider.dart';
import 'features/testreport/presentation/providers/equipment_acb_provider/acb_crm_provider.dart';
import 'features/testreport/presentation/providers/equipment_acb_provider/acb_ir_provider.dart';
import 'features/testreport/presentation/providers/energy_meter_provider/energy_meter_ap_provider.dart';
import 'features/testreport/presentation/providers/energy_meter_provider/energy_meter_aprp_provider.dart';
import 'features/testreport/presentation/providers/energy_meter_provider/energy_meter_ci_provider.dart';
import 'features/testreport/presentation/providers/energy_meter_provider/energy_meter_fi_provider.dart';
import 'features/testreport/presentation/providers/energy_meter_provider/energy_meter_pfi_provider.dart';
import 'features/testreport/presentation/providers/energy_meter_provider/energy_meter_rp_provider.dart';

import 'features/testreport/presentation/providers/it_provider/it_ir_provider.dart';
import 'features/testreport/presentation/providers/it_provider/it_mb_provider.dart';
import 'features/testreport/presentation/providers/it_provider/it_mc_provider.dart';
import 'features/testreport/presentation/providers/it_provider/it_provider.dart';
import 'features/testreport/presentation/providers/it_provider/it_r_provider.dart';
import 'features/testreport/presentation/providers/it_provider/it_vg_provider.dart';
import 'features/testreport/presentation/providers/it_provider/it_wr_provider.dart';
import 'features/testreport/presentation/providers/powt_3_winding/powt3_wrLv_provider.dart';
import 'features/testreport/presentation/providers/powt_3_winding/powt3win_ir_provider.dart';
import 'features/testreport/presentation/providers/powt_3_winding/powt3win_mb_provider.dart';
import 'features/testreport/presentation/providers/powt_3_winding/powt3win_mcHv_provider.dart';
import 'features/testreport/presentation/providers/powt_3_winding/powt3win_mcIvT_provider.dart';
import 'features/testreport/presentation/providers/powt_3_winding/powt3win_mcLv_provider.dart';
import 'features/testreport/presentation/providers/powt_3_winding/powt3win_r_provider.dart';
import 'features/testreport/presentation/providers/powt_3_winding/powt3win_schvivt_provider.dart';
import 'features/testreport/presentation/providers/powt_3_winding/powt3win_schvlv_provider.dart';
import 'features/testreport/presentation/providers/powt_3_winding/powt3win_tsc_provider.dart';
import 'features/testreport/presentation/providers/powt_3_winding/powt3win_wrHv_provider.dart';
import 'features/testreport/presentation/providers/powt_3_winding/powt3win_wrIvT_provider.dart';
import 'features/testreport/presentation/providers/powt_3_winding/powt_3_winding_provider.dart';
import 'features/testreport/presentation/providers/powt_provider/powt_bNamePlate_provider.dart';
import 'features/testreport/presentation/providers/powt_provider/powt_ir_provider.dart';
import 'features/testreport/presentation/providers/powt_provider/powt_mb_provider.dart';
import 'features/testreport/presentation/providers/powt_provider/powt_mc_provider.dart';
import 'features/testreport/presentation/providers/powt_provider/powt_provider.dart';

import 'features/testreport/presentation/providers/iso_provider/iso_cr_provider.dart';
import 'features/testreport/presentation/providers/iso_provider/iso_ir_provider.dart';
import 'features/testreport/presentation/providers/iso_provider/iso_provider.dart';

import 'features/testreport/presentation/providers/powt_provider/powt_r_provider.dart';
import 'features/testreport/presentation/providers/powt_provider/powt_sc_provider.dart';
import 'features/testreport/presentation/providers/powt_provider/powt_td_provider.dart';
import 'features/testreport/presentation/providers/powt_provider/powt_tsc_provider.dart';
import 'features/testreport/presentation/providers/powt_provider/powt_wrHv_provider.dart';
import 'features/testreport/presentation/providers/powt_provider/powt_wrLv_provider.dart';
import 'features/testreport/presentation/providers/pt_provider/pt_core_provider.dart';
import 'features/testreport/presentation/providers/pt_provider/pt_core_r_provider.dart';
import 'features/testreport/presentation/providers/pt_provider/pt_core_wr_provider.dart';
import 'features/testreport/presentation/providers/pt_provider/pt_ir_provider.dart';
import 'features/testreport/presentation/providers/pt_provider/pt_provider.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //! Features - TestReport
  //StateManagement
  sl.registerSingleton<GoogleSignInController>(
      GoogleSignInController()); //login-page-getitmixin-added
  sl.registerLazySingleton<TestReportsProvider>(() => TestReportsProvider());
  sl.registerLazySingleton<AcbProvider>(() => AcbProvider());
  sl.registerLazySingleton<AcbIrProvider>(() => AcbIrProvider());
  sl.registerLazySingleton<AcbCrmProvider>(() => AcbCrmProvider());
  sl.registerLazySingleton<VcbTimingProvider>(() => VcbTimingProvider());
  sl.registerLazySingleton<EnergyMeterProvider>(() => EnergyMeterProvider());
  sl.registerLazySingleton<EnergyMeterViProvider>(
      () => EnergyMeterViProvider());
  sl.registerLazySingleton<EnergyMeterCiProvider>(
      () => EnergyMeterCiProvider());
  sl.registerLazySingleton<EnergyMeterFiProvider>(
      () => EnergyMeterFiProvider());
  sl.registerLazySingleton<EnergyMeterPfiProvider>(
      () => EnergyMeterPfiProvider());
  sl.registerLazySingleton<EnergyMeterApProvider>(
      () => EnergyMeterApProvider());
  sl.registerLazySingleton<EnergyMeterRpProvider>(
      () => EnergyMeterRpProvider());
  sl.registerLazySingleton<EnergyMeterAprpProvider>(
      () => EnergyMeterAprpProvider());

  sl.registerLazySingleton<UserProvider>(() => UserProvider());
  sl.registerLazySingleton<InventoryProvider>(() => InventoryProvider());
  sl.registerLazySingleton<AcbCRProvider>(() => AcbCRProvider());
  // --------------------------------------------------------------------
  sl.registerLazySingleton<CTProvider>(() => CTProvider());
  sl.registerLazySingleton<CT_core_Provider>(() => CT_core_Provider());
  sl.registerLazySingleton<CTcoreIRProvider>(() => CTcoreIRProvider());
  sl.registerLazySingleton<CTcoreWRProvider>(() => CTcoreWRProvider());
  sl.registerLazySingleton<CTcorePProvider>(() => CTcorePProvider());
  sl.registerLazySingleton<CTcoreRProvider>(() => CTcoreRProvider());
  sl.registerLazySingleton<CTcoreKVPProvider>(() => CTcoreKVPProvider());
  sl.registerLazySingleton<CT_tap_Provider>(() => CT_tap_Provider());
  // --------------------------------------------------------------------
  sl.registerLazySingleton<PTProvider>(() => PTProvider());
  sl.registerLazySingleton<PT_core_Provider>(() => PT_core_Provider());
  sl.registerLazySingleton<PTcoreIRProvider>(() => PTcoreIRProvider());
  sl.registerLazySingleton<PTcoreWRProvider>(() => PTcoreWRProvider());
  sl.registerLazySingleton<PTcoreRProvider>(() => PTcoreRProvider());
  // -------------------------------------------------------------------
  sl.registerLazySingleton<ATProvider>(() => ATProvider());
  sl.registerLazySingleton<ATcoreIRProvider>(() => ATcoreIRProvider());
  sl.registerLazySingleton<ATwrHv_Provider>(() => ATwrHv_Provider());
  sl.registerLazySingleton<ATwrLv_Provider>(() => ATwrLv_Provider());
  sl.registerLazySingleton<AT_R_Provider>(() => AT_R_Provider());
  sl.registerLazySingleton<AT_mc_Provider>(() => AT_mc_Provider());
  sl.registerLazySingleton<AT_mb_Provider>(() => AT_mb_Provider());
  // -------------------------------------------------------------------
  sl.registerLazySingleton<PowtProvider>(() => PowtProvider());
  sl.registerLazySingleton<PowtcoreIRProvider>(() => PowtcoreIRProvider());
  sl.registerLazySingleton<PowttscProvider>(() => PowttscProvider());
  sl.registerLazySingleton<PowtwrHvProvider>(() => PowtwrHvProvider());
  sl.registerLazySingleton<PowtwrLvProvider>(() => PowtwrLvProvider());
  sl.registerLazySingleton<Powt_R_Provider>(() => Powt_R_Provider());
  sl.registerLazySingleton<Powt_mc_Provider>(() => Powt_mc_Provider());
  sl.registerLazySingleton<Powt_mb_Provider>(() => Powt_mb_Provider());
  sl.registerLazySingleton<Powtsc_Provider>(() => Powtsc_Provider());
  sl.registerLazySingleton<PowtbNamePlateProvider>(
      () => PowtbNamePlateProvider());
  sl.registerLazySingleton<PowttdProvider>(() => PowttdProvider());

  //-------------------------------------------------------------
  sl.registerLazySingleton<IsoProvider>(() => IsoProvider());
  sl.registerLazySingleton<IsoIrProvider>(() => IsoIrProvider());
  sl.registerLazySingleton<IsoCrProvider>(() => IsoCrProvider());
  //-------------------------------------------------------------
  sl.registerLazySingleton<LaProvider>(() => LaProvider());
  sl.registerLazySingleton<LaIrProvider>(() => LaIrProvider());
  //-------------------------------------------------------------
  sl.registerLazySingleton<ScProvider>(() => ScProvider());
  sl.registerLazySingleton<ScCProvider>(() => ScCProvider());

  //----------------------------------------------------------------
  sl.registerLazySingleton<PcProvider>(() => PcProvider());
  sl.registerLazySingleton<PcIrProvider>(() => PcIrProvider());
  sl.registerLazySingleton<PcHvProvider>(() => PcHvProvider());

  //----------------------------------------------------------------
  sl.registerLazySingleton<EEProvider>(() => EEProvider());
  sl.registerLazySingleton<EE_loc_Provider>(() => EE_loc_Provider());
  sl.registerLazySingleton<EETestProvider>(() => EETestProvider());
  sl.registerLazySingleton<EERTestProvider>(() => EERTestProvider());

  //----------------------------------------------------------------
  sl.registerLazySingleton<BbProvider>(() => BbProvider());
  sl.registerLazySingleton<BbIrProvider>(() => BbIrProvider());
  sl.registerLazySingleton<BbHvProvider>(() => BbHvProvider());
  sl.registerLazySingleton<BbCrProvider>(() => BbCrProvider());
  // ---------------------------------------------------------------
  sl.registerLazySingleton<Powt3WindingProvider>(() => Powt3WindingProvider());
  sl.registerLazySingleton<Powt3winIRProvider>(() => Powt3winIRProvider());
  sl.registerLazySingleton<Powt3wintscProvider>(() => Powt3wintscProvider());
  sl.registerLazySingleton<Powt3winwrHvProvider>(() => Powt3winwrHvProvider());
  sl.registerLazySingleton<Powt3winwrLvProvider>(() => Powt3winwrLvProvider());
  sl.registerLazySingleton<Powt3winwrIvTProvider>(
      () => Powt3winwrIvTProvider());
  sl.registerLazySingleton<Powt3win_R_Provider>(() => Powt3win_R_Provider());
  sl.registerLazySingleton<Powt3win_mcHv_Provider>(
      () => Powt3win_mcHv_Provider());
  sl.registerLazySingleton<Powt3win_mcLv_Provider>(
      () => Powt3win_mcLv_Provider());
  sl.registerLazySingleton<Powt3winmcIvTProvider>(
      () => Powt3winmcIvTProvider());
  sl.registerLazySingleton<Powt3win_mb_Provider>(() => Powt3win_mb_Provider());
  sl.registerLazySingleton<Powt3winschvlvProvider>(
      () => Powt3winschvlvProvider());
  sl.registerLazySingleton<Powt3winschvivtProvider>(
      () => Powt3winschvivtProvider());

  //-------------------------------------------------------------------------
  sl.registerLazySingleton<FPrelayProvider>(() => FPrelayProvider());
  sl.registerLazySingleton<FPRcurrentMgmtProvider>(
      () => FPRcurrentMgmtProvider());
  sl.registerLazySingleton<FPRvoltageMgmtProvider>(
      () => FPRvoltageMgmtProvider());
  sl.registerLazySingleton<FPRovercurrentProvider>(
      () => FPRovercurrentProvider());
  sl.registerLazySingleton<FPRearthfaultProvider>(
      () => FPRearthfaultProvider());
  sl.registerLazySingleton<FPRovervoltageProvider>(
      () => FPRovervoltageProvider());
  sl.registerLazySingleton<FPRundervoltageProvider>(
      () => FPRundervoltageProvider());
  sl.registerLazySingleton<FPRoverfreqProvider>(() => FPRoverfreqProvider());
  sl.registerLazySingleton<FPRunderfreqProvider>(() => FPRunderfreqProvider());
  // --------------------------------------------------------------------------
  sl.registerLazySingleton<ARProvider>(() => ARProvider());
  sl.registerLazySingleton<ARpudoProvider>(() => ARpudoProvider());
  //-------------------------------------------------------------
  sl.registerLazySingleton<DgProvider>(() => DgProvider());
  sl.registerLazySingleton<DgIrProvider>(() => DgIrProvider());
  sl.registerLazySingleton<DgWrProvider>(() => DgWrProvider());

  // --------------------------------------------------------------------------
  sl.registerLazySingleton<TrProvider>(() => TrProvider());
  sl.registerLazySingleton<TrPacProvider>(() => TrPacProvider());
  // --------------------------------------------------------------------------
  sl.registerLazySingleton<VrProvider>(() => VrProvider());
  sl.registerLazySingleton<VrPacProvider>(() => VrPacProvider());

  // --------------------------------------------------------------------------
  sl.registerLazySingleton<EfElrProvider>(() => EfElrProvider());
  sl.registerLazySingleton<EfElrPacProvider>(() => EfElrPacProvider());

  // --------------------------------------------------------------------------
  sl.registerLazySingleton<OcEfrProvider>(() => OcEfrProvider());
  sl.registerLazySingleton<OcEfrPacProvider>(() => OcEfrPacProvider());
  // --------------------------------------------------------------------------
  sl.registerLazySingleton<ItProvider>(() => ItProvider());
  sl.registerLazySingleton<ItIrProvider>(() => ItIrProvider());
  sl.registerLazySingleton<ItMbProvider>(() => ItMbProvider());
  sl.registerLazySingleton<ItMcProvider>(() => ItMcProvider());
  sl.registerLazySingleton<ItRProvider>(() => ItRProvider());
  sl.registerLazySingleton<ItVgProvider>(() => ItVgProvider());
  sl.registerLazySingleton<ItWrProvider>(() => ItWrProvider());

  ////////////////////////////////////////////////////////////////////////////////////////
  //Usecases
  sl.registerLazySingleton(() => GetTestReport(sl()));

  ////////////////////////////////////////////////////////////////////////////////////////
  //Repository
  sl.registerLazySingleton<TestReportRepository>(
    () => TestReportRepositoryImpl(
      remoteDatasource: sl(),
      localDatasource: sl(),
      networkInfo: sl(),
    ),
  );

  ////////////////////////////////////////////////////////////////////////////////////////
  //Remote-Datasources

  sl.registerLazySingleton<TestReportRemoteDatasourceImpl>(
      () => TestReportRemoteDatasourceImpl(client: sl()));

  sl.registerLazySingleton<UserRemoteDatasourceImpl>(
      () => UserRemoteDatasourceImpl(client: sl()));

  sl.registerLazySingleton<InventoryRemoteDatasourceImpl>(
      () => InventoryRemoteDatasourceImpl(client: sl()));

  ////////////////////////////////////////////////////////////////////////////////////////
  //Local-Datasources

  sl.registerLazySingleton<TestReportLocalDatasourceImpl>(
      () => TestReportLocalDatasourceImpl());

  sl.registerLazySingleton<AcbLocalDatasourceImpl>(
      () => AcbLocalDatasourceImpl());
  sl.registerLazySingleton<EnergyMeterLocalDatasourceImpl>(
      () => EnergyMeterLocalDatasourceImpl());

  sl.registerLazySingleton(() => AcbIrLocalDatasourceImpl());
  sl.registerLazySingleton(() => AcbCrmLocalDatasourceImpl());
  sl.registerLazySingleton(() => VcbTimingLocalDatasourceImpl());
  sl.registerLazySingleton(() => UserLocalDatasourceImpl());
  sl.registerLazySingleton(() => InventorytocalDatasourceImpl());
  sl.registerLazySingleton(() => EnergyMeterViLocalDatasourceImpl());
  sl.registerLazySingleton(() => EnergyMeterCiLocalDatasourceImpl());
  sl.registerLazySingleton(() => EnergyMeterFiLocalDatasourceImpl());
  sl.registerLazySingleton(() => EnergyMeterPfiLocalDatasourceImpl());
  sl.registerLazySingleton(() => EnergyMeterApLocalDatasourceImpl());
  sl.registerLazySingleton(() => EnergyMeterRpLocalDatasourceImpl());
  sl.registerLazySingleton(() => EnergyMeterAprpLocalDatasourceImpl());
  sl.registerLazySingleton(() => AcbCRLocalDatasourceImpl());
  // -----------------------------------------------------------------
  sl.registerLazySingleton(() => CTLocalDatasourceImpl());
  sl.registerLazySingleton(() => CT_core_LocalDatasourceImpl());
  sl.registerLazySingleton(() => CTcoreIRLocalDatasourceImpl());
  sl.registerLazySingleton(() => CTcoreWRLocalDatasourceImpl());
  sl.registerLazySingleton(() => CTcorePLocalDatasourceImpl());
  sl.registerLazySingleton(() => CTcoreRLocalDatasourceImpl());
  sl.registerLazySingleton(() => CTcoreKVPLocalDatasourceImpl());
  sl.registerLazySingleton(() => CT_tap_LocalDatasourceImpl());
  // -----------------------------------------------------------------
  sl.registerLazySingleton(() => PTLocalDatasourceImpl());
  sl.registerLazySingleton(() => PT_core_LocalDatasourceImpl());
  sl.registerLazySingleton(() => PTcoreIRLocalDatasourceImpl());
  sl.registerLazySingleton(() => PTcoreWRLocalDatasourceImpl());
  sl.registerLazySingleton(() => PTcoreRLocalDatasourceImpl());

  // ----------------------------------------------------------------
  sl.registerLazySingleton(() => ATLocalDatasourceImpl());
  sl.registerLazySingleton(() => ATcoreIRLocalDatasourceImpl());
  sl.registerLazySingleton(() => ATwrHv_LocalDatasourceImpl());
  sl.registerLazySingleton(() => ATwrLv_LocalDatasourceImpl());
  sl.registerLazySingleton(() => AT_R_LocalDatasourceImpl());
  sl.registerLazySingleton(() => AT_mc_LocalDatasourceImpl());
  sl.registerLazySingleton(() => AT_mb_LocalDatasourceImpl());
  // ----------------------------------------------------------------
  sl.registerLazySingleton(() => PowtLocalDatasourceImpl());
  sl.registerLazySingleton(() => PowtcoreIRLocalDatasourceImpl());
  sl.registerLazySingleton(() => PowttscLocalDatasourceImpl());
  sl.registerLazySingleton(() => PowtwrHvLocalDatasourceImpl());
  sl.registerLazySingleton(() => PowtwrLvLocalDatasourceImpl());
  sl.registerLazySingleton(() => Powt_R_LocalDatasourceImpl());
  sl.registerLazySingleton(() => Powt_mc_LocalDatasourceImpl());
  sl.registerLazySingleton(() => Powt_mb_LocalDatasourceImpl());
  sl.registerLazySingleton(() => PowtscLocalDatasourceImpl());
  sl.registerLazySingleton(() => PowtbNamePlateLocalDatasourceImpl());
  sl.registerLazySingleton(() => PowttdLocalDatasourceImpl());

  //-----------------------------------------------------------------
  sl.registerLazySingleton(() => LaLocalDatasourceImpl());
  sl.registerLazySingleton(() => LaIrLocalDatasourceImpl());
  //-----------------------------------------------------------------
  sl.registerLazySingleton(() => ScLocalDatasourceImpl());
  sl.registerLazySingleton(() => ScCLocalDatasourceImpl());
//--------------------------------------------------------------------
  sl.registerLazySingleton(() => IsoLocalDatasourceImpl());
  sl.registerLazySingleton(() => IsoIrLocalDatasourceImpl());
  sl.registerLazySingleton(() => IsoCrLocalDatasourceImpl());

  //----------------------------------------------------------------
  sl.registerLazySingleton(() => PcLocalDatasourceImpl());
  sl.registerLazySingleton(() => PcIrLocalDatasourceImpl());
  sl.registerLazySingleton(() => PcHvLocalDatasourceImpl());

  //----------------------------------------------------------------
  sl.registerLazySingleton(() => EELocalDatasourceImpl());
  sl.registerLazySingleton(() => EE_Loc_LocalDatasourceImpl());
  sl.registerLazySingleton(() => EETestLocalDatasourceImpl());
  sl.registerLazySingleton(() => EERTestLocalDatasourceImpl());

  //----------------------------------------------------------------
  sl.registerLazySingleton(() => BbLocalDatasourceImpl());
  sl.registerLazySingleton(() => BbIrLocalDatasourceImpl());
  sl.registerLazySingleton(() => BbCrLocalDatasourceImpl());
  sl.registerLazySingleton(() => BbHvLocalDatasourceImpl());
  // ----------------------------------------------------------------
  sl.registerLazySingleton(() => Powt3WindingLocalDatasourceImpl());
  sl.registerLazySingleton(() => Powt3winIRLocalDatasourceImpl());
  sl.registerLazySingleton(() => Powt3wintscLocalDatasourceImpl());
  sl.registerLazySingleton(() => Powt3winwrHvLocalDatasourceImpl());
  sl.registerLazySingleton(() => Powt3winwrLvLocalDatasourceImpl());
  sl.registerLazySingleton(() => Powt3winwrIvTLocalDatasourceImpl());
  sl.registerLazySingleton(() => Powt3win_R_LocalDatasourceImpl());
  sl.registerLazySingleton(() => Powt3win_mcHv_LocalDatasourceImpl());
  sl.registerLazySingleton(() => Powt3win_mcLv_LocalDatasourceImpl());
  sl.registerLazySingleton(() => Powt3winmcIvTLocalDatasourceImpl());
  sl.registerLazySingleton(() => Powt3win_mb_LocalDatasourceImpl());
  sl.registerLazySingleton(() => Powt3winschvlvLocalDatasourceImpl());
  sl.registerLazySingleton(() => Powt3winschvivtLocalDatasourceImpl());
  // -----------------------------------------------------------------
  sl.registerLazySingleton(() => FPrelayLocalDatasourceImpl());
  sl.registerLazySingleton(() => FPRcurrentMgmtLocalDatasourceImpl());
  sl.registerLazySingleton(() => FPRvoltageMgmtLocalDatasourceImpl());
  sl.registerLazySingleton(() => FPRovercurrentLocalDatasourceImpl());
  sl.registerLazySingleton(() => FPRearthfaultLocalDatasourceImpl());
  sl.registerLazySingleton(() => FPRovervoltageLocalDatasourceImpl());
  sl.registerLazySingleton(() => FPRundervoltageLocalDatasourceImpl());
  sl.registerLazySingleton(() => FPRoverfreqLocalDatasourceImpl());
  sl.registerLazySingleton(() => FPRunderfreqLocalDatasourceImpl());
  // ------------------------------------------------------------------
  sl.registerLazySingleton(() => ARLocalDatasourceImpl());
  sl.registerLazySingleton(() => ARpudoLocalDatasourceImpl());

  //--------------------------------------------------------------------
  sl.registerLazySingleton(() => DgLocalDatasourceImpl());
  sl.registerLazySingleton(() => DgIrLocalDatasourceImpl());
  sl.registerLazySingleton(() => DgWrLocalDatasourceImpl());
// ------------------------------------------------------------------
  sl.registerLazySingleton(() => TrLocalDatasourceImpl());
  sl.registerLazySingleton(() => TrPacLocalDatasourceImpl());
  // ------------------------------------------------------------------
  sl.registerLazySingleton(() => VrLocalDatasourceImpl());
  sl.registerLazySingleton(() => VrPacLocalDatasourceImpl());

  // ------------------------------------------------------------------
  sl.registerLazySingleton(() => EfElrLocalDatasourceImpl());
  sl.registerLazySingleton(() => EfElrPacLocalDatasourceImpl());

  // ------------------------------------------------------------------
  sl.registerLazySingleton(() => OcEfrLocalDatasourceImpl());
  sl.registerLazySingleton(() => OcEfrPacLocalDatasourceImpl());
  // ------------------------------------------------------------------
  sl.registerLazySingleton(() => ItLocalDatasourceImpl());
  sl.registerLazySingleton(() => ItIrLocalDatasourceImpl());
  sl.registerLazySingleton(() => ItMbLocalDatasourceImpl());
  sl.registerLazySingleton(() => ItMcLocalDatasourceImpl());
  sl.registerLazySingleton(() => ItRLocalDatasourceImpl());
  sl.registerLazySingleton(() => ItVgLocalDatasourceImpl());
  sl.registerLazySingleton(() => ItWrLocalDatasourceImpl());

  /////////////////////////////////////////////////////////////////////////////////////////////
  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /////////////////////////////////////////////////////////////////////////////////////////////
  //!External
  sl.registerLazySingleton(() => AppDatabase());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());

  /////////////////////////////////////////////////////////////////////////////////////////////
}

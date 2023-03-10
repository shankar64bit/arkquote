import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/busbar/add_bb_Page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/busbar/add_bb_ir_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/busbar/detail_bb_ir_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/busbar/detail_bb_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/current_transformer/add_CT_core_kvp_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/current_transformer/add_CT_core_p_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/current_transformer/add_CT_core_r_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/earth_electrode/add_ee_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/earth_electrode/add_ee_test_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/earth_electrode/edit_ee_test_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/add_acb_crm_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/add_acb_details.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/add_acb_ir_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/add_test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/add_vcb_timing_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/detail_acb_crm_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/detail_acb_ir_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/detail_acb_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/detail_vcb_timing_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/edit_acb_crm_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/edit_acb_ir_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/edit_acb_page.dart';

import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/login_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/isolater/add_iso_ir_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/isolater/detail_iso_cr_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/isolater/detail_iso_ir_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/isolater/detail_iso_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/isolater/edit_iso_cr_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/lightning_arrester/detail_la_ir_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/power_cable/add_pc_hv_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/power_cable/add_pc_ir_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/power_cable/detail_pc_hv_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/power_cable/detail_pc_ir_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/power_cable/edit_pc_hv_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/power_cable/edit_pc_ir_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/power_cable/edit_pc_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/powt_3_winding/edit_powt3win_tsc_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/surge_counter/add_sc_Page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/surge_counter/add_sc_c_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/surge_counter/detail_sc_c_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/surge_counter/detail_sc_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/surge_counter/edit_sc_c_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/surge_counter/edit_sc_page.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../pages/Potential_transformer/add_pt_core_r_page.dart';
import '../pages/Potential_transformer/add_pt_core_wr_page.dart';
import '../pages/Potential_transformer/detail_pt_core_r_page.dart';
import '../pages/Potential_transformer/detail_pt_core_wr_page.dart';
import '../pages/Potential_transformer/edit_pt_Page.dart';
import '../pages/Potential_transformer/edit_pt_core_page.dart';
import '../pages/Potential_transformer/edit_pt_ir_page.dart';
import '../pages/Potential_transformer/edit_pt_r_page.dart';
import '../pages/Potential_transformer/edit_pt_wr_page.dart';
import '../pages/Relays/AuxiliaryRelay/add_AR_page.dart';
import '../pages/Relays/AuxiliaryRelay/add_AR_pudo_page.dart';
import '../pages/Relays/AuxiliaryRelay/detail_AR_page.dart';
import '../pages/Relays/AuxiliaryRelay/detail_AR_pudo_page.dart';
import '../pages/Relays/AuxiliaryRelay/edit_AR_page.dart';
import '../pages/Relays/AuxiliaryRelay/edit_AR_pudo_page.dart';
import '../pages/Relays/EFELRelay/add_efelr_pac_page.dart';
import '../pages/Relays/EFELRelay/add_efelr_page.dart';
import '../pages/Relays/EFELRelay/detail_efelr_pac_page.dart';
import '../pages/Relays/EFELRelay/detail_efelr_page.dart';
import '../pages/Relays/EFELRelay/edit_efelr_pac_page.dart';
import '../pages/Relays/EFELRelay/edit_efelr_page.dart';
import '../pages/Relays/FPrelay/add_FPR_currentMgmt_page.dart';
import '../pages/Relays/FPrelay/add_FPR_earthfault_page.dart';
import '../pages/Relays/FPrelay/add_FPR_overcurrent_page.dart';
import '../pages/Relays/FPrelay/add_FPR_overfreq_page.dart';
import '../pages/Relays/FPrelay/add_FPR_overvoltage_page.dart';
import '../pages/Relays/FPrelay/add_FPR_underfreq_page.dart';
import '../pages/Relays/FPrelay/add_FPR_undervoltage_page.dart';
import '../pages/Relays/FPrelay/add_FPR_voltageMgmt_page.dart';
import '../pages/Relays/FPrelay/add_FPrelay_page.dart';
import '../pages/Relays/FPrelay/detail_FPR_currentMgmt_page.dart';
import '../pages/Relays/FPrelay/detail_FPR_earthfault_page.dart';
import '../pages/Relays/FPrelay/detail_FPR_overcurrent_page.dart';
import '../pages/Relays/FPrelay/detail_FPR_overfreq_page.dart';
import '../pages/Relays/FPrelay/detail_FPR_overvoltage_page.dart';
import '../pages/Relays/FPrelay/detail_FPR_underfreq_page.dart';
import '../pages/Relays/FPrelay/detail_FPR_undervoltage_page.dart';
import '../pages/Relays/FPrelay/detail_FPR_voltageMgmt_page.dart';
import '../pages/Relays/FPrelay/detail_FPrelay_page.dart';
import '../pages/Relays/FPrelay/edit_FPR_currentMgmt_page.dart';
import '../pages/Relays/FPrelay/edit_FPR_earthfault_page.dart';
import '../pages/Relays/FPrelay/edit_FPR_overcurrent_page.dart';
import '../pages/Relays/FPrelay/edit_FPR_overfreq_page.dart';
import '../pages/Relays/FPrelay/edit_FPR_overvoltage_page.dart';
import '../pages/Relays/FPrelay/edit_FPR_underfreq_page.dart';
import '../pages/Relays/FPrelay/edit_FPR_undervoltage_page.dart';
import '../pages/Relays/FPrelay/edit_FPR_voltageMgmt_page.dart';
import '../pages/Relays/FPrelay/edit_FPrelay_page.dart';
import '../pages/Relays/OCEFRelay/add_ocefr_pac_page.dart';
import '../pages/Relays/OCEFRelay/add_ocefr_page.dart';
import '../pages/Relays/OCEFRelay/detail_ocefr_pac_page.dart';
import '../pages/Relays/OCEFRelay/detail_ocefr_page.dart';
import '../pages/Relays/OCEFRelay/edit_ocefr_pac_page.dart';
import '../pages/Relays/OCEFRelay/edit_ocefr_page.dart';
import '../pages/Relays/TimerRelay/add_tr_pac_page.dart';
import '../pages/Relays/TimerRelay/add_tr_page.dart';
import '../pages/Relays/TimerRelay/detail_tr_pac_page.dart';
import '../pages/Relays/TimerRelay/detail_tr_page.dart';
import '../pages/Relays/TimerRelay/edit_tr_pac_page.dart';
import '../pages/Relays/TimerRelay/edit_tr_page.dart';
import '../pages/Relays/VoltageRelay/add_vr_pac_page.dart';
import '../pages/Relays/VoltageRelay/add_vr_page.dart';
import '../pages/Relays/VoltageRelay/detail_vr_pac_page.dart';
import '../pages/Relays/VoltageRelay/detail_vr_page.dart';
import '../pages/Relays/VoltageRelay/edit_vr_pac_page.dart';
import '../pages/Relays/VoltageRelay/edit_vr_page.dart';
import '../pages/auxiliary_transformer/add_at_ir_page.dart';
import '../pages/auxiliary_transformer/add_at_mb_page.dart';
import '../pages/auxiliary_transformer/add_at_mc_page.dart';
import '../pages/auxiliary_transformer/add_at_page.dart';
import '../pages/auxiliary_transformer/add_at_r_page.dart';
import '../pages/auxiliary_transformer/add_at_wrHv_page.dart';
import '../pages/auxiliary_transformer/add_at_wrLv_page.dart';
import '../pages/auxiliary_transformer/detail_at_ir_page.dart';
import '../pages/auxiliary_transformer/detail_at_mb_page.dart';
import '../pages/auxiliary_transformer/detail_at_mc_page.dart';
import '../pages/auxiliary_transformer/detail_at_page.dart';
import '../pages/auxiliary_transformer/detail_at_r_page.dart';
import '../pages/auxiliary_transformer/detail_at_wrHv_page.dart';
import '../pages/auxiliary_transformer/detail_at_wrLv_page.dart';
import '../pages/auxiliary_transformer/edit_at_ir_page.dart';
import '../pages/auxiliary_transformer/edit_at_mb_page.dart';
import '../pages/auxiliary_transformer/edit_at_mc_page.dart';
import '../pages/auxiliary_transformer/edit_at_page.dart';
import '../pages/auxiliary_transformer/edit_at_r_page.dart';
import '../pages/auxiliary_transformer/edit_at_wrHv_page.dart';
import '../pages/auxiliary_transformer/edit_at_wrLv_page.dart';
import '../pages/busbar/add_bb_cr_page.dart';
import '../pages/busbar/add_bb_hv_page.dart';
import '../pages/busbar/detail_bb_cr_page.dart';
import '../pages/busbar/detail_bb_hv_page.dart';
import '../pages/busbar/edit_bb_cr_page.dart';
import '../pages/busbar/edit_bb_hv_page.dart';
import '../pages/busbar/edit_bb_ir_page.dart';
import '../pages/current_transformer/add_CT_core_ir_page.dart';
import '../pages/current_transformer/add_CT_core_page.dart';
import '../pages/current_transformer/add_CT_core_wr_page.dart';
import '../pages/current_transformer/add_CT_page.dart';
import '../pages/current_transformer/add_CT_tap_page.dart';
import '../pages/current_transformer/detail_CT_core_ir_page.dart';
import '../pages/current_transformer/detail_CT_core_kvp_page.dart';
import '../pages/current_transformer/detail_CT_core_p_page.dart';
import '../pages/current_transformer/detail_CT_core_r_page.dart';
import '../pages/current_transformer/detail_CT_core_wr_page.dart';
import '../pages/current_transformer/detail_CT_page.dart';
import '../pages/current_transformer/detail_CT_tap_page.dart';
import '../pages/current_transformer/details_CT_core_page.dart';
import '../pages/current_transformer/edit_CT_core_ir_page.dart';
import '../pages/current_transformer/edit_CT_core_kvp_page.dart';
import '../pages/current_transformer/edit_CT_core_p_page.dart';
import '../pages/current_transformer/edit_CT_core_page.dart';
import '../pages/current_transformer/edit_CT_core_r_page.dart';
import '../pages/current_transformer/edit_CT_core_wr_page.dart';
import '../pages/current_transformer/edit_CT_page.dart';
import '../pages/current_transformer/edit_CT_tap_page.dart';
import '../pages/diesel_generator/add_dg_Page.dart';
import '../pages/diesel_generator/add_dg_ir_page.dart';
import '../pages/diesel_generator/add_dg_wr_page.dart';
import '../pages/diesel_generator/detail_dg_ir_page.dart';
import '../pages/diesel_generator/detail_dg_page.dart';
import '../pages/diesel_generator/detail_dg_wr_page.dart';
import '../pages/diesel_generator/edit_dg_ir_page.dart';
import '../pages/diesel_generator/edit_dg_page.dart';
import '../pages/diesel_generator/edit_dg_wr_page.dart';
import '../pages/earth_electrode/add_ee_lco_page.dart';
import '../pages/earth_electrode/add_ee_rtest_page.dart';
import '../pages/earth_electrode/detail_ee_loc_page.dart';
import '../pages/earth_electrode/detail_ee_page.dart';
import '../pages/earth_electrode/edit_ee_rtest_page.dart';
import '../pages/energy_meter/add_energy_meter_ap_page.dart';
import '../pages/energy_meter/add_energy_meter_aprp_page.dart';
import '../pages/energy_meter/add_energy_meter_ci_page.dart';
import '../pages/energy_meter/add_energy_meter_fi_page.dart';
import '../pages/energy_meter/add_energy_meter_page.dart';
import '../pages/energy_meter/add_energy_meter_pfi_page.dart';
import '../pages/energy_meter/add_energy_meter_rp_page.dart';
import '../pages/energy_meter/add_energy_meter_vi_page.dart';
import '../pages/energy_meter/detail_energy_meter_ap_page.dart';
import '../pages/energy_meter/detail_energy_meter_aprp_page.dart';
import '../pages/energy_meter/detail_energy_meter_ci_page.dart';
import '../pages/energy_meter/detail_energy_meter_fi_page.dart';
import '../pages/energy_meter/detail_energy_meter_page.dart';
import '../pages/energy_meter/detail_energy_meter_pfi_page.dart';
import '../pages/energy_meter/detail_energy_meter_rp_page.dart';
import '../pages/energy_meter/detail_energy_meter_vi_page.dart';
import '../pages/energy_meter/edit_energy_meter_ap_page.dart';
import '../pages/energy_meter/edit_energy_meter_aprp_page.dart';
import '../pages/energy_meter/edit_energy_meter_ci_page.dart';
import '../pages/energy_meter/edit_energy_meter_fi_page.dart';
import '../pages/energy_meter/edit_energy_meter_page.dart';
import '../pages/energy_meter/edit_energy_meter_pfi_page.dart';
import '../pages/energy_meter/edit_energy_meter_rp_page.dart';
import '../pages/energy_meter/edit_energy_meter_vi_page.dart';
import '../pages/equipment_acb/add_acb_cr_page.dart';
import '../pages/equipment_acb/detail_acb_cr_page.dart';
import '../pages/equipment_acb/detail_test_report_page.dart';
import '../pages/equipment_acb/edit_acb_cr_page.dart';
import '../pages/equipment_acb/edit_test_report.dart';
import '../pages/equipment_acb/edit_vcb_timing_page.dart';

import '../pages/Potential_transformer/add_pt_core_page.dart';
import '../pages/Potential_transformer/add_pt_ir_page.dart';
import '../pages/Potential_transformer/add_pt_page.dart';
import '../pages/Potential_transformer/detail_pt_page.dart';
import '../pages/Potential_transformer/detail_pt_core_page.dart';
import '../pages/Potential_transformer/detail_pt_ir_page.dart';
import '../pages/inverter_transformer/add_it_ir_page.dart';
import '../pages/inverter_transformer/add_it_mb_page.dart';
import '../pages/inverter_transformer/add_it_mc_page.dart';
import '../pages/inverter_transformer/add_it_page.dart';
import '../pages/inverter_transformer/add_it_r_page.dart';
import '../pages/inverter_transformer/add_it_vg_page.dart';
import '../pages/inverter_transformer/add_it_wr_page.dart';
import '../pages/inverter_transformer/detail_it_ir_page.dart';
import '../pages/inverter_transformer/detail_it_mb_page.dart';
import '../pages/inverter_transformer/detail_it_mc_page.dart';
import '../pages/inverter_transformer/detail_it_page.dart';
import '../pages/inverter_transformer/detail_it_r_page.dart';
import '../pages/inverter_transformer/detail_it_wr_page.dart';
import '../pages/inverter_transformer/edit_it_ir_page.dart';
import '../pages/inverter_transformer/edit_it_mb_page.dart';
import '../pages/inverter_transformer/edit_it_mc_page.dart';
import '../pages/inverter_transformer/edit_it_page.dart';
import '../pages/inverter_transformer/edit_it_r_page.dart';
import '../pages/inverter_transformer/edit_it_wr_page.dart';
import '../pages/power_transformer/add_powt_bNamePlate_page.dart';
import '../pages/power_transformer/add_powt_ir_page.dart';
import '../pages/power_transformer/add_powt_mb_page.dart';
import '../pages/power_transformer/add_powt_mc_page.dart';
import '../pages/power_transformer/add_powt_page.dart';
import '../pages/power_transformer/add_powt_r_page.dart';
import '../pages/power_transformer/add_powt_sc_page.dart';
import '../pages/power_transformer/add_powt_td_page.dart';
import '../pages/power_transformer/add_powt_tsc_page.dart';
import '../pages/power_transformer/add_powt_wrHv_page.dart';
import '../pages/power_transformer/add_powt_wrLv_page.dart';
import '../pages/power_transformer/detail_powt_bNamePlate_page.dart';
import '../pages/power_transformer/detail_powt_ir_page.dart';
import '../pages/power_transformer/detail_powt_mb_page.dart';
import '../pages/power_transformer/detail_powt_mc_page.dart';
import '../pages/power_transformer/detail_powt_page.dart';
import '../pages/isolater/add_iso_Page.dart';
import '../pages/isolater/add_iso_cr_page.dart';
import '../pages/isolater/edit_iso_ir_page.dart';
import '../pages/isolater/edit_iso_page.dart';
import '../pages/lightning_arrester/add_la_Page.dart';
import '../pages/lightning_arrester/add_la_ir_page.dart';
import '../pages/lightning_arrester/detail_la_page.dart';
import '../pages/lightning_arrester/edit_la_ir_page.dart';
import '../pages/lightning_arrester/edit_la_page.dart';
import '../pages/power_cable/add_pc_Page.dart';
import '../pages/power_cable/detail_pc_page.dart';
import '../pages/power_transformer/detail_powt_r_page.dart';
import '../pages/power_transformer/detail_powt_sc_page.dart';
import '../pages/power_transformer/detail_powt_td_page.dart';
import '../pages/power_transformer/detail_powt_tsc_page.dart';
import '../pages/power_transformer/detail_powt_wrHv_page.dart';
import '../pages/power_transformer/detail_powt_wrLv_page.dart';
import '../pages/power_transformer/edit_powt_Page.dart';
import '../pages/power_transformer/edit_powt_bNamePlate_page.dart';
import '../pages/power_transformer/edit_powt_ir_page.dart';
import '../pages/power_transformer/edit_powt_mb_page.dart';
import '../pages/power_transformer/edit_powt_mc_page.dart';
import '../pages/power_transformer/edit_powt_r_page.dart';
import '../pages/power_transformer/edit_powt_sc_page.dart';
import '../pages/power_transformer/edit_powt_td_page.dart';
import '../pages/power_transformer/edit_powt_tsc_page.dart';
import '../pages/power_transformer/edit_powt_wrHv_page.dart';
import '../pages/power_transformer/edit_powt_wrLv_page.dart';
import '../pages/powt_3_winding/add_powt3win_ir_page..dart';
import '../pages/powt_3_winding/add_powt3win_mb_page.dart';
import '../pages/powt_3_winding/add_powt3win_mcHv_page.dart';
import '../pages/powt_3_winding/add_powt3win_mcIvT_page.dart';
import '../pages/powt_3_winding/add_powt3win_mcLv_page.dart';
import '../pages/powt_3_winding/add_powt3win_r_page.dart';
import '../pages/powt_3_winding/add_powt3win_schvivt_page.dart';
import '../pages/powt_3_winding/add_powt3win_schvlv_page.dart';
import '../pages/powt_3_winding/add_powt3win_tsc_page.dart';
import '../pages/powt_3_winding/add_powt3win_wrHv_page.dart';
import '../pages/powt_3_winding/add_powt3win_wrIvT_page.dart';
import '../pages/powt_3_winding/add_powt3win_wrLv_page.dart';
import '../pages/powt_3_winding/add_powt_3_winding_page.dart';
import '../pages/powt_3_winding/detail_powt3win_ir_page.dart';
import '../pages/powt_3_winding/detail_powt3win_mb_page.dart';
import '../pages/powt_3_winding/detail_powt3win_mcHv_page.dart';
import '../pages/powt_3_winding/detail_powt3win_mcIvT_page.dart';
import '../pages/powt_3_winding/detail_powt3win_mcLv_page.dart';
import '../pages/powt_3_winding/detail_powt3win_r_page.dart';
import '../pages/powt_3_winding/detail_powt3win_schvivt_page.dart';
import '../pages/powt_3_winding/detail_powt3win_schvlv_page.dart';
import '../pages/powt_3_winding/detail_powt3win_tsc_page.dart';
import '../pages/powt_3_winding/detail_powt3win_wrHv_page.dart';
import '../pages/powt_3_winding/detail_powt3win_wrIvT_page.dart';
import '../pages/powt_3_winding/detail_powt3win_wrLv_page.dart';
import '../pages/powt_3_winding/detail_powt_3_winding_page.dart';
import '../pages/powt_3_winding/edit_powt3win_Page.dart';
import '../pages/powt_3_winding/edit_powt3win_ir_page.dart';
import '../pages/powt_3_winding/edit_powt3win_mb_page copy.dart';
import '../pages/powt_3_winding/edit_powt3win_mcHv_page.dart';
import '../pages/powt_3_winding/edit_powt3win_mcIvt_page.dart';
import '../pages/powt_3_winding/edit_powt3win_mcLv_page.dart';
import '../pages/powt_3_winding/edit_powt3win_r_page.dart';
import '../pages/powt_3_winding/edit_powt3win_schvIvt_page.dart';
import '../pages/powt_3_winding/edit_powt3win_schvlv_page.dart';
import '../pages/powt_3_winding/edit_powt3win_wrHv_page.dart';
import '../pages/powt_3_winding/edit_powt3win_wrIvt_page.dart';
import '../pages/powt_3_winding/edit_powt3win_wrLv_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    //Map args1 = settings.arguments;
    var isloggedin = sl<GoogleSignInController>().isLoggedIn();
    // var isValidUser = sl<GoogleSignInController>().isValidUser();
    try {
      if (!isloggedin) {
        print('Triggerd isloggedin');
        return MaterialPageRoute(builder: (_) => LoginPage());
      }
    } catch (error) {
      return error;
    }

    // List<String> EmailDB = ['shankar2space@gmail.com', 'shan2harry@gmail.com'];
    // try {
    //   if (EmailDB.contains(model.email)) {}
    // } catch (error) {
    //   return error;
    // }

    switch (settings.name) {
      // case '/add_OCB':
      //   return MaterialPageRoute(builder: (_) => AddOCBDetails());
      case '/login_page_init':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/':
        return MaterialPageRoute(builder: (_) => TestReportPage());
      case '/add_report':
        return MaterialPageRoute(builder: (_) => AddTestReportPage());
      case '/edit_report':
        if (args is int) {
          return MaterialPageRoute(
            builder: (_) => EditTestReportPage(
              id: args,
            ),
          );
        }
        return _errorRoute();

      case '/detail_report':
        return MaterialPageRoute(
            builder: (_) => DetailTestReportPage(
                  id: args,
                ));

      // case '/add_OCB':
      //   if (args is Map) {
      //     return MaterialPageRoute(builder: (_) => AddOCBDetails(args));
      //   }
      //   return _errorRoute();

      // case '/add_SF6':
      //   if (args is Map) {
      //     return MaterialPageRoute(builder: (_) => AddSF6etails(args));
      //   }
      //   return _errorRoute();

      case '/add_ACB':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddACBDetails(args));
        }
        return _errorRoute();
      // case '/add_VCB':
      //   if (args is Map) {
      //     return MaterialPageRoute(builder: (_) => AddVCBDetails(args));
      //   }
      //   return _errorRoute();
      case '/edit_ACB':
        return MaterialPageRoute(
          builder: (_) => EditAcbPage(
            id: args,
          ),
        );

      case '/detail_ACB':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailAcbPage(args: args));
        }
        return _errorRoute();
      // --------------------------------
      case '/add_ACB_CR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddAcbCRPage(args));
        }
        return _errorRoute();
      case '/detail_ACB_CR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailAcbCRPage(args));
        }
        return _errorRoute();
      case '/edit_ACB_CR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditAcbCRPage(args));
        }
        return _errorRoute();

      // ---------------------------------
      case '/add_ACB_Ir':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddAcbIrPage(args));
        }
        return _errorRoute();
      case '/detail_ACB_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailAcbIrPage(args));
        }
        return _errorRoute();
      case '/edit_ACB_Ir':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditAcbIrPage(args));
        }
        return _errorRoute();

      // ---------------------------------
      case '/add_ACB_Crm':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddAcbCrmPage(args));
        }
        return _errorRoute();
      case '/detail_ACB_CRM':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailAcbCrmPage(args));
        }
        return _errorRoute();
      case '/edit_ACB_Crm':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditAcbCrmPage(args));
        }
        return _errorRoute();
      // ---------------------------------
      case '/add_VCB_timing':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddVcbTimingPage(args));
        }
        return _errorRoute();
      case '/detail_VCB_timing':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailVcbTimingPage(args));
        }
        return _errorRoute();
      case '/edit_Vcb_Timing':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditVcbTimingPage(args));
        }
        return _errorRoute();

      ////////////////////////Energy Meter///////////////////

      case '/add_EM':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddEnergyMeterDetails(args));
        }
        return _errorRoute();

      case '/edit_EM':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditEnergyMeterPage(args));
        }
        return _errorRoute();

      case '/detail_EM':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailEnergyMeterPage(args));
        }
        return _errorRoute();

      case '/add_EM_VI':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddEnergyMeterViPage(args));
        }
        return _errorRoute();

      case '/detail_EM_VI':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => DetailEnergyMeterViPage(args));
        }
        return _errorRoute();

      case '/add_EM_CI':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddEnergyMeterCiPage(args));
        }
        return _errorRoute();

      case '/detail_EM_CI':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => DetailEnergyMeterCiPage(args));
        }
        return _errorRoute();

      case '/edit_EM_CI':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditEnergyMeterCiPage(args));
        }
        return _errorRoute();

      case '/edit_EM_VI':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditEnergyMeterViPage(args));
        }
        return _errorRoute();

      case '/add_EM_FI':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddEnergyMeterFiPage(args));
        }
        return _errorRoute();

      case '/detail_EM_FI':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => DetailEnergyMeterFiPage(args));
        }
        return _errorRoute();

      case '/edit_EM_FI':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditEnergyMeterFiPage(args));
        }
        return _errorRoute();

      case '/add_EM_PFI':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddEnergyMeterPfiPage(args));
        }
        return _errorRoute();

      case '/detail_EM_PFI':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => DetailEnergyMeterPfiPage(args));
        }
        return _errorRoute();

      case '/edit_EM_PFI':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => EditEnergyMeterPfiPage(args));
        }
        return _errorRoute();

      case '/add_EM_AP':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddEnergyMeterApPage(args));
        }
        return _errorRoute();

      case '/detail_EM_AP':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => DetailEnergyMeterApPage(args));
        }
        return _errorRoute();

      case '/edit_EM_AP':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditEnergyMeterApPage(args));
        }
        return _errorRoute();

      case '/add_EM_RP':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddEnergyMeterRpPage(args));
        }
        return _errorRoute();

      case '/detail_EM_RP':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => DetailEnergyMeterRpPage(args));
        }
        return _errorRoute();

      case '/edit_EM_RP':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditEnergyMeterRpPage(args));
        }
        return _errorRoute();

      case '/add_EM_APRP':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => AddEnergyMeterAprpPage(args));
        }
        return _errorRoute();

      case '/detail_EM_APRP':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => DetailEnergyMeterAprpPage(args));
        }
        return _errorRoute();

      case '/edit_EM_APRP':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => EditEnergyMeterAprpPage(args));
        }
        return _errorRoute();

      ////////////////////////////////CT//////////////////////////////
      case '/add_CT':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_CT_Details(args));
        }
        return _errorRoute();

      case '/detail_CT':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_CT_Page(args));
        }
        return _errorRoute();

      case '/edit_CT':
        return MaterialPageRoute(
          builder: (_) => Edit_CT_Details(
            id: args,
          ),
        );

      case '/add_CT_core':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_CT_core_Details(args));
        }
        return _errorRoute();

      case '/detail_CT_core':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_CT_core_page(args));
        }
        return _errorRoute();

      case '/edit_CT_core':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditCTcorePage(args));
        }
        return _errorRoute();
      /////////////////////////////////CT_core_Tests////////////////////////Add_CTcoreIR
      case '/add_CTcoreIR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_CTcoreIR(args));
        }
        return _errorRoute();

      case '/detail_CTcoreIR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_CTcoreIR_page(args));
        }
        return _errorRoute();

      case '/edit_CTcoreIR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditCTirPage(args));
        }
        return _errorRoute();

      case '/add_CTcoreWR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_CTcoreWR(args));
        }
        return _errorRoute();

      case '/detail_CTcoreWR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_CTcoreWR_page(args));
        }
        return _errorRoute();

      case '/edit_CTcoreWR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditCTwrPage(args));
        }
        return _errorRoute();

      case '/add_CTcoreP':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_CTcoreP(args));
        }
        return _errorRoute();

      case '/detail_CTcoreP':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_CTcoreP_page(args));
        }
        return _errorRoute();

      case '/edit_CTcoreP':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditCTpPage(args));
        }
        return _errorRoute();

      case '/add_CTcoreR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_CTcoreR(args));
        }
        return _errorRoute();

      case '/detail_CTcoreR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_CTcoreR_page(args));
        }
        return _errorRoute();

      case '/edit_CTcoreR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditCTrPage(args));
        }
        return _errorRoute();

      case '/add_CTcoreKVP':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_CTcoreKVP(args));
        }
        return _errorRoute();

      case '/detail_CTcoreKVP':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_CTcoreKVP_page(args));
        }
        return _errorRoute();

      case '/edit_CTcoreKVP':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditCTkvpPage(args));
        }
        return _errorRoute();

      case '/add_CT_tap':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_CT_tap_Details(args));
        }
        return _errorRoute();

      case '/detail_CT_tap':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_CT_tap_page(args));
        }
        return _errorRoute();

      case '/edit_CTcoretap':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditCTcoretapPage(args));
        }
        return _errorRoute();

      ///////////////////////////////potential-transformer////////////////
      case '/add_PT':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_PT_Details(args));
        }
        return _errorRoute();

      case '/detail_PT':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_PT_Page(args));
        }
        return _errorRoute();

      case '/edit_PT':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPtPage(args));
        }
        return _errorRoute();

      case '/add_PT_core':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_PT_core_Details(args));
        }
        return _errorRoute();

      case '/detail_PT_core':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_PT_core_page(args));
        }
        return _errorRoute();
      case '/edit_PT_core':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPtCorePage(args));
        }
        return _errorRoute();

      case '/add_PTcoreIR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_PTcoreIR(args));
        }
        return _errorRoute();

      case '/detail_PTcoreIR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_PTcoreIR_page(args));
        }
        return _errorRoute();

      case '/edit_PTcoreIR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPtIrPage(args));
        }
        return _errorRoute();

      case '/add_PTcoreWR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_PTcoreWR(args));
        }
        return _errorRoute();

      case '/detail_PTcoreWR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_PTcoreWR_page(args));
        }
        return _errorRoute();
      case '/edit_PTcoreWR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPtWrPage(args));
        }
        return _errorRoute();

      case '/add_PTcoreR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_PTcoreR(args));
        }
        return _errorRoute();

      case '/detail_PTcoreR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_PTcoreR_page(args));
        }
        return _errorRoute();

      case '/edit_PTcoreR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPtRPage(args));
        }
        return _errorRoute();

      //--------------------Auxiliary transformer-----------------
      case '/add_AT':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_AT_Details(args));
        }
        return _errorRoute();

      case '/detail_AT':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_AT_Page(args));
        }
        return _errorRoute();

      case '/edit_AT':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditATPage());
        }
        return _errorRoute();

      case '/add_ATcoreIR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_ATcoreIR(args));
        }
        return _errorRoute();

      case '/detail_ATcoreIR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_ATcoreIR_page(args));
        }
        return _errorRoute();

      case '/edit_ATcoreIR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditATirPage(args));
        }
        return _errorRoute();

      case '/add_ATwrHv':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_AtwrHv_Details(args));
        }
        return _errorRoute();

      case '/detail_ATwrHv':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_ATwrHv_page(args));
        }
        return _errorRoute();

      case '/edit_ATwrHv':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditATwrHVPage(args));
        }
        return _errorRoute();

      case '/add_ATwrLv':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_AtwrLv_Details(args));
        }
        return _errorRoute();

      case '/detail_ATwrLv':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_ATwrLv_page(args));
        }
        return _errorRoute();

      case '/edit_ATwrLv':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditATwrLVPage(args));
        }
        return _errorRoute();

      case '/add_AT_R':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_R_Details(args));
        }
        return _errorRoute();

      case '/detail_AT_R':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_AT_R_page(args));
        }
        return _errorRoute();

      case '/edit_AT_R':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditAT_r_Page(args));
        }
        return _errorRoute();

      case '/add_AT_mc':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_At_mc_Details(args));
        }
        return _errorRoute();

      case '/detail_AT_mc':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_AT_mc_page(args));
        }
        return _errorRoute();

      case '/edit_AT_mc':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditATmcPage(args));
        }
        return _errorRoute();

      case '/add_AT_mb':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_At_mb_Details(args));
        }
        return _errorRoute();

      case '/detail_AT_mb':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_AT_mb_page(args));
        }
        return _errorRoute();

      case '/edit_AT_mb':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditATmbPage(args));
        }
        return _errorRoute();

      // ---------------------------------------------------------------------
      //add_POWT

      // //---------------------------------------------------------------------
      // case 'edit_powt':
      // if (args is Map)
      case '/add_POWT':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_Powt_Details(args));
        }
        return _errorRoute();

      case '/detail_POWT':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_Powt_Page(args));
        }
        return _errorRoute();

      case '/edit_POWT':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowtPage(args));
        }
        return _errorRoute();

      case '/add_PowtcoreIR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_PowtcoreIR(args));
        }
        return _errorRoute();

      case '/detail_PowtcoreIR':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_PowtcoreIR_page(args));
        }
        return _errorRoute();

      case '/edit_PowtcoreIR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowtIrPage(args));
        }
        return _errorRoute();

      case '/add_Powttsc':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_Powttsc_Details(args));
        }
        return _errorRoute();

      case '/detail_Powttsc':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_Powttsc_page(args));
        }
        return _errorRoute();

      case '/edit_Powttsc':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowtTscPage(args));
        }
        return _errorRoute();

      case '/add_PowtwrHv':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_PowtwrHv_Details(args));
        }
        return _errorRoute();

      case '/detail_PowtwrHv':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_PowtwrHv_page(args));
        }
        return _errorRoute();

      case '/edit_PowtwrHv':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowtWrHvPage(args));
        }
        return _errorRoute();

      case '/add_PowtwrLv':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_PowtwrLv_Details(args));
        }
        return _errorRoute();

      case '/detail_PowtwrLv':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_PowtwrLv_page(args));
        }
        return _errorRoute();

      case '/edit_PowtwrLv':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowtWrLvPage(args));
        }
        return _errorRoute();

      case '/add_Powt_R':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_PowtR_Details(args));
        }
        return _errorRoute();

      case '/detail_Powt_R':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_Powt_R_page(args));
        }
        return _errorRoute();

      case '/edit_Powt_R':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowtRPage(args));
        }
        return _errorRoute();

      case '/add_Powt_mc':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_Powt_mc_Details(args));
        }
        return _errorRoute();

      case '/detail_Powt_mc':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_Powt_mc_page(args));
        }
        return _errorRoute();

      case '/edit_Powt_mc':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowtMcPage(args));
        }
        return _errorRoute();

      case '/add_Powt_mb':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_Powt_mb_Details(args));
        }
        return _errorRoute();

      case '/detail_Powt_mb':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_Powt_mb_page(args));
        }
        return _errorRoute();
      case '/edit_Powt_mb':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowtMbPage(args));
        }
        return _errorRoute();

      case '/add_Powtsc':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_Powtsc_Details(args));
        }
        return _errorRoute();

      case '/detail_Powtsc':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_Powtsc_page(args));
        }
        return _errorRoute();

      case '/edit_Powtsc':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowtScPage(args));
        }
        return _errorRoute();

      case '/add_Powttd':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_Powttd(args));
        }
        return _errorRoute();

      case '/detail_Powttd':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_Powttd_page(args));
        }
        return _errorRoute();

      case '/edit_Powttd':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowtTdPage(args));
        }
        return _errorRoute();

      case '/add_PowtbNameplate':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_PowtbNamePlate_Details(args));
        }
        return _errorRoute();

      case '/detail_PowtbNameplate':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_PowtbNamePlate_page(args));
        }
        return _errorRoute();

      case '/edit_PowtbNameplate':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => EditPowtbNamePlatePage(args));
        }
        return _errorRoute();

      /////////////////////////////ISOLATER  /////////////////////////
      case '/add_ISO':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddIsoDetails(args));
        }
        return _errorRoute();

      case '/detail_ISO':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailIsoPage(args));
        }
        return _errorRoute();
      case '/add_ISO_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddIsoIrPage(args));
        }
        return _errorRoute();
      case '/add_ISO_CR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddIsoCrPage(args));
        }
        return _errorRoute();
      case '/detail_ISO_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailIsoIrPage(args));
        }
        return _errorRoute();
      case '/detail_ISO_CR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailIsoCrPage(args));
        }
        return _errorRoute();
      case '/edit_ISO':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditIsoPage(args));
        }
        return _errorRoute();
      case '/edit_ISO_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditIsoIrPage(args));
        }
        return _errorRoute();
      case '/edit_ISO_CR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditIsoCrPage(args));
        }
        return _errorRoute();

      ///////////////////////////////Lightning Arrester  /////////////////////////
      case '/add_LA':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddLaDetails(args));
        }
        return _errorRoute();
      case '/edit_LA':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditLaPage(args));
        }
        return _errorRoute();
      case '/detail_LA':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailLaPage(args));
        }
        return _errorRoute();
      case '/add_LA_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddLaIrPage(args));
        }
        return _errorRoute();
      case '/detail_LA_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailLaIrPage(args));
        }
        return _errorRoute();
      case '/edit_LA_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditLaIrPage(args));
        }
        return _errorRoute();

      ///////////////////////////////Surge Counter /////////////////////////
      case '/add_SC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddScDetails(args));
        }
        return _errorRoute();
      case '/edit_SC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditScPage(args));
        }
        return _errorRoute();
      case '/detail_SC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailScPage(args));
        }
        return _errorRoute();
      case '/add_SC_C':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddScCPage(args));
        }
        return _errorRoute();
      case '/detail_SC_C':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailScCPage(args));
        }
        return _errorRoute();
      case '/edit_SC_C':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditScCPage(args));
        }
        return _errorRoute();
      ///////////////////////////////Power Cable /////////////////////////
      case '/add_PC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddPcDetails(args));
        }
        return _errorRoute();
      case '/detail_PC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailPcPage(args));
        }
        return _errorRoute();
      case '/add_PC_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddPcIrPage(args));
        }
        return _errorRoute();
      case '/add_PC_HV':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddPcHvPage(args));
        }
        return _errorRoute();
      case '/detail_PC_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailPcIrPage(args));
        }
        return _errorRoute();
      case '/detail_PC_HV':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailPcHvPage(args));
        }
        return _errorRoute();
      case '/edit_PC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPcPage(args));
        }
        return _errorRoute();
      case '/edit_PC_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPcIrPage(args));
        }
        return _errorRoute();
      case '/edit_PC_HV':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPcHvPage(args));
        }
        return _errorRoute();

        return _errorRoute();
      ///////////////////////////////Power Cable /////////////////////////
      case '/add_EE':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddEEPage(args));
        }
        return _errorRoute();
      case '/detail_EE':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailEEPage(args));
        }
        return _errorRoute();
      case '/detail_EE_LOC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailEELocPage(args));
        }
        return _errorRoute();
      case '/add_EE_LOC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddEELocPage(args));
        }
        return _errorRoute();
      case '/add_EE_TEST':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddEETestPage(args));
        }
        return _errorRoute();
      case '/add_EE_RTEST':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddEERTestPage(args));
        }
        return _errorRoute();
      case '/edit_EE_TEST':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditEETestPage(args));
        }
        return _errorRoute();
      case '/edit_EE_RTEST':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditEERTestPage(args));
        }
        return _errorRoute();

/////////////////////////////Busbar/////////// /////////////////////////
      case '/add_BB':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddBBDetails(args));
        }
        return _errorRoute();
      case '/detail_BB':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailBbPage(args));
        }
        return _errorRoute();

      case '/add_BB_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddBbIrPage(args));
        }
        return _errorRoute();

      case '/detail_BB_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailBbIrPage(args));
        }
        return _errorRoute();
      case '/edit_BB_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditBbIrPage(args));
        }
        return _errorRoute();
      case '/add_BB_CR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddBbCrPage(args));
        }
        return _errorRoute();
      case '/detail_BB_CR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailBbCrPage(args));
        }
        return _errorRoute();
      case '/edit_BB_CR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditBbCrPage(args));
        }
        return _errorRoute();
      case '/add_BB_HV':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddBbHvPage(args));
        }
        return _errorRoute();
      case '/detail_BB_HV':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailBbHvPage(args));
        }
        return _errorRoute();
      case '/edit_BB_HV':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditBbHvPage(args));
        }
        return _errorRoute();

///////////////////////////////Inverter Transformer/////////// /////////////////////////
      case '/add_IT':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_It_Details(args));
        }
        return _errorRoute();
      case '/detail_IT':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailItPage(args));
        }
        return _errorRoute();
      case '/edit_IT':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditItPage(args));
        }
        return _errorRoute();
      case '/add_IT_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddItIrPage(args));
        }
        return _errorRoute();
      case '/detail_IT_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailItIrPage(args));
        }
        return _errorRoute();

      case '/edit_IT_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditItIrPage(args));
        }
        return _errorRoute();
      case '/add_IT_WR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddItWrPage(args));
        }
        return _errorRoute();
      case '/detail_IT_WR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailItWrPage(args));
        }
        return _errorRoute();
      case '/edit_IT_WR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditItWrPage(args));
        }
        return _errorRoute();
      case '/add_IT_R':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddItRPage(args));
        }
        return _errorRoute();
      case '/detail_IT_R':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailItRPage(args));
        }
        return _errorRoute();
      case '/edit_IT_R':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditItRPage(args));
        }
        return _errorRoute();
      case '/add_IT_MC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddItMcPage(args));
        }
        return _errorRoute();
      case '/detail_IT_MC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailItMcPage(args));
        }
        return _errorRoute();
      case '/edit_IT_MC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditItMcPage(args));
        }
        return _errorRoute();

      case '/add_IT_MB':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddItMbPage(args));
        }
        return _errorRoute();
      case '/detail_IT_MB':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailItMbPage(args));
        }
        return _errorRoute();
      case '/edit_IT_MB':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditItMbPage(args));
        }
        return _errorRoute();
      case '/add_IT_VG':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddItVgPage(args));
        }
        return _errorRoute();
      case '/detail_IT_VG':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailItMbPage(args));
        }
        return _errorRoute();
      case '/edit_IT_Vg':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditItMbPage(args));
        }
        return _errorRoute();
      // --------------------------------------------------------------------
      case '/add_POWT3WIN':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_Powt3Winding_Details(args));
        }
        return _errorRoute();

      case '/detail_POWT3WIN':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_Powt3Winding_Page(args));
        }
        return _errorRoute();

      case '/edit_Powt3Winding':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowt3WindingPage(args));
        }
        return _errorRoute();

      case '/add_POWT3WIN_ir':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_Powt3winIR(args));
        }
        return _errorRoute();

      case '/detail_POWT3WIN_ir':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_Powt3winIR_page(args));
        }
        return _errorRoute();

      case '/edit_Powt3winIR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowt3winIrPage(args));
        }
        return _errorRoute();

      case '/add_POWT3WIN_tsc':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_Powt3wintsc_Details(args));
        }
        return _errorRoute();

      case '/detail_POWT3WIN_tsc':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_Powt3wintsc_page(args));
        }
        return _errorRoute();

      case '/Edit_POWT3WIN_tsc':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowt3winTscPage(args));
        }
        return _errorRoute();

      case '/add_POWT3WIN_wrHv':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_Powt3winwrHv_Details(args));
        }
        return _errorRoute();

      case '/detail_POWT3WIN_wrHv':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_Powt3winwrHv_page(args));
        }
        return _errorRoute();

      case '/edit_POWT3WIN_wrHv':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowt3winwrHvPage(args));
        }
        return _errorRoute();

      case '/add_POWT3WIN_wrLv':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_Powt3winwrLv_Details(args));
        }
        return _errorRoute();

      case '/detail_POWT3WIN_wrLv':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_Powt3winwrLv_page(args));
        }
        return _errorRoute();

      case '/edit_POWT3WIN_wrLv':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowt3winwrLvPage(args));
        }
        return _errorRoute();

      case '/add_POWT3WIN_wrIvT':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_PowtwrIvT_Details(args));
        }
        return _errorRoute();

      case '/detail_POWT3WIN_wrIvT':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_Powt3winwrIvT_page(args));
        }
        return _errorRoute();

      case '/edit_POWT3WIN_wrIvT':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowt3winwrIvtPage(args));
        }
        return _errorRoute();

      case '/add_POWT3WIN_r':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_Powt3winR_Details(args));
        }
        return _errorRoute();

      case '/detail_POWT3WIN_r':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_Powt3win_R_page(args));
        }
        return _errorRoute();

      case '/edit_POWT3WIN_r':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowt3winRPage(args));
        }
        return _errorRoute();

      case '/add_POWT3WIN_mcHv':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_Powt3win_mcHv_Details(args));
        }
        return _errorRoute();

      case '/detail_POWT3WIN_mcHv':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_Powt3win_mcHv_page(args));
        }
        return _errorRoute();

      case '/edit_POWT3WIN_mcHv':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowt3winmcHvPage(args));
        }
        return _errorRoute();

      case '/add_POWT3WIN_mcLv':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_Powt3win_mcLv_Details(args));
        }
        return _errorRoute();

      case '/detail_POWT3WIN_mcLv':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_Powt3win_mcLv_page(args));
        }
        return _errorRoute();

      case '/edit_POWT3WIN_mcLv':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowt3winmcLvPage(args));
        }
        return _errorRoute();

      case '/add_POWT3WIN_mcIvT':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_Powt3winmcIvTDetails(args));
        }
        return _errorRoute();

      case '/detail_POWT3WIN_mcIvT':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_Powt3winmcIvTpage(args));
        }
        return _errorRoute();

      case '/edit_POWT3WIN_mcIvT':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowt3winmcIvtPage(args));
        }
        return _errorRoute();

      case '/add_POWT3WIN_mb':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_Powt3win_mb_Details(args));
        }
        return _errorRoute();

      case '/detail_POWT3WIN_mb':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_Powt3win_mb_page(args));
        }
        return _errorRoute();

      case '/edit_POWT3WIN_mb':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditPowt3winMbPage(args));
        }
        return _errorRoute();

      case '/add_POWT3WIN_schvlv':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_Powt3winschvlvDetails(args));
        }
        return _errorRoute();

      case '/detail_POWT3WIN_schvlv':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_Powt3winschvlvpage(args));
        }
        return _errorRoute();

      case '/edit_POWT3WIN_schvlv':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => EditPowt3winscHvLvPage(args));
        }
        return _errorRoute();

      case '/add_POWT3WIN_schvivt':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_Powt3winschvivtDetails(args));
        }
        return _errorRoute();

      case '/detail_POWT3WIN_schvivt':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_Powt3winschvivtpage(args));
        }
        return _errorRoute();

      case '/edit_POWT3WIN_schvivt':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => EditPowt3winscHvIvtPage(args));
        }
        return _errorRoute();

      // ------------------------------------------------------------------------------

      case '/add_FPrelay':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_FPrelay_Details(args));
        }
        return _errorRoute();

      case '/detail_FPrelay':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_Fprelay_Page(args));
        }
        return _errorRoute();

      case '/edit_FPrelay':
        return MaterialPageRoute(
          builder: (_) => EditFPrelayPage(
            id: args,
          ),
        );

      case '/add_FPRcurrentMgmt':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_FPRcurrentMgmt_Details(args));
        }
        return _errorRoute();

      case '/detail_FPRcurrentMgmt':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_FPRcurrentMgmt_page(args));
        }
        return _errorRoute();

      case '/edit_FPRcurrentMgmt':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => EditFPRcurrentMgmtPage(args));
        }
        return _errorRoute();

      case '/add_FPRvoltageMgmt':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_FPRvoltageMgmt_Details(args));
        }
        return _errorRoute();

      case '/detail_FPRvoltageMgmt':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_FPRvoltageMgmt_page(args));
        }
        return _errorRoute();

      case '/edit_FPRvoltageMgmt':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => EditFPRvoltageMgmtPage(args));
        }
        return _errorRoute();

      case '/add_FPRovercurrent':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_FPRovercurrent_Details(args));
        }
        return _errorRoute();

      case '/detail_FPRovercurrent':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_FPRovercurrent_page(args));
        }
        return _errorRoute();

      case '/edit_FPRovercurrent':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => EditFPRovercurrentPage(args));
        }
        return _errorRoute();

      case '/add_FPRearthfault':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_FPRearthfault_Details(args));
        }
        return _errorRoute();

      case '/detail_FPRearthfault':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_FPRearthfault_page(args));
        }
        return _errorRoute();

      case '/edit_FPRearthfault':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditFPRearthfaultPage(args));
        }
        return _errorRoute();

      case '/add_FPRovervoltage':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_FPRovervoltage_Details(args));
        }
        return _errorRoute();

      case '/detail_FPRovervoltage':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_FPRovervoltage_page(args));
        }
        return _errorRoute();

      case '/edit_FPRovervoltage':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => EditFPRovervoltagePage(args));
        }
        return _errorRoute();

      case '/add_FPRundervoltage':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_FPRundervoltage_Details(args));
        }
        return _errorRoute();

      case '/detail_FPRundervoltage':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_FPRundervoltage_page(args));
        }
        return _errorRoute();

      case '/edit_FPRundervoltage':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => EditFPRundervoltagePage(args));
        }
        return _errorRoute();

      case '/add_FPRoverfreq':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_FPRoverfreq_Details(args));
        }
        return _errorRoute();

      case '/detail_FPRoverfreq':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_FPRoverfreq_page(args));
        }
        return _errorRoute();

      case '/edit_FPRoverfreq':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditFPRoverfreqPage(args));
        }
        return _errorRoute();

      case '/add_FPRunderfreq':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Add_FPRunderfreq_Details(args));
        }
        return _errorRoute();

      case '/detail_FPRunderfreq':
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => Detail_FPRunderfreq_page(args));
        }
        return _errorRoute();

      case '/edit_FPRunderfreq':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditFPRunderfreqPage(args));
        }
        return _errorRoute();
////////////////////////Auxiliary Relay ///////////////////////////////////////
      case '/add_AR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_AR_Details(args));
        }
        return _errorRoute();

      case '/detail_AR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_AR_Page(args));
        }
        return _errorRoute();

      case '/edit_AR':
        return MaterialPageRoute(
          builder: (_) => EditARPage(
            id: args,
          ),
        );

      case '/add_ARpudo':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Add_ARpudo_Details(args));
        }
        return _errorRoute();

      case '/detail_ARpudo':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => Detail_ARpudo_page(args));
        }
        return _errorRoute();

      case '/edit_ARpudo':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditARpudoPage(args));
        }
        return _errorRoute();

      /////////////////////////////  Diesel Generator  ////////////////////////////
      case '/add_DG':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddDgDetails(args));
        }
        return _errorRoute();
      case '/detail_DG':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailDgPage(args));
        }
        return _errorRoute();
      case '/edit_DG':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditDgPage(args));
        }
        return _errorRoute();
      case '/add_DG_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddDgIrPage(args));
        }
        return _errorRoute();
      case '/detail_DG_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailDgIrPage(args));
        }
        return _errorRoute();
      case '/edit_DG_IR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditDgIrPage(args));
        }
        return _errorRoute();
      case '/add_DG_WR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddDgWrPage(args));
        }
        return _errorRoute();
      case '/detail_DG_WR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailDgWrPage(args));
        }
        return _errorRoute();
      case '/edit_DG_WR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditDgWrPage(args));
        }
        return _errorRoute();

////////////////////////Timer Relay ///////////////////////////////////////
      case '/add_TR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddTrDetails(args));
        }
        return _errorRoute();

      case '/detail_TR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailTrPage(args));
        }
        return _errorRoute();

      case '/edit_TR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditTrPage(args));
        }
        return _errorRoute();
      case '/add_TR_PAC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddTrPacPage(args));
        }
        return _errorRoute();

      case '/detail_TR_PAC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailTrPacPage(args));
        }
        return _errorRoute();

      case '/edit_TR_PAC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditTrPacPage(args));
        }
        return _errorRoute();

////////////////////////Voltage Relay ///////////////////////////////////////
      case '/add_VR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddVrDetails(args));
        }
        return _errorRoute();

      case '/detail_VR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailVrPage(args));
        }
        return _errorRoute();

      case '/edit_VR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditVrPage(args));
        }
        return _errorRoute();
      case '/add_VR_PAC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddVrPacPage(args));
        }
        return _errorRoute();

      case '/detail_VR_PAC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailVrPacPage(args));
        }
        return _errorRoute();

      case '/edit_VR_PAC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditVrPacPage(args));
        }
        return _errorRoute();
      ////////////////////////Earth Fault ,Earth Leakage Relay ///////////////////////////////////////
      case '/add_EFELR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddEfElrDetails(args));
        }
        return _errorRoute();

      case '/detail_EFELR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailEfElrPage(args));
        }
        return _errorRoute();

      case '/edit_EFELR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditEfElrPage(args));
        }
        return _errorRoute();
      case '/add_EFELR_PAC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddEfElrPacPage(args));
        }
        return _errorRoute();

      case '/detail_EFELR_PAC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailEfElrPacPage(args));
        }
        return _errorRoute();

      case '/edit_EFELR_PAC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditEfElrPacPage(args));
        }
        return _errorRoute();
      ////////////////////////OverCurrent and Earth Fault Relay ///////////////////////////////////////
      case '/add_OCEFR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddOcEfrDetails(args));
        }
        return _errorRoute();

      case '/detail_OCEFR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailOcEfrPage(args));
        }
        return _errorRoute();

      case '/edit_OCEFR':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditOcEfrPage(args));
        }
        return _errorRoute();
      case '/add_OCEFR_PAC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => AddOcEfrPacPage(args));
        }
        return _errorRoute();

      case '/detail_OCEFR_PAC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => DetailOcEfrPacPage(args));
        }
        return _errorRoute();

      case '/edit_OCEFR_PAC':
        if (args is Map) {
          return MaterialPageRoute(builder: (_) => EditOcEfrPacPage(args));
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('No route'),
        ),
        body: const Center(
          child: Text('Sorry no route found'),
        ),
      );
    });
  }
}

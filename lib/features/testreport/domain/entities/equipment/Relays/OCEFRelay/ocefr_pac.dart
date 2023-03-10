// ignore_for_file: non_constant_identifier_names
import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class OcEfrPac extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final double r_plugSetting;
  final double r_TMS;
  final double r_plugSetting_Hi;
  final double r_time;
  final double y_plugSetting;
  final double y_TMS;
  final double y_plugSetting_Hi;
  final double y_time;
  final double b_plugSetting;
  final double b_TMS;
  final double b_plugSetting_Hi;
  final double b_time;
  final double plugSettingMul_2x;
  final double plugSettingMul_5x;
  final double r_coilResistanace;
  final double y_coilResistanace;
  final double b_coilResistanace;
  final double r_pickupCurrent;
  final double y_pickupCurrent;
  final double b_pickupCurrent;
  final double r_relayOprTime_2x;
  final double r_relayOprTime_5x;
  final double r_relayOprTime_Hi;
  final double y_relayOprTime_2x;
  final double y_relayOprTime_5x;
  final double y_relayOprTime_Hi;
  final double b_relayOprTime_2x;
  final double b_relayOprTime_5x;
  final double b_relayOprTime_Hi;
  final String equipmentUsed;
  final DateTime updateDate;

  const OcEfrPac({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.r_plugSetting,
    @required this.r_TMS,
    @required this.r_plugSetting_Hi,
    @required this.r_time,
    @required this.y_plugSetting,
    @required this.y_TMS,
    @required this.y_plugSetting_Hi,
    @required this.y_time,
    @required this.b_plugSetting,
    @required this.b_TMS,
    @required this.b_plugSetting_Hi,
    @required this.b_time,
    @required this.plugSettingMul_2x,
    @required this.plugSettingMul_5x,
    @required this.r_coilResistanace,
    @required this.y_coilResistanace,
    @required this.b_coilResistanace,
    @required this.r_pickupCurrent,
    @required this.y_pickupCurrent,
    @required this.b_pickupCurrent,
    @required this.r_relayOprTime_2x,
    @required this.r_relayOprTime_5x,
    @required this.r_relayOprTime_Hi,
    @required this.y_relayOprTime_2x,
    @required this.y_relayOprTime_5x,
    @required this.y_relayOprTime_Hi,
    @required this.b_relayOprTime_2x,
    @required this.b_relayOprTime_5x,
    @required this.b_relayOprTime_Hi,
    @required this.equipmentUsed,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        r_plugSetting,
        r_TMS,
        r_plugSetting,
        r_time,
        plugSettingMul_2x,
        plugSettingMul_5x,
        r_coilResistanace,
        y_coilResistanace,
        b_coilResistanace,
        r_pickupCurrent,
        y_pickupCurrent,
        b_pickupCurrent,
        r_relayOprTime_2x,
        r_relayOprTime_5x,
        r_relayOprTime_Hi,
        y_relayOprTime_2x,
        y_relayOprTime_5x,
        y_relayOprTime_Hi,
        b_relayOprTime_2x,
        b_relayOprTime_5x,
        b_relayOprTime_Hi,
        equipmentUsed,
        updateDate,
      ];
}

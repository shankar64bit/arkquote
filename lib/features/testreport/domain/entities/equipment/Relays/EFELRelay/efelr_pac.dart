// ignore_for_file: non_constant_identifier_names
import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class EfElrPac extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final double plugSetting;
  final double TMS;
  final double plugSetting_Hi;
  final double time;
  final double plugSettingMul_2x;
  final double plugSettingMul_5x;
  final double coilResistanace;
  final double pickupCurrent;
  final double relayOprTime_2x;
  final double relayOprTime_5x;
  final double relayOprTime_Hi;
  final String equipmentUsed;
  final DateTime updateDate;

  const EfElrPac({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.plugSetting,
    @required this.TMS,
    @required this.plugSetting_Hi,
    @required this.time,
    @required this.plugSettingMul_2x,
    @required this.plugSettingMul_5x,
    @required this.coilResistanace,
    @required this.pickupCurrent,
    @required this.relayOprTime_2x,
    @required this.relayOprTime_5x,
    @required this.relayOprTime_Hi,
    @required this.equipmentUsed,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        plugSetting,
        TMS,
        plugSetting,
        time,
        plugSettingMul_2x,
        plugSettingMul_5x,
        coilResistanace,
        pickupCurrent,
        relayOprTime_2x,
        relayOprTime_5x,
        relayOprTime_Hi,
        equipmentUsed,
        updateDate,
      ];
}

// ignore_for_file: non_constant_identifier_names
import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class VrPac extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final double plugSetting;
  final double TMS;

  final double plugSettingMul1;
  final double plugSettingMul2;
  final double coilResistanace;
  final double relayOprTime_1x;
  final double relayOprTime_3x;
  final String equipmentUsed;
  final DateTime updateDate;

  const VrPac({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.plugSetting,
    @required this.TMS,
    @required this.plugSettingMul1,
    @required this.plugSettingMul2,
    @required this.coilResistanace,
    @required this.relayOprTime_1x,
    @required this.relayOprTime_3x,
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
        plugSettingMul1,
        plugSettingMul2,
        coilResistanace,
        relayOprTime_1x,
        relayOprTime_3x,
        equipmentUsed,
        updateDate,
      ];
}

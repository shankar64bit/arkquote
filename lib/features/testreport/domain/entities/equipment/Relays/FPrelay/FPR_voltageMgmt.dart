// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class FPRvoltageMgmt extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final double rn_applSecVoltage;
  final double rn_measurePrimVoltage;
  final double yn_applSecVoltage;
  final double yn_measurePrimVoltage;
  final double bn_applSecVoltage;
  final double bn_measurePrimVoltage;
  final String equipmentUsed;
  final DateTime updateDate;

  const FPRvoltageMgmt({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.rn_applSecVoltage,
    @required this.rn_measurePrimVoltage,
    @required this.yn_applSecVoltage,
    @required this.yn_measurePrimVoltage,
    @required this.bn_applSecVoltage,
    @required this.bn_measurePrimVoltage,
    @required this.equipmentUsed,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        rn_applSecVoltage,
        rn_measurePrimVoltage,
        yn_applSecVoltage,
        yn_measurePrimVoltage,
        bn_applSecVoltage,
        bn_measurePrimVoltage,
        equipmentUsed,
        updateDate,
      ];
}

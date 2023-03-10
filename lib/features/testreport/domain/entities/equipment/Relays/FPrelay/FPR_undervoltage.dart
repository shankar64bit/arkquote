
// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class FPRundervoltage extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String function;
  final double voltageSet;
  final double delay;
  final double rn_secVoltageSet;
  final double rn_appliedSecVoltage;
  final double rn_relayOprTime;
  final double yn_secVoltageSet;
  final double yn_appliedSecVoltage;
  final double yn_relayOprTime;
  final double bn_secVoltageSet;
  final double bn_appliedSecVoltage;
  final double bn_relayOprTime;
  final int stageNo;
  final String equipmentUsed;
  final DateTime updateDate;

  const FPRundervoltage({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.voltageSet,
    @required this.delay,
    @required this.rn_secVoltageSet,
    @required this.rn_appliedSecVoltage,
    @required this.rn_relayOprTime,
    @required this.yn_secVoltageSet,
    @required this.yn_appliedSecVoltage,
    @required this.yn_relayOprTime,
    @required this.bn_secVoltageSet,
    @required this.bn_appliedSecVoltage,
    @required this.bn_relayOprTime,
    @required this.stageNo,
    @required this.function,
    @required this.equipmentUsed,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        voltageSet,
        delay,
        rn_secVoltageSet,
        rn_appliedSecVoltage,
        rn_relayOprTime,
        yn_secVoltageSet,
        yn_appliedSecVoltage,
        yn_relayOprTime,
        bn_secVoltageSet,
        bn_appliedSecVoltage,
        bn_relayOprTime,
        stageNo,
        function,
        equipmentUsed,
        updateDate,
      ];
}

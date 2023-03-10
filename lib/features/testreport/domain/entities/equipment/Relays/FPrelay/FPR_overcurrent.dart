// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class FPRovercurrent extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final double CurrentSet;
  final double TMS;
  final double delay;
  final double rn_pickupCurrent;
  final double rn_relayOprTime_2x;
  final double rn_relayOprTime_5x;
  final double yn_pickupCurrent;
  final double yn_relayOprTime_2x;
  final double yn_relayOprTime_5x;
  final double bn_pickupCurrent;
  final double bn_relayOprTime_2x;
  final double bn_relayOprTime_5x;
  final int stageNo;
  final String curve;
  final String function;
  final String equipmentUsed;
  final DateTime updateDate;

  const FPRovercurrent({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.CurrentSet,
    @required this.TMS,
    @required this.delay,
    @required this.rn_pickupCurrent,
    @required this.rn_relayOprTime_2x,
    @required this.rn_relayOprTime_5x,
    @required this.yn_pickupCurrent,
    @required this.yn_relayOprTime_2x,
    @required this.yn_relayOprTime_5x,
    @required this.bn_pickupCurrent,
    @required this.bn_relayOprTime_2x,
    @required this.bn_relayOprTime_5x,
    @required this.stageNo,
    @required this.curve,
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
        CurrentSet,
        TMS,
        delay,
        rn_pickupCurrent,
        rn_relayOprTime_2x,
        rn_relayOprTime_5x,
        yn_pickupCurrent,
        yn_relayOprTime_2x,
        yn_relayOprTime_5x,
        bn_pickupCurrent,
        bn_relayOprTime_2x,
        bn_relayOprTime_5x,
        stageNo,
        curve,
        function,
        equipmentUsed,
        updateDate,
      ];
}

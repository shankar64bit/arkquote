// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class FPRearthfault extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final double currentSet;
  final double TMS;
  final double delay;
  final double pickupCurrent;
  final double relayOprTime_2x;
  final double relayOprTime_5x;
  final int stageNo;
  final String curve;
  final String function;
  final String equipmentUsed;
  final DateTime updateDate;

  const FPRearthfault({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.currentSet,
    @required this.TMS,
    @required this.delay,
    @required this.pickupCurrent,
    @required this.relayOprTime_2x,
    @required this.relayOprTime_5x,
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
        currentSet,
        TMS,
        delay,
        pickupCurrent,
        relayOprTime_2x,
        relayOprTime_5x,
        stageNo,
        curve,
        function,
        equipmentUsed,
        updateDate,
      ];
}

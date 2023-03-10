// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class FPRoverfreq extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String function;
  final double frequencySet;
  final double delay;
  final double rn_relayOprTime;
  final double yn_relayOprTime;
  final double bn_relayOprTime;
  final int stageNo;
  final String equipmentUsed;
  final DateTime updateDate;

  const FPRoverfreq({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.frequencySet,
    @required this.delay,
    @required this.rn_relayOprTime,
    @required this.yn_relayOprTime,
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
        frequencySet,
        delay,
        rn_relayOprTime,
        yn_relayOprTime,
        bn_relayOprTime,
        stageNo,
        function,
        equipmentUsed,
        updateDate,
      ];
}

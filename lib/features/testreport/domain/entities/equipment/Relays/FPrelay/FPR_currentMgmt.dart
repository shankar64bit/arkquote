// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class FPRcurrentMgmt extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final double rn_measurePrimCurrent;
  final double yn_measurePrimCurrent;
  final double bn_measurePrimCurrent;
  final String equipmentUsed;
  final DateTime updateDate;

  const FPRcurrentMgmt({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.rn_measurePrimCurrent,
    @required this.yn_measurePrimCurrent,
    @required this.bn_measurePrimCurrent,
    @required this.equipmentUsed,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        rn_measurePrimCurrent,
        yn_measurePrimCurrent,
        bn_measurePrimCurrent,
        equipmentUsed,
        updateDate,
      ];
}

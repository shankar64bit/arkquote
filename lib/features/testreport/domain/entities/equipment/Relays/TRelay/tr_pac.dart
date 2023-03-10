// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TrPac extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final double time;
  final double coilResistenace;
  final double relayOprTime;
  final String equipmentUsed;
  final DateTime updateDate;

  const TrPac({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.time,
    @required this.coilResistenace,
    @required this.relayOprTime,
    @required this.equipmentUsed,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        time,
        coilResistenace,
        relayOprTime,
        equipmentUsed,
        updateDate,
      ];
}

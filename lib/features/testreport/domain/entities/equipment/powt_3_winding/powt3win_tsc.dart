// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Powt3wintsc extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final int tapPosition;
  final int hv_voltage;
  final double hv_current_Onan;
  final double hv_current_Onaf;
  final double hv_current_Ofaf;
  final String equipmentUsed;
  final DateTime updateDate;

  const Powt3wintsc({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.tapPosition,
    @required this.serialNo,
    @required this.hv_voltage,
    @required this.hv_current_Onan,
    @required this.hv_current_Onaf,
    @required this.hv_current_Ofaf,
    @required this.equipmentUsed,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        hv_voltage,
        hv_current_Onan,
        hv_current_Onaf,
        hv_current_Ofaf,
        equipmentUsed,
        updateDate,
        tapPosition,
      ];
}

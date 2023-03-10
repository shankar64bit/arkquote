// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Powttsc extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final int tapPosition;
  final int hv_voltage;
  final double hv_current;
  final String equipmentUsed;
  final DateTime updateDate;

  const Powttsc({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.tapPosition,
    @required this.serialNo,
    @required this.hv_voltage,
    @required this.hv_current,
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
        hv_current,
        equipmentUsed,
        updateDate,
        tapPosition,
      ];
}

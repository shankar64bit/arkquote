// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PowtbNamePlate extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String R_serialNo;
  final int R_ratedVoltage;
  final int R_ratedCurrent;
  final String R_Make;
  final String Y_serialNo;
  final int Y_ratedVoltage;
  final int Y_ratedCurrent;
  final String Y_Make;
  final String B_serialNo;
  final int B_ratedVoltage;
  final int B_ratedCurrent;
  final String B_Make;

  const PowtbNamePlate({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.R_serialNo,
    @required this.R_ratedVoltage,
    @required this.R_ratedCurrent,
    @required this.R_Make,
    @required this.Y_serialNo,
    @required this.Y_ratedVoltage,
    @required this.Y_ratedCurrent,
    @required this.Y_Make,
    @required this.B_serialNo,
    @required this.B_ratedVoltage,
    @required this.B_ratedCurrent,
    @required this.B_Make,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        R_serialNo,
        R_ratedVoltage,
        R_ratedCurrent,
        R_Make,
        Y_serialNo,
        Y_ratedVoltage,
        Y_ratedCurrent,
        Y_Make,
        B_serialNo,
        B_ratedVoltage,
        B_ratedCurrent,
        B_Make,
      ];
}

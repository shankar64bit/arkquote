// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CTcoreWR extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String equipmentUsed;
  final DateTime updateDate;

  final double R_1S1_1S2;
  final double R_2S1_2S2;
  final double R_3S1_3S2;
  final double R_4S1_4S2;
  final double R_5S1_5S2;

  final double Y_1S1_1S2;
  final double Y_2S1_2S2;
  final double Y_3S1_3S2;
  final double Y_4S1_4S2;
  final double Y_5S1_5S2;

  final double B_1S1_1S2;
  final double B_2S1_2S2;
  final double B_3S1_3S2;
  final double B_4S1_4S2;
  final double B_5S1_5S2;

  const CTcoreWR({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.equipmentUsed,
    @required this.updateDate,
    @required this.R_1S1_1S2,
    @required this.R_2S1_2S2,
    @required this.R_3S1_3S2,
    @required this.R_4S1_4S2,
    @required this.R_5S1_5S2,
    @required this.Y_1S1_1S2,
    @required this.Y_2S1_2S2,
    @required this.Y_3S1_3S2,
    @required this.Y_4S1_4S2,
    @required this.Y_5S1_5S2,
    @required this.B_1S1_1S2,
    @required this.B_2S1_2S2,
    @required this.B_3S1_3S2,
    @required this.B_4S1_4S2,
    @required this.B_5S1_5S2,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        equipmentUsed,
        updateDate,
        R_1S1_1S2,
        R_2S1_2S2,
        R_3S1_3S2,
        R_4S1_4S2,
        R_5S1_5S2,
        Y_1S1_1S2,
        Y_2S1_2S2,
        Y_3S1_3S2,
        Y_4S1_4S2,
        Y_5S1_5S2,
        B_1S1_1S2,
        B_2S1_2S2,
        B_3S1_3S2,
        B_4S1_4S2,
        B_5S1_5S2,
      ];
}

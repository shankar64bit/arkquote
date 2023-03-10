// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CTcoreR extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String equipmentUsed;
  final DateTime updateDate;

  final double R_1S1_1S2_200;
  final double R_2S1_2S2_200;
  final double R_3S1_3S2_200;
  final double R_4S1_4S2_200;
  final double R_5S1_5S2_200;

  final double Y_1S1_1S2_200;
  final double Y_2S1_2S2_200;
  final double Y_3S1_3S2_200;
  final double Y_4S1_4S2_200;
  final double Y_5S1_5S2_200;

  final double B_1S1_1S2_200;
  final double B_2S1_2S2_200;
  final double B_3S1_3S2_200;
  final double B_4S1_4S2_200;
  final double B_5S1_5S2_200;
////////////////////////////
  final double R_1S1_1S2_400;
  final double R_2S1_2S2_400;
  final double R_3S1_3S2_400;
  final double R_4S1_4S2_400;
  final double R_5S1_5S2_400;

  final double Y_1S1_1S2_400;
  final double Y_2S1_2S2_400;
  final double Y_3S1_3S2_400;
  final double Y_4S1_4S2_400;
  final double Y_5S1_5S2_400;

  final double B_1S1_1S2_400;
  final double B_2S1_2S2_400;
  final double B_3S1_3S2_400;
  final double B_4S1_4S2_400;
  final double B_5S1_5S2_400;
////////////////////////////
  final double R_1S1_1S2_600;
  final double R_2S1_2S2_600;
  final double R_3S1_3S2_600;
  final double R_4S1_4S2_600;
  final double R_5S1_5S2_600;

  final double Y_1S1_1S2_600;
  final double Y_2S1_2S2_600;
  final double Y_3S1_3S2_600;
  final double Y_4S1_4S2_600;
  final double Y_5S1_5S2_600;

  final double B_1S1_1S2_600;
  final double B_2S1_2S2_600;
  final double B_3S1_3S2_600;
  final double B_4S1_4S2_600;
  final double B_5S1_5S2_600;
///////////////////////////
  final double R_1S1_1S2_800;
  final double R_2S1_2S2_800;
  final double R_3S1_3S2_800;
  final double R_4S1_4S2_800;
  final double R_5S1_5S2_800;

  final double Y_1S1_1S2_800;
  final double Y_2S1_2S2_800;
  final double Y_3S1_3S2_800;
  final double Y_4S1_4S2_800;
  final double Y_5S1_5S2_800;

  final double B_1S1_1S2_800;
  final double B_2S1_2S2_800;
  final double B_3S1_3S2_800;
  final double B_4S1_4S2_800;
  final double B_5S1_5S2_800;

  const CTcoreR({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.equipmentUsed,
    @required this.updateDate,
    @required this.R_1S1_1S2_200,
    @required this.R_2S1_2S2_200,
    @required this.R_3S1_3S2_200,
    @required this.R_4S1_4S2_200,
    @required this.R_5S1_5S2_200,
    @required this.Y_1S1_1S2_200,
    @required this.Y_2S1_2S2_200,
    @required this.Y_3S1_3S2_200,
    @required this.Y_4S1_4S2_200,
    @required this.Y_5S1_5S2_200,
    @required this.B_1S1_1S2_200,
    @required this.B_2S1_2S2_200,
    @required this.B_3S1_3S2_200,
    @required this.B_4S1_4S2_200,
    @required this.B_5S1_5S2_200,
    @required this.R_1S1_1S2_400,
    @required this.R_2S1_2S2_400,
    @required this.R_3S1_3S2_400,
    @required this.R_4S1_4S2_400,
    @required this.R_5S1_5S2_400,
    @required this.Y_1S1_1S2_400,
    @required this.Y_2S1_2S2_400,
    @required this.Y_3S1_3S2_400,
    @required this.Y_4S1_4S2_400,
    @required this.Y_5S1_5S2_400,
    @required this.B_1S1_1S2_400,
    @required this.B_2S1_2S2_400,
    @required this.B_3S1_3S2_400,
    @required this.B_4S1_4S2_400,
    @required this.B_5S1_5S2_400,
    @required this.R_1S1_1S2_600,
    @required this.R_2S1_2S2_600,
    @required this.R_3S1_3S2_600,
    @required this.R_4S1_4S2_600,
    @required this.R_5S1_5S2_600,
    @required this.Y_1S1_1S2_600,
    @required this.Y_2S1_2S2_600,
    @required this.Y_3S1_3S2_600,
    @required this.Y_4S1_4S2_600,
    @required this.Y_5S1_5S2_600,
    @required this.B_1S1_1S2_600,
    @required this.B_2S1_2S2_600,
    @required this.B_3S1_3S2_600,
    @required this.B_4S1_4S2_600,
    @required this.B_5S1_5S2_600,
    @required this.R_1S1_1S2_800,
    @required this.R_2S1_2S2_800,
    @required this.R_3S1_3S2_800,
    @required this.R_4S1_4S2_800,
    @required this.R_5S1_5S2_800,
    @required this.Y_1S1_1S2_800,
    @required this.Y_2S1_2S2_800,
    @required this.Y_3S1_3S2_800,
    @required this.Y_4S1_4S2_800,
    @required this.Y_5S1_5S2_800,
    @required this.B_1S1_1S2_800,
    @required this.B_2S1_2S2_800,
    @required this.B_3S1_3S2_800,
    @required this.B_4S1_4S2_800,
    @required this.B_5S1_5S2_800,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        equipmentUsed,
        updateDate,
        R_1S1_1S2_200,
        R_2S1_2S2_200,
        R_3S1_3S2_200,
        R_4S1_4S2_200,
        R_5S1_5S2_200,
        Y_1S1_1S2_200,
        Y_2S1_2S2_200,
        Y_3S1_3S2_200,
        Y_4S1_4S2_200,
        Y_5S1_5S2_200,
        B_1S1_1S2_200,
        B_2S1_2S2_200,
        B_3S1_3S2_200,
        B_4S1_4S2_200,
        B_5S1_5S2_200,
        R_1S1_1S2_400,
        R_2S1_2S2_400,
        R_3S1_3S2_400,
        R_4S1_4S2_400,
        R_5S1_5S2_400,
        Y_1S1_1S2_400,
        Y_2S1_2S2_400,
        Y_3S1_3S2_400,
        Y_4S1_4S2_400,
        Y_5S1_5S2_400,
        B_1S1_1S2_400,
        B_2S1_2S2_400,
        B_3S1_3S2_400,
        B_4S1_4S2_400,
        B_5S1_5S2_400,
        R_1S1_1S2_600,
        R_2S1_2S2_600,
        R_3S1_3S2_600,
        R_4S1_4S2_600,
        R_5S1_5S2_600,
        Y_1S1_1S2_600,
        Y_2S1_2S2_600,
        Y_3S1_3S2_600,
        Y_4S1_4S2_600,
        Y_5S1_5S2_600,
        B_1S1_1S2_600,
        B_2S1_2S2_600,
        B_3S1_3S2_600,
        B_4S1_4S2_600,
        B_5S1_5S2_600,
        R_1S1_1S2_800,
        R_2S1_2S2_800,
        R_3S1_3S2_800,
        R_4S1_4S2_800,
        R_5S1_5S2_800,
        Y_1S1_1S2_800,
        Y_2S1_2S2_800,
        Y_3S1_3S2_800,
        Y_4S1_4S2_800,
        Y_5S1_5S2_800,
        B_1S1_1S2_800,
        B_2S1_2S2_800,
        B_3S1_3S2_800,
        B_4S1_4S2_800,
        B_5S1_5S2_800,
      ];
}

// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CTcoreKVP extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String equipmentUsed;
  final DateTime updateDate;

  final double R_35;
  final double R_70;
  final double R_105;
  final double R_140;
  final double R_175;
  final double R_210;
  final double R_245;
  final double R_280;
  final double R_315;
  final double R_350;
  final double R_385;
  final double Y_35;
  final double Y_70;
  final double Y_105;
  final double Y_140;
  final double Y_175;
  final double Y_210;
  final double Y_245;
  final double Y_280;
  final double Y_315;
  final double Y_350;
  final double Y_385;
  final double B_35;
  final double B_70;
  final double B_105;
  final double B_140;
  final double B_175;
  final double B_210;
  final double B_245;
  final double B_280;
  final double B_315;
  final double B_350;
  final double B_385;

  const CTcoreKVP({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.equipmentUsed,
    @required this.updateDate,
    @required this.R_35,
    @required this.R_70,
    @required this.R_105,
    @required this.R_140,
    @required this.R_175,
    @required this.R_210,
    @required this.R_245,
    @required this.R_280,
    @required this.R_315,
    @required this.R_350,
    @required this.R_385,
    @required this.Y_35,
    @required this.Y_70,
    @required this.Y_105,
    @required this.Y_140,
    @required this.Y_175,
    @required this.Y_210,
    @required this.Y_245,
    @required this.Y_280,
    @required this.Y_315,
    @required this.Y_350,
    @required this.Y_385,
    @required this.B_35,
    @required this.B_70,
    @required this.B_105,
    @required this.B_140,
    @required this.B_175,
    @required this.B_210,
    @required this.B_245,
    @required this.B_280,
    @required this.B_315,
    @required this.B_350,
    @required this.B_385,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        equipmentUsed,
        updateDate,
        R_35,
        R_70,
        R_105,
        R_140,
        R_175,
        R_210,
        R_245,
        R_280,
        R_315,
        R_350,
        R_385,
        Y_35,
        Y_70,
        Y_105,
        Y_140,
        Y_175,
        Y_210,
        Y_245,
        Y_280,
        Y_315,
        Y_350,
        Y_385,
        B_35,
        B_70,
        B_105,
        B_140,
        B_175,
        B_210,
        B_245,
        B_280,
        B_315,
        B_350,
        B_385,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EnergyMeterViTest extends Equatable {
  final double rr;
  final double ra;
  final double yr;
  final double ya;
  final double br;
  final double ba;
  final int trNo;
  final int id;
  final int databaseID;
  final DateTime updateDate;
  final String serialNo;
  final String EquipmentType;

  const EnergyMeterViTest({
    @required this.id,
    @required this.trNo,
    @required this.rr,
    @required this.ra,
    @required this.yr,
    @required this.ya,
    @required this.br,
    @required this.ba,
    @required this.serialNo,
    @required this.databaseID,
    @required this.EquipmentType,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        trNo,
        databaseID,
        rr,
        ra,
        yr,
        ya,
        br,
        ba,
        serialNo,
        EquipmentType,
        updateDate,
      ];
}

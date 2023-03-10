import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PcIrTest extends Equatable {
  final int trNo;
  final int id;
  final int databaseID;
  final int pcRefId;
  final String EquipmentType;
  final DateTime lastUpdated;

  final double rA;
  final double rB;
  final double yA;
  final double yB;
  final double bA;
  final double bB;

  final double ryA;
  final double ryB;
  final double ybA;
  final double ybB;
  final double brA;
  final double brB;
  const PcIrTest({
    @required this.id,
    @required this.trNo,
    @required this.rA,
    @required this.rB,
    @required this.yA,
    @required this.yB,
    @required this.bA,
    @required this.bB,
    @required this.ryA,
    @required this.ryB,
    @required this.ybA,
    @required this.ybB,
    @required this.brA,
    @required this.brB,
    @required this.pcRefId,
    @required this.EquipmentType,
    @required this.databaseID,
    @required this.lastUpdated,
  });

  @override
  List<Object> get props => [
        id,
        trNo,
        databaseID,
        rA,
        rB,
        yA,
        yB,
        bA,
        bB,
        ryA,
        ryB,
        ybA,
        ybB,
        brA,
        brB,
        pcRefId,
        EquipmentType,
        lastUpdated,
      ];
}

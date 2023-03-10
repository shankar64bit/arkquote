import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BbIrTest extends Equatable {
  final int trNo;
  final int id;
  final int databaseID;
  final int bbRefId;
  final String EquipmentType;
  final DateTime lastUpdated;

  final double rA;
  final double rB;
  final double yA;
  final double yB;
  final double bA;
  final double bB;
  final double nA;
  final double nB;

  final double ryA;
  final double ryB;
  final double ybA;
  final double ybB;
  final double brA;
  final double brB;
  final double rnA;
  final double rnB;
  final double ynA;
  final double ynB;
  final double bnA;
  final double bnB;

  const BbIrTest({
    @required this.id,
    @required this.trNo,
    @required this.rA,
    @required this.rB,
    @required this.yA,
    @required this.yB,
    @required this.bA,
    @required this.bB,
    @required this.nA,
    @required this.nB,
    @required this.ryA,
    @required this.ryB,
    @required this.ybA,
    @required this.ybB,
    @required this.brA,
    @required this.brB,
    @required this.rnA,
    @required this.rnB,
    @required this.ynA,
    @required this.ynB,
    @required this.bnA,
    @required this.bnB,
    @required this.bbRefId,
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
        nA,
        nB,
        ryA,
        ryB,
        ybA,
        ybB,
        brA,
        brB,
        rnA,
        rnB,
        ynA,
        ynB,
        bnA,
        bnB,
        bbRefId,
        EquipmentType,
        lastUpdated,
      ];
}

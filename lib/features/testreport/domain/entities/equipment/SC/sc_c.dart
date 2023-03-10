import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ScCTest extends Equatable {
  final int trNo;
  final int id;
  final int databaseID;
  final String serialNo;
  final String EquipmentType;
  final DateTime lastUpdated;

  final double rB;
  final double rA;
  final double yB;
  final double yA;
  final double bB;
  final double bA;

  const ScCTest({
    @required this.id,
    @required this.trNo,
    @required this.rB,
    @required this.rA,
    @required this.yB,
    @required this.yA,
    @required this.bB,
    @required this.bA,
    @required this.serialNo,
    @required this.EquipmentType,
    @required this.databaseID,
    @required this.lastUpdated,
  });

  @override
  List<Object> get props => [
        id,
        trNo,
        databaseID,
        rB,
        rA,
        yB,
        yA,
        bA,
        bB,
        serialNo,
        EquipmentType,
        lastUpdated,
      ];
}

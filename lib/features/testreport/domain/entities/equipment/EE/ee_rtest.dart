import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class eeRTest extends Equatable {
  final int trNo;
  final int id;
  final int databaseID;
  final int locNo;
  final String EquipmentType;
  final DateTime lastUpdated;
  final String eeName;
  final double resistanceValue_BR;
  final double resistanceValue_AR;

  const eeRTest({
    @required this.id,
    @required this.trNo,
    @required this.locNo,
    @required this.EquipmentType,
    @required this.databaseID,
    @required this.lastUpdated,
    @required this.resistanceValue_BR,
    @required this.resistanceValue_AR,
    @required this.eeName,
  });

  @override
  List<Object> get props => [
        id,
        trNo,
        databaseID,
        locNo,
        EquipmentType,
        lastUpdated,
        resistanceValue_BR,
        resistanceValue_AR,
        eeName,
      ];
}

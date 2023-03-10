import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class eeTest extends Equatable {
  final int trNo;
  final int id;
  final int databaseID;
  final int locNo;
  final String EquipmentType;
  final DateTime lastUpdated;
  final String eeName;
  final double resistanceValue;

  const eeTest({
    @required this.id,
    @required this.trNo,
    @required this.locNo,
    @required this.EquipmentType,
    @required this.databaseID,
    @required this.lastUpdated,
    @required this.resistanceValue,
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
        resistanceValue,
        eeName,
      ];
}

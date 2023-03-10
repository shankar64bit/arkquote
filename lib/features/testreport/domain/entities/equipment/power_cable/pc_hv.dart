import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PcHvTest extends Equatable {
  final int trNo;
  final int id;
  final int databaseID;
  final int pcRefId;
  final String EquipmentType;

  final DateTime lastUpdated;

  final double rVoltage;
  final double rCurrent;
  final double yVoltage;
  final double yCurrent;
  final double bVoltage;
  final double bCurrent;

  const PcHvTest({
    @required this.id,
    @required this.trNo,
    @required this.rVoltage,
    @required this.rCurrent,
    @required this.yVoltage,
    @required this.yCurrent,
    @required this.bVoltage,
    @required this.bCurrent,
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
        rVoltage,
        rCurrent,
        yVoltage,
        yCurrent,
        bVoltage,
        bCurrent,
        pcRefId,
        EquipmentType,
        lastUpdated,
      ];
}

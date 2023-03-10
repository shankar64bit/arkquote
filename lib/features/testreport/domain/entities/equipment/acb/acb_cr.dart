import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AcbCR extends Equatable {
  final int trNo;
  final int id;
  final int databaseID;
  final String serialNo;
  final DateTime lastUpdated;
  final double motorCoil;
  final double closeCoil;
  final double tripCoil;
  final String EquipmentType;

  const AcbCR({
    @required this.motorCoil,
    @required this.closeCoil,
    @required this.tripCoil,
    @required this.trNo,
    @required this.serialNo,
    @required this.id,
    @required this.databaseID,
    @required this.lastUpdated,
    @required this.EquipmentType,
  });

  @override
  List<Object> get props => [
        trNo,
        motorCoil,
        closeCoil,
        tripCoil,
        serialNo,
        id,
        databaseID,
        lastUpdated,
        EquipmentType,
      ];
}

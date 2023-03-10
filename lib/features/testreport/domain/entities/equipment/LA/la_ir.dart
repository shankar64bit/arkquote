import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LaIrTest extends Equatable {
  final int trNo;
  final int id;
  final int databaseID;
  final String serialNo;
  final String EquipmentType;
  final DateTime lastUpdated;

  final double seR;
  final double seY;
  final double seB;
  final double ssR;
  final double ssY;
  final double ssB;

  const LaIrTest({
    @required this.id,
    @required this.trNo,
    @required this.seR,
    @required this.seY,
    @required this.seB,
    @required this.ssR,
    @required this.ssY,
    @required this.ssB,
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
        seR,
        seY,
        seB,
        ssR,
        ssY,
        ssB,
        serialNo,
        EquipmentType,
        lastUpdated,
      ];
}

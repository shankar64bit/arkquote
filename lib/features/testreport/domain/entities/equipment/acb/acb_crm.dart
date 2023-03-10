import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AcbCrm extends Equatable {
  final int trNo;
  final int id;
  final int databaseID;
  final String serialNo;
  final String EquipmentType;
  final DateTime lastUpdated;

  final double rR;
  final double yY;
  final double bB;
  final double nN;

  const AcbCrm({
    @required this.rR,
    @required this.yY,
    @required this.bB,
    @required this.nN,
    @required this.trNo,
    @required this.serialNo,
    @required this.id,
    @required this.databaseID,
    @required this.EquipmentType,
    @required this.lastUpdated,
  });

  @override
  List<Object> get props => [
        rR,
        yY,
        bB,
        nN,
        trNo,
        serialNo,
        id,
        databaseID,
        EquipmentType,
        lastUpdated,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DgWrTest extends Equatable {
  final int trNo;
  final int id;
  final int databaseID;
  final String serialNo;
  final String EquipmentType;

  final DateTime lastUpdated;

  final double uv;
  final double vw;
  final double wu;

  const DgWrTest({
    @required this.id,
    @required this.trNo,
    @required this.uv,
    @required this.vw,
    @required this.wu,
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
        uv,
        vw,
        wu,
        serialNo,
        EquipmentType,
        lastUpdated,
      ];
}

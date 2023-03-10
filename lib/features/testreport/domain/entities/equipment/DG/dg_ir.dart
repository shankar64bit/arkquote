import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DgIrTest extends Equatable {
  final int trNo;
  final int id;
  final int databaseID;
  final String serialNo;
  final String EquipmentType;

  final DateTime lastUpdated;

  final double re_mResistance;
  final double ye_mResistance;
  final double be_mResistance;

  const DgIrTest({
    @required this.id,
    @required this.trNo,
    @required this.re_mResistance,
    @required this.ye_mResistance,
    @required this.be_mResistance,
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
        re_mResistance,
        ye_mResistance,
        be_mResistance,
        serialNo,
        EquipmentType,
        lastUpdated,
      ];
}

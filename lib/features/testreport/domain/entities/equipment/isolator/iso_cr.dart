import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class IsoCrTest extends Equatable {
  final int trNo;
  final int id;
  final int databaseID;
  final String serialNo;
  final String EquipmentType;
  final DateTime lastUpdated;

  final double rr;
  final double yy;
  final double bb;

  const IsoCrTest({
    @required this.rr,
    @required this.yy,
    @required this.bb,
    @required this.trNo,
    @required this.serialNo,
    @required this.id,
    @required this.databaseID,
    @required this.EquipmentType,
    @required this.lastUpdated,
  });

  @override
  List<Object> get props => [
        rr,
        yy,
        bb,
        trNo,
        serialNo,
        id,
        databaseID,
        EquipmentType,
        lastUpdated,
      ];
}

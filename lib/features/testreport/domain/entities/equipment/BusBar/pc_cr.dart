import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BbCrTest extends Equatable {
  final int trNo;
  final int id;
  final int databaseID;
  final int bbRefId;
  final String EquipmentType;
  final DateTime lastUpdated;
  final double r;
  final double y;
  final double b;
  final double n;

  const BbCrTest({
    @required this.id,
    @required this.trNo,
    @required this.r,
    @required this.y,
    @required this.b,
    @required this.n,
    @required this.bbRefId,
    @required this.EquipmentType,
    @required this.databaseID,
    @required this.lastUpdated,
  });

  @override
  List<Object> get props => [
        id,
        trNo,
        databaseID,
        r,
        y,
        b,
        n,
        bbRefId,
        EquipmentType,
        lastUpdated,
      ];
}

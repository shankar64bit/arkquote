import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class IsoIrTest extends Equatable {
  final int trNo;
  final int id;
  final int databaseID;
  final String serialNo;
  final String EquipmentType;

  final DateTime lastUpdated;

  final double ry;
  final double yb;
  final double br;

  final double re;
  final double ye;
  final double be;

  final double rr;
  final double yy;
  final double bb;

  const IsoIrTest({
    @required this.id,
    @required this.trNo,
    @required this.ry,
    @required this.yb,
    @required this.br,
    @required this.be,
    @required this.re,
    @required this.ye,
    @required this.yy,
    @required this.rr,
    @required this.bb,
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
        rr,
        yy,
        bb,
        ye,
        be,
        re,
        ry,
        yb,
        br,
        serialNo,
        EquipmentType,
        lastUpdated,
      ];
}

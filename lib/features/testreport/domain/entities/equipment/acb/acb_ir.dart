import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AcbIrTest extends Equatable {
  final int trNo;
  final int id;
  final int databaseID;
  final String serialNo;
  final String EquipmentType;
  final DateTime lastUpdated;

  final double ry;
  final double yb;
  final double br;
  final double rn;
  final double yn;
  final double bn;
  final double re;
  final double ye;
  final double be;
  final double ne;
  final double rR;
  final double yY;
  final double bB;
  final double nN;
  final double cb;
  final double cr;
  final double cy;

  const AcbIrTest({
    @required this.id,
    @required this.trNo,
    @required this.ry,
    @required this.yb,
    @required this.bB,
    @required this.be,
    @required this.bn,
    @required this.br,
    @required this.nN,
    @required this.ne,
    @required this.rR,
    @required this.re,
    @required this.rn,
    @required this.yY,
    @required this.ye,
    @required this.yn,
    @required this.serialNo,
    @required this.databaseID,
    @required this.EquipmentType,
    @required this.lastUpdated,
    @required this.cb,
    @required this.cr,
    @required this.cy,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        rR,
        re,
        rn,
        ry,
        yY,
        yb,
        ye,
        yn,
        bB,
        be,
        bn,
        br,
        nN,
        ne,
        serialNo,
        EquipmentType,
        lastUpdated,
        cb,
        cr,
        cy,
      ];
}

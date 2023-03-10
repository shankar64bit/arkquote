import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class VcbTiming extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String EquipmentType;
  final DateTime lastUpdated;

  final double closeR;
  final double closeY;
  final double closeB;
  final double tc1OpenR;
  final double tc1OpenY;
  final double tc1OpenB;
  final double tc1CloseR;
  final double tc1CloseY;
  final double tc1CloseB;
  final double tc2OpenR;
  final double tc2OpenY;
  final double tc2OpenB;
  final double tc2CloseR;
  final double tc2CloseY;
  final double tc2CloseB;

  const VcbTiming({
    @required this.closeR,
    @required this.closeY,
    @required this.closeB,
    @required this.tc1OpenR,
    @required this.tc1OpenY,
    @required this.tc1OpenB,
    @required this.tc1CloseR,
    @required this.tc1CloseY,
    @required this.tc1CloseB,
    @required this.tc2OpenR,
    @required this.tc2OpenY,
    @required this.tc2OpenB,
    @required this.tc2CloseR,
    @required this.tc2CloseY,
    @required this.tc2CloseB,
    @required this.serialNo,
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.EquipmentType,
    @required this.lastUpdated,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        closeR,
        closeY,
        closeB,
        tc1OpenR,
        tc1OpenY,
        tc1OpenB,
        tc1CloseR,
        tc1CloseY,
        tc1CloseB,
        tc2OpenR,
        tc2OpenY,
        tc2OpenB,
        tc2CloseR,
        tc2CloseY,
        tc2CloseB,
        serialNo,
        trNo,
        EquipmentType,
        lastUpdated,
      ];
}

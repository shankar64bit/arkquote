// ignore_for_file: non_constant_identifier_names
import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ItMc extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String equipmentUsed;
  final DateTime updateDate;
  final String tapPosition;
  final double uv;
  final double vw;
  final double wu;
  final double u;
  final double v;
  final double w;

  const ItMc({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.equipmentUsed,
    @required this.updateDate,
    @required this.tapPosition,
    @required this.uv,
    @required this.vw,
    @required this.wu,
    @required this.u,
    @required this.v,
    @required this.w,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        equipmentUsed,
        updateDate,
        tapPosition,
        uv,
        vw,
        wu,
        u,
        v,
        w,
      ];
}

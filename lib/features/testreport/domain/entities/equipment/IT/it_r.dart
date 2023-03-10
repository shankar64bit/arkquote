// ignore_for_file: non_constant_identifier_names
import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ItR extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String equipmentUsed;
  final DateTime updateDate;
  final String tapPosition;
  final double hv_uv;
  final double hv_vw;
  final double hv_wu;
  final double lv1_uv;
  final double lv1_vw;
  final double lv1_wu;
  final double lv2_uv;
  final double lv2_vw;
  final double lv2_wu;
  final double lv3_uv;
  final double lv3_vw;
  final double lv3_wu;
  final double lv4_uv;
  final double lv4_vw;
  final double lv4_wu;
  const ItR({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.equipmentUsed,
    @required this.updateDate,
    @required this.tapPosition,
    @required this.hv_uv,
    @required this.hv_vw,
    @required this.hv_wu,
    @required this.lv1_uv,
    @required this.lv1_vw,
    @required this.lv1_wu,
    @required this.lv2_uv,
    @required this.lv2_vw,
    @required this.lv2_wu,
    @required this.lv3_uv,
    @required this.lv3_vw,
    @required this.lv3_wu,
    @required this.lv4_uv,
    @required this.lv4_vw,
    @required this.lv4_wu,
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
        hv_uv,
        hv_vw,
        hv_wu,
        lv1_uv,
        lv1_vw,
        lv1_wu,
        lv1_uv,
        lv1_vw,
        lv1_wu,
        lv1_uv,
        lv1_vw,
        lv1_wu,
        lv1_uv,
        lv1_vw,
        lv1_wu,
      ];
}

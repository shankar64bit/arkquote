// ignore_for_file: non_constant_identifier_names
import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ItMb extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String equipmentUsed;
  final DateTime updateDate;
  final double r_hv_uv;
  final double r_hv_vw;
  final double r_hv_wu;
  final double r_lv1_uv;
  final double r_lv1_vw;
  final double r_lv1_wu;
  final double r_lv2_uv;
  final double r_lv2_vw;
  final double r_lv2_wu;
  final double r_lv3_uv;
  final double r_lv3_vw;
  final double r_lv3_wu;
  final double r_lv4_uv;
  final double r_lv4_vw;
  final double r_lv4_wu;

  final double y_hv_uv;
  final double y_hv_vw;
  final double y_hv_wu;
  final double y_lv1_uv;
  final double y_lv1_vw;
  final double y_lv1_wu;
  final double y_lv2_uv;
  final double y_lv2_vw;
  final double y_lv2_wu;
  final double y_lv3_uv;
  final double y_lv3_vw;
  final double y_lv3_wu;
  final double y_lv4_uv;
  final double y_lv4_vw;
  final double y_lv4_wu;

  final double b_hv_uv;
  final double b_hv_vw;
  final double b_hv_wu;
  final double b_lv1_uv;
  final double b_lv1_vw;
  final double b_lv1_wu;
  final double b_lv2_uv;
  final double b_lv2_vw;
  final double b_lv2_wu;
  final double b_lv3_uv;
  final double b_lv3_vw;
  final double b_lv3_wu;
  final double b_lv4_uv;
  final double b_lv4_vw;
  final double b_lv4_wu;
  const ItMb({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.equipmentUsed,
    @required this.updateDate,
    @required this.r_hv_uv,
    @required this.r_hv_vw,
    @required this.r_hv_wu,
    @required this.r_lv1_uv,
    @required this.r_lv1_vw,
    @required this.r_lv1_wu,
    @required this.r_lv2_uv,
    @required this.r_lv2_vw,
    @required this.r_lv2_wu,
    @required this.r_lv3_uv,
    @required this.r_lv3_vw,
    @required this.r_lv3_wu,
    @required this.r_lv4_uv,
    @required this.r_lv4_vw,
    @required this.r_lv4_wu,
    @required this.y_hv_uv,
    @required this.y_hv_vw,
    @required this.y_hv_wu,
    @required this.y_lv1_uv,
    @required this.y_lv1_vw,
    @required this.y_lv1_wu,
    @required this.y_lv2_uv,
    @required this.y_lv2_vw,
    @required this.y_lv2_wu,
    @required this.y_lv3_uv,
    @required this.y_lv3_vw,
    @required this.y_lv3_wu,
    @required this.y_lv4_uv,
    @required this.y_lv4_vw,
    @required this.y_lv4_wu,
    @required this.b_hv_uv,
    @required this.b_hv_vw,
    @required this.b_hv_wu,
    @required this.b_lv1_uv,
    @required this.b_lv1_vw,
    @required this.b_lv1_wu,
    @required this.b_lv2_uv,
    @required this.b_lv2_vw,
    @required this.b_lv2_wu,
    @required this.b_lv3_uv,
    @required this.b_lv3_vw,
    @required this.b_lv3_wu,
    @required this.b_lv4_uv,
    @required this.b_lv4_vw,
    @required this.b_lv4_wu,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        equipmentUsed,
        updateDate,
        r_hv_uv,
        r_hv_vw,
        r_hv_wu,
        r_lv1_uv,
        r_lv1_vw,
        r_lv1_wu,
        r_lv2_uv,
        r_lv2_vw,
        r_lv2_wu,
        r_lv3_uv,
        r_lv3_vw,
        r_lv3_wu,
        r_lv4_uv,
        r_lv4_vw,
        r_lv4_wu,
        y_hv_uv,
        y_hv_vw,
        y_hv_wu,
        y_lv1_uv,
        y_lv1_vw,
        y_lv1_wu,
        y_lv2_uv,
        y_lv2_vw,
        y_lv2_wu,
        y_lv3_uv,
        y_lv3_vw,
        y_lv3_wu,
        y_lv4_uv,
        y_lv4_vw,
        y_lv4_wu,
        b_hv_uv,
        b_hv_vw,
        b_hv_wu,
        b_lv1_uv,
        b_lv1_vw,
        b_lv1_wu,
        b_lv2_uv,
        b_lv2_vw,
        b_lv2_wu,
        b_lv3_uv,
        b_lv3_vw,
        b_lv3_wu,
        b_lv4_uv,
        b_lv4_vw,
        b_lv4_wu,
      ];
}

// ignore_for_file: non_constant_identifier_names
import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ItVg extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String equipmentUsed;
  final DateTime updateDate;

  final double lv1_v1;
  final double lv1_v2;
  final double lv1_v3;
  final double lv1_v4;
  final double lv2_v1;
  final double lv2_v2;
  final double lv2_v3;
  final double lv2_v4;
  final double lv3_v1;
  final double lv3_v2;
  final double lv3_v3;
  final double lv3_v4;
  final double lv4_v1;
  final double lv4_v2;
  final double lv4_v3;
  final double lv4_v4;
  const ItVg({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.equipmentUsed,
    @required this.updateDate,
    @required this.lv1_v1,
    @required this.lv1_v2,
    @required this.lv1_v3,
    @required this.lv1_v4,
    @required this.lv2_v1,
    @required this.lv2_v2,
    @required this.lv2_v3,
    @required this.lv2_v4,
    @required this.lv3_v1,
    @required this.lv3_v2,
    @required this.lv3_v3,
    @required this.lv3_v4,
    @required this.lv4_v1,
    @required this.lv4_v2,
    @required this.lv4_v3,
    @required this.lv4_v4,
  });
  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        equipmentUsed,
        updateDate,
        lv1_v1,
        lv1_v2,
        lv1_v3,
        lv1_v4,
        lv2_v1,
        lv2_v2,
        lv2_v3,
        lv2_v4,
        lv3_v1,
        lv3_v2,
        lv3_v3,
        lv3_v4,
        lv4_v1,
        lv4_v2,
        lv4_v3,
        lv4_v4,
      ];
}

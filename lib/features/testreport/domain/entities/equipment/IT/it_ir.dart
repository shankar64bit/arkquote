// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ItIr extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String equipmentUsed;
  final DateTime updateDate;
  final double hvE_60;
  final double hvE_600;
  final double hvLv1_60;
  final double hvLv1_600;
  final double hvLv2_60;
  final double hvLv2_600;
  final double hvLv3_60;
  final double hvLv3_600;
  final double hvLv4_60;
  final double hvLv4_600;
  final double lv1E;
  final double lv2E;
  final double lv3E;
  final double lv4E;
  final double lv1Lv2;
  final double lv1Lv3;
  final double lv1Lv4;
  final double lv2Lv3;
  final double lv2Lv4;
  final double lv3Lv4;
  final double lv4Lv1;

  const ItIr({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.equipmentUsed,
    @required this.updateDate,
    @required this.hvE_60,
    @required this.hvE_600,
    @required this.hvLv1_60,
    @required this.hvLv1_600,
    @required this.hvLv2_60,
    @required this.hvLv2_600,
    @required this.hvLv3_60,
    @required this.hvLv3_600,
    @required this.hvLv4_60,
    @required this.hvLv4_600,
    @required this.lv1E,
    @required this.lv2E,
    @required this.lv3E,
    @required this.lv4E,
    @required this.lv1Lv2,
    @required this.lv1Lv3,
    @required this.lv1Lv4,
    @required this.lv2Lv3,
    @required this.lv2Lv4,
    @required this.lv3Lv4,
    @required this.lv4Lv1,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        equipmentUsed,
        updateDate,
        hvE_60,
        hvE_600,
        hvLv1_60,
        hvLv1_600,
        hvLv2_60,
        hvLv2_600,
        hvLv3_60,
        hvLv3_600,
        hvLv4_60,
        hvLv4_600,
        lv1E,
        lv2E,
        lv3E,
        lv4E,
        lv1Lv2,
        lv1Lv3,
        lv1Lv4,
        lv2Lv3,
        lv2Lv4,
        lv3Lv4,
        lv4Lv1,
      ];
}

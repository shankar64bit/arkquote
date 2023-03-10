// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Powtsc extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final int tapPosition;
  final double hv_1u;
  final double hv_1v;
  final double hv_1w;
  final double hv_1n;
  final double lv_2u;
  final double lv_2v;
  final double lv_2w;
  final double lv_2n;
  final String equipmentUsed;
  final DateTime updateDate;

  const Powtsc({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.tapPosition,
    @required this.serialNo,
    @required this.hv_1u,
    @required this.hv_1v,
    @required this.hv_1w,
    @required this.hv_1n,
    @required this.lv_2u,
    @required this.lv_2v,
    @required this.lv_2w,
    @required this.lv_2n,
    @required this.equipmentUsed,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        hv_1u,
        hv_1v,
        hv_1w,
        hv_1n,
        lv_2u,
        lv_2v,
        lv_2w,
        lv_2n,
        equipmentUsed,
        updateDate,
        tapPosition,
      ];
}

// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Powt_R extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final int tapPosition;
  final double hv_1u_1v;
  final double hv_1v_1w;
  final double hv_1w_1u;
  final double hv_1u_1n;
  final double hv_1v_1n;
  final double hv_1w_1n;
  final double lv_2u_2v;
  final double lv_2v_2w;
  final double lv_2w_2u;
  final double lv_2u_2n;
  final double lv_2v_2n;
  final double lv_2w_2n;
  final String equipmentUsed;
  final DateTime updateDate;

  const Powt_R({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.tapPosition,
    @required this.serialNo,
    @required this.hv_1u_1v,
    @required this.hv_1v_1w,
    @required this.hv_1w_1u,
    @required this.hv_1u_1n,
    @required this.hv_1v_1n,
    @required this.hv_1w_1n,
    @required this.lv_2u_2v,
    @required this.lv_2v_2w,
    @required this.lv_2w_2u,
    @required this.lv_2u_2n,
    @required this.lv_2v_2n,
    @required this.lv_2w_2n,
    @required this.equipmentUsed,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        hv_1u_1v,
        hv_1v_1w,
        hv_1w_1u,
        hv_1u_1n,
        hv_1v_1n,
        hv_1w_1n,
        lv_2u_2v,
        lv_2v_2w,
        lv_2w_2u,
        lv_2u_2n,
        lv_2v_2n,
        lv_2w_2n,
        equipmentUsed,
        updateDate,
      ];
}

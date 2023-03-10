// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class AT_mb extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final double ry_hv_1u_1v;
  final double ry_hv_1v_1w;
  final double ry_hv_1w_1u;
  final double ry_hv_1u_1n;
  final double ry_hv_1v_1n;
  final double ry_hv_1w_1n;
  final double ry_lv_2u_2v;
  final double ry_lv_2v_2w;
  final double ry_lv_2w_2u;
  final double ry_lv_2u_2n;
  final double ry_lv_2v_2n;
  final double ry_lv_2w_2n;
  final double yb_hv_1u_1v;
  final double yb_hv_1v_1w;
  final double yb_hv_1w_1u;
  final double yb_hv_1u_1n;
  final double yb_hv_1v_1n;
  final double yb_hv_1w_1n;
  final double yb_lv_2u_2v;
  final double yb_lv_2v_2w;
  final double yb_lv_2w_2u;
  final double yb_lv_2u_2n;
  final double yb_lv_2v_2n;
  final double yb_lv_2w_2n;
  final double br_hv_1u_1v;
  final double br_hv_1v_1w;
  final double br_hv_1w_1u;
  final double br_hv_1u_1n;
  final double br_hv_1v_1n;
  final double br_hv_1w_1n;
  final double br_lv_2u_2v;
  final double br_lv_2v_2w;
  final double br_lv_2w_2u;
  final double br_lv_2u_2n;
  final double br_lv_2v_2n;
  final double br_lv_2w_2n;
  final String equipmentUsed;
  final DateTime updateDate;

  const AT_mb({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.ry_hv_1u_1v,
    @required this.ry_hv_1v_1w,
    @required this.ry_hv_1w_1u,
    @required this.ry_hv_1u_1n,
    @required this.ry_hv_1v_1n,
    @required this.ry_hv_1w_1n,
    @required this.ry_lv_2u_2v,
    @required this.ry_lv_2v_2w,
    @required this.ry_lv_2w_2u,
    @required this.ry_lv_2u_2n,
    @required this.ry_lv_2v_2n,
    @required this.ry_lv_2w_2n,
    @required this.yb_hv_1u_1v,
    @required this.yb_hv_1v_1w,
    @required this.yb_hv_1w_1u,
    @required this.yb_hv_1u_1n,
    @required this.yb_hv_1v_1n,
    @required this.yb_hv_1w_1n,
    @required this.yb_lv_2u_2v,
    @required this.yb_lv_2v_2w,
    @required this.yb_lv_2w_2u,
    @required this.yb_lv_2u_2n,
    @required this.yb_lv_2v_2n,
    @required this.yb_lv_2w_2n,
    @required this.br_hv_1u_1v,
    @required this.br_hv_1v_1w,
    @required this.br_hv_1w_1u,
    @required this.br_hv_1u_1n,
    @required this.br_hv_1v_1n,
    @required this.br_hv_1w_1n,
    @required this.br_lv_2u_2v,
    @required this.br_lv_2v_2w,
    @required this.br_lv_2w_2u,
    @required this.br_lv_2u_2n,
    @required this.br_lv_2v_2n,
    @required this.br_lv_2w_2n,
    @required this.equipmentUsed,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        ry_hv_1u_1v,
        ry_hv_1v_1w,
        ry_hv_1w_1u,
        ry_hv_1u_1n,
        ry_hv_1v_1n,
        ry_hv_1w_1n,
        ry_lv_2u_2v,
        ry_lv_2v_2w,
        ry_lv_2w_2u,
        ry_lv_2u_2n,
        ry_lv_2v_2n,
        ry_lv_2w_2n,
        yb_hv_1u_1v,
        yb_hv_1v_1w,
        yb_hv_1w_1u,
        yb_hv_1u_1n,
        yb_hv_1v_1n,
        yb_hv_1w_1n,
        yb_lv_2u_2v,
        yb_lv_2v_2w,
        yb_lv_2w_2u,
        yb_lv_2u_2n,
        yb_lv_2v_2n,
        yb_lv_2w_2n,
        br_hv_1u_1v,
        br_hv_1v_1w,
        br_hv_1w_1u,
        br_hv_1u_1n,
        br_hv_1v_1n,
        br_hv_1w_1n,
        br_lv_2u_2v,
        br_lv_2v_2w,
        br_lv_2w_2u,
        br_lv_2u_2n,
        br_lv_2v_2n,
        br_lv_2w_2n,
        equipmentUsed,
        updateDate,
      ];
}

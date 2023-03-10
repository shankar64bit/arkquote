// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Powt3win_Mb extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final double r_hv_un;
  final double r_hv_vn;
  final double r_hv_wn;
  final double y_hv_un;
  final double y_hv_vn;
  final double y_hv_wn;
  final double b_hv_un;
  final double b_hv_vn;
  final double b_hv_wn;
  final double r_lv_un;
  final double r_lv_vn;
  final double r_lv_wn;
  final double y_lv_un;
  final double y_lv_vn;
  final double y_lv_wn;
  final double b_lv_un;
  final double b_lv_vn;
  final double b_lv_wn;
  final double r_ivt_un;
  final double r_ivt_vn;
  final double r_ivt_wn;
  final double y_ivt_un;
  final double y_ivt_vn;
  final double y_ivt_wn;
  final double b_ivt_un;
  final double b_ivt_vn;
  final double b_ivt_wn;
  final String equipmentUsed;
  final DateTime updateDate;

  const Powt3win_Mb({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.r_hv_un,
    @required this.r_hv_vn,
    @required this.r_hv_wn,
    @required this.y_hv_un,
    @required this.y_hv_vn,
    @required this.y_hv_wn,
    @required this.b_hv_un,
    @required this.b_hv_vn,
    @required this.b_hv_wn,
    @required this.r_lv_un,
    @required this.r_lv_vn,
    @required this.r_lv_wn,
    @required this.y_lv_un,
    @required this.y_lv_vn,
    @required this.y_lv_wn,
    @required this.b_lv_un,
    @required this.b_lv_vn,
    @required this.b_lv_wn,
    @required this.r_ivt_un,
    @required this.r_ivt_vn,
    @required this.r_ivt_wn,
    @required this.y_ivt_un,
    @required this.y_ivt_vn,
    @required this.y_ivt_wn,
    @required this.b_ivt_un,
    @required this.b_ivt_vn,
    @required this.b_ivt_wn,
    @required this.equipmentUsed,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        r_hv_un,
        r_hv_vn,
        r_hv_wn,
        y_hv_un,
        y_hv_vn,
        y_hv_wn,
        b_hv_un,
        b_hv_vn,
        b_hv_wn,
        r_lv_un,
        r_lv_vn,
        r_lv_wn,
        y_lv_un,
        y_lv_vn,
        y_lv_wn,
        b_lv_un,
        b_lv_vn,
        b_lv_wn,
        r_ivt_un,
        r_ivt_vn,
        r_ivt_wn,
        y_ivt_un,
        y_ivt_vn,
        y_ivt_wn,
        b_ivt_un,
        b_ivt_vn,
        b_ivt_wn,
        equipmentUsed,
        updateDate,
      ];
}

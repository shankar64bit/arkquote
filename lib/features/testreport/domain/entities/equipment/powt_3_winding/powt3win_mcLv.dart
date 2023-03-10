// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Powt3win_mcLv extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final int tapPosition;
  final double lv_u_vn;
  final double lv_v_wn;
  final double lv_w_un;
  final double lv_u;
  final double lv_v;
  final double lv_w;
  final double lv_n;

  const Powt3win_mcLv({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.tapPosition,
    @required this.serialNo,
    @required this.lv_u_vn,
    @required this.lv_v_wn,
    @required this.lv_w_un,
    @required this.lv_u,
    @required this.lv_v,
    @required this.lv_w,
    @required this.lv_n,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        lv_u_vn,
        lv_v_wn,
        lv_w_un,
        lv_u,
        lv_v,
        lv_w,
        lv_n,
      ];
}

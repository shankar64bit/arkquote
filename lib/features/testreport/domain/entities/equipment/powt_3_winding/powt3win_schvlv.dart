// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Powt3winschvlv extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final int tapPosition;
  final double hv_u;
  final double hv_v;
  final double hv_w;
  final double hv_n;
  final double lv_u;
  final double lv_v;
  final double lv_w;
  final double lv_n;

  const Powt3winschvlv({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.tapPosition,
    @required this.serialNo,
    @required this.hv_u,
    @required this.hv_v,
    @required this.hv_w,
    @required this.hv_n,
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
        hv_u,
        hv_v,
        hv_w,
        hv_n,
        lv_u,
        lv_v,
        lv_w,
        lv_n,
      ];
}

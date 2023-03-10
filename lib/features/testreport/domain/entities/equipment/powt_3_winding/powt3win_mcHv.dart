// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Powt3win_mcHv extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final int tapPosition;
  final double hv_1u_1vn;
  final double hv_1v_1wn;
  final double hv_1w_1un;
  final double hv_1u;
  final double hv_1v;
  final double hv_1w;
  final double hv_1n;

  const Powt3win_mcHv({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.tapPosition,
    @required this.serialNo,
    @required this.hv_1u_1vn,
    @required this.hv_1v_1wn,
    @required this.hv_1w_1un,
    @required this.hv_1u,
    @required this.hv_1v,
    @required this.hv_1w,
    @required this.hv_1n,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        hv_1u_1vn,
        hv_1v_1wn,
        hv_1w_1un,
        hv_1u,
        hv_1v,
        hv_1w,
        hv_1n,
      ];
}
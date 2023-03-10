// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Powt_mc extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final int tapPosition;
  final double hv_1u_1n;
  final double hv_1v_1n;
  final double hv_1w_1n;
  final double hv_1u;
  final double hv_1v;
  final double hv_1w;
  final double hv_1n;
  final String equipmentUsed;
  final DateTime updateDate;

  const Powt_mc({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.tapPosition,
    @required this.serialNo,
    @required this.hv_1u_1n,
    @required this.hv_1v_1n,
    @required this.hv_1w_1n,
    @required this.hv_1u,
    @required this.hv_1v,
    @required this.hv_1w,
    @required this.hv_1n,
    @required this.equipmentUsed,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        hv_1u_1n,
        hv_1v_1n,
        hv_1w_1n,
        hv_1u,
        hv_1v,
        hv_1w,
        hv_1n,
        equipmentUsed,
        updateDate,
      ];
}

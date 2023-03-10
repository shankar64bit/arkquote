// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PowtwrHv extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final int tapPosition;
  final double hv_r_1u_1vn;
  final double hv_r_1v_1wn;
  final double hv_r_1w_1un;

  const PowtwrHv({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.hv_r_1u_1vn,
    @required this.hv_r_1v_1wn,
    @required this.hv_r_1w_1un,
    @required this.tapPosition,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        hv_r_1u_1vn,
        hv_r_1v_1wn,
        hv_r_1w_1un,
        tapPosition,
      ];
}

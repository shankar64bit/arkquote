// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class AT_wrHv extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final int tapPosition;
  final double hv_1u_1n;
  final double hv_1v_1n;
  final double hv_1w_1n;

  const AT_wrHv({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.hv_1u_1n,
    @required this.hv_1v_1n,
    @required this.hv_1w_1n,
    @required this.tapPosition,
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
        tapPosition,
      ];
}

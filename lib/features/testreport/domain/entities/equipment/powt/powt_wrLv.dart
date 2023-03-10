// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PowtwrLv extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final int tapPosition;
  final double lv_r_2u_2vn;
  final double lv_r_2v_2wn;
  final double lv_r_2w_2un;
  final String equipmentUsed;
  final DateTime updateDate;

  const PowtwrLv({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.tapPosition,
    @required this.serialNo,
    @required this.lv_r_2u_2vn,
    @required this.lv_r_2v_2wn,
    @required this.lv_r_2w_2un,
    @required this.equipmentUsed,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        lv_r_2u_2vn,
        lv_r_2v_2wn,
        lv_r_2w_2un,
        equipmentUsed,
        updateDate,
        tapPosition,
      ];
}

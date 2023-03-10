// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class AT_wrLv extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final int tapPosition;
  final double lv_2u_2v;
  final double lv_2v_2w;
  final double lv_2w_2u;
  final String equipmentUsed;
  final DateTime updateDate;

  const AT_wrLv({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.tapPosition,
    @required this.serialNo,
    @required this.lv_2u_2v,
    @required this.lv_2v_2w,
    @required this.lv_2w_2u,
    @required this.equipmentUsed,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        lv_2u_2v,
        lv_2v_2w,
        lv_2w_2u,
        equipmentUsed,
        updateDate,
        tapPosition,
      ];
}

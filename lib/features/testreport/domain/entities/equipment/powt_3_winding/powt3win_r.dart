// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Powt3win_R extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final int tapPosition;
  final double hv_1u_1vn;
  final double hv_1v_1wn;
  final double hv_1w_1un;
  final double lv_uvn;
  final double lv_vwn;
  final double lv_wun;
  final double ivt_uvn;
  final double ivt_vwn;
  final double ivt_wun;
  final String equipmentUsed;
  final DateTime updateDate;

  const Powt3win_R({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.tapPosition,
    @required this.serialNo,
    @required this.hv_1u_1vn,
    @required this.hv_1v_1wn,
    @required this.hv_1w_1un,
    @required this.lv_uvn,
    @required this.lv_vwn,
    @required this.lv_wun,
    @required this.ivt_uvn,
    @required this.ivt_vwn,
    @required this.ivt_wun,
    @required this.equipmentUsed,
    @required this.updateDate,
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
        lv_uvn,
        lv_vwn,
        lv_wun,
        ivt_uvn,
        ivt_vwn,
        ivt_wun,
        equipmentUsed,
        updateDate,
      ];
}

// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Powt3winmcIvT extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final int tapPosition;
  final double ivt_u_vn;
  final double ivt_v_wn;
  final double ivt_w_un;
  final double ivt_u;
  final double ivt_v;
  final double ivt_w;
  final double ivt_n;
  final String equipmentUsed;
  final DateTime updateDate;

  const Powt3winmcIvT({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.tapPosition,
    @required this.serialNo,
    @required this.ivt_u_vn,
    @required this.ivt_v_wn,
    @required this.ivt_w_un,
    @required this.ivt_u,
    @required this.ivt_v,
    @required this.ivt_w,
    @required this.ivt_n,
    @required this.equipmentUsed,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        ivt_u_vn,
        ivt_v_wn,
        ivt_w_un,
        ivt_u,
        ivt_v,
        ivt_w,
        ivt_n,
        equipmentUsed,
        updateDate,
      ];
}

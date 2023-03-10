// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Powt3winschvivt extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final int tapPosition;
  final double hv_u;
  final double hv_v;
  final double hv_w;
  final double hv_n;
  final double ivt_u;
  final double ivt_v;
  final double ivt_w;
  final double ivt_n;
  final String equipmentUsed;
  final DateTime updateDate;

  const Powt3winschvivt({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.tapPosition,
    @required this.serialNo,
    @required this.hv_u,
    @required this.hv_v,
    @required this.hv_w,
    @required this.hv_n,
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
        hv_u,
        hv_v,
        hv_w,
        hv_n,
        ivt_u,
        ivt_v,
        ivt_w,
        ivt_n,
        equipmentUsed,
        updateDate,
      ];
}

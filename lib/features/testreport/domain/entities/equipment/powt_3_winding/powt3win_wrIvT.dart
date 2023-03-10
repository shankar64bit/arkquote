// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Powt3winwrIvT extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final int tapPosition;
  final double ivt_r_uvn;
  final double ivt_r_vwn;
  final double ivt_r_wun;

  const Powt3winwrIvT({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.tapPosition,
    @required this.serialNo,
    @required this.ivt_r_uvn,
    @required this.ivt_r_vwn,
    @required this.ivt_r_wun,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        ivt_r_uvn,
        ivt_r_vwn,
        ivt_r_wun,
        tapPosition,
      ];
}

// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CT_tap extends Equatable {
  final int id;
  final int databaseID;
  final String tapName;
  final int ratio;
  final int kneePointVoltage;
  final int leakageCurrent;
  final int coreRef;
  final DateTime updateDate;

  const CT_tap({
    @required this.id,
    @required this.databaseID,
    @required this.tapName,
    @required this.ratio,
    @required this.kneePointVoltage,
    @required this.leakageCurrent,
    @required this.coreRef,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        tapName,
        ratio,
        kneePointVoltage,
        leakageCurrent,
        coreRef,
        updateDate,
      ];
}

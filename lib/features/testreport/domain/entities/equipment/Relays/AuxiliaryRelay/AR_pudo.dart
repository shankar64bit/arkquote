// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ARpudo extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final int arRef;
  final String coilRef;
  final double coilResistenace;
  final int pickUp;
  final String dropOff;
  final String equipmentUsed;
  final DateTime updateDate;

  const ARpudo({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.arRef,
    @required this.coilRef,
    @required this.coilResistenace,
    @required this.pickUp,
    @required this.dropOff,
    @required this.equipmentUsed,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        arRef,
        coilRef,
        coilResistenace,
        pickUp,
        dropOff,
        equipmentUsed,
        updateDate,
      ];
}

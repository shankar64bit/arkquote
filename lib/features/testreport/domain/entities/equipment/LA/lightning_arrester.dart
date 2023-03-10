import 'dart:ffi';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LightningArrester extends Equatable {
  final String etype;
  final int trNo;
  final String designation;
  final String location;
  final String serialNo;
  final String rating;
  final String make;
  final String equipType;
  final int yom;
  final DateTime dateOfTesting;
  final int id;
  final int databaseID;
  final String TestedBy;
  final String VerifiedBy;
  final String WitnessedBy;
  final DateTime updateDate;

  const LightningArrester({
    @required this.etype,
    @required this.designation,
    @required this.location,
    @required this.serialNo,
    @required this.make,
    @required this.rating,
    @required this.yom,
    @required this.equipType,
    @required this.dateOfTesting,
    @required this.trNo,
    @required this.id,
    @required this.databaseID,
    @required this.TestedBy,
    @required this.VerifiedBy,
    @required this.WitnessedBy,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        etype,
        designation,
        location,
        serialNo,
        make,
        rating,
        equipType,
        yom,
        dateOfTesting,
        trNo,
        id,
        databaseID,
        TestedBy,
        VerifiedBy,
        WitnessedBy,
        updateDate,
      ];
}

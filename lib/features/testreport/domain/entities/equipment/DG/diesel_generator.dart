import 'dart:ffi';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class DieselGenerator extends Equatable {
  final String etype;
  final int trNo;
  final String design;
  final String location;
  final String serialNo;
  final String model;
  final int rating;
  final int voltage;
  final double powerFactor;
  final int speed;
  final String make;
  final int yom;
  final DateTime dateOfTesting;
  final int id;
  final int databaseID;
  final String TestedBy;
  final String VerifiedBy;
  final String WitnessedBy;
  final DateTime updateDate;

  const DieselGenerator({
    @required this.etype,
    @required this.design,
    @required this.location,
    @required this.serialNo,
    @required this.model,
    @required this.voltage,
    @required this.powerFactor,
    @required this.speed,
    @required this.make,
    @required this.rating,
    @required this.yom,
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
        design,
        location,
        serialNo,
        make,
        rating,
        model,
        voltage,
        speed,
        powerFactor,
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

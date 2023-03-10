import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Acb extends Equatable {
  final String etype;
  final String designation;
  final String location;
  final String panel;
  final String serialNo;
  final String make;
  final String type;
  final int ratedSystemVoltage;
  final int ratedSystemCurrent;
  final int yom;
  final DateTime dateOfTesting;
  final DateTime dueDateOfTesting;
  final int noOfPoles;
  final int iecStandard;
  final int trNo;
  final int id;
  final int databaseID;
  final String TestedBy;
  final String VerifiedBy;
  final String WitnessedBy;
  final DateTime lastUpdated;
  final double motorVoltage;
  final double closeCoilTripVolt;

  const Acb({
    @required this.etype,
    @required this.designation,
    @required this.location,
    @required this.panel,
    @required this.serialNo,
    @required this.make,
    @required this.type,
    @required this.ratedSystemVoltage,
    @required this.ratedSystemCurrent,
    @required this.yom,
    @required this.dateOfTesting,
    @required this.dueDateOfTesting,
    @required this.noOfPoles,
    @required this.iecStandard,
    @required this.trNo,
    @required this.id,
    @required this.databaseID,
    @required this.TestedBy,
    @required this.VerifiedBy,
    @required this.WitnessedBy,
    @required this.lastUpdated,
    @required this.motorVoltage,
    @required this.closeCoilTripVolt,
  });

  @override
  List<Object> get props => [
        etype,
        designation,
        location,
        panel,
        serialNo,
        make,
        type,
        ratedSystemCurrent,
        ratedSystemVoltage,
        yom,
        dateOfTesting,
        dueDateOfTesting,
        noOfPoles,
        iecStandard,
        trNo,
        id,
        databaseID,
        TestedBy,
        VerifiedBy,
        WitnessedBy,
        lastUpdated,
        motorVoltage,
        closeCoilTripVolt,
      ];
}

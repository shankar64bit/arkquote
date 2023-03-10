import 'dart:ffi';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PowerCable extends Equatable {
  final String etype;
  final int trNo;
  final String designation;
  final String location;
  final String panel;

  final String rating;
  final String make;
  final String size;
  final String length;
  final DateTime dateOfTesting;
  final int id;
  final int databaseID;
  final String TestedBy;
  final String VerifiedBy;
  final String WitnessedBy;
  final DateTime updateDate;

  const PowerCable({
    @required this.etype,
    @required this.designation,
    @required this.location,
    @required this.panel,
    @required this.make,
    @required this.rating,
    @required this.size,
    @required this.length,
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
        panel,
        make,
        rating,
        size,
        length,
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

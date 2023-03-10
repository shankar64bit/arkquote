import 'dart:ffi';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class BusBar extends Equatable {
  final String etype;
  final int trNo;
  final String designation;
  final String location;
  final String panel;
  final String rating;

  final int noOfBar;
  final DateTime dateOfTesting;
  final int id;
  final int databaseID;
  final String TestedBy;
  final String VerifiedBy;
  final String WitnessedBy;
  final DateTime updateDate;

  const BusBar({
    @required this.etype,
    @required this.designation,
    @required this.location,
    @required this.panel,
    @required this.noOfBar,
    @required this.rating,
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
        rating,
        noOfBar,
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

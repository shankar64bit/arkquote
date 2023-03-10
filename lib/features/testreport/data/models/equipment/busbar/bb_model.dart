import 'package:flutter_testreports/features/testreport/domain/entities/equipment/BusBar/busbar.dart';

class BbModel extends BusBar {
  const BbModel({
    final String etype,
    final String designation,
    final String location,
    final String panel,
    final String rating,
    final int noOfBar,
    final DateTime dateOfTesting,
    final int trNo,
    final int id,
    final int databaseID,
    final String TestedBy,
    final String VerifiedBy,
    final String WitnessedBy,
    final DateTime lastUpdated,
  }) : super(
          etype: etype,
          designation: designation,
          location: location,
          panel: panel,
          rating: rating,
          noOfBar: noOfBar,
          dateOfTesting: dateOfTesting,
          trNo: trNo,
          id: id,
          databaseID: databaseID,
          TestedBy: TestedBy,
          VerifiedBy: VerifiedBy,
          WitnessedBy: WitnessedBy,
          updateDate: lastUpdated,
        );

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

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'etype': etype,
      'designation': designation,
      'location': location,
      'rating': rating,
      'nob': noOfBar,
      'panel ': panel,
      'dateOfTesting': dateOfTesting,
      'trNo': trNo,
      'id': id,
      'databaseID': databaseID,
      'testedBy': TestedBy,
      'verifiedBy': VerifiedBy,
      'WitnessedBy': WitnessedBy,
      'updateDate': updateDate,
    };
  }

  factory BbModel.fromJson(Map<String, dynamic> json) {
    return BbModel(
      etype: json['etype'],
      designation: json['designation'],
      location: json['location'],
      rating: json['rating'],
      panel: json['panel'],
      noOfBar: json['nob'],
      dateOfTesting: json['dateOfTesting'],
      trNo: json['trNo'],
      id: json['id'],
      databaseID: json['databaseID'],
      TestedBy: json['testedBy'],
      VerifiedBy: json['verifiedBy'],
      WitnessedBy: json['WitnessedBy'],
      lastUpdated: json['updateDate'],
    );
  }
}

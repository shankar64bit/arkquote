import 'package:flutter_testreports/features/testreport/domain/entities/equipment/power_cable/power_cable.dart';

class PcModel extends PowerCable {
  const PcModel({
    final String etype,
    final String designation,
    final String location,
    final String panel,
    final String rating,
    final String make,
    final String length,
    final String size,
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
          make: make,
          size: size,
          dateOfTesting: dateOfTesting,
          length: length,
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
        make,
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

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'etype': etype,
      'designation': designation,
      'location': location,
      'rating': rating,
      'make': make,
      'panel ': panel,
      'size': size,
      'length': length,
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

  factory PcModel.fromJson(Map<String, dynamic> json) {
    return PcModel(
      etype: json['etype'],
      designation: json['designation'],
      location: json['location'],
      rating: json['rating'],
      panel: json['panel'],
      make: json['make'],
      size: json['size'],
      length: json['length'],
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

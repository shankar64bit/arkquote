import 'package:flutter_testreports/features/testreport/domain/entities/equipment/DG/diesel_generator.dart';

class DgModel extends DieselGenerator {
  const DgModel({
    final String etype,
    final int trNo,
    final String design,
    final String location,
    final String serialNo,
    final String model,
    final int rating,
    final int voltage,
    final double powerFactor,
    final int speed,
    final String make,
    final int yom,
    final DateTime dateOfTesting,
    final int id,
    final int databaseID,
    final String TestedBy,
    final String VerifiedBy,
    final String WitnessedBy,
    final DateTime updateDate,
  }) : super(
          etype: etype,
          design: design,
          location: location,
          serialNo: serialNo,
          rating: rating,
          make: make,
          model: model,
          voltage: voltage,
          powerFactor: powerFactor,
          speed: speed,
          dateOfTesting: dateOfTesting,
          yom: yom,
          trNo: trNo,
          id: id,
          databaseID: databaseID,
          TestedBy: TestedBy,
          VerifiedBy: VerifiedBy,
          WitnessedBy: WitnessedBy,
          updateDate: updateDate,
        );

  @override
  List<Object> get props => [
        etype,
        design,
        location,
        rating,
        serialNo,
        make,
        model,
        yom,
        voltage,
        speed,
        powerFactor,
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
      'designation': design,
      'location': location,
      'rating': rating,
      'serialNo': serialNo,
      'make': make,
      'model': model,
      'voltage': voltage,
      'speed': speed,
      'powerFactor': powerFactor,
      'yom': yom,
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

  factory DgModel.fromJson(Map<String, dynamic> json) {
    return DgModel(
      etype: json['etype'],
      design: json['design'],
      location: json['location'],
      rating: json['rating'],
      serialNo: json['serialNo'],
      make: json['make'],
      model: json['moel'],
      speed: json['speed'],
      voltage: json['voltage'],
      powerFactor: json['powerFactor'],
      yom: json['yom'],
      dateOfTesting: json['dateOfTesting'],
      trNo: json['trNo'],
      id: json['id'],
      databaseID: json['databaseID'],
      TestedBy: json['testedBy'],
      VerifiedBy: json['verifiedBy'],
      WitnessedBy: json['WitnessedBy'],
      updateDate: json['updateDate'],
    );
  }
}

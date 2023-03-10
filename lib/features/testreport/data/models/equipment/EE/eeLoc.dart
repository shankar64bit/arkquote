import 'package:flutter_testreports/features/testreport/domain/entities/equipment/EE/earth_electrode.dart';
import 'package:flutter_testreports/features/testreport/domain/entities/equipment/EE/eeLoc.dart';

class EELocModel extends eeLoc {
  const EELocModel({
    final String location,
    final int id,
    final int databaseID,
    final int eeRef,
    final DateTime lastUpdated,
  }) : super(
          location: location,
          id: id,
          databaseID: databaseID,
          eeRef: eeRef,
          updateDate: lastUpdated,
        );

  @override
  List<Object> get props => [
        location,
        id,
        databaseID,
        eeRef,
        updateDate,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'location': location,
      'id': id,
      'databaseID': databaseID,
      'eeRef': eeRef,
      'updateDate': updateDate,
    };
  }

  factory EELocModel.fromJson(Map<String, dynamic> json) {
    return EELocModel(
      location: json['location'],
      id: json['id'],
      eeRef: json['eeRef'],
      databaseID: json['databaseID'],
      lastUpdated: json['updateDate'],
    );
  }
}

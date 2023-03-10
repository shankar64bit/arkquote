import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Inventory extends Equatable {
  final String barcode;
  // ignore: non_constant_identifier_names
  final String SpecialKit;
  final String type, serialNo, make, model;
  final DateTime dateOfTesting;
  final DateTime dueDateOfTesting;
  final DateTime lastUpdated;

  const Inventory({
    // ignore: non_constant_identifier_names
    @required this.SpecialKit,
    @required this.barcode,
    @required this.type,
    @required this.serialNo,
    @required this.make,
    @required this.model,
    @required this.dateOfTesting,
    @required this.dueDateOfTesting,
    @required this.lastUpdated,
  });

  @override
  List<Object> get props => [
        type,
        serialNo,
        make,
        model,
        dateOfTesting,
        dueDateOfTesting,
        barcode,
        SpecialKit,
        lastUpdated,
      ];
}

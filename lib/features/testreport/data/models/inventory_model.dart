import 'package:flutter_testreports/features/testreport/domain/entities/inventory.dart';

class InventoryModel extends Inventory {
  InventoryModel({
    final String barcode,
    // ignore: non_constant_identifier_names
    final String SpecialKit,
    final String type,
    serialNo,
    make,
    model,
    final DateTime dateOfTesting,
    final DateTime dueDateOfTesting,
    final lastUpdated,
  }) : super(
          barcode: barcode,
          serialNo: serialNo,
          type: type,
          make: make,
          model: model,
          dateOfTesting: dateOfTesting,
          dueDateOfTesting: dueDateOfTesting,
          SpecialKit: SpecialKit,
          lastUpdated: lastUpdated,
        );

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

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'barcode': barcode,
      'equipmentName': type,
      'serialNo': serialNo,
      'make': make,
      'model': model,
      'CalibrationDate': dateOfTesting,
      'dueDate': dueDateOfTesting,
      'specialKit': SpecialKit,
      'updateDate': lastUpdated,
    };
  }

  factory InventoryModel.fromJson(Map<String, dynamic> json) {
    return InventoryModel(
      barcode: json['barcode'],
      type: json['equipmentName'],
      serialNo: json['serialNo'],
      make: json['make'],
      model: json['model'],
      dateOfTesting: json['CalibrationDate'],
      dueDateOfTesting: json['dueDate'],
      SpecialKit: json['specialKit'],
      lastUpdated: json['updateDate'],
    );
  }
}

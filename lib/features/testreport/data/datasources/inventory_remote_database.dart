// ignore: library_prefixes
// import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/status.dart' as status;
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:flutter_testreports/features/testreport/data/models/inventory_model.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_testreports/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import '../../../../env.sample.dart';
import '../../../../injection_container.dart';
import '../../presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import '../../presentation/providers/equipment_acb_provider/inventory_provider.dart';

abstract class InventoryRemoteDatasource {
  ///Calls the Backend api endpoint
  ///Throws a [ServerException] otherwise
  Future<InventoryModel> getNewEquipments();
}

class InventoryRemoteDatasourceImpl implements InventoryRemoteDatasource {
  final http.Client client;

  InventoryRemoteDatasourceImpl({@required this.client});

  @override
  Future<InventoryModel> getNewEquipments() async {
    var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;

    final response = await client.get(Uri.parse('${Env.URL_PREFIX}/inventry/'),
        //headers: {'Content-Type': 'application/json'},
        headers: {'Authorization': 'Bearer $acc_token'});

    List<dynamic> equipmets = json.decode(response.body);

    for (var elem in equipmets) {
      var isEquipmentId =
          sl<InventoryProvider>().getInventoryById(elem['barcode']);

      if (isEquipmentId == null) {
        print('Equipment Existed');
      } else {
        sl<InventoryProvider>().AddInventory(InventoryModel(
          barcode: elem['barcode'],
          type: elem['equipmentName'],
          SpecialKit: elem['specialKit'],
          serialNo: elem['serialNo'],
          make: elem['make'],
          model: elem['model'],
          // lastUpdated: elem['updateDate'],
          // dateOfTesting: elem['CalibrationDate'],
          // dueDateOfTesting: elem['dueDate'],
        ));

        // print(
        //     'Inventory > Fetched successfully from remote DB and added to AddInventory localDB\n');
      }
    }
  }
}

// ignore_for_file: missing_return, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/energy_meter/energy_meter_model.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_rp_test.dart';
import '../../../domain/entities/equipment/energy_meter/energy_meter_rp.dart';
import '../../providers/energy_meter_provider/energy_meter_provider.dart';
import '../../providers/energy_meter_provider/energy_meter_rp_provider.dart';

class DetailEnergyMeterRpPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int EM_ID;

  DetailEnergyMeterRpPage(this.args, {Key key}) : super(key: key);

  EnergyMeterRpTestModel energyMeterRpTestModel, ntr;

  @override
  Widget build(BuildContext context) {
    final EnergyMeterModel ntr1 =
        watchOnly((EnergyMeterProvider x) => x.energymeterModel);
    getX((EnergyMeterRpProvider x) => x.getEnergyMeterRpByID(args['id']));
    EnergyMeterRpTestModel ntr =
        watchOnly((EnergyMeterRpProvider x) => x.energymeterRpModel);

    print(ntr);
    print("ntr  Rp......");
    var mob =
        const Text('EM - RP Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('EM - RP Test Details', style: TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            return desk;
          } else {
            return mob;
          }
        }),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/edit_EM_RP', arguments: {
                  'id': args['id'],
                  'TrNo': ntr.trNo,
                  'EM_ID': args['EM_ID'],
                  'Serial_No': ntr.serialNo,
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((EnergyMeterRpProvider x) =>
                  x.deleteEnergyMeterRp(args['id']));
              Navigator.popAndPushNamed(context, '/detail_EM', arguments: {
                'id': args['id'],
                'trDatabaseID': args['trDatabaseID']
              });
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3, 0, 15, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.end, display_EquipmentValue_details
                        children: [
                          ConstrainedBox(
                              constraints:
                                  BoxConstraints(minHeight: 0, maxWidth: 700),
                              child: display_EM_Rp_details(ntr)),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container display_EM_Rp_details(EnergyMeterRpTest ntr) {
    return Container(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [
                          Text('ID : ' + args['id'].toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                          Divider(height: 10),
                          Text('TrNo : ' + ntr.trNo.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                          Divider(height: 10),
                          Text('SerialNo : ' + ntr.serialNo.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                        ]),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [
                          Text(
                              'initialTestMeterReading : ' +
                                  ntr.initialTestMeterReading.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'afterTestMeterReading : ' +
                                  ntr.afterTestMeterReading.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'testMeterReading_R : ' +
                                  ntr.testMeterReading_R.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                        ]),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [
                          Text(
                              'initialStandardMeterReading : ' +
                                  ntr.initialStandardMeterReading.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'bafterStandardMeterReadingr : ' +
                                  ntr.afterStandardMeterReading.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'standardMeterReading_A : ' +
                                  ntr.standardMeterReading_A.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

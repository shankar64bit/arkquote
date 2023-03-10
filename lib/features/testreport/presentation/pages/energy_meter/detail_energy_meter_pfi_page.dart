// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/domain/entities/equipment/energy_meter/energy_meter_ci.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/energy_meter/energy_meter_Pfi_test.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_model.dart';
import '../../../domain/entities/equipment/energy_meter/energy_meter_pfi.dart';
import '../../providers/energy_meter_provider/energy_meter_pfi_provider.dart';
import '../../providers/energy_meter_provider/energy_meter_provider.dart';

class DetailEnergyMeterPfiPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int EM_ID;

  DetailEnergyMeterPfiPage(this.args, {Key key}) : super(key: key);

  EnergyMeterPfiTestModel energyMeterPfiTestModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((EnergyMeterPfiProvider x) => x.getEnergyMeterPfiByID(args['id']));
    EnergyMeterPfiTestModel ntr =
        watchOnly((EnergyMeterPfiProvider x) => x.energymeterPfiModel);

    print(ntr);
    print("ntr  Pfi......");
    var mob =
        const Text('EM - PFI Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('EM - PFI Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_EM_PFI', arguments: {
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
              getX((EnergyMeterPfiProvider x) =>
                  x.deleteEnergyMeterPfi(args['id']));
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
                              child: display_EM_Pfi_details(ntr)),
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

  Container display_EM_Pfi_details(EnergyMeterPfiTest ntr) {
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
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [
                          Text('rr : ' + ntr.rr.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('ra : ' + ntr.ra.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('yr : ' + ntr.yr.toString(),
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
                          Text('ya : ' + ntr.ya.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('br : ' + ntr.br.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('ba : ' + ntr.ba.toString(),
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

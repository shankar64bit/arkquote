// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/power_cable/pc_hv_test_model.dart';
import '../../../domain/entities/equipment/power_cable/pc_hv.dart';
import '../../providers/pc_provider/pc_hv_provider.dart';

class DetailPcHvPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int PC_ID;

  DetailPcHvPage(this.args, {Key key}) : super(key: key);

  PcHvTestModel pcHvTestModel, ntr;

  @override
  Widget build(BuildContext context) {
    // final PcModel ntr1 = watchOnly((PcProvider x) => x.pcModel);
    getX((PcHvProvider x) => x.getPcHvByID(args['id']));
    PcHvTestModel ntr = watchOnly((PcHvProvider x) => x.pcHvModel);

    print(ntr);
    print("ntr  ......");
    var mob =
        const Text('Pc - Hv Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Pc - Hv Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_PC_HV', arguments: {
                  'id': args['id'],
                  'TrNo': ntr.trNo,
                  'PC_ID': args['PC_ID'],
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((PcHvProvider x) => x.deletePcHv(args['id']));
              Navigator.popAndPushNamed(context, '/detail_PC', arguments: {
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
                              child: display_PC_HV_details(ntr)),
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

  Container display_PC_HV_details(PcHvTest ntr) {
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
                        ]),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [
                          Text(
                              'R-Phase Applied Voltage: ' +
                                  ntr.rVoltage.toString() +
                                  ' Ω ',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'Y-Phase Applied Voltage: ' +
                                  ntr.yVoltage.toString() +
                                  ' Ω ',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'B-Phase Applied Voltage: ' +
                                  ntr.bVoltage.toString() +
                                  ' Ω ',
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
                              'R-Phase Measured Leakage Current: ' +
                                  ntr.rCurrent.toString() +
                                  ' Ω ',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'Y-Phase Measured Leakage Current: ' +
                                  ntr.yCurrent.toString() +
                                  ' Ω ',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'B-Phase Measured Leakage Current: ' +
                                  ntr.bCurrent.toString() +
                                  ' Ω ',
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

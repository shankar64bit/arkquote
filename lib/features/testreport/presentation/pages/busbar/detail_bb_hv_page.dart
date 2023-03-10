// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/busbar/bb_hv_test_model.dart';
import '../../../data/models/equipment/busbar/bb_model.dart';
import '../../../domain/entities/equipment/BusBar/pc_hv.dart';
import '../../providers/busbar_provider/bb_hv_provider.dart';
import '../../providers/busbar_provider/bb_provider.dart';

class DetailBbHvPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int BB_ID;

  DetailBbHvPage(this.args, {Key key}) : super(key: key);

  BbHvTestModel bbHvTestModel, ntr;

  @override
  Widget build(BuildContext context) {
    final BbModel ntr1 = watchOnly((BbProvider x) => x.bbModel);
    getX((BbHvProvider x) => x.getBbHvByID(args['id']));
    BbHvTestModel ntr = watchOnly((BbHvProvider x) => x.bbHvModel);

    print(ntr);
    print("ntr  ......");
    var mob =
        const Text('Busbar-HV Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Busbar-HV Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_BB_HV', arguments: {
                  'id': args['id'],
                  'TrNo': ntr.trNo,
                  'BB_ID': args['BB_ID'],
                  'bbDatabaseID': args['bbDatabaseID'],
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((BbHvProvider x) => x.deleteBbHv(args['id']));
              Navigator.popAndPushNamed(context, '/detail_BB', arguments: {
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
                              child: display_BB_HV_details(ntr, ntr1)),
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

  Container display_BB_HV_details(BbHvTest ntr, BbModel ntr1) {
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
                          Text('DBID : ' + ntr.databaseID.toString(),
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
                              'R-Phase Measured Leakage Current (mA)' +
                                  ntr.r.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'Y-Phase Measured Leakage Current (mA)' +
                                  ntr.y.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'B-Phase Measured Leakage Current (mA)' +
                                  ntr.b.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          ntr1.noOfBar == 4
                              ? Text(
                                  'Neutral - Measured Leakage Current (mA)' +
                                      ntr.n.toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13))
                              : Container(),
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

// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/busbar/bb_ir_test_model.dart';
import '../../../data/models/equipment/busbar/bb_model.dart';
import '../../../domain/entities/equipment/BusBar/bb_ir.dart';
import '../../providers/busbar_provider/bb_ir_provider.dart';
import '../../providers/busbar_provider/bb_provider.dart';

class DetailBbIrPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int Bb_ID;

  DetailBbIrPage(this.args, {Key key}) : super(key: key);

  BbIrTestModel bbIrTestModel, ntr;

  @override
  Widget build(BuildContext context) {
    final BbModel ntr1 = watchOnly((BbProvider x) => x.bbModel);
    getX((BbIrProvider x) => x.getBbIrByID(args['id']));
    BbIrTestModel ntr = watchOnly((BbIrProvider x) => x.bbIrModel);

    print(ntr);
    print("ntr  ......");
    var mob =
        const Text('Busbar-Ir Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Busbar-Ir Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_BB_IR', arguments: {
                  'id': args['id'],
                  'TrNo': ntr.trNo,
                  'BB_ID': args['BB_ID'],
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((BbIrProvider x) => x.deleteBbIr(args['id']));
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
                              child: display_BB_IR_details(ntr, ntr1)),
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

  Container display_BB_IR_details(BbIrTest ntr, BbModel ntr1) {
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
                              'Phase-Earth Before HV Test-R : ' +
                                  ntr.rB.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'Phase-Earth Before HV Test-Y : ' +
                                  ntr.yB.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'Phase-Earth Before HV Test-B : ' +
                                  ntr.bB.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          ntr1.noOfBar == 4
                              ? Text(
                                  'Phase-Earth Before HV Test-N : ' +
                                      ntr.nB.toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13))
                              : Container(),
                        ]),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [
                          Text(
                              'Phase-Earth Before HV Test-RY: ' +
                                  ntr.ryB.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'Phase-Earth Before HV Test-YB : ' +
                                  ntr.ybB.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'Phase-Earth Before HV Test-BR : ' +
                                  ntr.brB.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          ntr1.noOfBar == 4
                              ? Text(
                                  'Phase-Earth Before HV Test-RN : ' +
                                      ntr.rnB.toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13))
                              : Container(),
                          Divider(height: 10),
                          ntr1.noOfBar == 4
                              ? Text(
                                  'Phase-Earth Before HV Test-YN : ' +
                                      ntr.ynB.toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13))
                              : Container(),
                          Divider(height: 10),
                          ntr1.noOfBar == 4
                              ? Text(
                                  'Phase-Earth Before HV Test-BN : ' +
                                      ntr.bnB.toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13))
                              : Container(),
                        ]),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [
                          Text(
                              'Phase-Earth After HV Test-R :' +
                                  ntr.rA.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'Phase-Earth After HV Test-Y :' +
                                  ntr.yA.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'Phase-Earth After HV Test-B :' +
                                  ntr.bA.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          ntr1.noOfBar == 4
                              ? Text(
                                  'Phase-Earth After HV Test-N : ' +
                                      ntr.nA.toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13))
                              : Container()
                        ]),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [
                          Text(
                              'Phase-Earth After HV Test-RY: ' +
                                  ntr.ryA.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'Phase-Earth After HV Test-YB : ' +
                                  ntr.ybA.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'Phase-Earth After HV Test-BR : ' +
                                  ntr.brA.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          ntr1.noOfBar == 4
                              ? Text(
                                  'Phase-Earth After HV Test-RN : ' +
                                      ntr.rnA.toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13))
                              : Container(),
                          Divider(height: 10),
                          ntr1.noOfBar == 4
                              ? Text(
                                  'Phase-Earth After HV Test-YN : ' +
                                      ntr.ynA.toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13))
                              : Container(),
                          Divider(height: 10),
                          ntr1.noOfBar == 4
                              ? Text(
                                  'Phase-Earth After HV Test-BN : ' +
                                      ntr.bnA.toString(),
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

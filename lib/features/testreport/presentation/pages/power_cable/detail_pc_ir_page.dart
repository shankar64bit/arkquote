// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/power_cable/pc_ir_test_model.dart';
import '../../../domain/entities/equipment/power_cable/pc_ir.dart';
import '../../providers/pc_provider/pc_ir_provider.dart';

class DetailPcIrPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int PC_ID;
  double mega;
  double giga;
  double terra;

  double mega_y;
  double giga_y;
  double terra_y;

  double mega_b;
  double giga_b;
  double terra_b;

  DetailPcIrPage(this.args, {Key key}) : super(key: key);

  PcIrTestModel pcIrTestModel, ntr;

  @override
  Widget build(BuildContext context) {
    // final PcModel ntr1 = watchOnly((PcProvider x) => x.pcModel);
    getX((PcIrProvider x) => x.getPcIrByID(args['id']));
    PcIrTestModel ntr = watchOnly((PcIrProvider x) => x.pcIrModel);

    mega = ntr.bB / 1;
    print(mega);
    giga = ntr.bB / 1000;
    print(giga);
    terra = ntr.bB / 1000000;
    print(terra);
    // ----------------------
    mega_y = ntr.yB / 1;
    print(mega_y);
    giga_y = ntr.yB / 1000;
    print(giga_y);
    terra_y = ntr.yB / 1000000;
    print(terra_y);
    // ----------------------
    mega_b = ntr.rB / 1;
    print(mega_b);
    giga_b = ntr.rB / 1000;
    print(giga_b);
    terra_b = ntr.rB / 1000000;
    print(terra_b);

    print(ntr);
    print("ntr  ......");
    var mob =
        const Text('Pc - Ir Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Pc - Ir Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_PC_IR', arguments: {
                  'id': args['id'],
                  'TrNo': ntr.trNo,
                  'PC_ID': args['PC_ID'],
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((PcIrProvider x) => x.deletePcIr(args['id']));
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
                              child: display_PC_IR_details(ntr)),
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

  Container display_PC_IR_details(PcIrTest ntr) {
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
                          ntr.rB > 0 && ntr.rB <= 999
                              ? simplified_pcIR_bb(
                                  'PHe Before HV Test-R : ', mega_b, ' MΩ')
                              : Container(),
                          ntr.rB > 999 && ntr.rB <= 999999
                              ? simplified_pcIR_bb(
                                  'PHe Before HV Test-R : ', giga_b, ' GΩ')
                              : Container(),
                          ntr.rB > 1000000
                              ? simplified_pcIR_bb(
                                  'PHe Before HV Test-R : ', terra_b, ' TΩ')
                              : Container(),

                          Divider(
                            height: 10,
                          ),

                          ntr.yB > 0 && ntr.yB <= 999
                              ? simplified_pcIR_bb(
                                  'PHe Before HV Test-Y : ', mega_y, ' MΩ')
                              : Container(),
                          ntr.yB > 999 && ntr.yB <= 999999
                              ? simplified_pcIR_bb(
                                  'PHe Before HV Test-Y : ', giga_y, ' GΩ')
                              : Container(),
                          ntr.yB > 1000000
                              ? simplified_pcIR_bb(
                                  'PHe Before HV Test-Y : ', terra_y, ' TΩ')
                              : Container(),

                          Divider(
                            height: 10,
                          ),

                          ntr.bB > 0 && ntr.bB <= 999
                              ? simplified_pcIR_bb(
                                  'PHe Before HV Test-B : ', mega, ' MΩ')
                              : Container(),

                          ntr.bB > 1000 && ntr.bB <= 999999
                              ? simplified_pcIR_bb(
                                  'PHe Before HV Test-B : ', giga, ' GΩ')
                              : Container(),
                          ntr.bB > 1000000
                              ? simplified_pcIR_bb(
                                  'PHe Before HV Test-B : ', terra, ' TΩ')
                              : Container(),

                          // Text(
                          //     'note : Example of Mega, Giga, Terra \n [under development]\n\n original value of mega converstion in PDF :\n',
                          //     style: TextStyle(fontWeight: FontWeight.bold)),

                          // simplified_pcIR_bb(
                          //     'PHe Before HV Test-R : ', ntr.rB, ' MΩ'),
                          // simplified_pcIR_bb(
                          //     'PHe Before HV Test-Y : ', ntr.yB, ' MΩ'),
                          // simplified_pcIR_bb(
                          //     'PHe Before HV Test-B : ', ntr.bB, ' MΩ'),
                          // Divider(height: 10, color: Colors.red),

                          // ---------------------------------------------------
                        ]),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [
                          Text(
                              'PHe Before HV Test-RY: ' +
                                  ntr.ryB.toString() +
                                  ' MΩ',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'PHe Before HV Test-YB : ' +
                                  ntr.ybB.toString() +
                                  ' MΩ',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'PHe Before HV Test-BR : ' +
                                  ntr.brB.toString() +
                                  ' MΩ',
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
                              'PHe After HV Test-R :' +
                                  ntr.rA.toString() +
                                  ' MΩ',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'PHe After HV Test-Y :' +
                                  ntr.yA.toString() +
                                  ' MΩ',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'PHe After HV Test-B :' +
                                  ntr.bA.toString() +
                                  ' MΩ',
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
                              'PHe After HV Test-RY: ' +
                                  ntr.ryA.toString() +
                                  ' MΩ',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'PHe After HV Test-YB : ' +
                                  ntr.ybA.toString() +
                                  ' MΩ',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'PHe After HV Test-BR : ' +
                                  ntr.brA.toString() +
                                  ' MΩ',
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

  simplified_pcIR_bb(String hinttext, double mgt, String sym) {
    return Text(hinttext + mgt.toString() + sym,
        style: const TextStyle(color: Colors.black, fontSize: 13));
  }
}

// ignore_for_file: missing_return, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/acb/acb_ir_test_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/equipment_acb_provider/acb_ir_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/acb/acb_model.dart';
import '../../providers/equipment_acb_provider/acb_provider.dart';

class DetailAcbIrPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int ACB_ID;

  DetailAcbIrPage(this.args, {Key key}) : super(key: key);

  AcbIrTestModel acbIrTestModel, ntr;

  @override
  Widget build(BuildContext context) {
    print("*** Detail ACB IR tr NO ****" + args['trDatabaseID'].toString());
    final AcbModel ntr1 = watchOnly((AcbProvider x) => x.acbModel);
    getX((AcbIrProvider x) => x.getAcbIrByID(args['id']));
    AcbIrTestModel ntr = watchOnly((AcbIrProvider x) => x.acbIrModel);

    var mob = const Text('ACB IR Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('ACB IR Test Details', style: TextStyle(fontSize: 20));
    var mobV =
        const Text('VCB IR Test Details', style: TextStyle(fontSize: 15));
    var deskV =
        const Text('VCB IR Test Details', style: TextStyle(fontSize: 20));
    var mobO =
        const Text('OCB IR Test Details', style: TextStyle(fontSize: 15));
    var deskO =
        const Text('OCB IR Test Details', style: TextStyle(fontSize: 20));
    var mobS =
        const Text('SF6 IR Test Details', style: TextStyle(fontSize: 15));
    var deskS =
        const Text('SF6 IR Test Details', style: TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            if (ntr1.etype == 'acb') {
              return ntr1.etype == 'acb' ? desk : mob;
            } else if (ntr1.etype == 'vcb') {
              return ntr1.etype == 'vcb' ? deskV : mobV;
            } else if (ntr1.etype == 'ocb') {
              return ntr1.etype == 'ocb' ? deskO : mobO;
            } else if (ntr1.etype == 'sf6') {
              return ntr1.etype == 'sf6' ? deskS : mobS;
            }
          } else {
            if (ntr1.etype == 'acb') {
              return ntr1.etype == 'acb' ? mob : desk;
            } else if (ntr1.etype == 'vcb') {
              return ntr1.etype == 'vcb' ? mobV : deskV;
            } else if (ntr1.etype == 'ocb') {
              return ntr1.etype == 'ocb' ? mobO : deskO;
            } else if (ntr1.etype == 'sf6') {
              return ntr1.etype == 'sf6' ? mobS : deskS;
            }
          }
        }),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/edit_ACB_Ir', arguments: {
                  'id': args['id'],
                  'TrNo': ntr.trNo,
                  'ACB_ID': args['ACB_ID'],
                  'Serial_No': ntr.serialNo,
                  'trDatabaseID': args['trDatabaseID'],
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((AcbIrProvider x) => x.deleteACBIr(args['id']));
              Navigator.popAndPushNamed(context, '/detail_ACB',
                  arguments: args['ACB_ID']);
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
                              child: display_Acb_Ir_details(ntr)),
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

  Container display_Acb_Ir_details(AcbIrTestModel ntr) {
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
                      child: Column(
                        children: [
                          const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('Pole-Pole (Open Condition)',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      letterSpacing: 0.5))),
                          Card(
                            elevation: 0,
                            child: Column(children: [
                              Text('rR : ' + ntr.rR.toString() + ' MΩ',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13)),
                              Divider(height: 10),
                              Text('yY : ' + ntr.yY.toString() + ' MΩ',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13)),
                              Divider(height: 10),
                              Text('bB : ' + ntr.bB.toString() + ' MΩ',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13)),
                              ntr.nN == 0.00
                                  ? Container()
                                  : Column(
                                      children: [
                                        Divider(height: 10),
                                        Text(
                                            'nN : ' + ntr.nN.toString() + ' MΩ',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 13)),
                                      ],
                                    ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Column(
                        children: [
                          const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('Pole-Earth (Close Condition)',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      letterSpacing: 0.5))),
                          Card(
                            elevation: 0,
                            child: Column(
                              children: [
                                Text('rE : ' + ntr.re.toString() + ' MΩ',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text('yE : ' + ntr.ye.toString() + ' MΩ',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text('bE : ' + ntr.be.toString() + ' MΩ',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                ntr.ne == 0.00
                                    ? Container()
                                    : Column(
                                        children: [
                                          Divider(height: 10),
                                          Text(
                                              'nE : ' +
                                                  ntr.ne.toString() +
                                                  ' MΩ',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13)),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 2,
                      color: Colors.white,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Text(
                                'Pole-Pole (Close Condition)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                    fontSize: 13),
                              ),
                              Divider(
                                height: 6,
                                color: Colors.white,
                              ),
                              Text('rY : ' + ntr.ry.toString() + ' MΩ',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13)),
                              Divider(height: 10),
                              Text('yB : ' + ntr.yb.toString() + ' MΩ',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13)),
                              Divider(height: 10),
                              Text('bR : ' + ntr.br.toString() + ' MΩ',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13)),
                            ],
                          ),
                        ),
                      ]),
                    ),
                    Card(
                      elevation: 2,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            ntr.rn == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text('rN : ' + ntr.rn.toString() + ' MΩ',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.yn == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text('yN : ' + ntr.yn.toString() + ' MΩ',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.bn == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text('bN : ' + ntr.bn.toString() + ' MΩ',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.cb == 1.00
                                ? Text('cb : ok',
                                    style: TextStyle(color: Colors.green))
                                : Text('cb : not ok',
                                    style: TextStyle(color: Colors.red)),
                            Divider(height: 10),
                            ntr.cr == 1.00
                                ? Text('cr : ok',
                                    style: TextStyle(color: Colors.green))
                                : Text('cr : not ok',
                                    style: TextStyle(color: Colors.red)),
                            Divider(height: 10),
                            ntr.cy == 1.00
                                ? Text('cy : ok',
                                    style: TextStyle(color: Colors.green))
                                : Text('cy : not ok',
                                    style: TextStyle(color: Colors.red)),
                            Divider(height: 10),
                            Text(
                                'Equipment Used : ' +
                                    ntr.EquipmentType.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13)),
                          ],
                        ),
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

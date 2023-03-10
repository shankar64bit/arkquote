// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/CT/ct_core_ir_model.dart';
import '../../providers/ct_provider/ct_core_ir_provider.dart';

class Detail_CTcoreIR_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_CTcoreIR_page(@required this.args, {Key key}) : super(key: key);

  CTcoreIRModel ctCoreIRModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((CTcoreIRProvider x) => x.getCTcoreIR_ById(args['id']));
    CTcoreIRModel ntr = watchOnly((CTcoreIRProvider x) => x.ctcoreIR_Model);

    print(ntr);
    print("ntr  CTcoreIR......");
    var mob =
        const Text('CTcore IR Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('CTcore IR Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_CTcoreIR',
                    arguments: {
                      'id': args['id'],
                      'CT_ID': args['CT_ID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((CTcoreIRProvider x) => x.deleteCTcoreIR(args['id']));
              Navigator.popAndPushNamed(context, '/detail_CTcoreIR',
                  arguments: {
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
                              child: display_CTcoreIR_details(ntr)),
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

  Container display_CTcoreIR_details(CTcoreIRModel ntr) {
    return Container(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        ]),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Text('TrNo : ' + ntr.trNo.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13)),
                            Divider(height: 10),
                            Text('serialNo : ' + ntr.serialNo.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13)),
                            Divider(height: 10),
                            Text(
                                'equipment used : ' +
                                    ntr.equipmentUsed.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13)),
                            Divider(height: 10),
                            Text(' peR : ' + ntr.peR.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13)),
                            Divider(height: 10),
                            Text(' peY : ' + ntr.peY.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13)),
                            Divider(height: 10),
                            Text(' peB : ' + ntr.peB.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13)),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            ntr.pc1R == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' pc1R : ' + ntr.pc1R.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.pc2R == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' pc2R : ' + ntr.pc2R.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.pc3R == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' pc3R : ' + ntr.pc3R.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.pc4R == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' pc4R : ' + ntr.pc4R.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.pc5R == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' pc5R : ' + ntr.pc5R.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.pc1Y == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' pc1Y : ' + ntr.pc1Y.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.pc2Y == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' pc2Y : ' + ntr.pc2Y.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.pc3Y == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' pc3Y : ' + ntr.pc3Y.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.pc4Y == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' pc4Y : ' + ntr.pc4Y.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.pc5Y == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' pc5Y : ' + ntr.pc5Y.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.pc1B == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' pc1B : ' + ntr.pc1B.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.pc2B == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' pc2B : ' + ntr.pc2B.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.pc3B == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' pc3B : ' + ntr.pc3B.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.pc4B == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' pc4B : ' + ntr.pc4B.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.pc5B == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' pc5B : ' + ntr.pc5B.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            ntr.c1eR == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c1eR : ' + ntr.c1eR.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c2eR == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c2eR : ' + ntr.c2eR.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c3eR == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c3eR : ' + ntr.c3eR.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c4eR == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c4eR : ' + ntr.c4eR.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c5eR == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c5eR : ' + ntr.c5eR.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c1eY == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c1eY : ' + ntr.c1eY.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c2eY == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c2eY : ' + ntr.c2eY.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c3eY == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c3eY : ' + ntr.c3eY.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c4eY == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c4eY : ' + ntr.c4eY.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c5eY == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c5eY : ' + ntr.c5eY.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c1eB == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c1eB : ' + ntr.c1eB.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c2eB == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c2eB : ' + ntr.c2eB.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c3eB == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c3eB : ' + ntr.c3eB.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c4eB == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c4eB : ' + ntr.c4eB.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c5eB == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c5eB : ' + ntr.c5eB.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            ntr.c1c2R == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c1c2R : ' + ntr.c1c2R.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c1c2Y == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c1c2Y : ' + ntr.c1c2Y.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c1c2B == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c1c2B : ' + ntr.c1c2B.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c2c3R == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c2c3R : ' + ntr.c2c3R.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c2c3Y == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c2c3Y : ' + ntr.c2c3Y.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c2c3B == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c2c3B : ' + ntr.c2c3B.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c3c4R == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c3c4R : ' + ntr.c3c4R.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c3c4Y == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c3c4Y : ' + ntr.c3c4Y.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c3c4B == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c3c4B : ' + ntr.c3c4B.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c4c5R == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c4c5R : ' + ntr.c4c5R.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c4c5Y == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c4c5Y : ' + ntr.c4c5Y.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.c4c5B == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' c4c5B : ' + ntr.c4c5B.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            ntr.clc1R == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' clc1R : ' + ntr.clc1R.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.clc1Y == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' clc1Y : ' + ntr.clc1Y.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.clc1B == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' clc1B : ' + ntr.clc1B.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                    ],
                                  ),
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

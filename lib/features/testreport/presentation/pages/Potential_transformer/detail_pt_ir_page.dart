import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/PT/pt_ir_model.dart';
import '../../providers/pt_provider/pt_ir_provider.dart';

class Detail_PTcoreIR_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_PTcoreIR_page(@required this.args, {Key key}) : super(key: key);

  PTcoreIRModel ptCoreIRModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((PTcoreIRProvider x) => x.getPTcoreIR_ById(args['id']));
    PTcoreIRModel ntr = watchOnly((PTcoreIRProvider x) => x.ptcoreIR_Model);

    print(ntr);
    print("ntr  PTcoreIR......");
    var mob =
        const Text('PTcore IR Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('PTcore IR Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_PTcoreIR',
                    arguments: {
                      'id': args['id'],
                      'PT_ID': args['PT_ID'],
                      'ptDatabaseID': args['ptDatabaseID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((PTcoreIRProvider x) => x.deletePTcoreIR(args['id']));
              Navigator.popAndPushNamed(context, '/detail_PT', arguments: {
                'id': args['id'],
                'PT_ID': args['PT_ID'],
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
                              child: display_PTcoreIR_details(ntr)),
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

  Container display_PTcoreIR_details(PTcoreIRModel ntr) {
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
                            Text(
                                ' Primary to Earth R-Phase : ' +
                                    ntr.peR.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13)),
                            Divider(height: 10),
                            Text(
                                ' Primary to Earth Y-Phase  : ' +
                                    ntr.peY.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13)),
                            Divider(height: 10),
                            Text(
                                ' Primary to Earth B-Phase  : ' +
                                    ntr.peB.toString(),
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
                                      Text(
                                          ' Primary to Core 1 R-Phase  : ' +
                                              ntr.pc1R.toString(),
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
                                      Text(
                                          ' Primary to core 2 R-Phase  : ' +
                                              ntr.pc2R.toString(),
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
                                      Text(
                                          ' Primary to Core 3 R-Phase  : ' +
                                              ntr.pc3R.toString(),
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
                                      Text(
                                          'Primary to core 1 Y-Phase : ' +
                                              ntr.pc1Y.toString(),
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
                                      Text(
                                          ' Primary to core 2 Y-Phase  : ' +
                                              ntr.pc2Y.toString(),
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
                                      Text(
                                          ' Primary to core 3 Y-Phase  : ' +
                                              ntr.pc3Y.toString(),
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
                                      Text(
                                          ' Primary to core 1 B-Phase  : ' +
                                              ntr.pc1B.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                    ],
                                  ),
                            ntr.pc2B == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Divider(height: 10),
                                      Text(
                                          ' Primary to core 2 B-Phase  : ' +
                                              ntr.pc2B.toString(),
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
                                      Divider(height: 10),
                                      Text(
                                          ' Primary to core 2 B-Phase  : ' +
                                              ntr.pc3B.toString(),
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
                                      Text(
                                          'Core 1 to Earth R-Phase : ' +
                                              ntr.c1eR.toString(),
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
                                      Text(
                                          'Core 2 to Earth R-Phase : ' +
                                              ntr.c2eR.toString(),
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
                                      Text(
                                          'Core 3 to Earth R-Phase : ' +
                                              ntr.c3eR.toString(),
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
                                      Text(
                                          'Core 1 to Earth Y-Phase : ' +
                                              ntr.c1eY.toString(),
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
                                      Text(
                                          'Core 2 to Earth Y-Phase : ' +
                                              ntr.c2eY.toString(),
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
                                      Text(
                                          'Core 3 to Earth Y-Phase : ' +
                                              ntr.c3eY.toString(),
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
                                      Text(
                                          'Core 1 to Earth B-Phase : ' +
                                              ntr.c1eB.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                    ],
                                  ),
                            ntr.c2eB == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Divider(height: 10),
                                      Text(
                                          'Core 2 to Earth B-Phase : ' +
                                              ntr.c2eB.toString(),
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
                                      Divider(height: 10),
                                      Text(
                                          'Core 3 to Earth B-Phase : ' +
                                              ntr.c3eB.toString(),
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
                                      Text(
                                          'Core 1 to Core 2 R-Phase : ' +
                                              ntr.c1c2R.toString(),
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
                                      Text(
                                          'Core 1 to Core 2 Y-Phase : ' +
                                              ntr.c1c2Y.toString(),
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
                                      Text(
                                          'Core 1 to Core 2 B-Phase : ' +
                                              ntr.c1c2B.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                    ],
                                  ),
                            ntr.c2c3R == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Divider(height: 10),
                                      Text(
                                          'Core 2 to Core 3 R-Phase : ' +
                                              ntr.c2c3R.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                    ],
                                  ),
                            ntr.c2c3Y == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Divider(height: 10),
                                      Text(
                                          ' Core 2 to Core 3 Y-Phase : ' +
                                              ntr.c2c3Y.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                    ],
                                  ),
                            ntr.c2c3B == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Divider(height: 10),
                                      Text(
                                          'Core 2 to Core 3 B-Phase : ' +
                                              ntr.c2c3B.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                    ntr.clc1Y == 0.00 && ntr.clc1R == 0.00 && ntr.clc1B == 0.00
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  ntr.clc1R == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                'Core 3 to Core 1 R-Phase  : ' +
                                                    ntr.clc1R.toString(),
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
                                            Text(
                                                'Core 3 to Core 1 Y-Phase : ' +
                                                    ntr.clc1Y.toString(),
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
                                            Text(
                                                'Core 3 to Core 1 B-Phase : ' +
                                                    ntr.clc1B.toString(),
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

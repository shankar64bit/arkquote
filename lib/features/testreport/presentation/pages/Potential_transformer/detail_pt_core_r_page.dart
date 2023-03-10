// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/PT/pt_core_r_model.dart';
import '../../providers/pt_provider/pt_core_r_provider.dart';

class Detail_PTcoreR_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_PTcoreR_page(@required this.args, {Key key}) : super(key: key);

  PTcoreRModel ptCoreRModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((PTcoreRProvider x) => x.getPTcoreR_ById(args['id']));
    PTcoreRModel ntr = watchOnly((PTcoreRProvider x) => x.ptcoreR_Model);

    print(ntr);
    print("ntr  PTcoreR......");
    var mob =
        const Text('PTcore R Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('PTcore R Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_PTcoreR', arguments: {
                  'id': args['id'],
                  'PT_ID': args['PT_ID'],
                  'ptDatabaseID': args['ptDatabaseID'],
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((PTcoreRProvider x) => x.deletePTcoreR(args['id']));
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
                              child: display_PTcoreR_details(ntr)),
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

  Container display_PTcoreR_details(PTcoreRModel ntr) {
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
                            ntr.R_1a_1n_1000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'R_1a_1n_1000 : ' +
                                              ntr.R_1a_1n_1000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.R_2a_2n_1000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'R_2a_2n_1000  : ' +
                                              ntr.R_2a_2n_1000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.R_3a_3n_1000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'R_3a_3n_1000  : ' +
                                              ntr.R_3a_3n_1000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.Y_1a_1n_1000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'Y_1a_1n_1000  : ' +
                                              ntr.Y_1a_1n_1000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.Y_2a_2n_1000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'Y_2a_2n_1000  : ' +
                                              ntr.Y_2a_2n_1000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.Y_3a_3n_1000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'Y_3a_3n_1000  : ' +
                                              ntr.Y_3a_3n_1000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.B_1a_1n_1000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'B_1a_1n_1000  : ' +
                                              ntr.B_1a_1n_1000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.B_2a_2n_1000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'B_2a_2n_1000  : ' +
                                              ntr.B_2a_2n_1000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.B_3a_3n_1000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'B_3a_3n_1000  : ' +
                                              ntr.B_3a_3n_1000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.R_1a_1n_2000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'R_1a_1n_2000  : ' +
                                              ntr.R_1a_1n_2000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.R_2a_2n_2000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'R_2a_2n_2000  : ' +
                                              ntr.R_2a_2n_2000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.R_3a_3n_2000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'R_3a_3n_2000  : ' +
                                              ntr.R_3a_3n_2000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.Y_1a_1n_2000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'Y_1a_1n_2000  : ' +
                                              ntr.Y_1a_1n_2000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.Y_2a_2n_2000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'Y_2a_2n_2000  : ' +
                                              ntr.Y_2a_2n_2000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.Y_3a_3n_2000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'Y_3a_3n_2000  : ' +
                                              ntr.Y_3a_3n_2000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.B_1a_1n_2000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'B_1a_1n_2000 : ' +
                                              ntr.B_1a_1n_2000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                    ],
                                  ),
                            ntr.B_2a_2n_2000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Divider(height: 10),
                                      Text(
                                          'B_2a_2n_2000  : ' +
                                              ntr.B_2a_2n_2000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                    ],
                                  ),
                            ntr.B_3a_3n_2000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Divider(height: 10),
                                      Text(
                                          'B_3a_3n_2000  : ' +
                                              ntr.B_3a_3n_2000.toString(),
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
                            ntr.R_1a_1n_3000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'R_1a_1n_3000  : ' +
                                              ntr.R_1a_1n_3000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.R_2a_2n_3000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'R_2a_2n_3000  : ' +
                                              ntr.R_2a_2n_3000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.R_3a_3n_3000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'R_3a_3n_3000  : ' +
                                              ntr.R_3a_3n_3000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.Y_1a_1n_3000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'Y_1a_1n_3000  : ' +
                                              ntr.Y_1a_1n_3000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.Y_2a_2n_3000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'Y_2a_2n_3000  : ' +
                                              ntr.Y_2a_2n_3000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.Y_3a_3n_3000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'Y_3a_3n_3000  : ' +
                                              ntr.Y_3a_3n_3000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.B_1a_1n_3000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'B_1a_1n_3000  : ' +
                                              ntr.B_1a_1n_3000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.B_2a_2n_3000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'B_2a_2n_3000  : ' +
                                              ntr.B_2a_2n_3000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.B_3a_3n_3000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'B_3a_3n_3000  : ' +
                                              ntr.B_3a_3n_3000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.R_1a_1n_4000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'R_1a_1n_4000  : ' +
                                              ntr.R_1a_1n_4000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.R_2a_2n_4000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'R_2a_2n_4000  : ' +
                                              ntr.R_2a_2n_4000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.R_3a_3n_4000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'R_3a_3n_4000  : ' +
                                              ntr.R_3a_3n_4000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.Y_1a_1n_4000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'Y_1a_1n_4000 : ' +
                                              ntr.Y_1a_1n_4000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.Y_2a_2n_4000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'Y_2a_2n_4000  : ' +
                                              ntr.Y_2a_2n_4000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.Y_3a_3n_4000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'Y_3a_3n_4000  : ' +
                                              ntr.Y_3a_3n_4000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.B_1a_1n_4000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          'B_1a_1n_4000  : ' +
                                              ntr.B_1a_1n_4000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                    ],
                                  ),
                            ntr.B_2a_2n_4000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Divider(height: 10),
                                      Text(
                                          'B_2a_2n_4000  : ' +
                                              ntr.B_2a_2n_4000.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                    ],
                                  ),
                            ntr.B_3a_3n_4000 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Divider(height: 10),
                                      Text(
                                          'B_3a_3n_4000  : ' +
                                              ntr.B_3a_3n_4000.toString(),
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

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/PT/pt_core_wr_model.dart';
import '../../providers/pt_provider/pt_core_wr_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_wr_radio_button_page.dart';

class Detail_PTcoreWR_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_PTcoreWR_page(@required this.args, {Key key}) : super(key: key);

  PTcoreWRModel ptCoreWRModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((PTcoreWRProvider x) => x.getPTcoreWR_ById(args['id']));
    PTcoreWRModel ntr = watchOnly((PTcoreWRProvider x) => x.ptcoreWR_Model);

    print(ntr);
    print("ntr  PTcoreWR......");
    var mob = const Text('PT WR Test Details', style: TextStyle(fontSize: 15));
    var desk = const Text('PT WR Test Details', style: TextStyle(fontSize: 20));

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
                Radio_R_1S1_1S2().get_Radio_R_1S1_1S2_default_value();
                Radio_R_2S1_2S2().get_Radio_R_2S1_2S2_default_value();
                Radio_R_3S1_3S2().get_Radio_R_3S1_3S2_default_value();

                Radio_Y_1S1_1S2().get_Radio_Y_1S1_1S2_default_value();
                Radio_Y_2S1_2S2().get_Radio_Y_2S1_2S2_default_value();
                Radio_Y_3S1_3S2().get_Radio_Y_3S1_3S2_default_value();

                Radio_B_1S1_1S2().get_Radio_B_1S1_1S2_default_value();
                Radio_B_2S1_2S2().get_Radio_B_2S1_2S2_default_value();
                Radio_B_3S1_3S2().get_Radio_B_3S1_3S2_default_value();

                Navigator.popAndPushNamed(context, '/edit_PTcoreWR',
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
              getX((PTcoreWRProvider x) => x.deletePTcoreWR(args['id']));
              Navigator.popAndPushNamed(context, '/detail_PT', arguments: {
                'id': args['PT_ID'],
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
                        children: [
                          ConstrainedBox(
                              constraints:
                                  BoxConstraints(minHeight: 0, maxWidth: 700),
                              child: display_PTcoreWR_details(ntr)),
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

  Container display_PTcoreWR_details(PTcoreWRModel ntr) {
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
                    Column(
                      children: [
                        Card(
                          elevation: 2,
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                ntr.R_1a_1n == 0.00
                                    ? Container()
                                    : Column(
                                        children: [
                                          Text(
                                              'R-Phase 1a_1n : ' +
                                                  ntr.R_1a_1n.toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13)),
                                        ],
                                      ),
                                ntr.R_2a_2n == 0.00
                                    ? Container()
                                    : Column(
                                        children: [
                                          Divider(height: 10),
                                          Text(
                                              'R-Phase 2a_2n : ' +
                                                  ntr.R_2a_2n.toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13)),
                                        ],
                                      ),
                                ntr.R_3a_3n == 0.00
                                    ? Container()
                                    : Column(
                                        children: [
                                          Divider(height: 10),
                                          Text(
                                              'R-Phase 3a_3n : ' +
                                                  ntr.R_3a_3n.toString(),
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
                                ntr.Y_1a_1n == 0.00
                                    ? Container()
                                    : Column(
                                        children: [
                                          Text(
                                              'Y-Phase 1a_1n : ' +
                                                  ntr.Y_1a_1n.toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13)),
                                        ],
                                      ),
                                ntr.Y_2a_2n == 0.00
                                    ? Container()
                                    : Column(
                                        children: [
                                          Divider(height: 10),
                                          Text(
                                              'Y-Phase 2a_2n : ' +
                                                  ntr.Y_2a_2n.toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13)),
                                        ],
                                      ),
                                ntr.Y_3a_3n == 0.00
                                    ? Container()
                                    : Column(
                                        children: [
                                          Divider(height: 10),
                                          Text(
                                              'Y-Phase 3a_3n : ' +
                                                  ntr.Y_3a_3n.toString(),
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
                                ntr.B_1a_1n == 0.00
                                    ? Container()
                                    : Column(
                                        children: [
                                          Text(
                                              'B-Phase 1a_1n : ' +
                                                  ntr.B_1a_1n.toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13)),
                                        ],
                                      ),
                                ntr.B_2a_2n == 0.00
                                    ? Container()
                                    : Column(
                                        children: [
                                          Divider(height: 10),
                                          Text(
                                              'B-Phase 2a_2n : ' +
                                                  ntr.B_2a_2n.toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13)),
                                        ],
                                      ),
                                ntr.B_3a_3n == 0.00
                                    ? Container()
                                    : Column(
                                        children: [
                                          Divider(height: 10),
                                          Text(
                                              'B-Phase 3a_3n : ' +
                                                  ntr.B_3a_3n.toString(),
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
                    )
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

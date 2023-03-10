import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/powt/powt_mc_model.dart';
import '../../providers/powt_provider/powt_mc_provider.dart';

class Detail_Powt_mc_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_Powt_mc_page(@required this.args, {Key key}) : super(key: key);

  Powt_mc_Model powt_mcModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((Powt_mc_Provider x) => x.getPowt_mcById(args['id']));
    Powt_mc_Model ntr = watchOnly((Powt_mc_Provider x) => x.powt_mc_Model);

    print(ntr);
    print("ntr  Powt_mc......");
    var mob =
        const Text('Powt_mc Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Powt_mc Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_Powt_mc', arguments: {
                  'id': args['id'],
                  'POWT_ID': args['POWT_ID'],
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((Powt_mc_Provider x) => x.deletePowt_mc(args['id']));
              Navigator.popAndPushNamed(context, '/detail_Powt_mc', arguments: {
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
                        children: [
                          ConstrainedBox(
                              constraints:
                                  BoxConstraints(minHeight: 0, maxWidth: 700),
                              child: display_Powt_mc_details(ntr)),
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

  Container display_Powt_mc_details(Powt_mc_Model ntr) {
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
                        child: Column(children: [
                          Text('Trno : ' + ntr.trNo.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('serialNo : ' + ntr.serialNo.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          ntr.hv_1u_1n != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'Applied Voltage HV Side 1u_1n : ' +
                                            ntr.hv_1u_1n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.hv_1v_1n != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'Applied Voltage HV Side 1v_1n : ' +
                                            ntr.hv_1v_1n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.hv_1w_1n != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'Applied Voltage HV Side 1w_1n : ' +
                                            ntr.hv_1w_1n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.hv_1u != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'Measured Magnetizing Current HV side 1U : ' +
                                            ntr.hv_1u.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.hv_1v != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'Measured Magnetizing Current HV side 1V : ' +
                                            ntr.hv_1v.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.hv_1w != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'Measured Magnetizing Current HV side 1W : ' +
                                            ntr.hv_1w.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                  ],
                                )
                              : Container(),
                          ntr.hv_1n != 0.00
                              ? Column(
                                  children: [
                                    Divider(height: 10),
                                    Text(
                                        'Measured Magnetizing Current HV side 1N : ' +
                                            ntr.hv_1n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                  ],
                                )
                              : Container(),
                          ntr.hv_1n != 0.00
                              ? Column(
                                  children: [
                                    Divider(height: 10),
                                    Text(
                                        'Tap Position : ' +
                                            ntr.tapPosition.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                  ],
                                )
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

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/AT/AT_r_model.dart';
import '../../providers/at_provider/at_r_provider.dart';

class Detail_AT_R_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_AT_R_page(@required this.args, {Key key}) : super(key: key);

  AT_R_Model at_RModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((AT_R_Provider x) => x.getATrById(args['id']));
    AT_R_Model ntr = watchOnly((AT_R_Provider x) => x.at_R_Model);

    print(ntr);
    print("ntr  AT_R......");
    var mob = const Text('AT_R Test Details', style: TextStyle(fontSize: 15));
    var desk = const Text('AT_R Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_AT_R', arguments: {
                  'id': args['id'],
                  'AT_ID': args['AT_ID'],
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((AT_R_Provider x) => x.deleteATr(args['id']));
              Navigator.popAndPushNamed(context, '/detail_AT_R', arguments: {
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
                              child: display_AT_R_details(ntr)),
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

  Container display_AT_R_details(AT_R_Model ntr) {
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
                          Text('DBID : ' + ntr.databaseID.toString(),
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
                          ntr.hv_1u_1v != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'hv_1u_1v : ' + ntr.hv_1u_1v.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.hv_1v_1w != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'hv_1v_1w : ' + ntr.hv_1v_1w.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.hv_1w_1u != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'hv_1w_1u : ' + ntr.hv_1w_1u.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.hv_1u_1n != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'hv_1u_1n : ' + ntr.hv_1u_1n.toString(),
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
                                        'hv_1v_1n : ' + ntr.hv_1v_1n.toString(),
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
                                        'hv_1w_1n : ' + ntr.hv_1w_1n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.lv_2u_2v != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'lv_2u_2v : ' + ntr.lv_2u_2v.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.lv_2v_2w != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'lv_2v_2w : ' + ntr.lv_2v_2w.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.lv_2w_2u != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'lv_2w_2u : ' + ntr.lv_2w_2u.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.lv_2u_2n != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'lv_2u_2n : ' + ntr.lv_2u_2n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.lv_2v_2n != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'lv_2v_2n : ' + ntr.lv_2v_2n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.lv_2w_2n != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'lv_2w_2n : ' + ntr.lv_2w_2n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          Text('tapPosition : ' + ntr.tapPosition.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'equipmentUsed : ' + ntr.equipmentUsed.toString(),
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

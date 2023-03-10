import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/powt_3_winding/powt3win_mcLv_model.dart';
import '../../providers/powt_3_winding/powt3win_mcLv_provider.dart';

class Detail_Powt3win_mcLv_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_Powt3win_mcLv_page(@required this.args, {Key key}) : super(key: key);

  Powt3win_mcLv_Model powt3win_mcLvModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((Powt3win_mcLv_Provider x) => x.getPowt3win_mcLvById(args['id']));
    Powt3win_mcLv_Model ntr =
        watchOnly((Powt3win_mcLv_Provider x) => x.powt3win_mcLv_Model);

    print(ntr);
    print("ntr  Powt3win_mcLv......");
    var mob = const Text('Powt3win MC-LV Side Test Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Powt3win MC-LV Side Test Details',
        style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_POWT3WIN_mcLv',
                    arguments: {
                      'id': args['id'],
                      'POWT3WIN_ID': args['POWT3WIN_ID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((Powt3win_mcLv_Provider x) =>
                  x.deletePowt3win_mcLv(args['id']));
              Navigator.popAndPushNamed(context, '/detail_POWT3WIN_mcLv',
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
                        children: [
                          ConstrainedBox(
                              constraints:
                                  BoxConstraints(minHeight: 0, maxWidth: 700),
                              child: display_Powt3win_mcLv_details(ntr)),
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

  Container display_Powt3win_mcLv_details(Powt3win_mcLv_Model ntr) {
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
                          ntr.lv_u_vn != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'LV side UN/UV : ' +
                                            ntr.lv_u_vn.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.lv_v_wn != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'LV side VN/VW : ' +
                                            ntr.lv_v_wn.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.lv_w_un != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'LV side WN/WU : ' +
                                            ntr.lv_w_un.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.lv_u != 0.00
                              ? Column(
                                  children: [
                                    Text('LV side U : ' + ntr.lv_u.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.lv_v != 0.00
                              ? Column(
                                  children: [
                                    Text('LV side V : ' + ntr.lv_v.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.lv_w != 0.00
                              ? Column(
                                  children: [
                                    Text('LV side W : ' + ntr.lv_w.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.lv_n != 0.00
                              ? Column(
                                  children: [
                                    Text('LV side N : ' + ntr.lv_n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
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

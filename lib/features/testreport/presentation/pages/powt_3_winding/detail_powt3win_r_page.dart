import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/powt_3_winding/powt3win_r_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3winding_model.dart';
import '../../providers/powt_3_winding/powt3win_r_provider.dart';
import '../../providers/powt_3_winding/powt_3_winding_provider.dart';

class Detail_Powt3win_R_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_Powt3win_R_page(@required this.args, {Key key}) : super(key: key);

  Powt3win_R_Model powt3win_RModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((Powt3win_R_Provider x) => x.getPowt3winrById(args['id']));
    Powt3win_R_Model ntr =
        watchOnly((Powt3win_R_Provider x) => x.powt3win_R_Model);

    print(ntr);
    print("ntr  Powt3win_R......");
    var mob = const Text('Powt3win RatioTest Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Powt3win Ratio Test Details',
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
                Navigator.popAndPushNamed(context, '/edit_POWT3WIN_r',
                    arguments: {
                      'id': args['id'],
                      'POWT3WIN_ID': args['POWT3WIN_ID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((Powt3win_R_Provider x) => x.deletePowt3winr(args['id']));
              Navigator.popAndPushNamed(context, '/detail_POWT3WIN_r',
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
                              child: display_Powt3win_R_details(ntr)),
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

  Container display_Powt3win_R_details(Powt3win_R_Model ntr) {
    String displayText;
    final Powt3WindingModel ntr1 =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);
    if (ntr1.vectorGroup.toLowerCase() == 'ynyn0d11') {
      displayText = 'Tertiary Side';
    } else {
      displayText = 'IV Side';
    }
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
                          ntr.hv_1u_1vn != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'HV Side UV/UN : ' +
                                            ntr.hv_1u_1vn.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.hv_1v_1wn != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'HV Side VW/VN : ' +
                                            ntr.hv_1v_1wn.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.hv_1w_1un != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'HV Side WU/WN : ' +
                                            ntr.hv_1w_1un.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.lv_uvn != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'LV Side UV/UN : ' +
                                            ntr.lv_uvn.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.lv_vwn != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'LV Side VW/VN : ' +
                                            ntr.lv_vwn.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.lv_wun != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'LV Side WU/WN : ' +
                                            ntr.lv_wun.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.ivt_uvn != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        displayText +
                                            ' UV/UN : ' +
                                            ntr.ivt_uvn.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.ivt_vwn != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        displayText +
                                            ' VW/VN : ' +
                                            ntr.ivt_vwn.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.ivt_wun != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        displayText +
                                            ' WU/WN : ' +
                                            ntr.ivt_wun.toString(),
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

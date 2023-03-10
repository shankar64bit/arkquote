import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/powt_3_winding/powt3win_mcIvT_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3winding_model.dart';
import '../../providers/powt_3_winding/powt3win_mcIvT_provider.dart';
import '../../providers/powt_3_winding/powt_3_winding_provider.dart';

class Detail_Powt3winmcIvTpage extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_Powt3winmcIvTpage(@required this.args, {Key key}) : super(key: key);

  Powt3winmcIvTModel powt3winmcIvTModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((Powt3winmcIvTProvider x) => x.getPowt3winmcIvTById(args['id']));
    Powt3winmcIvTModel ntr =
        watchOnly((Powt3winmcIvTProvider x) => x.powt3winmcIvTModel);

    print(ntr);
    print("ntr  Powt3win MC IV /Tertiary Side.....");
    var mob = const Text('Powt3winMC IV /Tertiary Side Test Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Powt3winMC IV /Tertiary Side Test Details',
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
                Navigator.popAndPushNamed(context, '/edit_POWT3WIN_mcIvT',
                    arguments: {
                      'id': args['id'],
                      'POWT3WIN_ID': args['POWT3WIN_ID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((Powt3winmcIvTProvider x) =>
                  x.deletePowt3winmcIvT(args['id']));
              Navigator.popAndPushNamed(context, '/detail_POWT3WIN_mcIvT',
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
                              child: display_Powt3winmcIvTdetails(ntr)),
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

  Container display_Powt3winmcIvTdetails(Powt3winmcIvTModel ntr) {
    String displayText;
    final Powt3WindingModel ntr1 =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);
    // ignore: unrelated_type_equality_checks
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
                          ntr.ivt_u_vn != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        displayText +
                                            ' UV / VN : ' +
                                            ntr.ivt_u_vn.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.ivt_v_wn != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        displayText +
                                            ' VW / VN : ' +
                                            ntr.ivt_v_wn.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.ivt_w_un != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        displayText +
                                            ' WU / WN : ' +
                                            ntr.ivt_w_un.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.ivt_u != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        displayText +
                                            ' U : ' +
                                            ntr.ivt_u.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.ivt_v != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        displayText +
                                            ' V: ' +
                                            ntr.ivt_v.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.ivt_w != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        displayText +
                                            ' W : ' +
                                            ntr.ivt_w.toString(),
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

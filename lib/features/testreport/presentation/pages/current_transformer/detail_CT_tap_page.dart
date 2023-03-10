import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/CT/ct_tap_model.dart';
import '../../providers/ct_provider/ct_tap_provider.dart';

class Detail_CT_tap_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_CT_tap_page(@required this.args, {Key key}) : super(key: key);
  CT_tap_Model ctTapModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((CT_tap_Provider x) => x.getCT_tap_ById(args['id']));
    CT_tap_Model ntr = watchOnly((CT_tap_Provider x) => x.ct_tap_Model);

    print(ntr);
    print("ntr  CTtap......");
    var mob = const Text('CTtap Test Details', style: TextStyle(fontSize: 15));
    var desk = const Text('CTtap Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_CTcoretap',
                    arguments: {
                      'id': args['id'],
                      'CT_ID': args['CT_ID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((CT_tap_Provider x) => x.deleteCT_tap(args['id']));
              Navigator.popAndPushNamed(context, '/detail_CT_tap', arguments: {
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
                              child: display_CT_tap_details(ntr)),
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

  Container display_CT_tap_details(CT_tap_Model ntr) {
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
                          Text('tapName : ' + ntr.tapName.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('ratio : ' + ntr.ratio.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('coreRef : ' + ntr.coreRef.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          ntr.kneePointVoltage != 0
                              ? Column(
                                  children: [
                                    Divider(height: 10),
                                    Text(
                                        'kneePoitVolt : ' +
                                            ntr.kneePointVoltage.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                  ],
                                )
                              : Container(),
                          ntr.leakageCurrent != 0
                              ? Column(
                                  children: [
                                    Divider(height: 10),
                                    Text(
                                        'leakageCurrent : ' +
                                            ntr.leakageCurrent.toString(),
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

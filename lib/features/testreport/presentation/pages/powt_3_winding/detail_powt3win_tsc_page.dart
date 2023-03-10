import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/powt_3_winding/powt3win_tsc_model.dart';
import '../../providers/powt_3_winding/powt3win_tsc_provider.dart';

class Detail_Powt3wintsc_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_Powt3wintsc_page(@required this.args, {Key key}) : super(key: key);

  Powt3wintscModel powt3wintscModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((Powt3wintscProvider x) => x.getPowt3wintscById(args['id']));
    Powt3wintscModel ntr =
        watchOnly((Powt3wintscProvider x) => x.powt3wintsc_Model);

    print(ntr);
    print("ntr  Powt3winTsc......");
    var mob =
        const Text('Powt3winTsc Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Powt3winTsc Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/Edit_POWT3WIN_tsc',
                    arguments: {
                      'id': args['id'],
                      'POWT3WIN_ID': args['POWT3WIN_ID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((Powt3wintscProvider x) => x.deletePowt3wintsc(args['id']));
              Navigator.popAndPushNamed(context, '/detail_Powt3wintsc',
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
                              child: display_Powt3wintsc_details(ntr)),
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

  Container display_Powt3wintsc_details(Powt3wintscModel ntr) {
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
                          Text('HV Side voltage : ' + ntr.hv_voltage.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'HV Side current_Ofaf : ' +
                                  ntr.hv_current_Ofaf.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'HV Side current_Onaf : ' +
                                  ntr.hv_current_Onaf.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'HV Side current_Onan : ' +
                                  ntr.hv_current_Onan.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
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

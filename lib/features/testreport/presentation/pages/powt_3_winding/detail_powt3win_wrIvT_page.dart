import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/powt_3_winding/powt3win_wrIvT_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3winding_model.dart';
import '../../providers/powt_3_winding/powt3win_wrIvT_provider.dart';
import '../../providers/powt_3_winding/powt_3_winding_provider.dart';

class Detail_Powt3winwrIvT_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_Powt3winwrIvT_page(@required this.args, {Key key}) : super(key: key);

  Powt3winwrIvTModel powt3winwrIvTModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((Powt3winwrIvTProvider x) => x.getPowt3winwrIvTById(args['id']));
    Powt3winwrIvTModel ntr =
        watchOnly((Powt3winwrIvTProvider x) => x.powt3winwrIvT_Model);

    print(ntr);
    print("ntr  Powt3win WR Iv/Tertiary......");
    var mob = const Text('Powt3win WR Iv/Tertiary Test Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Powt3win WR Iv/Tertiary Test Details',
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
                Navigator.popAndPushNamed(context, '/edit_POWT3WIN_wrIvT',
                    arguments: {
                      'id': args['id'],
                      'powt3winDatabaseID': args['powt3winDatabaseID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((Powt3winwrIvTProvider x) =>
                  x.deletePowt3winwrIvT(args['id']));
              Navigator.popAndPushNamed(context, '/detail_POWT3WIN_wrIvT',
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
                              child: display_Powt3winwrIvT_details(ntr)),
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

  Container display_Powt3winwrIvT_details(Powt3winwrIvTModel ntr) {
    String displayText = 'IV Measured Resistance Value (mΩ)- ';
    final Powt3WindingModel ntr1 =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);
    if (ntr1.vectorGroup.toLowerCase() == 'ynyn0d11')
      displayText = 'Tertairy Measured Resistance Value (mΩ)- ';
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
                          Text(
                              displayText +
                                  'UV/UN : ' +
                                  ntr.ivt_r_uvn.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              displayText +
                                  'VN/VW : ' +
                                  ntr.ivt_r_vwn.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              displayText +
                                  'WN/WU : ' +
                                  ntr.ivt_r_wun.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('tapPosition : ' + ntr.tapPosition.toString(),
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

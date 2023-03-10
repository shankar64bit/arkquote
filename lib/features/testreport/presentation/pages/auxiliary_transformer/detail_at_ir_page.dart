import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/AT/AT_ir_model.dart';
import '../../providers/at_provider/at_ir_provider.dart';

class Detail_ATcoreIR_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_ATcoreIR_page(@required this.args, {Key key}) : super(key: key);

  ATcoreIRModel atCoreIRModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((ATcoreIRProvider x) => x.getATcoreIR_ById(args['id']));
    ATcoreIRModel ntr = watchOnly((ATcoreIRProvider x) => x.atcoreIR_Model);

    print(ntr);
    print("ntr  ATcoreIR......");
    var mob =
        const Text('ATcore IR Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('ATcore IR Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_ATcoreIR',
                    arguments: {
                      'id': args['id'],
                      'AT_ID': args['AT_ID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((ATcoreIRProvider x) => x.deleteATcoreIR(args['id']));
              Navigator.popAndPushNamed(context, '/detail_ATcoreIR',
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
                              child: display_ATcoreIR_details(ntr)),
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

  Container display_ATcoreIR_details(ATcoreIRModel ntr) {
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
                            ntr.hvE_1min == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          ' hvE_1min : ' +
                                              ntr.hvE_1min.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.hvE_10min == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          ' hvE_10min : ' +
                                              ntr.hvE_10min.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.hvE_PImin == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          ' hvE_PImin : ' +
                                              ntr.hvE_PImin.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.hvLV_1min == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          ' hvLV_1min : ' +
                                              ntr.hvLV_1min.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.hvLV_10min == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          ' hvLV_10min : ' +
                                              ntr.hvLV_10min.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.hvLV_PImin == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          ' hvLV_PImin : ' +
                                              ntr.hvLV_PImin.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.lvE_1min == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          ' lvE_1min : ' +
                                              ntr.lvE_1min.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.lvE_10min == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          ' lvE_10min : ' +
                                              ntr.lvE_10min.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.lvE_PImin == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(
                                          ' lvE_PImin : ' +
                                              ntr.lvE_PImin.toString(),
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

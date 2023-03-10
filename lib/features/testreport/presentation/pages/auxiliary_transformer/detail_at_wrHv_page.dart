import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/AT/AT_wrHv_model.dart';
import '../../providers/at_provider/at_wrHv_provider.dart';

class Detail_ATwrHv_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_ATwrHv_page(@required this.args, {Key key}) : super(key: key);

  ATwrHv_Model atwrHvModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((ATwrHv_Provider x) => x.getATwrHvById(args['id']));
    ATwrHv_Model ntr = watchOnly((ATwrHv_Provider x) => x.atwrHv_Model);

    print(ntr);
    print("ntr  ATwrHv......");
    var mob = const Text('ATwrHv Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('ATwrHv Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_ATwrHv', arguments: {
                  'id': args['id'],
                  'AT_ID': args['AT_ID'],
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((ATwrHv_Provider x) => x.deleteATwrHv(args['id']));
              Navigator.popAndPushNamed(context, '/detail_ATwrHv', arguments: {
                'id': args['id'],
                'AT_ID': args['AT_ID'],
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
                              child: display_ATwrHv_details(ntr)),
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

  Container display_ATwrHv_details(ATwrHv_Model ntr) {
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
                          Text('hv_1u_1n : ' + ntr.hv_1u_1n.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('hv_1v_1n : ' + ntr.hv_1v_1n.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('hv_1w_1n : ' + ntr.hv_1w_1n.toString(),
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

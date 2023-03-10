import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/powt/powt_wrHv_model.dart';
import '../../providers/powt_provider/powt_wrHv_provider.dart';

class Detail_PowtwrHv_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_PowtwrHv_page(@required this.args, {Key key}) : super(key: key);

  PowtwrHvModel powtwrHvModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((PowtwrHvProvider x) => x.getPowtwrHvById(args['id']));
    PowtwrHvModel ntr = watchOnly((PowtwrHvProvider x) => x.powtwrHv_Model);

    print(ntr);
    print("ntr  PowtwrHv......");
    var mob = const Text('Powt Winding Resistance HV Winding Test Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Powt Winding Resistance HV Winding Test Details',
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
                Navigator.popAndPushNamed(context, '/edit_PowtwrHv',
                    arguments: {
                      'id': args['id'],
                      'POWT_ID': args['POWT_ID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((PowtwrHvProvider x) => x.deletePowtwrHv(args['id']));
              Navigator.popAndPushNamed(context, '/detail_PowtwrHv',
                  arguments: {
                    'id': args['id'],
                    'POWT_ID': args['POWT_ID'],
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
                              child: display_PowtwrHv_details(ntr)),
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

  Container display_PowtwrHv_details(PowtwrHvModel ntr) {
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
                              'HV Winding Measured Resistance Value (mΩ) 1U1V/1U1N : ' +
                                  ntr.hv_r_1u_1vn.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'HV Winding Measured Resistance Value (mΩ) 1V1W/1W1N : ' +
                                  ntr.hv_r_1v_1wn.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'HV Winding Measured Resistance Value (mΩ) 1W1U/1W1N : ' +
                                  ntr.hv_r_1w_1un.toString(),
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

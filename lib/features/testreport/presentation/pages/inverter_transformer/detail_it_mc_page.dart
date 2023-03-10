// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/IT/it_mc_model.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../providers/it_provider/it_mc_provider.dart';
import '../../providers/it_provider/it_provider.dart';

class DetailItMcPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int IT_ID;

  DetailItMcPage(this.args, {Key key}) : super(key: key);

  ItMcTestModel itMcTestModel, ntr;

  @override
  Widget build(BuildContext context) {
    final ItModel ntr1 = watchOnly((ItProvider x) => x.itModel);
    getX((ItMcProvider x) => x.getItMcByID(args['id']));
    ItMcTestModel ntr = watchOnly((ItMcProvider x) => x.itMcModel);

    var mob = const Text('IT-MC Test Details', style: TextStyle(fontSize: 15));
    var desk = const Text('IT-MC Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_IT_MC', arguments: {
                  'id': args['id'],
                  'TrNo': ntr.trNo,
                  'itDatabaseID': args['itDatabaseID'],
                  'SerialNo': ntr.serialNo,
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((ItMcProvider x) => x.deleteItMc(args['id']));
              Navigator.popAndPushNamed(context, '/detail_IT', arguments: {
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
                              constraints: const BoxConstraints(
                                  minHeight: 0, maxWidth: 700),
                              child: display_IT_Mc_details(ntr, ntr1)),
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

  Container display_IT_Mc_details(ItMcTestModel ntr, ItModel ntr1) {
    return Container(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [
                          Text('ID : ' + ntr.databaseID.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                          const Divider(height: 10),
                          Text('TrNo : ${ntr.trNo}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                          const Divider(height: 10),
                          Text('SerialNo : ${ntr.serialNo}',
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
                          Text('Applied Voltage HV Side (V)-U-V : ${ntr.uv}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('Applied Voltage HV Side (V)-V-W : ${ntr.vw}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('Applied Voltage HV Side (V)-W-U : ${ntr.wu}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'Measured Magnetizing Current HV Side (mA)-U : ${ntr.u}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'Measured Magnetizing Current HV Side (mA)-V: ${ntr.v}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'Measured Magnetizing Current HV Side (mA)-W: ${ntr.w}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                        ]),
                      ),
                    ),
                    checkVectoreGroup(ntr1)
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(children: [
                                Text(
                                    'Applied Voltage HV Side (V)-U-V : ${ntr.uv}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                const Divider(height: 10),
                                Text(
                                    'Applied Voltage HV Side (V)-V-W : ${ntr.vw}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                const Divider(height: 10),
                                Text(
                                    'Applied Voltage HV Side (V)-W-U : ${ntr.wu}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                const Divider(height: 10),
                                Text(
                                    'Measured Magnetizing Current HV Side (mA)-U : ${ntr.u}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                const Divider(height: 10),
                                Text(
                                    'Measured Magnetizing Current HV Side (mA)-V: ${ntr.v}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                const Divider(height: 10),
                                Text(
                                    'Measured Magnetizing Current HV Side (mA)-W: ${ntr.w}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                              ]),
                            )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool checkVectoreGroup(ItModel ntr) {
    return ntr.vectorGroup.toLowerCase() == 'dd0/dd0' ||
        ntr.vectorGroup.toLowerCase() == 'dd6/dd6' ||
        ntr.vectorGroup.toLowerCase() == 'yd1d1' ||
        ntr.vectorGroup.toLowerCase() == 'yd11d11';
  }
}

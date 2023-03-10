import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_3_winding/powt_3_winding_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/powt_3_winding/powt3win_ir_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3winding_model.dart';
import '../../providers/powt_3_winding/powt3win_ir_provider.dart';

class Detail_Powt3winIR_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_Powt3winIR_page(@required this.args, {Key key}) : super(key: key);

  Powt3winIRModel powt3winIRModel, ntr;

  @override
  Widget build(BuildContext context) {
    final Powt3WindingModel ntr1 =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);

    getX((Powt3winIRProvider x) => x.getPowt3winIRById(args['id']));
    Powt3winIRModel ntr =
        watchOnly((Powt3winIRProvider x) => x.powt3winIR_Model);

    print(ntr);
    print("ntr  Powt3winIR......");
    var mob =
        const Text('Powt3win IR Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Powt3win IR Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_Powt3winIR',
                    arguments: {
                      'id': args['id'],
                      'TrNo': ntr.trNo,
                      'POWT3WIN_ID': args['POWT3WIN_ID'],
                      'Serial_No': ntr1.serialNo,
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((Powt3winIRProvider x) => x.deletePowt3winIR(args['id']));
              Navigator.popAndPushNamed(context, '/detail_POWT3WIN',
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
                        // crossAxisAlignment: CrossAxisAlignment.end, display_EquipmentValue_details
                        children: [
                          ConstrainedBox(
                              constraints:
                                  BoxConstraints(minHeight: 0, maxWidth: 700),
                              child: display_Powt3winIR_details(ntr, ntr1)),
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

  Container display_Powt3winIR_details(
      Powt3winIRModel ntr, Powt3WindingModel ntr1) {
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
                          Text('ID : ${args['id']}',
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
                            Text('TrNo : ${ntr.trNo}',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13)),
                            Divider(height: 10),
                            Text('serialNo : ${ntr.serialNo}',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13)),
                            Divider(height: 10),
                            Text('equipment used : ${ntr.equipmentUsed}',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13)),
                          ],
                        ),
                      ),
                    ),
                    ntr1.vectorGroup == 'YNyn0d11'
                        ? Card(
                            elevation: 2,
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  ntr.hvE_60 == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                'HV Earth 60 Sec : ${ntr.hvE_60}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13)),
                                            Divider(height: 10),
                                          ],
                                        ),
                                  ntr.hvE_600 == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                'HV Earth 600 Sec : ${ntr.hvE_600}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13)),
                                            Divider(height: 10),
                                          ],
                                        ),
                                  ntr.hvLv_60 == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                'HV-LV 60 Sec : ${ntr.hvLv_60}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13)),
                                            Divider(height: 10),
                                          ],
                                        ),
                                  ntr.hvLv_600 == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                'HV-LV 600 Sec : ${ntr.hvLv_600}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13)),
                                            Divider(height: 10),
                                          ],
                                        ),
                                  ntr.hvT_60 == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                'HV-Tertiary 60 Sec : ${ntr.hvT_60}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13)),
                                            Divider(height: 10),
                                          ],
                                        ),
                                  ntr.hvT_600 == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                'HV-Tertiary 600 Sec : ${ntr.hvT_600}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13)),
                                            Divider(height: 10),
                                          ],
                                        ),
                                  ntr.lvE_60 == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                'LV-Earth 60 Sec : ${ntr.lvE_60}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13)),
                                            Divider(height: 10),
                                          ],
                                        ),
                                  ntr.lvE_600 == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                'LV-Earth 600 Sec : ${ntr.lvE_600}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13)),
                                            Divider(height: 10),
                                          ],
                                        ),
                                  ntr.lvT_60 == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                'LV-Tertiary 60 Sec : ${ntr.lvT_60}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13)),
                                            Divider(height: 10),
                                          ],
                                        ),
                                  ntr.lvT_600 == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                'LV-Tertiary 600 Sec: ${ntr.lvT_600}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13)),
                                            Divider(height: 10),
                                          ],
                                        ),
                                  ntr.tE_60 == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                'Tertiary-Earth 60 Sec : ${ntr.tE_60}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13)),
                                            Divider(height: 10),
                                          ],
                                        ),
                                  ntr.tE_600 == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                'Tertiary-Earth 600 Sec : ${ntr.tE_600}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13)),
                                          ],
                                        ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    ntr1.vectorGroup == 'YNa0d11'
                        ? Card(
                            elevation: 2,
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  ntr.hvE_60 == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                '(HV+IV+N)-(LV+Earth) 60 Sec : ${ntr.hvE_60}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13)),
                                            Divider(height: 10),
                                          ],
                                        ),
                                  ntr.hvE_600 == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                '(HV+IV+N)-(LV+Earth)600 Sec : ${ntr.hvE_600}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13)),
                                            Divider(height: 10),
                                          ],
                                        ),
                                  ntr.hvLv_60 == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                '(HV+IV+N)-LV 60 Sec : ${ntr.hvLv_60}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13)),
                                            Divider(height: 10),
                                          ],
                                        ),
                                  ntr.hvLv_600 == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                '(HV+IV+N)-LV 600 Sec : ${ntr.hvLv_600}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13)),
                                            Divider(height: 10),
                                          ],
                                        ),
                                  ntr.lvE_60 == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                'LV-(HV+IV+N+Earth) 60 Sec : ${ntr.lvE_60}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13)),
                                            Divider(height: 10),
                                          ],
                                        ),
                                  ntr.lvE_600 == 0.00
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                                'LV-(HV+IV+N+Earth) 600 Sec : ${ntr.lvE_600}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13)),
                                          ],
                                        ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ntr.cF_60 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text('Core-Frame 60 Sec : ${ntr.cF_60}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.cT_60 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text('Core-Tank 60 Sec : ${ntr.cT_60}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.fT_60 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text('Frame-Tank 60 Sec : ${ntr.fT_60}',
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

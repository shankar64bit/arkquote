import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/powt/powt_ir_model.dart';
import '../../providers/powt_provider/powt_ir_provider.dart';

class Detail_PowtcoreIR_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_PowtcoreIR_page(@required this.args, {Key key}) : super(key: key);

  PowtcoreIRModel powtCoreIRModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((PowtcoreIRProvider x) => x.getPowtcoreIRById(args['id']));
    PowtcoreIRModel ntr =
        watchOnly((PowtcoreIRProvider x) => x.powtcoreIR_Model);

    print(ntr);
    print("ntr  Powt IR......");
    var mob =
        const Text('Powt IR Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Powt IR Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_PowtcoreIR',
                    arguments: {
                      'id': args['id'],
                      'TrNo': ntr.trNo,
                      'POWT_ID': args['POWT_ID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((PowtcoreIRProvider x) => x.deletePowtcoreIR(args['id']));
              Navigator.popAndPushNamed(context, '/detail_PowtcoreIR',
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
                              child: display_PowtcoreIR_details(ntr)),
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

  Container display_PowtcoreIR_details(PowtcoreIRModel ntr) {
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
                            Text('serial No : ${ntr.serialNo}',
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
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            ntr.hvE_60 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text('HV-Earth 60 Sec : ${ntr.hvE_60}',
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
                                      Text('HV-Earth 600 Sec : ${ntr.hvE_600}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.hvLV_60 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text(' HV-LV 60 Sec : ${ntr.hvLV_60}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.hvLV_600 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text('HV-LV 600 Sec : ${ntr.hvLV_600}',
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
                                      Text('LV-Earth 60 Sec : ${ntr.lvE_60}',
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
                                      Text(' LV-Earth 600 Sec : ${ntr.lvE_600}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                      Divider(height: 10),
                                    ],
                                  ),
                            ntr.cE_60 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text('Core-Earth 60 Sec : ${ntr.cE_60}',
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
                            ntr.tE_60 == 0.00
                                ? Container()
                                : Column(
                                    children: [
                                      Text('Tank-Earth 60 Sec : ${ntr.tE_60}',
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

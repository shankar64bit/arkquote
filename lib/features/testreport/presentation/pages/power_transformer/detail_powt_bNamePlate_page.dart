import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/powt/powt_bNamePlate_model.dart';
import '../../providers/powt_provider/powt_bNamePlate_provider.dart';

class Detail_PowtbNamePlate_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_PowtbNamePlate_page(@required this.args, {Key key}) : super(key: key);

  PowtbNamePlateModel powtbNamePlateModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((PowtbNamePlateProvider x) => x.getPowtbNamePlateById(args['id']));
    PowtbNamePlateModel ntr =
        watchOnly((PowtbNamePlateProvider x) => x.powtbNamePlate_Model);

    print(ntr);
    print("ntr  PowtbNamePlate......");
    var mob = const Text('PowtbNamePlate Test Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('PowtbNamePlate Test Details',
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
                Navigator.popAndPushNamed(context, '/edit_PowtbNameplate',
                    arguments: {
                      'id': args['id'],
                      'POWT_ID': args['POWT_ID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((PowtbNamePlateProvider x) =>
                  x.deletePowtbNamePlate(args['id']));
              Navigator.popAndPushNamed(context, '/detail_PowtbNamePlate',
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
                              child: display_PowtbNamePlate_details(ntr)),
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

  Container display_PowtbNamePlate_details(PowtbNamePlateModel ntr) {
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
                          Text('serial No : ' + ntr.serialNo.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'R Phase serial No : ' +
                                  ntr.R_serialNo.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'R Phase rated Voltage : ' +
                                  ntr.R_ratedVoltage.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'R Phase ratedCurrent : ' +
                                  ntr.R_ratedCurrent.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('R Phase Make : ' + ntr.R_Make.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'Y Phase serial No : ' +
                                  ntr.Y_serialNo.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'Y Phase rated Voltage : ' +
                                  ntr.Y_ratedVoltage.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'Y Phase rated Current : ' +
                                  ntr.Y_ratedCurrent.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('Y Phase Make : ' + ntr.Y_Make.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'B Phase serial No : ' +
                                  ntr.B_serialNo.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'B Phase rated Voltage : ' +
                                  ntr.B_ratedVoltage.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'B Phase rated Current : ' +
                                  ntr.B_ratedCurrent.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('B Phase Make : ' + ntr.B_Make.toString(),
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

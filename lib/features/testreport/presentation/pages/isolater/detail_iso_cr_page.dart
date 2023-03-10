// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/isolator/iso_cr_test_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/isolator/iso_model.dart';
import 'package:flutter_testreports/features/testreport/domain/entities/equipment/isolator/iso_cr.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/iso_provider/iso_cr_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/iso_provider/iso_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class DetailIsoCrPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int ISO_ID;

  DetailIsoCrPage(this.args, {Key key}) : super(key: key);

  IsoCrTestModel isoCrTestModel, ntr;

  @override
  Widget build(BuildContext context) {
    final IsoModel ntr1 = watchOnly((IsoProvider x) => x.isoModel);
    getX((IsoCrProvider x) => x.getIsoCrByID(args['id']));
    IsoCrTestModel ntr = watchOnly((IsoCrProvider x) => x.isoCrModel);

    print(ntr);
    print("ntr  ......");
    var mob =
        const Text('Iso - Cr Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('ISo - Cr Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_ISO_CR', arguments: {
                  'id': args['id'],
                  'TrNo': ntr.trNo,
                  'ISO_ID': args['ISO_ID'],
                  'Serial_No': ntr.serialNo,
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((IsoCrProvider x) => x.deleteIsoCr(args['id']));
              Navigator.popAndPushNamed(context, '/detail_ISO', arguments: {
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
                              child: display_ISO_Cr_details(ntr)),
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

  Container display_ISO_Cr_details(IsoCrTest ntr) {
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
                          Text('ID : ' + args['id'].toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                          Divider(height: 10),
                          Text('TrNo : ' + ntr.trNo.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                          Divider(height: 10),
                          Text('SerialNo : ' + ntr.serialNo.toString(),
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
                          Text('rr : ' + ntr.rr.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('yy : ' + ntr.yy.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('bb : ' + ntr.bb.toString(),
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

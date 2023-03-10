import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/CT/ct_core_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/ct_provider/ct_core_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/CT/ct_tap_model.dart';
import '../../providers/ct_provider/ct_tap_provider.dart';

class Detail_CT_core_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_CT_core_page(@required this.args, {Key key}) : super(key: key);

  CT_core_Model ctCoreModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((CT_core_Provider x) => x.getCT_core_ById(args['id']));
    CT_core_Model ntr = watchOnly((CT_core_Provider x) => x.ct_core_Model);

    // print(ntr);
    // print("ntr  CTcore......");
    var mob = const Text('CTcore Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('CTcore Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_CT_core', arguments: {
                  'id': args['id'],
                  'CT_ID': args['CT_ID'],
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((CT_core_Provider x) => x.deleteCT_core(args['id']));
              Navigator.popAndPushNamed(context, '/detail_CT_core', arguments: {
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
                              child: display_CT_core_details(ntr)),
                          SizedBox(
                              width: 500,
                              height: 100,
                              child: generate_list_of_CT_tap(ntr)),
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
      floatingActionButton: PopupMenuButton(
        child: FloatingActionButton.extended(
          label: Text(
            'Add Test',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          icon: const Icon(Icons.account_tree_outlined, color: Colors.white),
        ),
        itemBuilder: (context) {
          return List.generate(
            1,
            (index) {
              //list.generate
              return PopupMenuItem(
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FloatingActionButton.extended(
                          heroTag: 'addCTtap',
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/add_CT_tap',
                                arguments: {
                                  'CTcore_ID': ntr.id,
                                  'ctcoreDatabaseID': ntr.databaseID,
                                  'ctDatabaseID': args['ctDatabaseID'],
                                });
                          },
                          label: const Text('Add CTtap',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white)),
                          icon: const Icon(Icons.add, color: Colors.white),
                        )),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Container display_CT_core_details(CT_core_Model ntr) {
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
                          Text('coreNo : ' + ntr.coreNo.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('coreClass : ' + ntr.coreClass.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('CTno : ' + ntr.ctNo.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          ntr.burden == 0
                              ? Text('burden : ' + '--',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13))
                              : Text('burden : ' + ntr.burden.toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13))
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

  Container generate_list_of_CT_tap(CT_core_Model ntr) {
    getX((CT_tap_Provider x) => x.getCTtapByctNoID(ntr.id));
    final List<CT_tap_Model> reports =
        watchOnly((CT_tap_Provider x) => x.ct_tap_ctNoIDList);
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/detail_CT_tap', arguments: {
                'id': report.id,
                'CTcore_ID': report.databaseID,
                'ctcoreDatabaseID': args['ctcoreDatabaseID'],
                // 'trDatabaseID': args['trDatabaseID'],
              });
            },
            child: Card(
              color: Colors.white,
              elevation: 2,
              //margin: EdgeInsets.fromLTRB(20, 10, 0, 70),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 40, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CTtap Details ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.5,
                          letterSpacing: 1.5),
                    ),
                    Text('tapName : ' + report.tapName,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('coreRef : ' + report.coreRef.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

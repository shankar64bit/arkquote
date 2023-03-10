// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/testedbyuser.dart';
import '../../../../../injection_container.dart';
import '../../../data/datasources/user_remote_database.dart';
import '../../providers/user_table_provider.dart';

class Employers {
  int id;
  String name;
  Employers({this.id, this.name});
}

class employer_permission extends StatefulWidget {
  employer_permission({Key key}) : super(key: key);
  @override
  _employer_permissionState createState() => _employer_permissionState();
}

List<Employers> employers = [];
var multiSelectKey = GlobalKey<FormFieldState>();
var items = employers.map((emp) => MultiSelectItem(emp, emp.name)).toList();
final users = sl<UserProvider>().userLocaldataList;
var getuserkeys = employers.map((e) => e.id);

class _employer_permissionState extends State<employer_permission> {
  @override
  Widget build(BuildContext context) {
    for (var i in users) {
      int empidpass = i.empNo;
      String empName = i.name;
      if (getuserkeys.contains(i.empNo)) {
        print('User ID already exists');
      } else {
        employers.add(Employers(id: empidpass, name: empName));
        print('Employer Added');
      }
    }

    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            MultiSelectBottomSheetField<Employers>(
              key: multiSelectKey,
              initialChildSize: 0.7,
              maxChildSize: 0.95,
              title: Text("Employees"),
              buttonText: Text("Allow Employers"),
              items: items,
              searchable: true,
              validator: (values) {
                print('none');
                // if (values == null || values.isEmpty) {
                //   return "Required";
                // }
              },
              onConfirm: (values) {
                setState(() {
                  employers = values;
                });
                multiSelectKey.currentState.validate();
              },
            ),
          ],
        ),
      ),
    );
  }
}

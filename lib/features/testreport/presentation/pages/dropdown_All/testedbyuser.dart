import 'package:flutter/material.dart';
import '../../../../../injection_container.dart';
import '../../../data/datasources/user_remote_database.dart';
import '../../providers/user_table_provider.dart';

int selectedValueForTested;
String selectedNameForTested;

class TestedByUser extends StatefulWidget {
  @override
  _TestedByUserState createState() => _TestedByUserState();

  getTestByUser() {
    return selectedValueForTested;
  }

  getTestByUsertoDefaultValue() {
    return selectedValueForTested = null;
  }
}

class _TestedByUserState extends State<TestedByUser> {
  @override
  Widget build(BuildContext context) {
    // sl<UserRemoteDatasourceImpl>().getNewUsers();
    // sl<UserProvider>().FutureGetUserLocalDataList();
    List<KeyValueModelForTest> datasOfTestedUser = [];
    final users = sl<UserProvider>().userLocaldataList;

    var getuserkeys = datasOfTestedUser.map((e) => e.keys);
    var getuservalues = datasOfTestedUser.map((e) => e.values);

    for (var eachuser in users) {
      //print(eachuser);
      var idemp = eachuser.empNo;
      var nameemp = eachuser.databaseID;
      var UNames = eachuser.name;

      // ignore: unrelated_type_equality_checks
      if (getuserkeys.contains(idemp)) {
        //print('User Already Existed in the TestedBy user list');
      } else {
        datasOfTestedUser.add(
            KeyValueModelForTest(keys: idemp, values: nameemp, UName: UNames));
      }
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          DropdownButton<String>(
              items: datasOfTestedUser
                  .map((data) => DropdownMenuItem<String>(
                        child:
                            Text(data.values.toString() + ' - ' + data.UName),
                        value: data.values.toString(),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() => selectedValueForTested = int.parse(value));
              },
              hint: const Text('Select > Tested By')),
          Text('Tested By : ' + selectedValueForTested.toString()),
          //sDivider(height: 25, thickness: 1, color: Colors.black),
        ],
      ),
    );
  }
}

class KeyValueModelForTest {
  int keys;
  int values;
  String UName;
  KeyValueModelForTest({this.keys, this.values, this.UName});
}

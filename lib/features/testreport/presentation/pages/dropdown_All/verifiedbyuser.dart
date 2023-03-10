import 'package:flutter/material.dart';
import '../../../../../injection_container.dart';
import '../../../data/datasources/user_remote_database.dart';
import '../../providers/user_table_provider.dart';

int selectedValueForVerified;

class VerifiedByUser extends StatefulWidget {
  @override
  _VerifiedByUserState createState() => _VerifiedByUserState();

  getVerifiedByUser() {
    return selectedValueForVerified;
  }

  getTestByUsertoDefaultValue() {
    return selectedValueForVerified = null;
  }
}

class _VerifiedByUserState extends State<VerifiedByUser> {
  @override
  Widget build(BuildContext context) {
    // sl<UserRemoteDatasourceImpl>().getNewUsers();
    // sl<UserProvider>().FutureGetUserLocalDataList();
    final users = sl<UserProvider>().userLocaldataList;
    List<KeyValueModel> datasOfVerifiedUser = [];

    var getuserkey = datasOfVerifiedUser.map((data) => data.key);
    var getuservalue = datasOfVerifiedUser.map((data) => data.value);

    for (var eachuser in users) {
      //print(eachuser);
      var id = eachuser.empNo;
      var name = eachuser.databaseID;
      var Username = eachuser.name;

      if (getuserkey.contains(id)) {
        //print('User Already Existed in the Verified by user list');
      } else {
        datasOfVerifiedUser
            .add(KeyValueModel(key: id, value: name, UserNameForUI: Username));
      }
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Divider(height: 10, thickness: 1, color: Colors.black),
          DropdownButton<String>(
              items: datasOfVerifiedUser
                  .map((data) => DropdownMenuItem<String>(
                        child: Text(
                            data.value.toString() + ' - ' + data.UserNameForUI),
                        value: data.value.toString(),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() => selectedValueForVerified = int.parse(value));
              },
              hint: const Text('Select > Verified By')),
          Text('Verified By : ' + selectedValueForVerified.toString()),
          Divider(height: 40, thickness: 1, color: Colors.black),
        ],
      ),
    );
  }
}

class KeyValueModel {
  int key;
  int value;
  String UserNameForUI;
  KeyValueModel({this.key, this.value, this.UserNameForUI});
}

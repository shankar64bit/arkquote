import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class thirdTab extends StatefulWidget {
  @override
  State<thirdTab> createState() => _thirdTabState();
}

class _thirdTabState extends State<thirdTab> {
  List<dynamic> countries = [];
  List<dynamic> stateMasters = [];
  List<dynamic> states = [];

  String countryId;
  String stateId;

  @override
  void initState() {
    super.initState();

    this.countries.add({'id': 1, 'name': 'India'});
    this.countries.add({'id': 2, 'name': 'UAE'});

    this.stateMasters.add({'ID': 1, 'Name': 'bangalore', 'ParentId': 1});
    this.stateMasters.add({'ID': 2, 'Name': 'delhi', 'ParentId': 1});
    this.stateMasters.add({'ID': 1, 'Name': 'dubai', 'ParentId': 2});
    this.stateMasters.add({'ID': 2, 'Name': 'abu dhabi', 'ParentId': 2});

    this.stateMasters = [
      {'ID': 1, 'Name': 'bangalore', 'ParentId': 1},
      {'ID': 2, 'Name': 'delhi', 'ParentId': 1},
      {'ID': 1, 'Name': 'dubai', 'ParentId': 2},
      {'ID': 2, 'Name': 'abu dhabi', 'ParentId': 2},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ARK   Q U O T E'),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          FormHelper.dropDownWidgetWithLabel(
            context,
            'Country',
            'Select country',
            this.countryId,
            this.countries,
            (onChangeVal) {
              this.countryId = onChangeVal;
              print('selected country : $onChangeVal');

              this.states = this
                  .stateMasters
                  .where(
                    (stateItem) =>
                        stateItem['ParentId'].toString() ==
                        onChangeVal.toString(),
                  )
                  .toList();
              this.stateId = null;
            },
            (onValidate) {
              if (onValidate == null) {
                return 'Please select country';
              }
              return null;
            },
            borderColor: Theme.of(context).primaryColor,
            borderFocusColor: Theme.of(context).primaryColor,
            borderRadius: 10,
          ),
          FormHelper.dropDownWidgetWithLabel(
            context,
            'state',
            'Select state',
            this.stateId,
            this.states,
            (onChangeVal) {
              this.stateId = onChangeVal;
              print('Select state : $onChangeVal');
            },
            (onValidate) {
              return null;
            },
            borderColor: Theme.of(context).primaryColor,
            borderFocusColor: Theme.of(context).primaryColor,
            borderRadius: 10,
            optionValue: 'ID',
            optionLabel: 'Name',
          ),
        ],
      ),
    ));
  }
}

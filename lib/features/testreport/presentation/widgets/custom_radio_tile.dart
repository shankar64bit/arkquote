import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomRadioTile extends StatelessWidget {
  final String _titleTxt, _valueTxt, _groupValue;
  final TextEditingController _radioController;

  // ignore: no_leading_underscores_for_local_identifiers
  const CustomRadioTile(
      @required TextEditingController radioController,
      @required String titleTxt,
      @required String valueTxt,
      @required groupValue,
      {Key key})
      : _titleTxt = titleTxt,
        _valueTxt = valueTxt,
        _groupValue = groupValue,
        _radioController = radioController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(_titleTxt),
      value: _valueTxt,
      groupValue: _groupValue,
      onChanged: (value) {
        print(value);
        _radioController.text = value.toString();
      },
    );
  }
}

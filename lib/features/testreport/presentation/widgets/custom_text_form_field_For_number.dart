import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormFieldForNumber extends StatelessWidget {
  const CustomTextFormFieldForNumber({
    Key key,
    @required this.hintText,
    @required this.inputFormatters,
    @required this.validator,
    @required this.reTest_color,
    @required TextEditingController controller,
    @required String txtLbl,
  })  : _controller = controller,
        _txtLbl = txtLbl,
        super(key: key);

  final TextEditingController _controller;
  final String _txtLbl;
  final String hintText;
  final List<TextInputFormatter> inputFormatters;
  final String Function(String) validator;
  final reTest_color;

  @override
  Widget build(BuildContext context) {
    if (reTest_color == true) {
      return TextFormField(
        controller: _controller,
        inputFormatters: inputFormatters,
        keyboardType: TextInputType.number,
        validator: validator,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            color: Colors.yellow[800],
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          fillColor: Colors.green,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          label: Text(hintText),
        ),
      );
    } else {
      return TextFormField(
        controller: _controller,
        inputFormatters: inputFormatters,
        keyboardType: TextInputType.number,
        validator: validator,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(hintText),
        ),
      );
    }
  }
}

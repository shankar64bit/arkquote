import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var reTest_color;

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key key,
    @required this.hintText,
    @required this.inputFormatters,
    @required this.validator,
    @required this.reTest_color,
    @required TextEditingController controller,
    @required String txtLbl,
  })  : _controller = controller,
        _txtLbl = txtLbl,
        // _hintText = hintText,
        // _inputFormatters = inputFormatters,
        // _validator = validator,
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
          //labelStyle: TextStyle(color: Colors.yellow[800], letterSpacing: 1.3),
        ),
        //decoration: InputDecoration(hintText: hintText),
      );
    } else {
      return TextFormField(
        controller: _controller,
        inputFormatters: inputFormatters,
        validator: validator,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(hintText),
        ),
        // decoration: InputDecoration(hintText: hintText),
      );
    }
  }
  // @override
  // Widget build(BuildContext context) {
  //   return TextFormField(
  //     inputFormatters: inputFormatters,
  //     // validator: validator,
  //     controller: _controller,
  //     keyboardType: TextInputType.text,
  //     decoration: InputDecoration(
  //       border: const OutlineInputBorder(),
  //       label: Text(_txtLbl),
  //     ),
  //     validator: (value) {
  //       if (value == null || value.isEmpty) {
  //         return '$_txtLbl is not valid';
  //       }
  //     },
  //   );
  // }
}

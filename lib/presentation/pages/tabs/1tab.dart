import 'package:flutter/material.dart';

class firstTab extends StatelessWidget {
  // const firstTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[100],
      child: Center(
          child: Text(
        '1ST TAB [quote summery]',
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}

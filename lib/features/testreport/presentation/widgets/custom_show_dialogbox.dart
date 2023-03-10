import 'package:flutter/material.dart';

class CustomShowDialogBox extends StatelessWidget {
  final VoidCallback _callback;
  final String _title;
  final String _content_txt;
  final BuildContext context;

  const CustomShowDialogBox(
    @required String title,
    @required String content_txt,
    @required callback,
    @required context, {
    Key key,
  })  : _title = title,
        _content_txt = content_txt,
        _callback = callback,
        context = context,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: [
              Expanded(
                child: AlertDialog(
                  title: Text(_title),
                  content: Text(_content_txt),
                  actions: [
                    TextButton(
                      onPressed: _callback,
                      child: const Text(
                        'YES',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'NO',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}

import 'package:flutter/material.dart';
import '../google_sign_in_out/login_page.dart';

class Unauthorized_User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('UnAuthorized Access, Sign In from Authorized Email ID\n\n'),
            ElevatedButton(
              onPressed: () {
                // Navigator.popAndPushNamed(context, '/login_page_init');
                LoginPage().loginUI;
              },
              child: Text('Sign-In'),
            )
          ],
        )),
      ),
    );
  }
}

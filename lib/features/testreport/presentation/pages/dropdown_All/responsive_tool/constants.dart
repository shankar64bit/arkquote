import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../../injection_container.dart';
import 'google_sign_in_out/google_login_controller.dart';
//import 'package:flutter_testreports/features/testreport/presentation/pages/responsive_tool/responsive/mobile.dart';

//constant variable for background color
var defaultBackgroundColor = Colors.grey[700];

//constant variable for AppBar Color
var appBarColor = Colors.grey[900];

//constant variable for AppBar Formate
var myAppBar = AppBar(
  backgroundColor: appBarColor,
  title: Text('ADMIN PANEL'),
  centerTitle: false,
);

//constant variable for DrawerTextColor
var drawerTextColor = TextStyle(color: Colors.black);

//constant variable for AppBar TilePadding (Padding for List in Drawer)
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);

//constant variable for MyDrawer Entire Formate
var myDrawer = Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      Padding(
        padding: EdgeInsets.all(0),
      ),
      const Padding(
          padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
          child: DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
            image: AssetImage("images/ARK-logo.jpg"),
          )))),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(Icons.home, color: Colors.black),
          title: Text('D A S H B O A R D', style: drawerTextColor),
          onTap: () {
            print('Clicked Dashboard');
          },
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(Icons.settings, color: Colors.black),
          title: Text('S E T T I N G S', style: drawerTextColor),
          onTap: () {
            print('Clicked Settings');
          },
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(Icons.history, color: Colors.black),
          title: Text('H I S T O R Y', style: drawerTextColor),
          onTap: () {
            print('Clicked History');
          },
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(Icons.info, color: Colors.black),
          title: Text('A B O U T', style: drawerTextColor),
          onTap: () {
            print('Clicked About');
          },
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(Icons.logout, color: Colors.black),
          title: Text('L O G O U T', style: drawerTextColor),
          onTap: () {
            sl<GoogleSignInController>().logout();
          },
        ),
      ),
      Padding(
        padding: EdgeInsets.all(0),
        child: LoginPage(),
      )
    ],
  ),
);

/////////////////////////////////LoginProfile in side of the Drawer menu navigator////////////////////////////

class LoginPage extends StatelessWidget with GetItMixin {
  @override
  Widget build(BuildContext context) {
    final model = watchOnly((GoogleSignInController x) => x.googleAccount);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Card(
            elevation: 5,
            color: Colors.white,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              Image.network(model.photoUrl ?? '').image,
                          radius: 20,
                          onBackgroundImageError: (exception, stackTrace) {
                            AssetImage('images/ARK-logo.jpg');
                          },
                        ),
                        Text(model.displayName ?? '',
                            style: TextStyle(fontSize: 15)),
                        Text(model.email, style: TextStyle(fontSize: 10))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

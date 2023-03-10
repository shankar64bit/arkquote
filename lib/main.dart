import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/routes/route_generator.dart';
import 'package:google_sign_in_dartio/google_sign_in_dartio.dart';
import 'injection_container.dart' as di;

void main() async {
  String os = Platform.operatingSystem;
  if (Platform.isWindows) {
    GoogleSignInDart.register(
        clientId:
            '1067720743417-r4madq9bovku5u1rcj3imei12dm5o3ah.apps.googleusercontent.com');
  }
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Reports',
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          //secondary: Color.fromARGB(255, 22, 17, 86),
          // theme blue color of ARK > Color.fromARGB(255, 42, 54, 76),
          secondary: Color.fromARGB(255, 119, 11, 11),
          primary: Color.fromARGB(255, 119, 11, 11),
        ),
        fontFamily: 'robotic',
      ),
      initialRoute: '/login_page_init',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

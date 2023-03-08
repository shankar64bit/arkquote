import 'package:flutter/material.dart';
import 'package:quotesummeryapp/presentation/routes/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quote Client Detail',
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          // secondary: Colors.black,
          primary: Color.fromARGB(255, 119, 11, 11),
        ),
        fontFamily: 'robotic',
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
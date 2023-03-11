import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

import 'features/presentation/routes/route_generator.dart';

void main() async {
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
      title: 'Quote Client Detail',
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          // primary: Color.fromARGB(255, 140, 12, 12),
          primary: Colors.grey[900],
        ),
        fontFamily: 'robotic',
      ),
      initialRoute: '/root',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

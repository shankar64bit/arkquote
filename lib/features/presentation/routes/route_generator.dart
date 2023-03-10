import 'package:flutter/material.dart';
import 'package:quotesummeryapp/features/presentation/pages/entry.dart';
import '../pages/homepage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/root':
        return MaterialPageRoute(builder: (_) => Entry(args));

      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());

      // case '/add_report':
      //   return MaterialPageRoute(builder: (_) => AddTestReportPage());

      // case '/edit_report':
      //   if (args is int) {
      //     return MaterialPageRoute(
      //       builder: (_) => EditTestReportPage(
      //         id: args,
      //       ),
      //     );
      //   }
      //   return _errorRoute();

      // case '/add_AT':
      //   if (args is Map) {
      //     return MaterialPageRoute(builder: (_) => Add_AT_Details(args));
      //   }
      //   return _errorRoute();

      // case '/detail_report':
      //   return MaterialPageRoute(
      //       builder: (_) => DetailTestReportPage(
      //             id: args,
      //           ));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('No route'),
        ),
        body: const Center(
          child: Text('Sorry no route found'),
        ),
      );
    });
  }
}

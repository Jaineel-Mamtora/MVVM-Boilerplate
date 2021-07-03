import 'package:sprintf/sprintf.dart';
import 'package:flutter/material.dart';

import '../ui/views/home_view.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeView.routeName:
        // var _args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => HomeView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                sprintf(
                  'No route defined for %s',
                  [settings.name],
                ),
              ),
            ),
          ),
        );
    }
  }
}

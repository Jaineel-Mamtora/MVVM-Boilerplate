import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './styling.dart';
import './locator.dart';
import './ui/router.dart';
import './ui/utils/size_config.dart';
import './ui/views/startup_view.dart';
import './services/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return MaterialApp(
                title: 'My App',
                debugShowCheckedModeBanner: false,
                navigatorKey: _navigationService.navigatorKey,
                onGenerateRoute: CustomRouter.generateRoute,
                theme: AppTheme.lightTheme,
                home: StartUpView(),
              );
            },
          );
        },
      ),
    );
  }
}

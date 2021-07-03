import 'package:flutter/material.dart';

import '../../ui/views/base_view.dart';
import '../../viewmodels/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) {},
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'MVVM Boilerplate',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Center(
            child: Text(
              'Welcome',
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';
import '../../viewmodels/base_viewmodel.dart';
import '../../managers/lifecycle_event_handler.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    T model,
    Widget child,
  ) builder;
  final Function(T) onModelReady;
  final Function(T) onModelDestroy;

  BaseView({
    this.builder,
    this.onModelReady,
    this.onModelDestroy,
  });

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = locator<T>();

  void initLifeCycleEventHandler() {
    WidgetsBinding.instance.addObserver(
      LifecycleEventHandler(
        resumeCallBack: () async {
          await Future.delayed(Duration(milliseconds: 500));
        },
      ),
    );
  }

  @override
  void initState() {
    initLifeCycleEventHandler();
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onModelDestroy != null) {
      widget.onModelDestroy(model);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}

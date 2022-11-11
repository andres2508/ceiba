import 'package:ceiba/ui/platform/dialog/progress-dialog.widget.dart';
import 'package:ceiba/ui/platform/router.model.dart';
import 'package:flutter/material.dart';

import 'common/error.widget.dart';

class CeibaRouter {
  static Route? currentRoute;
  List<CeibaRoute> _appRoutes = [];
  final _errorBuilder = (_) => CeibaErrorWidget.of("Ruta desconocida");

  Route<dynamic> generateRoute(RouteSettings settings) {
    final found = _appRoutes.where((it) => it.path == settings.name);
    WidgetBuilder builder = _errorBuilder;
    if (found.isNotEmpty) {
      builder = found.first.component(settings);
    }
    currentRoute = MaterialPageRoute(
      settings: settings,
      builder: (c) {
        return ProgressDialogWrapper(
          builder: builder,
        );
      },
    );
    return currentRoute!;
  }

  void addRoutes(List<CeibaRoute> routes) {
    _appRoutes.addAll(routes);
  }
}
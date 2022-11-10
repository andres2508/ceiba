import 'package:flutter/material.dart';

typedef WidgetFactory = WidgetBuilder Function(RouteSettings settings);

class CeibaRoute {
  String path;
  WidgetFactory component;

  CeibaRoute(this.path, this.component);
}
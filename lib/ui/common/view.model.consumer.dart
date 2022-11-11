import 'package:ceiba/ui/common/base.view.model.dart';
import 'package:ceiba/ui/common/error.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewModelConsumer<T extends BaseViewModel> extends StatelessWidget {
  final Widget Function(BuildContext context, T value, Widget? child) builder;

  ViewModelConsumer({required this.builder});

  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, model, child) {
        switch (model.state) {
          case NotifierState.loading:
            return Center(child: CircularProgressIndicator());
          case NotifierState.loaded:
          default:
            if (model.hasError) {
              return CeibaErrorWidget.of(model.failure.toString());
            }
            return builder(context, model, child);
        }
      },
    );
  }
}
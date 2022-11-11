import 'package:ceiba/ui/main.screen.dart';
import 'package:ceiba/ui/platform/ceiba.module.dart';
import 'package:ceiba/ui/platform/router.model.dart';

class MainModule extends CeibaViewModule {
  @override
  List<CeibaRoute> routes() {
    return [
      CeibaRoute('home', (s) => (_) => MainScreen())
    ];
  }

}
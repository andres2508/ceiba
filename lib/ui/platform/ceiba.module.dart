import 'package:ceiba/ui/platform/router.model.dart';

abstract class CeibaViewModule {
  List<CeibaViewModule> imports() {
    return [];
  }

  List<CeibaRoute> routes();
}
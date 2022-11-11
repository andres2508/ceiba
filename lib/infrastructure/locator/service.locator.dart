import 'package:ceiba/ui/platform/dialog/dialogs.service.dart';
import 'package:ceiba/ui/platform/messages/messages.service.dart';
import 'package:ceiba/ui/user/user.service.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Infrastructure Services
  serviceLocator.registerSingleton(MessagesService());
  serviceLocator.registerSingleton(DialogsService());
  // Domain services
  serviceLocator.registerLazySingleton(() => UserService());
}

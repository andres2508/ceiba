import 'package:ceiba/ui/main.module.dart';
import 'package:ceiba/ui/platform/ceiba.module.dart';
import 'package:ceiba/ui/posts/posts.module.dart';
import 'package:ceiba/ui/router.dart';
import 'package:ceiba/styles/color.styles.dart';
import 'package:flutter/material.dart';

List<CeibaViewModule> modules = [
  MainModule(),
  PostModule()
];

class CeibaMobileApp extends StatefulWidget {
  const CeibaMobileApp({Key? key}) : super(key: key);

  @override
  State<CeibaMobileApp> createState() => _CeibaMobileAppState();
}

class _CeibaMobileAppState extends State<CeibaMobileApp> {
  final CeibaRouter _router = CeibaRouter();
  final _theme = ThemeData(
    appBarTheme: AppBarTheme(color: ColorStyles.accentColor),
    primaryColor: ColorStyles.accentColor,
    primaryColorDark: ColorStyles.accentColor,
    primarySwatch: MaterialColor(ColorStyles.accentColor.value, const <int, Color>{
      50: Color.fromRGBO(43, 97, 49, 0.1),
      100: Color.fromRGBO(43, 97, 49, 0.2),
      200: Color.fromRGBO(43, 97, 49, 0.3),
      300: Color.fromRGBO(43, 97, 49, 0.4),
      400: Color.fromRGBO(43, 97, 49, 0.5),
      500: Color.fromRGBO(43, 97, 49, 0.6),
      600: Color.fromRGBO(43, 97, 49, 0.7),
      700: Color.fromRGBO(43, 97, 49, 0.8),
      800: Color.fromRGBO(43, 97, 49, 0.9),
      900: Color.fromRGBO(43, 97, 49, 1),
    },
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: ColorStyles.accentColor
      )
    ),
    textTheme: TextTheme(
      subtitle1: const TextStyle( color: ColorStyles.accentColor ),
      subtitle2: const TextStyle( color: ColorStyles.accentColor )
    )
  );

  @override
  void initState() {
    super.initState();
    for (final module in modules) {
      _router.addRoutes( module.routes() );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ceiba Flutter',
      debugShowCheckedModeBanner: false,
      theme: _theme,
      onGenerateRoute: _router.generateRoute,
      initialRoute: 'home',
    );
  }
}

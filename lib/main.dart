import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vr_web_admin/navigation/navigation_delegate.dart';
import 'package:vr_web_admin/navigation/navigation_route_parser.dart';
import 'package:vr_web_admin/main.reflectable.dart';

import 'generated/l10n.dart';

void main() {
  initializeReflectable();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigationDelegate = NavigationDelegate();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'VR Web Admin',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.yellow,
        //primarySwatch: Colors.yellow,
        appBarTheme: const AppBarTheme(
          color: Colors.yellow,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
              color: Colors.black87, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow),
          ),
          labelStyle:
              TextStyle(color: Colors.black87), // Change label text color
          hintStyle: TextStyle(color: Colors.grey), // Change hint text color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow, // background (button) color
              foregroundColor: Colors.black87,
              elevation: 2,
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              )
              // foreground (text) color
              ),
        ),
        // buttonTheme: const ButtonThemeData(
        //   buttonColor: Colors.yellow, // Change button color
        //   disabledColor: Colors.grey, // Change disabled button color
        //   textTheme: ButtonTextTheme.normal,
        // ),
      ),
      routeInformationParser: NavigationRouteParser(),
      routerDelegate: navigationDelegate,
    );
  }
}

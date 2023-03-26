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
        primarySwatch: Colors.yellow,
      ),
      routeInformationParser: NavigationRouteParser(),
      routerDelegate: navigationDelegate,
    );
  }
}

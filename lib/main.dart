import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:components/src/routes/app_routes.dart';
// import 'package:components/src/pages/home_temp.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
   // ... app-specific localization delegate[s] here
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
      supportedLocales: [
      const Locale('en'), // English
      const Locale('es', 'ES')
    ],
      debugShowCheckedModeBanner: false,
      title: 'Components',
      //home: HomePage()
      initialRoute: '/',
      routes: getApplicationRoutes(),
    );
  }
}
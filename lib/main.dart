import 'package:app/views/location_list.dart';
import 'package:app/views/login_page.dart';
import 'package:app/views/profil.dart';
import 'package:app/views/validation_location.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'my_home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // cle unique d'identifiant de mon widget
 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // cupertinoApp
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Location',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Mes locations'),
      routes: {
        '/': (context) =>  MyHomePage(title: 'Home page'),
        'profil': (context) =>  Profil(),
        'loclist': (context) =>  LocationList(),
        // Profil.routeName:(context) => const Profil(),
        // LoginPage.routeName:(context) => const LoginPage('/'),
        // LocationList.routeName:(context) => const LocationList(),
        // ValidationLocation.routeName:(context) => const ValidationLocation(),
      },
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale('en'), Locale('fr')]
    );
  }
}








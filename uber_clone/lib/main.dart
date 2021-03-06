import 'package:flutter/material.dart';
import 'package:uber_clone/src/pages/driver/register/driver_register_page.dart';
import 'package:uber_clone/src/pages/pages.home/home_page.dart';
import 'package:uber_clone/src/pages/pages.login/login_page.dart';
import 'package:uber_clone/src/pages/client/register/client_register_page.dart';
import 'package:uber_clone/src/utils/colors.dart' as utils;
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uber Clone',
      initialRoute: 'home',
      theme: ThemeData(
        fontFamily: 'NimbusSans',
        appBarTheme: AppBarTheme(
          elevation: 0
        ),
        primaryColor: utils.Colors.uberCloneColor
      ),
      routes: {
        'home' : (BuildContext context) => HomePage(),
        'login' : (BuildContext context) => LoginPage(),
        'client/register' : (BuildContext context) => ClientRegisterPage(),
        'driver/register' : (BuildContext context) => DriverRegisterPage(),
      },
    );
  }
}

import 'package:bluetup_inc/config/coloring.dart';
import 'package:bluetup_inc/config/login_persist.dart';
import 'package:bluetup_inc/palette.dart';
import 'package:bluetup_inc/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await UserLoginPref.initUser();
  runApp(const MyApp());
}

final TupColoring blueTup = TupColoring();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bluetup',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Palette.kToDark,
      ),
      debugShowCheckedModeBanner: false,
      home: Splasher(),
    );
  }
}

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mvvm_flutterapp/sharedprefernce/sharedpreference.dart';
import 'package:mvvm_flutterapp/translation/language.dart';
import 'package:mvvm_flutterapp/view/generateqr/generateqr.dart';
import 'package:mvvm_flutterapp/view/home.dart';
import 'package:mvvm_flutterapp/view/notetaker/notewithsqlite.dart';
import 'package:mvvm_flutterapp/view/notification.dart';
import 'package:mvvm_flutterapp/view/onboarding_screen_view.dart';
import 'package:mvvm_flutterapp/view/scanqrcode/qrcodescanner.dart';
import 'package:mvvm_flutterapp/view/video_player_from_file.dart';
import 'package:mvvm_flutterapp/view/video_player_from_network.dart';
import 'package:mvvm_flutterapp/view/video_player_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();

  runApp(MyApp());
}



class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //using the GetX package for translation

    return GetMaterialApp(
      routes: {
        '/pictures': (context) => HomeView() ,
        '/videofromfile': (context) => VideoPLayerFromFile() ,
        '/videofromnetwork': (context) => VideoPLayerFromNetwork(),
        '/notification': (context) => MyNotification(),
        '/videohome': (context) => VideoPLayerFromAssets(),
        '/qrgenerator': (context) => GenerateQRPage(),
        '/qrcodescanner': (context) => ScanQrCode(),
        '/sqflitenotesaver': (context) => NotesPage(),
      },
      debugShowCheckedModeBanner: false,

      translations: LocaleString(),

      locale: Locale('en', 'US'),
      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: OnBoardingScreen(),
    );
  }
}






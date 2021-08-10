import 'package:flutter/material.dart';
import 'package:mvvm_flutterapp/view/home.dart';
import 'package:mvvm_flutterapp/view/video_player_from_file.dart';
import 'package:mvvm_flutterapp/view/video_player_from_network.dart';
import 'package:mvvm_flutterapp/view/video_player_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/pictures': (context) => HomeView() ,
        '/videofromfile': (context) => VideoPLayerFromFile() ,
        '/videofromnetwork': (context) => VideoPLayerFromNetwork(),
      },

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: VideoPLayerFromAssets(),
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mvvm_flutterapp/sharedprefernce/sharedpreference.dart';
import 'package:mvvm_flutterapp/view/video_player_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'generateqr/generateqr.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
    child: IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'A reader lives a thosuand lives',
          body: 'The man who never reads lives only one',
          image: buildImage('assets/daggerjoke.jpg'),
          decoration: getPageDecoration(),

        ),
        PageViewModel(
          title: 'Android Kotlin is King',
          body: 'Android kotlin Jet Pack Compose is the future',
          image: buildImage('assets/jetpacklogo.png'),
          decoration: getPageDecoration(),

        ),
        PageViewModel(
          title: 'King of the jungle',
          body: 'A lion is the fearless king of the jungle',
          image: buildImage('assets/lion.jpg'),
          decoration: getPageDecoration(),

        ),
        PageViewModel(
          title: 'Tractor',
          body: 'Useful Machine for farming',
          image: buildImage('assets/tractor.png'),
          decoration: getPageDecoration(),

        ),
        PageViewModel(
          title: 'Drinks',
          body: 'Get you some Cocktail Magaritas',
          image: buildImage('assets/cocktailapplogo.png'),
          decoration: getPageDecoration(),

        ),
      ],
      showNextButton: false,

      showSkipButton: false,

      skip: Text("Skip", style: TextStyle(fontWeight: FontWeight.bold),),

      // onDone: () => gotoHome(context),
      onDone: () {
        gotoHome(context);
        setVisitFlag();
      },


      done: Text('Got it', style: TextStyle(fontWeight: FontWeight.bold),),),
  );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  PageDecoration getPageDecoration()=> PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 20),
    descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
    imagePadding: EdgeInsets.all(24),
    pageColor: Colors.orange

  );

  gotoHome(context) {
    // setVisitFlag();

    if(getVisitFlag() == true){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_)=>  VideoPLayerFromAssets()),

      );
    }else{
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_)=> GenerateQRPage()),
      );
    }
  }

}

getVisitFlag(){
  var alreadyVisited = UserPreferences.getVisitingFlag() ?? false;
  return alreadyVisited;
}

setVisitFlag()async{
   await UserPreferences.setVisitingFlag(true);
}

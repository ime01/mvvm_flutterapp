
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:mvvm_flutterapp/utils/video_player_widget.dart';
// import 'package:video_player/video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';


class VideoPLayerFromAssets extends StatefulWidget {
  const VideoPLayerFromAssets({Key? key}) : super(key: key);

  @override
  _VideoPLayerFromAssetsState createState() => _VideoPLayerFromAssetsState();
}

class _VideoPLayerFromAssetsState extends State<VideoPLayerFromAssets> {

  late VideoPlayerController controller;
  final videoAsset = 'assets/volvo.mp4';

  final List locale = [
    {'name':'ENGLISH', 'locale' : Locale('en', 'US')},
    {'name':'FRENCH', 'locale' : Locale('fr', 'FR')},
    {'name':'GERMAN', 'locale' : Locale('ge', 'GE')},
    {'name':'SPANISH', 'locale' : Locale('es', 'ES')},
  ];

  updateLanguage(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }

  buildLanguageDialog(BuildContext context){

    showDialog(context: context,
      builder: (builder) {
      return AlertDialog(
        title: Text('Choose Your Language'),
        content: Container(
          width: double.maxFinite,
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(child: Text(locale[index]['name']), onTap: (){
                    print(locale[index]['name']);
                    updateLanguage(locale[index]['locale']);

                  },),
                );
              },
              separatorBuilder: (context, index){
                return Divider(
                  color: Colors.blue,
                );
              },
              itemCount: locale.length),
        ),
      );
      },
    );
  }





  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(videoAsset)
    ..addListener(()=> setState((){}))
    ..setLooping(true)
    ..initialize().then((_) => controller.pause());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final isMuted = controller.value.volume ==0;

    return Scaffold(
      appBar: AppBar(
        // title: Text('VideoPlayer View'),
        title: Text('videoV'.tr),
      ),
        body: SingleChildScrollView(
        child: Stack(
        children:[
         Column(
          children: [
            Center(
              child: ElevatedButton(
                // child:Text('Open Notification View'),
                child:Text('notiV'.tr),
                onPressed: (){
                  Navigator.pushNamed(context, '/notification');
                },
              ),
            ),

            Center(
              child: ElevatedButton(
                // child:Text('Open Pictures View'),
                child:Text('openP'.tr),
                onPressed: (){
                  Navigator.pushNamed(context, '/pictures');
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                // child:Text('Video Player From Network'),
                child:Text('videoN'.tr),
                onPressed: (){
                  Navigator.pushNamed(context, '/videofromnetwork');
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                // child:Text('Video Player From File'),
                child:Text('videoF'.tr),
                onPressed: (){
                  Navigator.pushNamed(context, '/videofromfile');
                },
              ),
            ),
            VideoPlayerWidget(controller: controller),
            if(controller != null && controller.value.isInitialized)
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red,
                child: IconButton(
                  icon: Icon(
                    isMuted ? Icons.volume_mute : Icons.volume_up,
                    color: Colors.white,
                  ),
                  onPressed: () => controller.setVolume(isMuted ? 1:0),
                ),
              ),

            Center(
              child: ElevatedButton(
                // child:Text('Video Player From File'),
                child:Text('Change Your Language'),
                onPressed: (){
                  buildLanguageDialog(context);
                },
              ),
            ),

            Center(
              child: ElevatedButton(
                // child:Text('Video Player From File'),
                child:Text('Go to QR GENERATOR VIEW'),
                onPressed: (){
                  Navigator.pushNamed(context, '/qrgenerator');
                },
              ),
            ),

            Center(
              child: ElevatedButton(
                // child:Text('Video Player From File'),
                child:Text('Go to QR SCANNER VIEW'),
                onPressed: (){
                  Navigator.pushNamed(context, '/qrcodescanner');
                },
              ),
            ),

            Center(
              child: ElevatedButton(
                // child:Text('Video Player From File'),
                child:Text('Go to SQFLITE NOTE SAVER'),
                onPressed: (){
                  Navigator.pushNamed(context, '/sqflitenotesaver');
                },
              ),
            ),
          ],
        ),


          // floatingActionButton: FloatingActionButton(
          //   child: new Icon(Icons.add),
          //   onPressed: () {
          //     buildLanguageDialog(context);},
          // ),
       ],

       )
        )
    );
  }


}



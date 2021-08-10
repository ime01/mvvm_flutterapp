
import 'package:flutter/material.dart';
import 'package:mvvm_flutterapp/utils/video_player_widget.dart';
// import 'package:video_player/video_player.dart';
import 'package:video_player/video_player.dart';


class VideoPLayerFromAssets extends StatefulWidget {
  const VideoPLayerFromAssets({Key? key}) : super(key: key);

  @override
  _VideoPLayerFromAssetsState createState() => _VideoPLayerFromAssetsState();
}

class _VideoPLayerFromAssetsState extends State<VideoPLayerFromAssets> {

  late VideoPlayerController controller;
  final videoAsset = 'assets/volvo.mp4';

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(videoAsset)
    ..addListener(()=> setState((){}))
    ..setLooping(true)
    ..initialize().then((_) => controller.play());
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
        title: Text('VideoPlayer View'),
      ),
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                child:Text('Open Pictures View'),
                onPressed: (){
                  Navigator.pushNamed(context, '/pictures');
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                child:Text('Video Player From Network'),
                onPressed: (){
                  Navigator.pushNamed(context, '/videofromnetwork');
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                child:Text('Video Player From File'),
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
          ],
        )
    );
  }


}



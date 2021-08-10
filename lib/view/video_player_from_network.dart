
import 'package:flutter/material.dart';
import 'package:mvvm_flutterapp/utils/video_player_widget.dart';
import 'package:video_player/video_player.dart';


class VideoPLayerFromNetwork extends StatefulWidget {
  const VideoPLayerFromNetwork({Key? key}) : super(key: key);

  @override
  _VideoPLayerFromNetworkState createState() => _VideoPLayerFromNetworkState();
}

class _VideoPLayerFromNetworkState extends State<VideoPLayerFromNetwork> {

  final textController = TextEditingController(text: 'https://www.ebookfrenzy.com/android_book/movie.mp4');
  late VideoPlayerController controller;


  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(textController.text)
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
            buildTextField(),
          ],
        )
    );
  }

  Widget buildTextField() => Container(
    padding: EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            controller: textController,
            // hintText: 'Enter Video Url',
          ),
        ),
        const SizedBox(width: 12),
        FloatingActionButton(
          onPressed: (){
            if(textController.text.trim().isEmpty) return;

            controller = VideoPlayerController.network(textController.text)
              ..addListener(()=> setState((){}))
              ..setLooping(true)
              ..initialize().then((_) => controller.play());
          },
        )
      ],
    ),
  );


}



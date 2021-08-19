
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutterapp/utils/video_player_widget.dart';
// import 'package:video_player/video_player.dart';
import 'package:video_player/video_player.dart';


class VideoPLayerFromFile extends StatefulWidget {
  const VideoPLayerFromFile({Key? key}) : super(key: key);

  @override
  _VideoPLayerFromFileState createState() => _VideoPLayerFromFileState();
}

class _VideoPLayerFromFileState extends State<VideoPLayerFromFile> {

  late VideoPlayerController controller;
  final File file = File('\Galaxy A10e\Phone\Download.mp4');

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.file(file)
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
        title: Text('VideoPlayer 4rm File'),
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
            buildAddButton(),
          ],
        )
    );

  }

  Future<File?> pickVideoFile() async{

    final result = await FilePicker.platform.pickFiles(type: FileType.video);

    if(result == null) return null;

    return File(result.files.single.path!);

  }

 Widget buildAddButton() => Container(

        padding: EdgeInsets.all(32),

       child: FloatingActionButton(
       onPressed: () async{

         final file = await pickVideoFile();
         if(file == null) return;

         controller = VideoPlayerController.file(file)
         ..addListener(()=> setState((){}))
         ..setLooping(true)
         ..initialize().then((_) => controller.play());
         setState(() {

         });

       },
       ),
     );


}



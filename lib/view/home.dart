
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mvvm_flutterapp/view_models/list_picture_viwmodel.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  ListPictureViewModel listPictureViewModel = new ListPictureViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pictures'),),
      body: FutureBuilder(
        future: listPictureViewModel.fetchPictures(),

        builder: (context, snapshot){

          if(snapshot.connectionState ==  ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);

          }else{
            return StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              
              itemBuilder: (BuildContext context, int index) => Container(
                color: Colors.grey,
                child: FadeInImage.memoryNetwork(placeholder:kTransparentImage,
                    image: '${listPictureViewModel.pictures![index].picSumModel!.downloadUrl}',
                  fit: BoxFit.cover,),
              ),
              
              staggeredTileBuilder: (index) =>
                  StaggeredTile.count(2, index.isEven ? 2: 1),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,

            );
          }
        },

      ),
    );
  }
}


import 'dart:developer';

import 'package:mvvm_flutterapp/models/picsum_model.dart';
import 'package:mvvm_flutterapp/services/services.dart';

class ListPictureViewModel{

  List<PictureViewModel>? pictures;

  Future<void> fetchPictures() async{

    final apiResult = await Services().fetchPicturesAPI();
    this.pictures = apiResult.map((e) => PictureViewModel(e)).toList();

  }
}

class PictureViewModel {

  final PicSumModel? picSumModel;

  PictureViewModel(this.picSumModel);
}
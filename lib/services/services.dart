
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutterapp/models/picsum_model.dart';
import 'package:http/http.dart' as http;

class Services{

  Dio dio = new Dio();
  Future<List<PicSumModel>> fetchPicturesAPI()async{

    String picUrl = 'https://picsum.photos/v2/list';
    final response = await http.get(Uri.parse(picUrl));
    // final response = await dio.getUri(Uri.parse(picUrl));

    if(response.statusCode==200){
      print('THIS IS THE RESPONSE: ${response.body}');
      final json =  jsonDecode(response.body) as List<dynamic>;
      final listResult = json.map((e) => PicSumModel.fromJson(e)).toList();
      return listResult;
    }
    else{
      throw Exception('Error fetching pictures');
    }

  }

}
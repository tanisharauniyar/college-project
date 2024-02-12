import 'package:dio/dio.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/Http_services.dart';

final homepageLogic = ChangeNotifierProvider<HomePageLogic>((ref) {
  return HomePageLogic();
});

class HomePageLogic extends ChangeNotifier {
  bool islistening = false;
  List<String> responses = [];

  lisitening() {
    islistening = !islistening;
    notifyListeners();
  }

  uploadAudioFile(File audioFile) async {
    String fileName = audioFile.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(audioFile.path, filename: fileName),
    });
    //bool res = await HttpService().uploadAudio(formData);
    // if (res) {
    //
    //   showToast("done");
    // } else {
    //   Text('No response Found');
    // }
    try {
      // String data = await HttpService().uploadAudio(formData);
      // responses.add(data);

      Response? response = (await HttpService().uploadAudio(formData));

      if (response?.statusCode == 200) {
        String? data = response?.data.toString();
        responses.add(data??"");
      } else {
        print('${response?.statusCode}');
      }

      notifyListeners();
    } on DioException catch (e) {
      notifyListeners();
    }
  }
}

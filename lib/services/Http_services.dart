import 'package:dio/dio.dart';
import 'package:oktoast/oktoast.dart';
import 'ApiUrl.dart';

class HttpService {
  Future<Response?> uploadAudio(FormData data) async {
    try {
      Response response = await Dio(
        BaseOptions(
          baseUrl: ApiUrl.baseUrl,
          headers: {},
        ),
      ).post(ApiUrl.uploadImage, data: data);
      print("Server response: ${response.data}");
      print(response.data);
      return response;
    } on DioException catch (e) {
      print(e.response);
      print(e.error);
      print(e.message);
      showToast(
        "Something went wrong please try again",
        duration: Duration(seconds: 5),
      );
      return e.response;
    }
  }
}

import 'package:dio/dio.dart';

class DioClient {
  final dio = Dio();

  Future<dynamic> get(String baseUrl) async {
    var response = await dio.get(baseUrl);
    return response;
  }
}

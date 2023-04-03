import 'package:isolates/model/post_model.dart';
import 'package:isolates/services/dio_client.dart';

class CallApi {
  Future<List<PostModel>> getData() async {
    var response =
        await DioClient().get('https://jsonplaceholder.typicode.com/todos');
    Iterable listPost = response.data;
    return listPost.map((e) => PostModel.fromJson(e)).toList();
  }
}

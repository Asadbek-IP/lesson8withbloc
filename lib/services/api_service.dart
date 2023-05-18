import 'package:dio/dio.dart';

import '../model/post.dart';

class ApiService {
  static String baseUrl = "https://jsonplaceholder.typicode.com";

  static final dio = Dio();

  static Future<List<Post>> getAllPosts() async {
    Response response = await dio.get(baseUrl + "/posts");
    if (response.statusCode == 200) {
      return postFromJson(response.data);
    } else {
      throw "Serverda Xatolik";
    }
  }
}

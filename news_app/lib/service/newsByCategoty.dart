import 'package:dio/dio.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/model/newsState.dart';
import 'package:news_app/api.dart';

class NewsService {
  static Future<List<News>> getNewsData({required String apiPath}) async {
    try {
      final dio = Dio();

      final response = await dio.get(apiPath);
      if (response.statusCode == 405) {
        return [];
      } else {
        final data = (response.data["articles"] as List)
            .map((e) => News.fromJson(e))
            .toList();
        return data;
      }
    } on DioError catch (err) {
      return [];
    }
  }
}

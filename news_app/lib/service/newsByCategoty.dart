import 'package:dio/dio.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/model/newsState.dart';

class NewsService {
  static Future<List<News>> getNewsData({
    required String apiPath,
  }) async {
    final dio = Dio();
    final response = await dio.get(
        "https://newsapi.org/v2/everything?q=keyword&apiKey=053a86852df449cdac4a3cff8ad30eac");
    final data = (response.data["articles"] as List)
        .map((e) => News.fromJson(e))
        .toList();
    return data;
  }

  static Future<List<News>> searchNews(
      {required String apiPath,
      required String query,
      required int page}) async {
    final dio = Dio();
    final response = await dio.get(
      apiPath,
    );
    final data = (response.data["articles"] as List)
        .map((e) => News.fromJson(e))
        .toList();
    return data;
  }
}

import 'package:dio/dio.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/model/newsState.dart';
import 'package:news_app/api.dart';

class NewsService {
  static Future<List<News>> getNewsData({required String apiPath}) async {
    try {
      final dio = Dio();

      final response = await dio.get(apiPath);
      final data = (response.data["articles"] as List)
          .map((e) => News.fromJson(e))
          .toList();
      return data;
    } on DioError catch (err) {
      return [];
    }
  }

//   static Future<List<News>> getCryptoNews() async {
//     try {
//       final dio = Dio();
//       final response = await dio.get(
//         Api.allNews,
//       );
//       final data = (response.data["articles"] as List)
//           .map((e) => News.fromJson(e))
//           .toList();
//       return data;
//     } on DioError catch (err) {
//       return [];
//     }
//   }

//   static Future<List<News>> searchNews() async {
//     try {
//       final dio = Dio();
//       final response = await dio.get("");
//       final data = (response.data["articles"] as List)
//           .map((e) => News.fromJson(e))
//           .toList();
//       return data;
//     } on DioError catch (err) {
//       return [];
//     }
//   }
}

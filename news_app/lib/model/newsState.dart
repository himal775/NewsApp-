import 'package:news_app/api.dart';
import 'package:news_app/model/news.dart';

class NewsState {
  final String searchText;
  final String apiPath;
  final String q;
  final List<News> news;

  NewsState(
      {required this.searchText,
      required this.apiPath,
      required this.q,
      required this.news});

  NewsState.initState()
      : searchText = '',
        apiPath = Api.allNews,
        q = "everything",
        news = [];

  NewsState copyWith(
      {String? searchText, String? apiPath, List<News>? news, String? q}) {
    return NewsState(
        searchText: searchText ?? this.searchText,
        apiPath: apiPath ?? this.apiPath,
        q: q ?? this.q,
        news: news ?? this.news);
  }
}

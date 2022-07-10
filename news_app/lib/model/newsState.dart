import 'package:news_app/api.dart';
import 'package:news_app/model/news.dart';

class NewsState {
  // final String searchText;
  final String apiPath;
  // final int page;
  final List<News> news;

  NewsState(
      {
      //required this.searchText,
      required this.apiPath,
      // required this.page,
      required this.news});

  NewsState.initState()
      :
        // searchText = '',
        apiPath = Api.allNews,
        // page = 1,
        news = [];

  NewsState copyWith(
      {
      //String? searchText,
      String? apiPath,
      List<News>? news}) {
    return NewsState(
        //searchText: searchText ?? this.searchText,
        apiPath: apiPath ?? this.apiPath,
        //page: page,
        news: news ?? this.news);
  }
}

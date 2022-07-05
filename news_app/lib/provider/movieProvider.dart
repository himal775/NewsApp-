import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/model/newsState.dart';
import 'package:news_app/service/newsByCategoty.dart';

final newsprovider = StateNotifierProvider<NewsProvider, NewsState>(
    ((ref) => NewsProvider(NewsState.initState())));

class NewsProvider extends StateNotifier<NewsState> {
  NewsProvider(super.state) {
    getNewsDetails();
  }
  Future<void> getNewsDetails() async {
    final response = await NewsService.getNewsData(
      apiPath: state.apiPath,
    );
    state = state.copyWith(news: response);
  }
}

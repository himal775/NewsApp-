import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/api.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/model/newsState.dart';
import 'package:news_app/service/newsByCategoty.dart';

final newsprovider = StateNotifierProvider<NewsProvider, NewsState>(
    ((ref) => NewsProvider(NewsState.initState())));

class NewsProvider extends StateNotifier<NewsState> {
  NewsProvider(super.state) {
    changeCategory();
  }

  Future<void> changeCategory() async {
    final responses = await NewsService.getNewsData(apiPath: state.apiPath);

    state = state.copyWith(news: responses);
  }

  void please({required String apiPath}) async {
    state = state.copyWith(apiPath: apiPath, news: []);
    changeCategory();
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/model/newsState.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SearchPage {
  static Future<List<News>> getNewsData({required String q}) async {
    try {
      final dio = Dio();

      final response = await dio.get(
          "https://newsapi.org/v2/everything?apiKey=053a86852df449cdac4a3cff8ad30eac&q=${q}");
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

class SearchingPage extends ConsumerWidget {
  SearchingPage({Key? key}) : super(key: key);
  @override
  final Searchcontroller = TextEditingController();
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: Container(
      child: Consumer(
        builder: ((context, ref, child) {
          final counter = ref.watch(searchNewsProvider);
          return Container(
            child: Column(
              children: [
                TextFormField(
                  controller: Searchcontroller,
                  onFieldSubmitted: (value) {
                    ref.read(searchNewsProvider.notifier).hi(q: value.trim());
                    Searchcontroller.clear();
                  },
                  decoration: const InputDecoration(
                    hintText: "SearchMovie",
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                        itemCount: counter.news.length,
                        itemBuilder: (context, index) {
                          return Stack(children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: CachedNetworkImage(
                                  errorWidget: (context, url, error) =>
                                      Image.network(
                                          "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"),
                                  imageUrl: counter.news[index].image),
                            ),
                            Positioned(
                              bottom: 25,
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: Text(counter.news[index].title,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold)),
                              ),
                            )
                          ]);
                        }),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    ));
  }
}

final searchNewsProvider = StateNotifierProvider<SearchNewsProvider, NewsState>(
    (ref) => SearchNewsProvider(NewsState.initState()));

class SearchNewsProvider extends StateNotifier<NewsState> {
  SearchNewsProvider(super.state) {}

  Future<void> getNewsSearchData() async {
    final response = await SearchPage.getNewsData(q: state.q);
    state = state.copyWith(news: response);
  }

  void hi({required String q}) async {
    state = state.copyWith(q: q, news: []);
    getNewsSearchData();
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/api.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/service/newsByCategoty.dart';
import 'package:news_app/model/newsState.dart';
import 'package:news_app/provider/movieProvider.dart';

void main() {
  runApp(ProviderScope(child: NewsApp()));
}

final newsprovider = FutureProvider<List<News>>(
    ((ref) => NewsService.getNewsData(apiPath: Api.allNews)));

class NewsApp extends ConsumerWidget {
  Widget build(BuildContext context, WidgetRef) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.newspaper),
        title: Text("News App"),
      ),
      body: Consumer(builder: (context, ref, child) {
        final counter = ref.watch(newsprovider);
        return Center(
            child: counter.when(
                data: (counter) {
                  return Center(
                      child: ListView(
                          children: counter.map((e) {
                    return Column(
                      children: [
                        Text(e.title),
                        CachedNetworkImage(
                          imageUrl: e.image,
                        ),
                      ],
                    );
                  }).toList()));
                  ;
                },
                error: (err, stack) => const Text("ee:"),
                loading: () => const CircularProgressIndicator()));
      }),
    ));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:news_app/api.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/service/newsByCategoty.dart';
import 'package:news_app/model/newsState.dart';
import 'package:news_app/provider/movieProvider.dart';

void main() {
  runApp(ProviderScope(child: NewsApp()));
}

class NewsApp extends ConsumerWidget {
  Widget build(BuildContext context, WidgetRef) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("News App"),
          ),
          body: Consumer(
            builder: ((context, ref, child) {
              final counter = ref.watch(newsprovider);
              return Column(children: [
                Row(children: [
                  Expanded(child: TextFormField()),
                  Expanded(
                      child: PopupMenuButton(onSelected: (value) {
                    ref
                        .read(newsprovider.notifier)
                        .please(apiPath: value as String);
                  }, //{ref.read(newsprovider.notifier).changeCategory();},
                          itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: Api.sportsNews,
                        child: Text('sports'),
                      ),
                      PopupMenuItem(
                          value: Api.cryptoNews, child: Text("Crypto"))
                    ];
                  }))
                ]),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                      child: counter.news.isEmpty
                          ? const Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              itemCount: counter.news.length,
                              itemBuilder: (context, index) {
                                return Text(counter.news[index].author);
                              })),
                )
              ]);
            }),
          ),
        ));

    //  Container(child: Consumer(builder: (context, ref, child) {
    //   final counter = ref.watch(newsprovider);
    //   return
    //       // PopupMenuButton(
    //       //     onSelected: (val) {},
    //       //     itemBuilder: (context) {
    //       //       return [
    //       //         PopupMenuItem(
    //       //             value: Api.allNews, child: Text('popular'))
    //       //       ];
    //       //     }),
    //       Container(
    //     child: counter.news.isEmpty
    //         ? const Center(child: CircularProgressIndicator())
    //         : ListView.builder(
    //             itemCount: counter.news.length,
    //             itemBuilder: (context, index) {
    //               return Column(children: [
    //                 // RaisedButton(
    //                 //   onPressed: () {
    //                 //     ref
    //                 //         .read(newsprovider.notifier)
    //                 //         .changeCategory();
    //                 //   },
    //                 //   child: const Text("click"),
    //                 // ),

    //                   ];
    //                 }),
    //
    //               ]);
    //             }),
    //   );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:news_app/api.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/service/newsByCategoty.dart';
import 'package:news_app/model/newsState.dart';
import 'package:news_app/provider/newsProvider.dart';
import 'package:news_app/view/searchPage.dart';
import 'package:news_app/view/topButton.dart';
import 'package:news_app/service/newsByCategoty.dart';

void main() {
  runApp(ProviderScope(child: NewsApp()));
}

class NewsApp extends ConsumerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Text("News App"),
              centerTitle: true,
              bottom: const TabBar(isScrollable: true, tabs: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Icon(Icons.home, size: 30),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Icon(Icons.search, size: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Icon(Icons.settings, size: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Icon(Icons.person, size: 30),
                ),

                // Text("Business"),
                // Text("Technology"),
                // Text("General")
              ]),
            ),
            body: Container(
              child: Consumer(builder: ((context, ref, child) {
                final counter = ref.watch(newsprovider);
                return TabBarView(children: [
                  Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: TextButton(
                                onPressed: () {
                                  ref
                                      .read(newsprovider.notifier)
                                      .please(apiPath: Api.cryptoNews);
                                  setState() {
                                    color:
                                    Colors.accents;
                                  }
                                },
                                child: const Text(
                                  "Crypto",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.red),
                                ),
                              ),
                            ),
                            Container(
                              child: TextButton(
                                onPressed: () {
                                  ref
                                      .read(newsprovider.notifier)
                                      .please(apiPath: Api.politics);
                                },
                                child: const Text(
                                  "Politics",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.red),
                                ),
                              ),
                            ),
                            Container(
                              child: TextButton(
                                onPressed: () {
                                  ref
                                      .read(newsprovider.notifier)
                                      .please(apiPath: Api.sportsNews);
                                },
                                child: const Text(
                                  "Sports",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.red),
                                ),
                              ),
                            ),
                            Container(
                              child: TextButton(
                                onPressed: () {
                                  ref
                                      .read(newsprovider.notifier)
                                      .please(apiPath: Api.entertainment);
                                },
                                child: const Text(
                                  "Entertainment",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.red),
                                ),
                              ),
                            ),
                          ]),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: Container(
                              child: counter.news.isEmpty
                                  ? const Center(child: Text("Loading....."))
                                  : ListView.builder(
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 20),
                                              child: Stack(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      final imageLink = counter
                                                          .news[index].image;
                                                      final newsDescription =
                                                          counter.news[index]
                                                              .description;
                                                      final newsTitle = counter
                                                          .news[index].title;
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  ((context) =>
                                                                      NewsDetails(
                                                                        ImageLink:
                                                                            imageLink,
                                                                        NewsDescription:
                                                                            newsDescription,
                                                                        NewsTitle:
                                                                            newsTitle,
                                                                      ))));
                                                    },
                                                    child: CachedNetworkImage(
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Image.network(
                                                              "https://static.remove.bg/remove-bg-web/5c20d2ecc9ddb1b6c85540a333ec65e2c616dbbd/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png"),
                                                      imageUrl: counter
                                                          .news[index].image,
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 0,
                                                    child: Container(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Text(
                                                          counter.news[index]
                                                              .title,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 21,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      })),
                        ),
                      ),
                    ],
                  ),
                  SearchingPage(),
                  const Text("s"),
                  const Text("y")
                ]);
              })),
            ),
          ),
        ));
  }
}

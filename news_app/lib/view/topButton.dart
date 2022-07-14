import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/model/news.dart';
import 'package:flutter/material.dart';
import 'package:news_app/main.dart';

class NewsDetails extends StatelessWidget {
  final String NewsTitle;
  final String ImageLink;
  final String NewsDescription;

  NewsDetails(
      {required this.ImageLink,
      required this.NewsDescription,
      required this.NewsTitle});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("NewsApp"),
            leading: GestureDetector(
              child: const Icon(
                Icons.arrow_back,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => NewsApp())));
              },
            ),
            backgroundColor: Colors.red,
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    NewsTitle,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CachedNetworkImage(imageUrl: ImageLink),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    NewsDescription,
                    style: TextStyle(fontSize: 21),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

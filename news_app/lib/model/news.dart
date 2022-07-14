class News {
  final String author;
  final String title;
  final String image;
  final String description;
  News(
      {required this.author,
      required this.title,
      required this.image,
      required this.description});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        author: json['author'] ?? '',
        title: json['title'] ?? '',
        image: json['urlToImage'] ?? '',
        description: json['description']);
  }
}

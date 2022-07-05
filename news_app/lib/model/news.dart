class News {
  final String author;
  final String title;
  final String image;
  // final String urlImage;
  // final String apiPath;
  // final int page;
  News({
    required this.author,
    required this.title, //required this.Image
    required this.image,
    // required this.apiPath,
    // required this.page
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        author: json['author'] ?? '',
        title: json['title'] ?? '',
        image: json['urlToImage'] ?? ''
        // urlImage: json['urlImage'],
        // apiPath: json['apiPath'],
        // page: json['page']
        );
  }
}
//   News.initState()
//       : author = 'Praveen Mishra',
//         title = 'App Store Optimization Techniques and Strategies',
//         urlImage =
//             'https://media.wired.com/photos/628c07822563a9a2cb377a0b/191:100/w_1280,c_limit/surveillance_science-GettyImages-536214958.jpg',
//         apiPath =
//             'https://newsapi.org/v2/everything?q=keyword&apiKey=053a86852df449cdac4a3cff8ad30eac',
//         page = 1

//   News.copywith(String? apipath, String? page) {
//     final author=author?this.author;

//   }
// }

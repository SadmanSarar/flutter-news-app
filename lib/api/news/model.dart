import 'package:tinano/tinano.dart';

@row
class News {
  final int id;
  final String title;
  final String body;
  final String image;
  final int categoryId;
  final String type;
  final int published;
  final String publishedAt;
  final String categoryName;

  News(
    this.id,
    this.title,
    this.body,
    this.image,
    this.categoryId,
    this.type,
    this.published,
    this.publishedAt,
    this.categoryName,
  );

  static List<News> listFromJson(Map<String, dynamic> json) {
    var data = json['data'] as List<dynamic>;
    var list = data.map((item) {
      return News(
        item['id'],
        item['title'],
        item['body'],
        item['image'],
        int.parse(item['category_id']),
        item['type'],
        item['published'] == "1" ? 1 : 0,
        item['published_at'],
        item['category']['name'],
      );
    }).toList();
    return list;
  }

  @override
  String toString() {
    return """
    id : $id;
    title : $title;
    body : $body;
    image : $image;
    categoryId : $categoryId;
    type : $type;
    published : $published;
    publishedAt : $publishedAt;
    categoryName : $categoryName;
     """;
  }
}

import 'package:tinano/tinano.dart';

@row
class Category {
  final int id;
  final String name;
  final String imageUrl;
  final String description;

  Category(this.id, this.name, this.imageUrl, this.description);

  static List<Category> listFromJson(Map<String, dynamic> json) {
    var data = json['data'] as List<dynamic>;
    var list = data.map((item) {
      return Category(
        item['id'],
        item['name'],
        item['image'],
        item['description'],
      );
    }).toList();
    return list;
  }

  @override
  String toString() {
    return 'id: $id; name: $name; image: $imageUrl; description: $description,';
  }
}

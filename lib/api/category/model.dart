class Category {
  final int id;
  final String name;
  final String imageUrl;
  final String description;

  Category({this.id, this.name, this.imageUrl, this.description});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image'],
      description: json['description'],
    );
  }

  static List<Category> listFromJson(Map<String, dynamic> json) {
    var data = json['data'] as List<dynamic>;
    var list = data.map((item) {
      return Category(
        id: item['id'],
        name: item['name'],
        imageUrl: item['image'],
        description: json['description'],
      );
    }).toList();
    return list;
  }
}

import 'package:flutter/material.dart';
import 'news_list.dart';
import '../api/category/model.dart';

class CategoryDetails extends StatelessWidget {
  final Category category;
  CategoryDetails(this.category);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: NewsList('', category.id.toString()),
    );
  }
}

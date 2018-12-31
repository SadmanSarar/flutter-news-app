import 'package:flutter/material.dart';
import 'NewsListWidget.dart';
import '../data/category/Category.dart';

class CategoryDetails extends StatelessWidget {
  final Category category;
  CategoryDetails(this.category);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: NewsListWidget('', category.id.toString()),
    );
  }
}

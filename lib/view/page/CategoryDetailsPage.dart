import 'package:flutter/material.dart';
import 'package:news_app_flutter/data/category/Category.dart';
import 'package:news_app_flutter/view/widget/NewsListWidget.dart';

class CategoryDetailsPage extends StatelessWidget {
  final Category category;

  CategoryDetailsPage(this.category);

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

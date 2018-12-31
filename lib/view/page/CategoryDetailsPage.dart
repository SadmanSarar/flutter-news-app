import 'package:flutter/material.dart';
import '../widget/NewsListWidget.dart';
import '../../data/category/Category.dart';

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

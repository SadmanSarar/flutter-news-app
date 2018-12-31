import 'package:flutter/material.dart';
import 'news_item.dart';
import '../api/news/model.dart';
import 'news_list.dart';

class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewsList('fav', '');
  }
}

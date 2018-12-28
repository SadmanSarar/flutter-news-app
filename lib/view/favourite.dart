import 'package:flutter/material.dart';
import 'news_item.dart';
import '../api/news/model.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() {
    return _FavouriteState();
  }
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return new NewsListItem(
            News(0, '', '', '', 0, '', 0, '', ''),
            (id) {},
          );
        },
      ),
    );
  }
}

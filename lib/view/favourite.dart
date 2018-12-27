import 'package:flutter/material.dart';
import 'dashboard_item.dart';

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
          return new DashBoardItem(
            'Title',
            'Body',
            'https://picsum.photos/200/200',
            2,
            (id) {},
          );
        },
      ),
    );
  }
}
